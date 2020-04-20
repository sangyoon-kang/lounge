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
		<h2>일별 입출금 합계 </h2>
		<p>홈 &gt; 통계관리 &gt;일별 입출금 합계  &gt; 리스트</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>일자별 입출금 내역의 통계를 조회합니다. </li>
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
						<tt:select name="sYear" class="w10" list="${regDate}" onchange="javascript:doSearch();" listKey="regYears" listValue="regYearsText" selected="${search.sYear }"/>
						<select class="w10 ml5" name="sMonth" onchange="javascript:doSearch();">
							<c:forEach items="${monthMap}" var="m" varStatus="s">
								<option ${search.sMonth eq m.key ? 'selected' : ''}  value="${m.key }">${m.value }</option>
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
			</colgroup>
			<thead>
				<tr>
					<th>일자</th>
					<th>입금건수</th>
					<th>입금금액</th>
					<th>출금건수</th>
					<th>출금금액</th>
					<th>합계</th>
				</tr>
			</thead>
			<tbody>	
				<fmt:formatNumber var="totalICount" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalICash" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalOCount" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalOCash" pattern="#,##0" value="0" />
				<fmt:formatNumber var="totalCash" pattern="#,##0" value="0" />		
				<c:forEach items="${list }" var="l" varStatus="a">
				<tr>
					<td>${l.ioDate}</td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.iCount}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.iCash}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.oCount}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.oCash}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.totalCash}" /></td>
					<fmt:formatNumber var="totalICount" pattern="#.##" value="${totalICount + l.iCount  }" />
					<fmt:formatNumber var="totalICash" pattern="#.##" value="${totalICash + l.iCash }" />
					<fmt:formatNumber var="totalOCount" pattern="#.##" value="${totalOCount + l.oCount }" />
					<fmt:formatNumber var="totalOCash" pattern="#.##" value="${totalOCash + l.oCash}" />
					<fmt:formatNumber var="totalCash" pattern="#.##" value="${totalCash + l.totalCash}" />
				</tr>
				</c:forEach>
			<c:if test="${!empty list}">
				<tr>
					<td>합계 </td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalICount}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalICash}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalOCount}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalOCash}" /></td>
					<td><fmt:formatNumber pattern="#,##0" value="${totalCash}" /></td>
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
		$('#form1').attr('action', './day_total_bill');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>