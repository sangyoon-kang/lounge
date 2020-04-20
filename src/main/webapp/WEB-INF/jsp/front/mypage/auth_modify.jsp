<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<style>
.username{
	font-size: 28px;
	font-weight: 500;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px
}
</style>

<nav id="wrap_lnb">
<div>
	<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
	<div class="lnb_select">
		<h3 class="lnb_select_tit first">FX회원수정</h3>
		<%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp"%>
		</div>
	</div>
</nav>

<section class="wrap_scon">
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
		<div class="scon">
			<ul class="board_tab_sty01 board_tab_sty01_num04">
				<li class="current" data-tab="board-tab-1"><a href="javascript:$.Nav('go', '/auth', {id: '${tagoplusSolution1_session_user.userId}'});">FX회원수정</a></li>
				<li class="" data-tab="board-tab-2"><a href="/mypage/out.do">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div id="board-tab-1" class="board-tab-content current">
			<div class="scon" style="padding-top:0;">
				<div class="section_login">
					<p >회원님의 정보 보호를 위해 비밀번호를 한번 더 입력해 주세요.</p>
					<ul class="login_p01">
						<li class="username">${tagoplusSolution1_session_user.userId}</li>
						<li>
							<input type="password" id="user_pass" name="userPwd" placeholder="비밀번호" onkeypress="if(event.keyCode==13)javascript:doLogin();" required/>
						</li>
						<li><a href="#" onClick="javascript:doLogin(event);">로그인</a>
					</ul>
				</div>
			</div>
		</div>
</section>

<form id="secureForm" action="/request_modify.do?id=${tagoplusSolution1_session_user.userId}" method="post" style="display:none;">
	<input type="hidden" name="secureId" id="secureId" />
    <input type="hidden" name="securePwd" id="securePwd" />
    <input type="hidden" name="returnUrl" value="${returnUrl }" />
</form>
<script>
     feather.replace();
    function doLogin(event) {
    	event.preventDefault();
   		if (trim($('input[name=userPwd]').val()).length == 0) {
   			alert('비밀번호를 입력해 주세요.');
   			return;
   		}
   		
   		try {
   			var securedPassword = $('input[name=userPwd]').val();
   	        $('#securePwd').val(securedPassword);
   	    } 
   	    catch(err) {
   	        alert(err);
   	    }
   		
   		$('#secureForm').submit();
   	}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
