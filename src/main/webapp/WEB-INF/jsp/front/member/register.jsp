<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp" %>
<nav id="wrap_lnb">
    <div>
        <a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home"/></a>
        <div class="lnb_select">
            <h3 class="lnb_select_tit first"> 회원가입</h3>
            <%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp" %>
        </div>
    </div>
</nav>
<style>
    #cke_1_bottom, #cke_2_bottom, #cke_3_bottom {
        display: none;
    }

    #cke_1_top, #cke_2_top, #cke_3_top {
        display: none;
    }

    .cke_editable {
        padding: 10px;
        display: none;
    }

    #register-agree textarea {
        display: none;
    }
</style>

<section class="wrap_scon">
    <div class="scon">
        <form name="joinForm" id="joinForm" method="post" action="/join" style="display:none;">
            <input type="hidden" name="cert_type">
            <input type="hidden" name="ipin_param1">
            <input type="hidden" name="ipin_param2">
            <input type="hidden" name="ipin_param3">
            <input type="hidden" name="ipin_encdata">
            <input type="hidden" name="recomm_code" value="${recomm_code}">
            <input type="hidden" name="mode" value="check">
        </form>
        <form name="form_chk" method="post" style="display:none;">
            <input type="hidden" name="param_r1">
            <input type="hidden" name="param_r2">
            <input type="hidden" name="param_r3" value="${recomm_code}">
            <input type="hidden" name="m" value="checkplusSerivce">
            <input type="hidden" name="EncodeData" value="${checkplus.sEncDataCheckPlus}">
        </form>

        <h3 class="con_tit">회원정보입력</h3>
        <form id="formJoin" name="formJoin" action="/join_proc.do" method="post" class="col-sm-6 mx-auto">
            <input type="hidden" name="mseq" value="${empty vo.memberSeq ? 0 : vo.memberSeq }">
            <input type="hidden" name="transEmailYn" value="N">
            <input type="hidden" name="recommUserId" value="${recommUserId}">
            <input type="hidden" name="certType" value="">
            <input type="hidden" name="ipinEncdata" value="">
            <input type="hidden" name="bank" value="">
            <input type="hidden" name="isAdult" value="">
            <input type="hidden" name="birthDate" value="">
            <input type="hidden" name="gender" value="">
            <input type="hidden" name="isAccountCheck" value="">
            <div class="join_con">
                <ul class="join_list">
                    <li>아이디</li>
                    <li>
                        <input type="text" min="6" id="userId" maxlength="20" name="userId" placeholder="아이디를 입력하세요."
                               class="join_input01"/><a onClick="javascript:doCheck();" class="join_bt01">중복체크</a>
                        <span class="join_txt_red" id="userIdCheck"></span>
                    </li>
                </ul>
                <ul class="join_list">
                    <li>이름</li>
                    <li>
                        <input type="text" id="user_name" maxlength="100" name="userName" value="${search.userName }"
                               class="join_input01 " readonly style="background-color: rgb(218, 218, 218);"/><a
                            onclick="javascript:ipinCheck();" class="join_bt01">본인인증 </a>
                        <span class="join_txt_red small bold" id="userNameChk"
                              style="display:none;">이미 등록되어 있습니다.</span>
                    </li>

                </ul>
                <ul class="join_list">
                    <li>휴대폰번호</li>
                    <li>
                        <!-- <select class="join_select">
                        <option>010</option>
                        </select> -->
                        <input type="text" maxlength="3" class="join_input02" id="phone1" name="phone1" readonly
                               style="background-color: rgb(218, 218, 218);"/><span class="join_bar_txt">
						-</span><input type="text" maxlength="4" class="join_input02" id="phone2" name="phone2" readonly
                                       style="background-color: rgb(218, 218, 218);"/><span class="join_bar_txt">
						-</span><input type="text" maxlength="4" class="join_input02" id="phone3" name="phone3" readonly
                                       style="background-color: rgb(218, 218, 218);"/>

                        <input type="hidden" id="user_mobile_number" maxlength="24" name="phone" readonly
                               value="${search.phone }" placeholder="휴대폰">
                        <span class="join_txt_red small bold" id="userMobileChk"
                              style="display:none;">이미 등록되어 있습니다.</span>
                    </li>
                </ul>
                <ul class="join_list">
                    <li>비밀번호</li>
                    <li>
                        <input type="password" class="join_input01 join_input01_01" min="6" maxlength="25"
                               id="user_pass" name="userPwd" placeholder="비밀번호">

                        <!-- <fieldset>

                                 <span class="show-pass show"></span>
                            </fieldset> -->
                        <span class="join_txt_red" id="userPwdCheck"> </span>
                    </li>
                </ul>
                <ul class="join_list">
                    <li>비밀번호 재입력</li>
                    <li>
                        <input type="password" class="join_input01 join_input01_01" min="6" maxlength="25"
                               id="user_pass_repeat" name="userPwd2" placeholder="비밀번호 확인">
                        <span class="join_txt_red" id="userPwdCheck2"></span>
                    </li>
                </ul>
                <ul class="join_list">
                    <li>예금주</li>
                    <li>
                        <input type="text" class="join_input01 join_input01_01" value="" id="user_account_holder"
                               maxlength="8" name="accountOwner" placeholder="예금주명" readonly/>

                    </li>
                </ul>
                <!-- 				<ul class="join_list">
                                    <li>주민번호 앞자리</li>
                                    <li><input type="text" placeholder="주민번호 앞 6자리"  maxlength="6" name="ipin" class="join_input01 join_input01_01"/></li>
                                </ul> -->
                <ul class="join_list">
                    <li>은행</li>
                    <li><select class="join_select join_select02" name="selectBank">
                        <option>선택</option>

                        <c:forEach items="${bankList}" var="m" varStatus="s">
                            <option ${vo.bank eq m.codeName ? 'selected' : ''}
                                    value="${m.codeDesc2 }">${m.codeName }</option>
                        </c:forEach>
                    </select></li>
                </ul>
                <ul class="join_list">
                    <li>계좌번호</li>
                    <li>
                        <input type="text" placeholder="계좌번호 입력" class="join_input01 onlyNumber"
                               id="user_account_number" maxlength="24" name="bankAccount"/><a
                            onclick="javascript:accountCheck();" class="join_bt01">계좌번호 인증 </a>
                        <!-- <a href="" class="join_bt01">확인</a> -->
                    </li>
                </ul>
                <ul class="join_list">
                    <li>이메일</li>
                    <li>
                        <input type="text" class="join_input02" maxlength="24" id="email1"/><span
                            class="join_bar_txt join_bar_txt02">
					@</span><input type="text" class="join_input02" id="email2"/><select
                            class="join_select join_select03" id="emaildom">
                        <option selected value="">직접입력</option>
                        <c:forEach items="${emaildomains}" var="m" varStatus="s">
                            <option value="${m.value }">${m.value }</option>
                        </c:forEach>
                    </select>

                        <input type="hidden" class="form-control" id="user_email" name="email" maxlength="24"
                               placeholder="이메일">
                    </li>
                </ul>

                <ul class="join_list">
                    <li>추천지점</li>
                    <li>
                        <input type="text" class="join_input01 join_input01_01" id="user_recommended" placeholder="추천지점"
                               value="" ${!empty recommUserId ? 'readonly' : ''} />

                        <span class="join_txt_red" id="recUserIdCheck">(추천지점은 대리점에 문의하세요.)</span>
                    </li>
                </ul>
            </div>
            <h3 class="con_tit mt60">회원가입약관</h3>
            <div class="join_agree_box join_agree_box_fir">
                <p>
                    <label>
                        <input type="checkbox" name="checkbox-01" id="selectAll"/>
                        <span>전체동의</span>
                    </label>
                    <span class="join_agree_txt">회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</span></p>
            </div>
            <div class="join_agree_box">
                <h4 class="con_stit">개인정보수집 및 이용동의서 (필수)</h4>
                <div>
                    <p>
                        <c:forEach items="${term }" var="t2">
                            <c:if test="${t2.contentsType eq 'memterms'}">
                                ${t2.contents }
                            </c:if>
                        </c:forEach></p>
                </div>
                <p><label><input type="checkbox" name="checks"
                                 id="personal_information"/><span>회원가입약관의 내용에 동의합니다.</span></label></p>

				<ul class="join_list">
					<li>추천지점</li>
					<li>
                        <div class="ui-widget">
                            <input type="text" class="join_input01 join_input01_01" id="user_recommended" placeholder="추천지점" value="" ${!empty recommUserId ? 'readonly' : ''}
                                   autocomplete="off"/>
                        </div>
                        <span class="join_txt_red" id="recUserIdCheck">(추천지점은 대리점에 문의하세요.)</span>
					</li>
				</ul>
			</div>
			<h3 class="con_tit mt60">회원가입약관</h3>
			<div class="join_agree_box join_agree_box_fir">
				<p>
				<label>
				<input type="checkbox" name="checkbox-01" id="selectAll"  />
				<span>전체동의</span>
				</label>
				<span class="join_agree_txt">회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.</span></p>
			</div>
			<div class="join_agree_box">
				<h4 class="con_stit">개인정보수집 및 이용동의서 (필수)</h4>
				<div>
					<p>
					<c:forEach items="${term }" var="t2">
						<c:if test="${t2.contentsType eq 'memterms'}">
							${t2.contents }
						</c:if>
					</c:forEach></p>
				</div>
				<p><label><input type="checkbox" name="checks"  id="personal_information" /><span>회원가입약관의 내용에 동의합니다.</span></label></p>


                <h4 class="con_stit con_stit_line">서비스이용약관 (필수)</h4>
                <div>
                    <p>
                        <c:forEach items="${term }" var="t1">
                            <c:if test="${t1.contentsType eq 'terms'}">
                                ${t1.contents }
                            </c:if>
                        </c:forEach>
                    </p>
                </div>
                <p><label><input type="checkbox" name="checks" id="usage"/><span>서비스 이용약관 내용에 동의합니다.</span></label></p>

                <h4 class="con_stit con_stit_line">개인정보 처리 방침 (필수)</h4>
                <div>
                    <p>
                        <c:forEach items="${term }" var="t">
                            <c:if test="${t.contentsType eq 'privacy'}">
                                ${t.contents }
                            </c:if>
                        </c:forEach>
                    </p>
                </div>
                <p><label><input type="checkbox" name="checks"
                                 id="condition"/><span>개인정보 처리 방침 내용에 동의합니다.</span></label></p>
            </div>
            <div class="join_agree_bt_set">
                <a onClick="javascript:doSubmit();" class="bt_blue">회원가입</a><a href="javascript:$.Nav('go', '/')">취소</a>
            </div>
        </form>
    </div>

