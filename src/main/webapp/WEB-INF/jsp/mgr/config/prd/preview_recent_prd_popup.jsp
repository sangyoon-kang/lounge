<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 메인게시물 미리보기 팝업
		- 프론트 css 적용
 --%>
<%@ include file="/WEB-INF/include/front_start_html.jsp"%>

<div class="pop_scon">
	
	<jsp:include page="/module/rp.do" flush="true">
		<jsp:param name="rpseq" value="${search.rpseq }" />
	</jsp:include>
	
</div>

<%@ include file="/WEB-INF/include/front_end_html.jsp"%>