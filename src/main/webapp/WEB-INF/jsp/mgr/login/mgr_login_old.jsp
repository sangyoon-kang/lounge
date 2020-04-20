<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/common/js/rsa/rng.js"></script>

<!--wrap_scon S-->
<div id="wrap_scon">
	
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
	
	<div id="divLogin" style="width: 200px;">
		<h4 class="mb10">타고플러스 솔루션 관리자 로그인</h4>
		<form id="form1" method="post">
			<div class="mb10">
				<input type="text" id="userId" name="userId" placeholder="아이디" value="${testId }" />
			</div>
			<div class="mb10">
				<input type="password" id="userPassword" name="userPassword" placeholder="비밀번호" value="${testPwd }" />
			</div>
		</form>
		<div class="btn_area center">
			<button id="btnLogin" class="btn_login" onclick="javascript:doLogin();">로그인 </button>
		</div>
	</div>
	
	<form id="secureForm" action="./request_secure_login.do" method="post" style="display:none;">
		<input type="hidden" name="secureId" id="secureId" />
        <input type="hidden" name="securePwd" id="securePwd" />
	</form>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
	$(function() {
		$(document.body).css({
			'background': 'none'
			, 'padding': ' 10px 20px'
		});
		
		var iMarginTop = ($(document).height() - $('#divLogin').height()) / 2;
		var iMarginLeft = ($(document).width() - $('#divLogin').width()) / 2 - ($('#divLogin').width() / 2);
		$('#divLogin').css({'margin-top': iMarginTop, 'margin-left': iMarginLeft});
		
		
		$('#userId').focus();
		
		$('#userId').keypress(function(event) {
			if (event.which == 13) {
				$('#userPassword').focus();
				event.preventDefault();
			}
		});
		
		$('#userPassword').keypress(function(event) {
			if (event.which == 13) {
				$('#btnLogin').click();
				event.preventDefault();
			}
		});
	});
	
	
	function doLogin() {
		if ($('#userId').val().Trim().length == 0) {
			alert('아이디를 입력해 주세요.');
			return;
		}
		
		if ($('#userPassword').val().Trim().length == 0) {
			alert('비밀번호를 입력해 주세요.');
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