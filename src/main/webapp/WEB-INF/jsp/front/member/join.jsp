<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<c:if test="${bCertType or bIpinEncdata or bMode}">
<div class="container main">
     <div class="row my-4">
          <div class="col-sm-12">
               <form id="formJoin" action="/join_proc.do" method="post" class="col-sm-6 mx-auto">
               		<input type="hidden" name="mseq" value="${empty vo.memberSeq ? 0 : vo.memberSeq }">	
               		<input type="hidden" name="transEmailYn" value="N">	
               		<input type="hidden" name="recommUserId" value="${recommUserId}">	
               		<input type="hidden" name="certType" value="${search.certType}">	
					<input type="hidden" name="ipinEncdata" value="${search.ipinEncdata}">	
                    <div class="form-group">
                    	<label for="userId" class="form-label required">아이디</label>
                         <input type="text" min="4" class="form-control" id="userId" maxlength="24" name="userId" placeholder="아이디를 입력하세요." >
                         <span class="mt-2" id="userIdCheck"></span>
                    </div>
                    <div class="form-group">
                    	<label for="userPwd" class="form-label required">비밀번호</label>
                         <fieldset>
                              <input type="password" class="form-control password"  maxlength="256" id="user_pass" name="userPwd" placeholder="비밀번호(영문/숫자/특수문자 조합)">
                              <span class="show-pass"></span>
                         </fieldset>
                         <span class="mt-2" id="userPwdCheck"> </span>
                    </div>
                    <div class="form-group">
                    	<label for="userPwd2" class="form-label required">비밀번호 확인</label>
                         <input type="password" class="form-control password-repeat"  maxlength="256" id="user_pass_repeat" name="userPwd2" placeholder="비밀번호 확인">
                         <span class="mt-2" id="userPwdCheck2"></span>
                    </div>

                    <hr class="my-6">

                    <div class="form-group mt-3">
                    	<label for="userName" class="form-label">이름</label>
                         <input type="text" class="form-control" id="user_name"  maxlength="100" name="userName" readonly value="${search.userName }"placeholder="이름"  >
                    </div>

                    <div class="form-group">
                    	<label for="phone" class="form-label">휴대폰</label>
                         <input type="tel" class="form-control" id="user_mobile_number"  maxlength="24" name="phone" readonly value="${search.phone }" placeholder="휴대폰" >
                    </div>

                    <div class="form-group">
                    	<label for="email" class="form-label">이메일</label>
                         <input type="email" class="form-control" id="user_email" name="email" maxlength="24" placeholder="이메일">
                    </div>
                    <div class="form-group">
                    	<label for="email" class="form-label">추천인</label>
                         <input type="text" class="form-control" id="user_recommended" placeholder="추천인" value="" ${!empty recommUserId ? 'readonly' : ''}>
                         <span class="mt-2" id="recUserIdCheck">(추천인이 없는 경우 ${SITE_NAME_U}를 입력하세요.)</span>
                    </div>

				<hr class="my-6">

                    <div class="form-group">
                    	<label for="zipcode" class="form-label">우편번호</label>
                         <div class="input-group">
                              <input type="text" class="form-control" id="user_postcode" name="zipcode" placeholder="우편번호" readonly onclick="findZip()">
                              <button type="button" onclick="findZip()" name="button" class="btn dark" onclick="findZip()">우편번호검색</button>
                         </div>
                    </div>

                    <div class="form-group">
                    	<label for="addr1" class="form-label">주소</label>
                         <input type="text" onclick="findZip()" class="form-control" id="user_address" name="addr1" placeholder="주소" readonly onclick="findZip()">
                    </div>

                    <div class="form-group">
                    	<label for="addr2" class="form-label">상세주소</label>
                         <input type="text" class="form-control" id="user_detailAddress" name="addr2" placeholder="상세주소">
                    </div>

                    <hr class="my-6">

                    <div class="form-group mt-3 ">
                    	<label for="bank" class="form-label required">은행</label>
                   	 		<select class="form-control" name="bank" >
							<option value="0">은행</option>
							<c:forEach items="${bankList}" var="m" varStatus="s">
								<option ${vo.bank eq m.codeName ? 'selected' : ''} value="${m.codeName }">${m.codeName }</option>
							</c:forEach>
						</select>
                         <!-- <input type="text" value="" id="user_bank" class="form-control"  maxlength="8" name="bank" placeholder="은행"  > -->
                    </div>
                    <div class="form-group">
                    	<label for="bankAccount" class="form-label required">계좌번호</label>
                         <input type="text" value="" id="user_account_number" class="form-control onlyNumber"  maxlength="24" name="bankAccount" placeholder="계좌번호"  >
                    </div>
                    <div class="form-group">
                    	<label for="accountOwner" class="form-label required">예금주명</label>
                         <input type="text" value="" id="user_account_holder" class="form-control"  maxlength="8" name="accountOwner"placeholder="예금주명"  >
                    </div>
                    <div class="form-group">
                         <label for="recieve_mail">
                              <input type="checkbox" class="" id="recieve_mail" value="N">
                              <span>거래 확인서를 메일로 받겠습니다.</span>
                         </label>
                    </div>
                    <div class="row">
                         <div class="col-6 text-center">
                              <button type="button" name="button" onClick="javascript:doSubmit();" class="w-100 btn btn-lg primary">회원가입</button>
                         </div>
                         <div class="col-6 text-center">
                              <a href="javascript:$.Nav('go', '/')" class="w-100 btn btn-lg ghost dark">취소</a>
                         </div>
                    </div>

               </form>
               <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
               <script>

                    // function goEmailValue(){
                    //      var domain =  $(this).find("option:selected").text();
                    //      console.log(domain);
                    // };
                    function findZip(){
                         new daum.Postcode({
                              oncomplete: function(data) {
                                     // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                     // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                     // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                     var addr = ''; // 주소 변수
                                     var extraAddr = ''; // 참고항목 변수

                                     //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                         addr = data.roadAddress;
                                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                         addr = data.jibunAddress;
                                     }

                                     // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                     if(data.userSelectedType === 'R'){
                                         // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                         // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                                             extraAddr += data.bname;
                                         }
                                         // 건물명이 있고, 공동주택일 경우 추가한다.
                                         if(data.buildingName !== '' && data.apartment === 'Y'){
                                             extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                         }
                                         // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                         if(extraAddr !== ''){
                                             extraAddr = ' (' + extraAddr + ')';
                                         }
                                         // 조합된 참고항목을 해당 필드에 넣는다.
                                         document.getElementById("user_address").value = addr + extraAddr;

                                     } else {
                                         document.getElementById("user_address").value = addr;
                                     }

                                     // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                     document.getElementById('user_postcode').value = data.zonecode;
                                     // document.getElementById("user_address").value = addr;
                                     // 커서를 상세주소 필드로 이동한다.
                                     document.getElementById("user_detailAddress").focus();
                                 }
                        }).open();
                    }

               </script>
               <script type="text/javascript">
                    $(document).ready(function(){

                         $('#user_mobile_number').mask('000-0000-0000');

                         var options = {
                              onKeyPress: function(cep, e, field, options){
                                   var masks = ['000-000-0000','00-000-00000'];
                                   console.log(cep.length);
                                   var mask = (cep.length > 11) ? masks[0] : masks[1];
                                   $('#user_phone_number').mask(mask, options);
                              }
                         };
                         $('#user_phone_number').mask('000-0000-0000', options);
                    });

                    // $('#user_name').mask('KKK',{'translation': {
                    //           K : {pattern: /[\u3131-\uD79DA-Za-z]/},
                    //      }
                    // })
               </script>

          </div>

     </div>
