<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>

<div class="shop_pop">
	<h2 class="con_tit03">기간별검색</h2>
	<div class="shop_search">
	<form id="form"class="col-sm-6" action="./ms_shop_popup" method=GET >
				<input type="hidden" name="sellUserId" value="${search.sellUserId}" />
					
						<input type="text" name="startDate" class="form-control" id="startDate" value="${search.startDate }" />
						~ 
					    <input type="text" name="endDate" class="form-control" id="endDate"value="${search.endDate }" />
						<a  onclick="javascript:doSearch('${search.sellUserId}');" >검색</a>
					
				</form>
				
	</div>


	<div class="wrap_tsty03 wrap_tsty03_pop">
		<table>
			<colgroup>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
				<col></col>
			</colgroup>
			<thead>
				<tr>
					<th>렌트약정시작시간</th>
					<th>종목</th>
					<th>거래</th>
					<th>구분</th>
					<th>수량</th>
					<th>보증금</th>
					<th>수익</th>
					<th>손실</th>
					<th>수수료</th>
					<th>정산금액</th>
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
						<td>${m.goodsDate} &nbsp ${m.goodsTime}</td>
						<td>${m.runTime}분</td>
						<td>${m.cashType}</td>
						<td>${m.bsTypeText }</td>
						<td><fmt:formatNumber pattern="#,##0.#" value="${m.lot}" /> Lot</td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.profit}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.loss}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.taxCommission}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.commission}" /></td>
						<fmt:formatNumber var="totalLot" pattern="#.##" value="${totalLot +  m.lot}" />
						<fmt:formatNumber var="totalCash" pattern="#.##" value="${totalCash +  m.cash}" />
						<fmt:formatNumber var="totalProfit" pattern="#.##" value="${totalProfit +  m.profit}" />
						<fmt:formatNumber var="totalLoss" pattern="#.##" value="${totalLoss +  m.loss}" />
						<fmt:formatNumber var="totalCommission" pattern="#.##" value="${totalCommission +  m.commission}" />
						<fmt:formatNumber var="totalTaxCommission" pattern="#.##" value="${totalTaxCommission +  m.taxCommission}" />
					</tr>
				</c:forEach>
				</tbody>
				<tfoot class="bg-red-80">
					<tr>
						<td colspan="4">정산금액</td>
						<td><fmt:formatNumber pattern="#,##0.#" value="${totalLot}" /> Lot</td>
						<td><fmt:formatNumber pattern="#,##0" value="${totalCash}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${totalProfit}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${totalLoss}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${totalTaxCommission}" /></td>
						<td><fmt:formatNumber pattern="#,##0.#" value="${totalCommission}" /></td>
					</tr>
				</tfoot>
		</table>
	</div>
	<p class="shop_stxt">가맹점 정산관리 (일일정산) 수수료는 (소득세 3.3% 제외)한 금액입니다.</p>
</div>
<script>
$('#startDate, #endDate').datepicker(
		{
			language: 'kr',
			switchOnClick: true,
			autoClose:true
		}		
	);
	function doSearch() {
		$('#form').submit();	
	}
	
</script>