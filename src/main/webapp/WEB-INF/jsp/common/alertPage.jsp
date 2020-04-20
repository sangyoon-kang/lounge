<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%--
	공통 alert page
--%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			$(document.body).css('background', 'none');
		});
	</script>
	

	<c:if test="${!empty alert.message}">
		<script type="text/javascript">
			var sMsg = '${fn:escapeXml(alert.message) }';
			alert(sMsg);
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

	
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>