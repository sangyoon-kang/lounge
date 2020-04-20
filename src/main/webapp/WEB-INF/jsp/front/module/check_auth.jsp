<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		권한 체크 모듈
		/module/check_auth 참조
 --%>

 	<c:if test="${!empty alert.message}">
		<script type="text/javascript">
			alert('${alert.message }');
		</script>
	</c:if> 
	
	<c:if test="${!empty alert.href}">
		<script type="text/javascript">
			location.href = '${alert.href }';
		</script>
	</c:if>
	
	<c:if test="${!empty alert.script}">
		<script type="text/javascript">
			${alert.script }
		</script>
	</c:if>