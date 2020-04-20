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
	<form id="form1" action="./mem_cash16_pop.do" method="get">
		<input type="hidden" name="userId" value="${search.userId }" />
		<input type="hidden" name="sellUserId" value="${search.sellUserId }" />
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
						<a id="btnSearch" onclick="javascript:doSearch('${search.sellUserId }');"class="btn bg_pink w5">검색</a>
					</td>
				</tr>
			</tbody>
		</table>
		<h3 class="scon_tit mb5">${mo.userName } (${mo.nickname }) ${mo.gradeName }</h3>
		<c:if test="${!empty search.sellUserId and search.sellUserId ne search.userId}"><a onclick="javascript:doSearch('');"class="btn bg_gray w5 fr mb5">돌아가기</a></c:if>
		<table class="board_st1">
			<colgroup>
				<col width="10%" />
				<col width="12%" />
				<col width="10%" />
				<col width="12%" />
				<col width="10%" />
				<col width="9%" />
				<col width="9%" />
			</colgroup>
			<thead>
				<tr>
					<th>이름</th>
					<th>대리점명</th>
					<th>아이디 ID</th>
					<th>전화번호</th>
					<th>예치금</th>
					<th>수수료</th>
					<th>정산금액</th>
				</tr>
			</thead>
			<tbody>
				<fmt:formatNumber var="totalTaxCommission" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalCommission" pattern="#,##0" value="0" />
				<c:forEach items="${list}" var="m" varStatus="s">
					<tr>
						<td>
							<c:if test="${!empty m.nickName and m.userId ne search.userId and (!empty search.sellUserId and m.userId ne search.sellUserId)}"><a onclick="doSearch('${m.userId}')">${ m.userName}</a></c:if>
							<c:if test="${empty m.nickName or m.userId eq search.userId or m.userId eq search.sellUserId}">${m.userName}</c:if>
						</td>
						<td>
							<c:if test="${!empty m.nickName and m.userId ne search.userId and (!empty search.sellUserId and m.userId ne search.sellUserId)}"><a onclick="doSearch('${m.userId}')">${ m.nickName}</a></c:if>
							<c:if test="${empty m.nickName or m.userId eq search.userId or m.userId eq search.sellUserId}">${m.nickName}</c:if>
						</td>
						<td>
							<c:if test="${!empty m.nickName and m.userId ne search.userId and (!empty search.sellUserId and m.userId ne search.sellUserId)}"><a onclick="doSearch('${m.userId}')">${ m.userId}</a></c:if>
							<c:if test="${empty m.nickName or m.userId eq search.userId or m.userId eq search.sellUserId}">${m.userId}</c:if>
						</td>
						<td>${m.phone }</td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.commission}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.taxCommission}" /></td>
						<fmt:formatNumber var="totalCommission" pattern="#.##" value="${totalCommission +  m.commission}" />
						<fmt:formatNumber var="totalTaxCommission" pattern="#.##" value="${totalTaxCommission +  m.taxCommission}" />
					</tr>
				</c:forEach>
					<tr>
						<td colspan="5">합계</td>
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
		$('input[name="sellUserId"]').val(gseq);
		$('#form1').submit();
	}
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>