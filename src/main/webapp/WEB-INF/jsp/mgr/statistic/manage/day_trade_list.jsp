<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>일별거래내역</h2>
		<p>홈 &gt; 통계관리 &gt; 일별거래내역  &gt;리스트</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>일자별 거래 내역의 통계를 조회합니다.</li>
			</ul>
		</div>
		<form id="form1">
		<table class="board_st1 mb10">
			<colgroup>
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<td>
						<tt:select name="sYear" class="w10" list="${year}" onchange="javascript:doSearch();" listKey="years" listValue="yearsText" selected="${search.sYear }"/>
						<select class="w10 ml5" name="sMonth" onchange="javascript:doSearch();">
							<c:forEach items="${monthMap}" var="m" varStatus="s">
								<option ${search.sMonth eq m.key ? 'selected' : ''} value="${m.key }">${m.value }</option>
							</c:forEach>
						</select>
						<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ml10">검색</a>
						<!-- <a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml5">검색 초기화</a> -->
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<table class="board_st1 mb20">
			<colgroup>
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>일자</th>
					<th>실현수량</th>
					<th>실현금액</th>
					<th>실손수량</th>
					<th>실손금액</th>
					<th>실손-실현</th>
					<th>본사수수료</th>
					<th>대리점수수료</th>
					<th>정산금액</th>
				</tr>
			</thead>
			<tbody>	
				<fmt:formatNumber var="totalWinLot" pattern="#,###.#" value="0" />
				<fmt:formatNumber var="totalProfitS" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalLossLot" pattern="#,###.#" value="0" />
				<fmt:formatNumber var="totalLossS" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalProfitLoss" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalFxComm" pattern="#,##0" value="0" />	
				<fmt:formatNumber var="totalDealerCommFee" pattern="#,##0" value="0" />	
				<fmt:formatNumber var="totalDealerComm" pattern="#,##0" value="0" />		
				<c:forEach items="${list }" var="l" varStatus="a">
				<tr>
					<td>${l.goodsDate }</td>
					<td><fmt:formatNumber pattern="#,###.#" value="${l.winLot}" /> Lot</td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.profitS}" /></td>
					<td><fmt:formatNumber pattern="#,###.#" value="${l.lossLot}" /> Lot</td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.lossS}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.profitLoss}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.fxComm}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.dealerCommFee}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.dealerComm}" /></td>
					<fmt:formatNumber var="totalWinLot" pattern="#.##" value="${totalWinLot + l.winLot  }" />
					<fmt:formatNumber var="totalProfitS" pattern="#.##" value="${totalProfitS + l.profitS }" />
					<fmt:formatNumber var="totalLossLot" pattern="#.##" value="${totalLossLot + l.lossLot }" />
					<fmt:formatNumber var="totalLossS" pattern="#.##" value="${totalLossS + l.lossS}" />
					<fmt:formatNumber var="totalProfitLoss" pattern="#.##" value="${totalProfitLoss + l.profitLoss}" />
					<fmt:formatNumber var="totalFxComm" pattern="#.##" value="${totalFxComm + l.fxComm}" />	
					<fmt:formatNumber var="totalDealerCommFee" pattern="#.##" value="${totalDealerCommFee + l.dealerCommFee}" />	
					<fmt:formatNumber var="totalDealerComm" pattern="#.##" value="${totalDealerComm + l.dealerComm}" />
				</tr>
				</c:forEach>
			<c:if test="${!empty list}">
				<tr>
					<td>합계 </td>
					<td><fmt:formatNumber pattern="#,###.#" value="${totalWinLot}" /> Lot</td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalProfitS}" /></td>
					<td><fmt:formatNumber pattern="#,###.#" value="${totalLossLot}" /> Lot</td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalLossS}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalProfitLoss}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalFxComm}" />	</td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalDealerCommFee}" /></td>	
					<td><fmt:formatNumber pattern="#,##0" value="${totalDealerComm }" /></td>
				</tr>
			</c:if>
			<c:if test="${empty list}">
					<tr>
						<td colspan="10"><s:message code="common.noData" /></td>
					</tr>
			</c:if>
			</tbody>
		</table>
	</div>
</div>	
<script type="text/javascript">	
	function doSearch() {
		$('#form1').attr('action', './day_trade_list');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>