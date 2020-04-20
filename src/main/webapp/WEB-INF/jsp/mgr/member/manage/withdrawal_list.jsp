<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 탈퇴 회원 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>탈퇴 회원</h2>
		<p>홈 &gt; 회원 관리 &gt; 탈퇴 회원</p>
	</div>

	<div class="scon">
	
		<form id="form1">
		<div class="scon_search">
			<div class="search mb20 w100">
				<table class="mem_search">
					<colgroup>
						<col width="15%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>조건검색</strong></th>
							<td>
								<tt:select list="${type2s}" name="type2" listKey="value" listValue="text" selected="${search.type2 }" />
								<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
								<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
								<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a><br/>
							</td>
						</tr>
						<tr>
							<th><strong>탈퇴일</strong></th>
							<td>
								<input type="text" name="startDate1" class="input_type2 datepicker" value="${search.startDate1}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a> ~ 
								<input type="text" name="endDate1" class="input_type2 datepicker" value="${search.endDate1 }" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<table class="board_st1 mb20">
			<colgroup>
				<col width="5%" />
				<col width="15%" />
				<col width="15%" />
				<col width="*" />
				<col width="15%" />
				<col width="15%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>회원명</th>
					<th>회원아이디</th>
					<th>탈퇴사유</th>
					<th>탈퇴일</th>
					<th>기능</th>
					<th>거래조회</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${!empty list}">
	<c:forEach var="m" items="${list }" varStatus="s">			
				<tr>
					<td>${s.index + 1 }</td>
					<td>${m.userName }</td>
					<td>${m.userId }</td>
					<td><p style="-ms-word-wrap: break-word; word-break: break-word; -ms-word-break:break-word">${m.withdrawalReason }</p></td>
					<td><fmt:formatDate value="${m.withdrawalDt }" pattern="${DATE_TIME_FORMAT}"/></td>
					<td><a href="javascript:doDelete(${m.memberSeq });" class="btn btn_round bg_darkgray">삭제</a></td>
					<td><a onclick="javascript:showHistory('${m.userId }');" class="bt_modify">거래조회</a></td>
				</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
				<tr>
					<td colspan="7"><s:message code="common.noData" /></td>
				</tr>
</c:if>
			</tbody>
		</table>
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript">
$('.searchWord').on('keydown',function(event){
	if(event.keyCode == '13'){
		event.preventDefault();
		doSearch();
	}
})
	function doDelete(mseq) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		
		$('input[name=mseq]').val(mseq);	
		var sUrl = './withdrawal_proc.do';		
		var sParam = $.Nav('getSearch', {mseq:mseq, status:'d'});
		$('#form1').attr('action', sUrl + sParam);
		$('#form1').attr('method', 'post');
		$('#form1').submit();
	}
	
	function doSearch() {
		$('#form1').attr('action', './withdrawal_list.do');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
	
	function showHistory(userId) {
		openPop('?userId=' + userId, 'memberhistory');
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>