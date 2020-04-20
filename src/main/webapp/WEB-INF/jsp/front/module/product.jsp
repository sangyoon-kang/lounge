<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		제품 모듈
		필수 파라미터 : mode
			- list 또는  빈 문자열 : 목록
			- view : 상세
			 
 --%>
<c:choose>
	<c:when test="${search.mode eq 'view'}">
		<jsp:include page="/module/prd/view" flush="true" />
	</c:when>	
	<c:when test="${search.mode eq 'list'}">
		<jsp:include page="/module/prd/list" flush="true" />
	</c:when>
</c:choose>
	