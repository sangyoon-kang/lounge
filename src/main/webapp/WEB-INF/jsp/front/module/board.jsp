<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		게시판 모듈
		필수 파라미터 : mode
			- list 또는  빈 문자열 : 목록
			- view : 상세
			- write : 등록/수정 
 --%>
 
 
<c:choose>
	<c:when test="${search.mode eq 'view'}">
		<jsp:include page="/module/bbs/view" flush="true" />
	</c:when>
	<c:when test="${search.mode eq 'write'}">
		<jsp:include page="/module/bbs/write" flush="true" />
	</c:when>
	<c:otherwise>
		<jsp:include page="/module/bbs/list" flush="true" />
	</c:otherwise>
</c:choose>
	