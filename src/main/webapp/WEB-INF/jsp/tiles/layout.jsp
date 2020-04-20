<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title><s:eval expression="@globals['site.baseTitle']" /> - ${pageTitle }</title>
<%-- 
context path : ${pageContext.request.contextPath} 
--%>	
	<link rel="stylesheet" href="/common/css/ui.style.css" />
	
	<script src="/common/js/jquery/jquery-1.10.2.min.js?t=<%=System.currentTimeMillis() %>"></script>
	<script src="/common/js/jquery/jquery-ui-1.10.3.custom.min.js"></script>
	<script src="/common/js/jquery/jquery.tmpl.min.js"></script>
	<script src="/common/js/jquery/jquery.tmplPlus.js"></script>
	<script src="/common/js/jquery/jquery.locator.js"></script>
	<script src="/common/js/lib.js"></script>
	<script src="/common/js/common.jquery.util.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="body" />

	<tiles:insertAttribute name="footer" />
</body>
</html>
	