</div>
</c:if>
<script type="text/javascript">

$('#userIdCheck').hide();
$('#userPwdCheck').hide();
//$('#recUserIdCheck').hide();
$('#userPwdCheck2').hide();
$(function() {
	  var rec_code = decodeURIComponent("${recommUserId}");
	  $('#user_recommended').val(rec_code);
	checkRecomm();
	$('input[name=userId]').on('input change', function() {
			var sUserId = trim($('input[name=userId]').val());
			$('input[name=userId]').val(trim($('input[name=userId]').val()));
			if (sUserId != '') {
				if (sUserId.length < 4) {
					$('#userIdCheck').show();
					$('#userIdCheck').attr('class', 'mt-2 text-red small bold');
					$('#userIdCheck').text('아이디는 4~15자로 입력하세요.');
				} else {
					$.ajax({
						type : 'post',
						url : '/ajax/checkId.do',
						data : {
							id : sUserId
						},
						dataType : 'json',
						success : function(data) {
							if (data.result == null) {
								$('#userIdCheck').show();
								$('#userIdCheck').attr('class', 'mt-2 text-blue bold');
								$('#userIdCheck').text( '사용 가능한 아이디 입니다.');
							} else {
								$('#userIdCheck').show();
								$('#userIdCheck').attr('class', 'mt-2 text-red small bold');
								$('#userIdCheck').text( '사용 불가능한 아이디 입니다.');
							}
						}
					});
				}
			} else {
				$('#userIdCheck').hide();
			}
		});

	$('input[name=userPwd], input[name=userPwd2]').on('input change', function() {
		var sUserPwd = trim($('input[name=userPwd]').val());
		$('input[name=userPwd]').val(trim($('input[name=userPwd]').val()));
		var sUserPwd2 = trim($('input[name=userPwd2]').val());
		$('input[name=userPwd2]').val(trim($('input[name=userPwd2]').val()));

		if (sUserPwd.length < 8) {
			$('#userPwdCheck').show();
			$('#userPwdCheck').prop('class', 'mt-2 red bold');
			$('#userPwdCheck').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');
			} else {
				if(sUserPwd != '' && !checkPattern(sUserPwd, 'PASSWORD_ONLY')){
					$('#userPwdCheck').show();
					$('#userPwdCheck').prop('class','mt-2 text-red small bold');
					$('#userPwdCheck').text('비밀번호는 영문 및 숫자를 보함해야 합니다.');
				}else {
					$('#userPwdCheck').show();
					$('#userPwdCheck').prop('class', 'mt-2 text-blue bold');
					$('#userPwdCheck').text('비밀번호가 입력되었습니다.');
				}
		}
		if ($('input[name=userPwd]').val() == ''){
			$('#userPwdCheck').hide();
		}
		if ($('input[name=userPwd2]').val() == ''){
			$('#userPwdCheck2').hide();
		}
		if (sUserPwd != '' && sUserPwd2 != '') {
			if (sUserPwd != sUserPwd2) {
				$('#userPwdCheck2').show();
				$('#userPwdCheck2').prop('class', 'mt-2 text-red small bold');
				$('#userPwdCheck2').text('비밀번호가 다릅니다.');

			} else {
				$('#userPwdCheck2').show();
				$('#userPwdCheck2').prop('class', 'mt-2 text-blue bold');
				$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
			}
		}
		
		
	});
	$('#user_recommended').on('keyup', function() {
		checkRecomm();
		});
	function checkRecomm(){
		var nickName = trim($('#user_recommended').val());
		$('#user_recommended').val(nickName);
		if (nickName != '') {
				$.ajax({
					type : 'post',
					url : '/ajax/checkNickname.do',
					data : {
						nickname : nickName
					},
					dataType : 'json',
					success : function(data) {
						if (data.result == null) {
							$('input[name=recommUserId]').val('');
							$('#recUserIdCheck').show();
							$('#recUserIdCheck').attr('class', 'mt-2 text-blue bold');
							$('#recUserIdCheck').text( '등록되지 않은 추천인입니다.');
						} else {
							$('input[name=recommUserId]').val(data.result.userID);
							$('#recUserIdCheck').show();
							$('#recUserIdCheck').attr('class', 'mt-2 text-blue bold');
							$('#recUserIdCheck').text( '등록된 추천인입니다.');
						}
					}
				});
		} else if ($('#user_recommended').val() == ''){
			$('#recUserIdCheck').show();
			$('#recUserIdCheck').attr('class', 'mt-2 text-blue bold');
			$('#recUserIdCheck').text( '(추천인이 없는 경우 ${SITE_NAME_U}를 입력하세요.)');
		}
	}
});	