</section>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
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
                    alert("계좌 인증에 실패 하였습니다.");
                } else {
                    $('input[name=isAccountCheck]').val("1");
                    alert("계좌가 확인되었습니다.");
                }
            }
        });
    }

    // function goEmailValue(){
    //      var domain =  $(this).find("option:selected").text();
    //      console.log(domain);
    // };
    function findZip() {
        new daum.Postcode({
            oncomplete: function (data) {
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
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
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
    $(document).ready(function () {

        var phonenumber = $('#user_mobile_number').val();

        $('#phone1').val(phonenumber.substring(0, 3));
        $('#phone2').val(phonenumber.substring(3, 7));
        $('#phone3').val(phonenumber.substring(7, 11));


        // 한글입력막기 스크립트
        $("#userId").keyup(function (e) {
            if (!(e.keyCode >= 37 && e.keyCode <= 40)) {
                var v = $(this).val();
                $(this).val(v.replace(/[^a-z0-9]/gi, ''));
            }
        });
    });


</script>

<script type="text/javascript">

    $("#emaildom").change(function () {
        $("#email2").val($(this).val());
    })

    $(function () {
        $("#userId").bind('keypress', function (e) {
            var regex = new RegExp("^[a-zA-Z0-9 ]+$");
            var key = event.which || event.keyCode;
            var str = "";
            if (event.keyCode == 13) {
                str = $(this).val();
            } else {
                str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            }

            if (regex.test(str)) return true;
            e.preventDefault();
            $(this).val("");
            return false;
        });
        $("#phone1, #phone2, #phone3").bind('keypress', function (e) {
            var regex = new RegExp("^[0-9]+$");
            var key = event.which || event.keyCode;
            var str = "";
            if (event.keyCode == 13) {
                str = $(this).val();
            } else {
                str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
            }

            if (regex.test(str)) return true;
            e.preventDefault();

            return false;
        });
    });

    $('#userIdCheck').hide();
    $('#userPwdCheck').hide();
    //$('#recUserIdCheck').hide();
    $('#userPwdCheck2').hide();
    $(function () {
        var rec_code = decodeURIComponent("${recommUserId}");
        $('#user_recommended').val(rec_code);
        checkRecomm();


        $('input[name=userPwd], input[name=userPwd2]').on('input change', function () {
            var sUserPwd = trim($('input[name=userPwd]').val());
            $('input[name=userPwd]').val(trim($('input[name=userPwd]').val()));
            var sUserPwd2 = trim($('input[name=userPwd2]').val());
            $('input[name=userPwd2]').val(trim($('input[name=userPwd2]').val()));

            if (sUserPwd.length < 8) {
                $('#userPwdCheck').show();
                $('#userPwdCheck').prop('class', 'join_txt_red bold');
                $('#userPwdCheck').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');
            } else {
                if (sUserPwd != '' && !checkPattern(sUserPwd, 'PASSWORD_ONLY')) {
                    $('#userPwdCheck').show();
                    $('#userPwdCheck').prop('class', 'join_txt_red small bold');
                    $('#userPwdCheck').text('비밀번호는 영문 및 숫자를 보함해야 합니다.');
                } else {
                    $('#userPwdCheck').show();
                    $('#userPwdCheck').prop('class', 'join_txt_blue bold');
                    $('#userPwdCheck').text('비밀번호가 입력되었습니다.');
                }
            }
            if ($('input[name=userPwd]').val() == '') {
                $('#userPwdCheck').hide();
            }
            if ($('input[name=userPwd2]').val() == '') {
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
        $('#user_recommended').on('keyup', function () {
            checkRecomm();
        });

        function checkRecomm() {
            var nickName = trim($('#user_recommended').val());
            $('#user_recommended').val(nickName);
            if (nickName != '') {
                $.ajax({
                    type: 'post',
                    url: '/ajax/checkNickname.do',
                    data: {
                        nickname: nickName
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.result == null) {
                            $('input[name=recommUserId]').val('');
                            $('#recUserIdCheck').show();
                            $('#recUserIdCheck').attr('class', 'join_txt_red bold');
                            $('#recUserIdCheck').text('등록되지 않은 추천지점입니다.');
                        } else {
                            $('input[name=recommUserId]').val(data.result.userID);
                            $('#recUserIdCheck').show();
                            $('#recUserIdCheck').attr('class', 'join_txt_blue bold');
                            $('#recUserIdCheck').text('등록된 추천지점입니다.');
                        }
                    }
                });
            } else if ($('#user_recommended').val() == '') {
                $('#recUserIdCheck').show();
                $('#recUserIdCheck').attr('class', 'join_txt_blue bold');
                /* $('#recUserIdCheck').text( '(추천지점이 없는 경우




                ${SITE_NAME_U}를 입력하세요.)'); */
            }
        }
    });
			} else {
				$('#userPwdCheck2').show();
				$('#userPwdCheck2').prop('class', 'join_txt_blue bold');
				$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
			}
		}


	});


	// 지점검색 자동완성기능 추가 dj.kim
    var recommList = [];
    <c:forEach var="member" items="${recommendList}">
        recommList.push({label : "${member.nickname}", data : "${member.userID}"});
    </c:forEach>


    $("#user_recommended").autocomplete({
        source: recommList,

        select: function(event, ui) {
            console.log(ui.item);
            $('input[name=recommUserId]').val(ui.item.data);
            $('#recUserIdCheck').show();
            $('#recUserIdCheck').attr('class', 'join_txt_blue bold');
            $('#recUserIdCheck').text( '등록된 추천지점입니다.');
        },
        focus: function(event, ui) {
            return false;
        },
        change: function(event, ui){
            return false;
        }
    });


	$('#user_recommended').on('change', function() {
        var _this = this;
        recommList.some(function (row, idx) {
            if (row.label == $(_this).val()) {
                $('input[name=recommUserId]').val(row.data);
                return true;
            }
            $('input[name=recommUserId]').val('');
        });

        if($('input[name=recommUserId]').val() == ""){
            $('#recUserIdCheck').show();
            $('#recUserIdCheck').attr('class', 'join_txt_red bold');
            $('#recUserIdCheck').text( '등록되지 않은 추천지점입니다.');
        }else{
            $('#recUserIdCheck').show();
            $('#recUserIdCheck').attr('class', 'join_txt_blue bold');
            $('#recUserIdCheck').text( '등록된 추천지점입니다.');
        }
		//checkRecomm();
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
							$('#recUserIdCheck').attr('class', 'join_txt_red bold');
							$('#recUserIdCheck').text( '등록되지 않은 추천지점입니다.');
						} else {
							$('input[name=recommUserId]').val(data.result.userID);
							$('#recUserIdCheck').show();
							$('#recUserIdCheck').attr('class', 'join_txt_blue bold');
							$('#recUserIdCheck').text( '등록된 추천지점입니다.');
						}
					}
				});
		} else if ($('#user_recommended').val() == ''){
			$('#recUserIdCheck').show();
			$('#recUserIdCheck').attr('class', 'join_txt_blue bold');
			/* $('#recUserIdCheck').text( '(추천지점이 없는 경우 ${SITE_NAME_U}를 입력하세요.)'); */
		}
	}
});

    function scrollTo(el) {
        $('html, body').animate({
            scrollTop: $(el).offset().top - 500
        }, 500);
        alert('회원가입약관 및 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.')
        $(el).focus();
    }

    $('#recieve_mail').on('change', function (e) {
        $('input[name="transEmailYn"]').val(e.target.checked ? 'Y' : 'N')
    });

    function doSubmit() {
        var sId = '${vo.userId}';

        if (sId == '') {
            if ($('#emaildom').val() != "") {
                $('#user_email').val($('#email1').val() + "@" + $('#emaildom').val());
            } else {
                $('#user_email').val($('#email1').val() + "@" + $('#email2').val());
            }

            if (isNull($('input[name=userId]').val())) {
                $('#userIdCheck').show();
                $('#userIdCheck').attr('class', 'join_txt_red small bold').text('사용할 아이디를 입력하세요.');
                $('input[name=userId]').focus();
                return;
            }

            if ($('#userNameChk').is(':visible') && $('#userMobileChk').is(':visible')) {
                alert($('#userNameChk').text());
                return;
            }

            if (isNull($('input[name=userPwd]').val())) {
                $('#userPwdCheck').show();
                $('#userPwdCheck').attr('class', 'join_txt_red small bold').text('비밀번호를 입력해주세요');
                $('input[name=userPwd]').focus();
                return;
            }

            if ($('#userIdCheck').prop('class').indexOf('join_txt_blue') < 0) {
                $('#userIdCheck').show();
                $('#userIdCheck').attr('class', 'join_txt_red small bold').text('사용 불가능한 아이디 입니다.');
                $('input[name=userId]').focus();
                return;
            }

            if ($('#userPwdCheck').prop('class').indexOf('join_txt_blue') < 0) {
                $('#userPwdCheck').show();
                $('#userPwdCheck').attr('class', 'join_txt_red small bold').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');
                $('input[name="userPwd"]').focus();
                return;
            }
            if ($('#userPwdCheck2').prop('class').indexOf('join_txt_blue') < 0) {
                $('#userPwdCheck2').show();
                $('#userPwdCheck2').attr('class', 'join_txt_red small bold').text('비밀번호를 다시 입력해주세요 .');
                $('input[name="userPwd2"]').focus();
                return;
            }
        }

        if (isNull($('input[name=userName]').val())) {
            $('input[name=userName]').focus();
            alert('이름 입력하세요.');
            return;
        }
        if (isNull($('input[name=phone]').val())) {
            $('input[name=phone]').focus();
            alert('휴대폰번호 입력하세요.');
            return;
        }

        if (isNull($('input[name=accountOwner]').val())) {
            $('input[name=accountOwner]').focus();
            alert('예금주명 입력이 필요합니다. 예금주명은 본인인증 후에 자동으로 입력됩니다.');
            return;
        }

        if ($('select[name=selectBank]').val() == 0 || $('select[name=selectBank]').val() == '선택') {
            $('select[name=selectBank]').focus();
            alert('은행을 선택해주세요.');
            return;
        } else {
            $('input[name=bank]').val($('select[name=selectBank] option:selected').text());
        }

        if (isNull($('input[name=bankAccount]').val())) {
            $('input[name=bankAccount]').focus();
            alert('계좌번호를 입력하세요.');
            return;
        }

        if (isNull($('input[name=isAccountCheck]').val()) || $('input[name=isAccountCheck]').val() == "0") {
            alert('계좌번호 인증이 필요합니다.');
            return;
        }

        if ($('#recieve_mail').prop('checked')) {
            if (isNull($('input[name=email]').val())) {
                $('input[name=email]').focus();
                alert('이메일를 입력하세요.');
                return;
            }
        }

        if (isNull($('input[name=recommUserId]').val())) {
            $('input[name=recommUserId]').focus();
            alert('추천지점을 입력하세요.');
            return;
        }

        if (!$('#selectAll').prop('checked')) {
            var isRequired = true;
            var checkcount = 0;
            $.each($('input[name=checks]'), function () {
                if (!$(this).prop('checked')) {
                    //scrollTo("#selectAll")
                    checkcount = checkcount + 1
                    isRequired = false;
                }
            });
            if ($('input[name=checks]').length == checkcount)
                scrollTo("#selectAll")
            if (!isRequired)
                return;
        }

        if (!confirm('등록 하시겠습니까?')) {
            return;
        }
        $('#formJoin').submit();
    }
