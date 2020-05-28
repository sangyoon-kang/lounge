<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<style>
	#wrap_pop {float:left; width:950px !important; margin:20px; height: auto;}
	.back-red{
		color:#ff3000 !important;
	}
	.back-sky{
		color:#0066d9 !important;
	}
</style>
<div class="scroll-x w-100">
	<div style="padding-bottom: 10px"><label>${search.userId} 님의 ${pageTitle}</label></div>
	<table class="table board_st1" >
		<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
		<tr>
			<th>일자</th>
			<th>시간</th>
			<th>금액</th>
			<th>지급자ID</th>
			<th>지급사유</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m" varStatus="l">
			<tr>
				<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT}"/></td>
				<td><fmt:formatDate value="${m.regDate }" pattern="${TIME_FORMAT}"/></td>
				<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
				<td>${m.regUser}</td>
				<td>${m.memo}</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan="10"><s:message code="common.noData" /></td>
			</tr>
		</c:if>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
</div>