<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	Top MyPage/Logout Url, Img
 --%>
<c:if test="${!empty tagoplusSolution1_session_user }">
	<dd><a href="javascript:$.Nav('go', '${setting1.memInfoUrl }', {id: '${tagoplusSolution1_session_user.userId}'});" class="btn_login"><img width="30" src="${setting.memMyPageImg }" title="Member Info Image">마이 페이지</a></dd>
	<dd><a href="javascript:doLogout();"><img src="${setting.memLogoutImg }" width="30" title="Member Logout Image">로그아웃</a></dd>
	<script>
		function doLogout() {
			$.Nav('go', '/logout', null, null, true);	
		}
	</script>
</c:if>