</script>

<script>
    $(document).ready(function () {
        $(window).on('load', function () {
            $('.cke_editable').css({'display': 'block'});
            $('#register-agree textarea').css({'opacity': '1'});
        });

    });


    $('#selectAll').click(function () {
        $('input:checkbox').not(this).prop('checked', this.checked);
    })

    $('input[name=checks]').click(function () {
        if (!$(this).prop('checked')) {
            $('#selectAll').prop('checked', false)
        }
    });

    $("#personal_information").click(function () {
        viewTerms();
    })
    $("#usage").click(function () {
        viewTerms();
    })
    $("#condition").click(function () {
        viewTerms();
    })

    function viewTerms() {

        if (!$("#personal_information").is(":checked") || !$("#usage").is(":checked") || !$("#condition").is(":checked")) {
            $("#selectAll").prop("checked", false);
        }

        if ($("#personal_information").is(":checked") && $("#usage").is(":checked") && $("#condition").is(":checked")) {
            $("#selectAll").prop("checked", true);
        }

        return true;
    }

    function doCheckAgree() {

        if (!$('#selectAll').prop('checked')) {
            var isRequired = true;
            $.each($('input[name=checks]'), function () {
                if (!$(this).prop('checked')) {
                    $(this).parent().find(".req").text("(필수)");
                    isRequired = false;
                } else {
                    $(this).parent().find(".req").text("");
                }
            });
            if (!isRequired)
                return;
        } else {
            var isRequired = true;
            $.each($('input[name=checks]'), function () {
                if (!$(this).prop('checked')) {
                    $(this).parent().find(".req").text("(필수)");
                    isRequired = false;
                }
            });
            if (!isRequired)
                return;
        }


        $.Nav('self', {isAgreed: true, recomm_code: '${recomm_code}'}, null, true);
    }

    function doCheck() {

        var sUserId = trim($('input[name=userId]').val());
        $('input[name=userId]').val(trim($('input[name=userId]').val()));
        if (sUserId != '') {
            if (sUserId.length < 6) {
                $('#userIdCheck').show();
                $('#userIdCheck').attr('class', 'join_txt_red small bold');
                $('#userIdCheck').text('영문자로 시작하는 6~20자 영문자 또는 숫자이어야 합니다. 아이디 중복체크 필수');
            } else {
                $.ajax({
                    type: 'post',
                    url: '/ajax/checkId.do',
                    data: {
                        id: sUserId
                    },
                    dataType: 'json',
                    success: function (data) {
                        if (data.result == null) {
                            $('#userIdCheck').show();
                            $('#userIdCheck').attr('class', 'join_txt_blue bold');
                            $('#userIdCheck').text('사용 가능한 아이디 입니다.');
                        } else {
                            $('#userIdCheck').show();
                            $('#userIdCheck').attr('class', 'join_txt_red small bold');
                            $('#userIdCheck').text('사용 불가능한 아이디 입니다.');
                        }
                    }
                });
            }
        } else {
            $('#userIdCheck').hide();
        }


    }

</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp" %>
