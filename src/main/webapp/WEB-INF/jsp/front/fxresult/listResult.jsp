<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_start_popup.jsp"%>
<div class="pop_con pop_result" id="viewdata">
	<h2>API 데이터</h2>
	<!-- <span  onclick="javascript:closeView();" class="pop_close">닫기</span> -->
	
	<div class="pop_result_con">
		<!--list_basic_type01-->
		<div class="board_basic_type01">
			<table>
				<colgroup>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
					<col></col>
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>시간</th>
						<th>시가</th>
						<th>고가</th>
						<th>저가</th>
						<th>종가</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="m" varStatus="s">
			<tr>
				<td>${m.rowNumber}</td>
				<td>${m.resultTime}</td>
				<td>${m.sVal}</td>
				<td>${m.hVal}</td>
				<td>${m.lVal}</td>
				<td>${m.eVal}</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan="14"><s:message code="common.noData" /></td>
			</tr>
		</c:if>
				</tbody>
			</table>
			
		</div>
		<%@ include file="/WEB-INF/jsp/common/tp_new_paging/inc-paging-front.jsp"%>
	</div>
</div>	