//feather.replace();
$('#recieve_mail').on('change',function (e){$('input[name="transEmailYn"]').val(e.target.checked ? 'Y' : 'N')});
function doSubmit() {
	if($('#recieve_mail').prop('checked')){
		if(isNull($('input[name=email]').val())){
			$('input[name=email]').focus();
			alert('이메일를 입력하세요.');
			return;
		}
	}
	
	var sId = '${vo.userId}';

	if (sId == '') {
		
		if(isNull($('input[name=userId]').val())){
			$('#userIdCheck').show();
			$('#userIdCheck').attr('class', 'mt-2 text-red small bold').text('사용할 아이디를 입력하세요.');
			$('input[name=userId]').focus();
			return;
		}
		
		if(isNull($('input[name=userPwd]').val())){
			$('#userPwdCheck').show();
			$('#userPwdCheck').attr('class', 'mt-2 text-red small bold').text('비밀번호를 입력해주세요');
			$('input[name=userPwd]').focus();
			return;
		}
		
		if ($('#userIdCheck').prop('class').indexOf('text-blue') < 0) {
			$('#userIdCheck').show();
			$('#userIdCheck').attr('class', 'mt-2 text-red small bold').text('사용 불가능한 아이디 입니다.');
			$('input[name=userId]').focus();
			return;
		}

		if ($('#userPwdCheck').prop('class').indexOf('text-blue') < 0 ) {
			$('#userPwdCheck').show();
			$('#userPwdCheck').attr('class', 'mt-2 text-red small bold').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
			$('input[name="userPwd"]').focus();
			return;
		}
		if ($('#userPwdCheck2').prop('class').indexOf('text-blue') < 0) {
			$('#userPwdCheck2').show();
			$('#userPwdCheck2').attr('class', 'mt-2 text-red small bold').text('비밀번호를 다시 입력해주세요 .');
			$('input[name="userPwd2"]').focus();
			return;
		}
	}
	
	if (isNull($('input[name=recommUserId]').val())){
		$('input[name=recommUserId]').focus();
		alert('추천인을 입력하세요.');
		return;
	}
	
	if ($('select[name=bank]').val() == 0){
		$('select[name=bank]').focus();
		alert('은행을 선택해주세요.');
		return;
	}
	
	if (isNull($('input[name=bankAccount]').val())){
		$('input[name=bankAccount]').focus();
		alert('계좌번호를 입력하세요.');
		return;
	}
	
	if (isNull($('input[name=accountOwner]').val())){
		$('input[name=accountOwner]').focus();
		alert('예금주명을 입력하세요.');
		return;
	}
	
	if (!confirm('등록 하시겠습니까?')) {
		return;
	}
	$('#formJoin').submit();
}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
