<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<script>
	$(function() {
		$(document.body).css('background-image', 'none');
		$('#wrap_pop').width(750);
	});
</script>
<div class="pop_scon">
	<div class="scon_title" style="height: 25px;">
		<h3>기간별 검색</h3>
	</div>
	<form id="form1" action="./mem_cash17_pop.do" method="get">
		<input type="hidden" name="nickName" value="${search.nickName }" />
		<input type="hidden" name="userId" value="${search.userId }" />
		<input type="hidden" name="userName" value="${search.userName }" />
		<table class="board_st1 mb10">
			<colgroup>
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<td>
						<input type="text" name="startDate" class="input_type2 w20 datepicker" value="${search.startDate}" />
						<a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
						<input type="text" name="endDate" class="input_type2 w20 datepicker" value="${search.endDate }" />
						<a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
						<a id="btnSearch" onclick="javascript:doSearch();"class="btn bg_pink w5">검색</a>
					</td>
				</tr>
			</tbody>
		</table>
		<h3 class="scon_tit mb5">${search.userName } 회원</h3>
		<table class="board_st1">
			<colgroup>
				<col width="12%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
				<col width="8%" />
			</colgroup>
			<thead>
				<tr>
					<th>일자</th>
					<th>약정시간</th>
					<th>종목</th>
					<th>구분</th>
					<th>수량</th>
					<th>보증금</th>
					<th>수익</th>
					<th>손실</th>
					<th>수수료</th>
					<th>정산금</th>
				</tr>
			</thead>
			<tbody>
				<fmt:formatNumber var="totalLot" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalCash" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalProfit" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalLoss" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalCommission" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalTaxCommission" pattern="#,##0" value="0" />
				<c:forEach items="${list}" var="m" varStatus="s">
					<tr>
						<td>${m.goodsDate}</td>
						<td>${m.goodsTime}</td>
						<td>${m.cashType}</td>
						<td>${m.bsTypeText }</td>
						<td><fmt:formatNumber pattern="#,###.#" value="${m.lot}" /> Lot</td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.profit}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.loss}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.commission}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.taxCommission}" /></td>
						<fmt:formatNumber var="totalLot" pattern="#.##" value="${totalLot +  m.lot}" />
						<fmt:formatNumber var="totalCash" pattern="#.##" value="${totalCash +  m.cash}" />
						<fmt:formatNumber var="totalProfit" pattern="#.##" value="${totalProfit +  m.profit}" />
						<fmt:formatNumber var="totalLoss" pattern="#.##" value="${totalLoss +  m.loss}" />
						<fmt:formatNumber var="totalCommission" pattern="#.##" value="${totalCommission +  m.commission}" />
						<fmt:formatNumber var="totalTaxCommission" pattern="#.##" value="${totalTaxCommission +  m.taxCommission}" />
					</tr>
				</c:forEach>
				<tr>
					<td colspan="4">합계</td>
					<td><fmt:formatNumber pattern="#,###.#" value="${totalLot}" />Lot</td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalCash}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalProfit}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalLoss}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalCommission}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalTaxCommission}" /></td>
				</tr>
			</tbody>
		</table>
	</form>
	<ul class="summmit_btn mb20">
		<li><a onclick="javascript:self.close();" class="btn2 bg_gray">닫기</a></li>
	</ul>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSearch(gseq) {
		$('#form1').submit();
	}
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>