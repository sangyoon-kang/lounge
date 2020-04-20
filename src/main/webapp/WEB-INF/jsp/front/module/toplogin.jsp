<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	Top Login/Join Url, Img
 --%>
<c:if test="${empty tagoplusSolution1_session_user }">							
	<dd><a href="javascript:$.Nav('go', '${setting1.memLoginUrl }');" class="btn_login"><img width="30" src="${setting.memLoginImg }" title="Member Login Image">로그인</a></dd>
	<dd><a href="${setting1.memRegUrl }"><img src="${setting.memRegImg }" width="30" title="Member Register Image">회원가입</a></dd>
</c:if>
