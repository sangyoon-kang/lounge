<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<div id="wrapper">
		<div id="container">
			<div class="content">
				
				<p style="margin-top:250px; margin-bottom:15px; font-size:30px;  text-align:center; font-weight:600;">사이트 정보가 등록되었습니다. </p>
				<div>도메인 : ${site.siteDomain }</div>
				<div>사이트 이름 : ${site.siteName }</div>
				<div>슈퍼유저 아이디 : ${site.suId }</div>
				<div>슈퍼유저 비밀번호 : ${site.suPwd }</div>
				
				<div class="mT20">
					<input type="button" onclick="javascript:doLogin();" value="관리자 로그인" />
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(document.body).css('background', 'none');
		});
	
		function doLogin() {
			location.href = '${URL_ADMIN_LOGIN}';
		}
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>