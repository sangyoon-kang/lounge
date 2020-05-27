<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<style>
	thead th {
		background-repeat: no-repeat !important;
		background-position: right center !important;
		outline: none;
	}
	.tablesorter-default .header, .tablesorter-default .tablesorter-header {
		background-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==);
		cursor: pointer;
		white-space: normal;
	}
	thead th.up {
		background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7)!important;
	}
	thead th.down {
		background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7)!important;;
	}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>일별유저보유액</h2>
		<p>홈 &gt; 통계관리 &gt; 일별 총유저 보유액  &gt;리스트</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>일자별 유저의 총 보유액 통계를 조회합니다.</li>
			</ul>
		</div>
		<form id="form1">
		<table class="board_st1 mb10 tablesorter">
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
		<div class="all_io_exec" style="padding-bottom: 10px">
			<a class="btn bg_green">엑셀다운로드</a>
		</div>
		<table class="board_st1 mb20">
			<colgroup>
				<col />
				<col />
			</colgroup>
			<thead>
				<tr>
					<th>일자</th>
					<th>유저 총 보유액</th>
				</tr>
			</thead>
			<tbody>	
			<c:forEach items="${list }" var="l" varStatus="a">
				<tr>
					<td>${l.stDate }</td>
					<td><fmt:formatNumber pattern="#,##0" value="${l.sumCash}" /></td>
				</tr>
			</c:forEach>
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
		$('#form1').attr('action', './day_user_balance_list');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}

	$(".all_io_exec a.bg_green").click(function() {
		$.Nav('go', './api/day_user_balance_list_excel.do', {sYear:"2020", sMonth:"05"});
	});


	// $(window).load(function(){
	// 	$(".board_st1").tablesorter({
	// 		cssAsc: 'up',
	// 		cssDesc: 'down',
	// 		// cssNone: 'none'
	// 	});
	// });

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>