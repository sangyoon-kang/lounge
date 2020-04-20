<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true"  pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%-- 
	site meta 
 --%>
 	<meta http-equiv="Cache-Control" content="No-Cache" />
   	<meta http-equiv="Pragma" content="no-cache" />
<c:if test="${!empty vo }">
	<meta name="title" content="${vo.metaTitle }" />
	<meta name="description" content="${vo.metaDescription }" />
	<meta name="keywords" content="${vo.metaKeywords }" />
	<meta name="subject" content="${vo.metaSubject }" />
</c:if>