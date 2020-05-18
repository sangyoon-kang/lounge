<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<style>
.mb-1 {
    margin-top: 3rem;
    margin-bottom: 3rem;
    margin-left:16rem;
}

</style>
<nav id="wrap_lnb">
		<div>
			<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
			<div class="lnb_select">
				<h3 class="lnb_select_tit first">정보수정</h3>
				<%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp"%>
			</div>
		</div>
	</nav>
<div class="wrap_scon">
	<div class="scon">
          <h3 class="con_tit">정보수정</h3>
			<div id="register_form" class="col-sm-6 mx-auto">
		    	<form id="formJoin" name="formJoin" action="/mypage/member_proc.do" method="post" class="col-sm-12 mx-auto" enctype="multipart/form-data">
		          	<input type="hidden" name="mseq" value="${empty vo.memberSeq ? 0 : vo.memberSeq }">	
					<input type="hidden" name="transEmailYn" value="N">	
					<input type="hidden" name="recommUserId" value="${vo.recommUserId }">
					<input type="hidden" name="gradeLevel" value="${vo.gradeLevel }">

					<input type="hidden" name="certType" value="">
					<input type="hidden" name="ipinEncdata" value="${vo.ipinDi }">
					<input type="hidden" name="isAdult" value="">
					<input type="hidden" name="birthDt" value="${vo.birthDt }">

					<input type="hidden" name="gender" value="">
					<input type="hidden" name="isAccountCheck" value="">

					<input type="hidden" name="mode" value="modify">
				<div class="join_con">
			
					
			<ul class="join_list">
					<li>아이디</li>
					<li>
					<input type="text" min="6" id="userId" maxlength="20" name="userId" placeholder="아이디를 입력하세요." class="join_input01" value="${vo.userId }" readonly />
					<span class="join_txt_red" id="userIdCheck"></span>
					</li>
			</ul>
			<ul class="join_list">
					<li>이름</li>
					<li>
						<input type="text" ${!tagoplusSolution1_session_user.snsYn ? 'readonly' : ''}   id="user_name" name="userName"  maxlength="100" value="${vo.userName }"  placeholder="이름" class="join_input01"/>
						<a id="btnIpinCheck" onclick="javascript:ipinCheck();" class="join_bt01" style="display: none">본인인증 </a>
						<span class="join_txt_red small bold" id="userNameChk"
							  style="display:none;">이미 등록되어 있습니다.</span>
					</li>
					
			</ul>
			<ul class="join_list">
					<li>휴대폰번호</li>
					<li>
						<input type="text" maxlength="24" name="phone1" ${!tagoplusSolution1_session_user.snsYn ? 'readonly' : ''} value="${vo.phone }" placeholder="휴대폰" >
						<input type="hidden" id="user_mobile_number" maxlength="24" name="phone" readonly value="${vo.phone }" placeholder="휴대폰">
						<span class="join_txt_red small bold" id="userMobileChk"
							  style="display:none;">이미 등록되어 있습니다.</span>
					</li>
				</ul>
				
				<ul class="join_list">
					<li>예금주</li>
					<li>
					<input type="text" ${!tagoplusSolution1_session_user.snsYn ? 'readonly' : ''} class="join_input01 join_input01_01" value="${vo.accountOwner}" id="user_account_holder" maxlength="8" name="accountOwner"placeholder="예금주명" />
					
					</li>
				</ul>
				<ul class="join_list">
					<li>은행</li>
					<li>
					<!--c:if test="${tagoplusSolution1_session_user.snsYn}"-->
						<select class="join_select join_select02" name="selectBank">
							<option>선택</option>
							<c:forEach items="${bankList}" var="m" varStatus="s">
								<option ${vo.bank eq m.codeName ? 'selected' : ''} value="${m.codeDesc2 }">${m.codeName }</option>
							</c:forEach>
						</select>
						<input type="text" readonly value="${vo.bank}" name="bank" style="display: none"/>
					<!--/c:if-->
					<!--c:if test="${!tagoplusSolution1_session_user.snsYn}">
						<input type="text" readonly value="${vo.bank}" />
					c:if-->
					</li>
				</ul>
				<ul class="join_list" style="display: ${vo.birthDt eq null or vo.birthDt eq '' ? 'flex' : 'none'}">
					<li>생년월일</li>
					<li>
						<input type="text" placeholder="주민번호 앞 6자리" class="join_input01 onlyNumber" maxlength="6" name="birthDate"/>
						<span id="lblBirthText" class="join_txt_blue bold">(계좌번호 인증을 위해 주민번호상 생년월일을 입력해주세요.)</span>
					</li>
				</ul>
				<ul class="join_list">
					<li>계좌번호</li>
					<li>
						<input type="text" placeholder="계좌번호 입력" value="${vo.bankAccount}" class="join_input01 onlyNumber" id="user_account_number" maxlength="24" name="bankAccount"/>
						<a onclick="javascript:accountCheck();" class="join_bt01" id="btnBankCheck">계좌번호 인증 </a>
					</li>
				</ul>
				<ul class="join_list">
					<li>이메일</li>
					<li>
					<input type="text" class="join_input02" name="" maxlength="24" id="email1" value="${vo.mailAddress.id }"/>
					<span class="join_bar_txt join_bar_txt02">@</span>
					<input type="text" class="join_input02" id="email2" value="${vo.mailAddress.domain }"/>
					<select class="join_select join_select03" id="emaildom">
					<option selected value="" >직접입력</option>
					<c:forEach items="${emaildomains}" var="m" varStatus="s">
								<option  value="${m.value }" ${m.value == vo.mailAddress.domain ? selected:'' }>${m.value }</option>
							</c:forEach>
					</select>
					<input type="hidden" id="user_email" name="email" />
					</li>
				</ul>
				<c:if test="${!tagoplusSolution1_session_user.snsYn}">
				<ul class="join_list">
					<li>비밀번호</li>
					<li>
						<input type="password" class="join_input01 join_input01_01" min="6"  maxlength="25" id="user_pass" name="userPwd" placeholder="비밀번호">
                        <span class="join_txt_red" id="userPwdCheck"> </span>
					</li>
				</ul>
				<ul class="join_list">
					<li>비밀번호 재입력</li>
					<li>
						<input type="password" class="join_input01 join_input01_01" min="6"  maxlength="25" id="user_pass_repeat" name="userPwd2" placeholder="비밀번호 확인">
						<span class="join_txt_red" id="userPwdCheck2"></span>
					</li>
				</ul>
				</c:if>
				<ul class="join_list">
					<li>추천인</li>
					<li>
						<input type="text" readonly class="join_input01 join_input01_01" id="user_recommended" placeholder="추천인" value="${vo.recommNickname }" />
					</li>
				</ul>
			</div>
		       		
			   </form>
				   <div class="join_agree_bt_set">
			             <a type="button" name="button" onClick="javascript:doSubmit();" class="bt_blue">정보수정</a>
			             <a href="javascript:$.Nav('go', '/main')" class="w-100 btn btn-lg ghost dark">취소</a>
				   </div>
		      </div>
		
	</div>
	<!-- 본인인증 체크 //-->
	<form name="form_chk" method="post" style="display:none;">
		<input type="hidden" name="param_r1">
		<input type="hidden" name="param_r2">
		<input type="hidden" name="param_r3" value="${recomm_code}">
		<input type="hidden" name="m" value="checkplusSerivce">
		<input type="hidden" name="EncodeData" value="${checkplus.sEncDataCheckPlus}">
	</form>
