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
	<div class="all_io_exec" style="padding-bottom: 10px">
		<a class="btn bt_bwhite" onclick="showDepositHistory('${search.userId}', '')">전체</a>
		<a class="btn bg_pink" onclick="showDepositHistory('${search.userId}', 'I')">입금</a>
		<a class="btn bg_sky" onclick="showDepositHistory('${search.userId}', 'O')">출금</a>
	</div>
	<table class="table board_st1" >
		<colgroup>
			<col width="10%" />
			<col width="10%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
		<tr>
			<th>거래번호</th>
			<th>구분</th>
			<th>이름</th>
			<th>일자</th>
			<th>시간</th>
			<th>금액</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m" varStatus="l">
			<tr>
				<td>${m.moneySeq}</td>
				<td class="${m.ioType eq 'I' ? 'back-red' : ''} ${m.ioType eq 'O' ? 'back-sky' : ''}">
					<c:if test="${m.ioType eq 'I'}">입금</c:if>
					<c:if test="${m.ioType eq 'O'}">출금</c:if>
				</td>
				<td>${m.accountName}</td>
				<td><fmt:formatDate value="${m.acceptDate }" pattern="${DATE_FORMAT}"/></td>
				<td><fmt:formatDate value="${m.acceptDate }" pattern="${TIME_FORMAT}"/></td>
				<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
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
    $( function() {

    });

    //입출금 내역
    function showDepositHistory(userId, idType) {
        openPop('?userId=' + userId + '&ioType=' + idType, 'memberDepositHistory');
    }
</script>