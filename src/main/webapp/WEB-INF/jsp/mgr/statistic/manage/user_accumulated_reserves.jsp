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
		<h2>사용자별 보유금 누적 입출금 합계 </h2>
		<p>홈 &gt; 통계관리 &gt;사용자별 보유금 누적 합계  &gt; 리스트</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>사용자별 보유금 누적 입/출금 내역을 조회합니다. </li>
			</ul>
		</div>
		<form id="form1">
			<table class="board_st1 mb10">
				<colgroup>
					<col width="*" />
				</colgroup>
				<tbody>
				<tr>
					<th>이름</th>
					<td>
						<input type="text" name="searchWord" class="input_type2 w70" value="${search.searchWord}" />
						<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ">검색</a>
					</td>
				</tr>
				</tbody>
			</table>
		</form>
		<div class="all_io_exec" style="padding-bottom: 10px">
			<a onclick="javascript:$.Nav('go', './user_accumulated_reserves_excel', {})" class="bt_boardmake">전체 엑셀파일저장</a>
		</div>
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
				<th>아이디</th>
				<th>이름</th>
				<th>보유금</th>
				<th>누적 입금</th>
				<th>누적 출금</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
				<c:forEach items="${list }" var="l" varStatus="a">
					<tr>
						<td>${l.userId}</td>
						<td>${l.userName}</td>
						<td><fmt:formatNumber pattern="#,##0" value="${l.cash}" /></td>


						<td><fmt:formatNumber pattern="#,##0" value="${l.iCash}" /></td>
						<td><fmt:formatNumber pattern="#,##0" value="${l.oCash}" /></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan="10"><s:message code="common.noData" /></td>
				</tr>
			</c:if>
			</tbody>
		</table>
		<br class="clear mb5" />
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
	</div>
</div>
<script type="text/javascript">
	function doSearch() {
		$('#form1').attr('action', './user_accumulated_reserves');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>