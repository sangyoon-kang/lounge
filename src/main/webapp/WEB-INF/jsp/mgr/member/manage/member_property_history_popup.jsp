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
	<div><label>${search.userId} 님의 ${pageTitle}</label></div>
	<div class="all_io_exec" style="padding-bottom: 10px">
<%--		<a class="btn bt_bwhite" onclick="showDepositHistory('${search.userId}', '')">전체</a>--%>
<%--		<a class="btn bg_pink" onclick="showDepositHistory('${search.userId}', 'I')">입금</a>--%>
<%--		<a class="btn bg_sky" onclick="showDepositHistory('${search.userId}', 'O')">출금</a>--%>
	</div>
	<table class="table board_st1" >
		<colgroup>
			<col width="10%" />
			<col width="20%" />
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
		</colgroup>
		<thead>
		<tr>
			<th>거래번호</th>
			<th>구분</th>
			<th>일자</th>
			<th>금액</th>
			<th>잔고</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m" varStatus="l">
			<tr>
				<td>${m.cashSeq}</td>
				<td class="${m.ioType eq 'I' ? 'back-red' : ''} ${m.ioType eq 'O' ? 'back-sky' : ''}">
					${m.ioTypeName}
				</td>
				<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_TIME_FORMAT}"/></td>
				<td class="${(m.cash < 0)?'back-sky':'back-red'}">
					<fmt:formatNumber pattern="#,##0" value="${m.cash}" />
				</td>
				<td><fmt:formatNumber pattern="#,##0" value="${m.balance}" /></td>
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
<script type="text/javascript">
	<%--$( function() {--%>

	<%--});--%>

	<%--//입출금 내역--%>
	<%--function showDepositHistory(userId, idType) {--%>
	<%--	<c:if test="${!empty myshop}">--%>
	<%--	openPop('?userId=' + userId + '&ioType=' + idType, 'myShoopMemberDepositHistory');--%>
	<%--	</c:if>--%>
	<%--	<c:if test="${empty myshop}">--%>
	<%--	openPop('?userId=' + userId + '&ioType=' + idType, 'memberDepositHistory');--%>
	<%--	</c:if>--%>
	<%--}--%>
</script>