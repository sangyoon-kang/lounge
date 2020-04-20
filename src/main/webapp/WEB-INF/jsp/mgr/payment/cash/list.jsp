<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 상품 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>정산관리</h2>
		<p>홈 &gt; 상품 /정산관리  &gt; 정산관리 </p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>기간별 정산 내역을 조회합니다.</li>
			</ul>
		</div>
		<form id="form1" action="./list" method="GET">
			<div class="scon_search">
				<div class="search mb10 w100">
					<table class="board_st1 mb5">
						<colgroup>
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="16%" />
						</colgroup>
						<thead>
							<tr>
								<th>대리점수</th>
								<th>회원수</th>
								<th>실현금액</th>
								<th>본사수수료</th>
								<th>대리점수수료</th>
								<th>대리점 정산액</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${!empty totalSum}">
								<tr>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.dealerCount }" /></td>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.userCount }" /></td>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.winCash}" /></td>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.fxofficeCash}" /></td>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.commiCash}" /></td>
									<td class="red bold"><fmt:formatNumber pattern="#,##0" value="${totalSum.commiCalculate}" /></td>
								</tr>
							</c:if>
							<c:if test="${empty totalSum}">
								<tr>
									<td colspan="9"><s:message code="common.noData" /></td>
								</tr>
							</c:if>
						</tbody>
					</table>
					<table class="mem_search">
						<colgroup>
							<col width="8%" />
							<col width="15%" />
							<col width="8%" />
							<col width="35%" />
							<col width="8%" />
							<col width="30%" />
						</colgroup>
						<tbody>
							<tr>
								<th>등급 </th>
								<td>
									<tt:select name="glevel" onchange="javascript:doSearch();" class="w90" list="${gradeList}" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체  =" selected="${search.glevel }"/>
								</td>
								<th>일자</th>
								<td>
									<input type="text" name="startDate" class="input_type2 w30 datepicker" value="${search.startDate}" /> <a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>&nbsp;&nbsp;~&nbsp;&nbsp;
									<input type="text" name="endDate" class="input_type2 w30 datepicker" value="${search.endDate }" /> <a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</td>
								<th>이름</th>
								<td>
									<input type="text" name="searchWord" class="input_type2 w60" onkeypress="if(event.keyCode == 13)doSearch();" value="${search.searchWord}" />
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ">검색</a>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<ul class="w100 txt_right">
					<li><a onclick="javascript:$.Nav('go', './cash_excel.do', {glevel:${search.glevel }, startDate: '${search.startDate}', endDate: '${search.endDate }' , searchWord: '${search.searchWord}'})" class="btn bg_green">엑셀저장</a></li>
				</ul>
			</div>
		</form>
		<form id="deposit" action="./dep_proc.do" method="POST">
			<input type="hidden" name="status" value="I" />
			<input type="hidden" name="moneySeq" value=""/>
			<table class="board_st1">
				<colgroup>
					<col width="10%" />
					<col width="11%" />
					<col width="11%" />
					<col width="11%" />
					<col width="12%" />
					<col width="10%" />
					<col width="10%" />
					<col width="12%" />
					<col width="12%" />
				</colgroup>
				<thead>
					<tr>
						<th>등급</th>
						<th>대리점명</th>
						<th>아이디</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>하위대리점</th>
						<th>직속회원</th>
						<th>수수료</th>
						<th>정산금액</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="m" varStatus="s">
					<tr>
						<td>${m.gradeName}</td>
						<td>
	                        <a onclick="javascript:openPop('?userId=${m.userId }&startDate=${search.startDate}&endDate=${search.endDate }', 'memCashPop_16')">
	                        	${m.nickName}
	                        </a>
                        </td>
						<td>
                        	<a onclick="javascript:openPop('?userId=${m.userId }&startDate=${search.startDate}&endDate=${search.endDate }', 'memCashPop_16')">
                        		${m.userId}
                        	</a>
                        </td>
                        <td>
                        	<a onclick="javascript:openPop('?userId=${m.userId }&startDate=${search.startDate}&endDate=${search.endDate }', 'memCashPop_16')">
                        		${m.userName}
                        	</a>
                        </td>
                        <td>${m.phone }</td>
                        <td>${m.dealerCount}</td>
                        <td>${m.userCount}</td>
                        <td><fmt:formatNumber pattern="#,##0" value="${m.commiCash}" /></td>
                        <td>
                        	<a onclick="javascript:openPop('?userId=${m.userId}&startDate=${search.startDate}&endDate=${search.endDate }', 'memCashPop_17')">
                        		<fmt:formatNumber pattern="#,##0" value="${m.commiCalculate}" />
                        	</a>
                        </td>
					</tr>
				</c:forEach>	
				<c:if test="${empty list}">
					<tr>
						<td colspan="15"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<br class="clear mb5" />
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
		
	</div>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
$(document).ready(function(){
	$('a[href="/mgr/payment/cash/list"]').addClass('depth2_on');
});
//For Searching
function doSearch(){
	$('#form1').submit();
}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>