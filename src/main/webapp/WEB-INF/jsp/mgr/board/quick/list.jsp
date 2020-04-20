<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판별 게시물 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>간편 상담</h2>
		<p>홈 &gt; 게시판 관리 &gt; 간편 상담</p>
	</div>

	<div class="scon">
			<form id="form1">
		<input type="hidden" name="idx" value="${search.idx }" />
			<div class="scon_search">
				<div class="search mb20">
					<tt:select list="${type1s }" name="type1" listKey="value" listValue="text" indexKey="all" indexValue="= 전체 =" selected="${search.type1 }"/>
					
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
				</div>
				<span class="table_aside">총 등록 수 : ${search.totalCount }</span>
				
			</div>
		
			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="20%" />
					<col width="20%" />
					<col width="30%" />
					<col width="15%" />
					
				</colgroup>
				<thead>
					<tr>
						<th>index</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>내용</th>
						<th>작성일</th>
						
					</tr>
				</thead>
				<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
					<tr>
						<td class="first">${search.paging.virtualNumber - s.index }</td>
						<td><a href="javascript:doWrite(${m.idx});">${m.userName }</a></td>
						<td><a href="javascript:doWrite(${m.idx});">${m.contact }</a></td>
						<td><a href="javascript:doWrite(${m.idx});">${m.email }</a></td>
						<td style="text-align: left;     word-wrap: break-word; max-width: 200px;"><a href="javascript:doWrite(${m.idx});">${m.content }</a></td>
						<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
						
									</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
									<tr>
										<td colspan="6"><s:message code="common.noData" /></td>
									</tr>
				</c:if>
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>

		</form>
		
	
				
	</div>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
	$(function() {
		//기준 CSS 너비 +
		$('div.scon').width($('div.scon').width() + 150);
	});
	
	function doWrite(idx) {
		$.Nav('go', './quick_write', {Idx:idx});
	}
	
	function doSearch() {
		var searchWord = $('input[name=searchWord]').val();
		var type1 = $('select[name=type1]').val();
		$.Nav('go', '', {searchWord:searchWord,type1:type1 });
	} 
	
	
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>