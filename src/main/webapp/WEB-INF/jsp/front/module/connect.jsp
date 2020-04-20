<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<c:if test="${not empty vo.googleUa}">
<script async src="https://www.googletagmanager.com/gtag/js?id=${vo.googleUa}" ></script>
	<script>
		  window.dataLayer = window.dataLayer || [];
		  function gtag(){dataLayer.push(arguments);}
		  gtag('js', new Date());			
		  gtag('config', '${vo.googleUa}');
		  
	</script>
	</c:if>