</div>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function findZip(){
         new daum.Postcode({
              oncomplete: function(data) {
                     var addr = ''; // 주소 변수
                     var extraAddr = ''; // 참고항목 변수
                     if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                         addr = data.roadAddress;
                     } else { // 사용자가 지번 주소를 선택했을 경우(J)
                         addr = data.jibunAddress;
                     }
                     if(data.userSelectedType === 'R'){
                         if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                             extraAddr += data.bname;
                         }
                         if(data.buildingName !== '' && data.apartment === 'Y'){
                             extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                         }
                         if(extraAddr !== ''){
                             extraAddr = ' (' + extraAddr + ')';
                         }
                         document.getElementById("user_address").value = addr + extraAddr;

                     } else {
                         document.getElementById("user_address").value = addr;
                     }
                     document.getElementById('user_postcode').value = data.zonecode;
                     document.getElementById("user_detailAddress").focus();
                 }
        }).open();
    }

</script>
<script type="text/javascript">

$(function() {
    $(document).ready(function () {
        $(window).on('load', function () {
            if(isNull($('input[name=phone]').val().trim())){
                $('#btnIpinCheck').show();
            }

            if(!isNull($('input[name=birthDt]').val().trim())){
                $('select[name=selectBank]').hide();
                $('input[name=bank]').show();
                $('input[name=bankAccount]').prop("readonly", true);
                $('input[name=bankAccount]').css("background-color", "#dadada");
                $('input[name=isAccountCheck]').val("1");
                $('#btnBankCheck').hide();
			}

            if(isNull($('input[name=phone]').val().trim()) && isNull($('input[name=birthDt]').val().trim())){
                $('#lblBirthText').text("(본인인증 시 자동입력됩니다.)");
                $('input[name=birthDate]').prop("readonly", true);
                $('input[name=birthDate]').css("background-color", "#dadada");
            }
        });

    });

	$('input[name=userPwd], input[name=userPwd2]').on('input change', function() {
		var sUserPwd = trim($('input[name=userPwd]').val());
		$('input[name=userPwd]').val(trim($('input[name=userPwd]').val()));
		var sUserPwd2 = trim($('input[name=userPwd2]').val());
		$('input[name=userPwd2]').val(trim($('input[name=userPwd2]').val()));

		if (sUserPwd.length < 8) {
			$('#userPwdCheck').show();
			$('#userPwdCheck').prop('class', 'join_txt_red bold');
			$('#userPwdCheck').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');
			} else {
				if(sUserPwd != '' && !checkPattern(sUserPwd, 'PASSWORD_ONLY')){
					$('#userPwdCheck').show();
					$('#userPwdCheck').prop('class','join_txt_red small bold');
					$('#userPwdCheck').text('비밀번호는 영문 및 숫자를 보함해야 합니다.');
				}else {
					$('#userPwdCheck').show();
					$('#userPwdCheck').prop('class', 'join_txt_blue bold');
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
				$('#userPwdCheck2').prop('class', 'join_txt_red small bold');
				$('#userPwdCheck2').text('비밀번호가 다릅니다.');

			} else {
				$('#userPwdCheck2').show();
				$('#userPwdCheck2').prop('class', 'join_txt_blue bold');
				$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
			}
		}
	});
});

