<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<html>
<head>
	<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
	<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
	<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
	<script type="text/javascript" src="/common/js/rsa/rng.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
</head>
<body class="login_bg">
	<div id="login_cont_new">
		<div class="login_area">
        	<div class="login_top">
                <p>관리자 로그인</p>
            </div>
            <div class="login_middle">
				<form name="loginForm" method="post">
				<input type="hidden" id="rsaPublicKeyModulus" name="rsaPublicKeyModulus" value="${publicKeyModulus }" />
				<input type="hidden" id="rsaPublicKeyExponent" name="rsaPublicKeyExponent" value="${publicKeyExponent }" />
                <div class="login_id">
                    <span class="login_txt2">아이디</span>
                    <input type="text" name="userId" id="userId" value="${testId }" maxlength="20" class="input_login" placeholder="아이디" onkeypress="if(event.keyCode==13)javascript:fnIdEnter();">
                </div>
                <div class="login_pw">
                    <span class="login_txt2">비밀번호</span>
                    <input type="password" id="userPassword" name="userPassword" value="${testPwd }" maxlength="20" class="input_login" placeholder="비밀번호" onkeypress="if(event.keyCode==13)javascript:loginSubmit();">
                </div>
                <div class="login_btn">
                    <a href="javascript:loginSubmit();">로그인</a>
                </div>
				</form>
            </div>
            <form id="secureForm" name="secureForm" action="./request_secure_login.do" method="post" style="display:none;">
				<input type="hidden" name="secureId" id="secureId" />
		        <input type="hidden" name="securePwd" id="securePwd" />
			</form>
        </div>
        <p class="login_txt">사이트 관리자님 환영합니다.<br> 관리자 이용을 위해서는 아이디와 비밀번호를 입력해주세요.</p>
	</div>
</body>
</html>
<script type="text/javascript">

function fnIdEnter(){
	
	if (checkNull($('#userPassword'), ''))
		return;
	else
		loginSubmit();
}


function loginSubmit(){
	if (checkNull($('#userId'), '아이디를 입력해주세요.')) {
		return;
	}
	
	if (checkNull($('#userPassword'), '비밀번호를 입력해주세요.')) {
		return;
	}
	
	try {
		var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
		var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
		var rsa = new RSAKey();
		rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
		var securedUsername = rsa.encrypt($('#userId').val());
		var securedPassword = rsa.encrypt($('#userPassword').val());
		$('#secureId').val(securedUsername);
        $('#securePwd').val(securedPassword);
    } 
    catch(err) {
        alert(err);
    }
	
    $('#secureForm').submit();	
}
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>