$("#emaildom").change(function(){
	$("#email2").val($(this).val());
	console.log($(this).val())
})

$('#recieve_mail').on('change',function (e){$('input[name="transEmailYn"]').val(e.target.checked ? 'Y' : 'N')});

function doSubmit() {
	if(!isNull($('input[name="userPwd"]').val())){
		if ($('#userPwdCheck').prop('class').indexOf('join_txt_blue') < 0) {
			$('#userPwdCheck').attr('class', 'join_txt_red small bold').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
			$('input[name="userPwd"]').focus();
			return;
		}
		if(isNull($('input[name="userPwd2"]').val())){
			$('#userPwdCheck2').attr('class', 'join_txt_red small bold').text('비밀번호를 다시 입력해주세요 .');
			$('input[name=userPwd2]').focus();
			return;
		}
		else{
			if ($('#userPwdCheck2').prop('class').indexOf('join_txt_blue') < 0) {
				$('#userPwdCheck2').attr('class', 'join_txt_red small bold').text('비밀번호를 다시 입력해주세요 .');
				$('input[name="userPwd2"]').focus();
				return;
			}
		}
	}


	if(!isNull($('#emaildom').val()))
		$('#user_email').val($('#email1').val()+"@"+$('#emaildom').val());
	else
		$('#user_email').val($('#email1').val()+"@"+$('#email2').val());
	
	if(isNull($('input[name=userId]').val())){
		$('#userIdCheck').show();
		$('#userIdCheck').attr('class', 'join_txt_red small bold').text('사용할 아이디를 입력하세요.');
		$('input[name=userId]').focus();
		return;
	}
	if(checkNull($('input[name=phone]') , '휴대폰번호를 입력해야 합니다.')) {
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

    if (isNull($('input[name=isAccountCheck]').val()) || $('input[name=isAccountCheck]').val() == "0") {
        $('input[name=bankAccount]').focus();
        alert('계좌번호 인증이 필요합니다.');
        return;
    }
	
	if (!confirm('등록 하시겠습니까?')) {
		return;
	}
	console.log($('#user_email').val())
	$('#formJoin').submit();
}

window.name = "Parent_window";

function ipinCheck() {
    window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
    document.form_chk.action = "${IPIN_CHECK}";
    //https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb
    document.form_chk.target = "popupChk";
    document.form_chk.submit();
}

// 계좌번호 소유주 체크
function accountCheck() {
    if ($('select[name=selectBank]').val() == 0 || $('select[name=selectBank]').val() == '선택') {
        $('select[name=selectBank]').focus();
        alert('은행을 선택해주세요.');
        return;
    }

    if (isNull($('input[name=bankAccount]').val())) {
        $('input[name=bankAccount]').focus();
        alert('계좌번호를 입력하세요.');
        return;
    }

    if (isNull($('input[name=accountOwner]').val())) {
        alert('예금주명을 입력하세요. 예금주명은 본인인증 후에 자동으로 입력됩니다.');
        return;
    }

    if (isNull($('input[name=birthDate]').val())){
        $('input[name=birthDate]').focus();
        alert('계좌번호 인증을 위해 생년월일을 입력해주세요');
        return;
    }

    $.ajax({
        type: 'post',
        url: '/ajax/checkAccount.do',
        data: {
            strResId: $('input[name=birthDate]').val(),
            strNm: $('input[name=accountOwner]').val(),
            strBankCode: $('select[name=selectBank]').val(),
            strAccountNo: $('input[name=bankAccount]').val()
        },
        dataType: 'json',
        success: function (data) {
            if (data.resultCode != "0000") {
                $('input[name=isAccountCheck]').val("0");

                $('#lblBirthText').text("계좌인증에 실패하였습니다.");
                $('#lblBirthText').prop('class', 'join_txt_red small bold');
            } else {
                $('input[name=isAccountCheck]').val("1");

                $('input[name=bankAccount]').css("background-color", '#dadada');
                $('select[name=selectBank]').hide();
                $('input[name=bank]').show();
                $('input[name=bank]').val($('select[name=selectBank] option:checked').text());
                $('input[name=bankAccount]').prop('readonly', true);
                //$('input[name=birthDate]').closest('ul').hide();
                $('input[name=birthDate]').prop('readonly', true);
                $('input[name=birthDate]').css("background-color", '#dadada');
                $('#btnBankCheck').hide();

                $('input[name=birthDt]').val($('input[name=birthDate]').val());

                $('#lblBirthText').text("계좌인증에 성공하였습니다.");
                $('#lblBirthText').prop('class', 'join_txt_blue bold');
            }
        }
    });
}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
