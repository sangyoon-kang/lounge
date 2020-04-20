<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>견적상담</h2>
		<p>홈 &gt; 게시판 관리 &gt; 견적상담</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./estimate_list">
			<input type="hidden" name="estimateSeq" />
			<div class="scon_search">
				<div class="search mb20">
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
				</div>
				<span class="table_aside">전체 게시판 수 : ${search.totalCount }</span>			
			</div>
		
			<table class="board_st1">
				<colgroup>
					<col width="8%" />
					<col width="*" />
					<col width="12%" />
					<col width="12%" />
					<col width="15%" />
					
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>견적종류</th>
						<th>작성자</th>
						<th>등록일</th>
						<th>휴대폰</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
					<tr>
						<td class="first">${s.index +1 }</td>
						<td>
							<a href="javascript:$.Nav('go', './estimate_write', {estimateSeq:'${m.estimateSeq }'});">
								<c:forEach items="${listEstimateType }" var="e" varStatus="s" >
                          			<c:if test="${fn:contains(m.estimateFlag, e.value)}">
                          				${e.text},
                          			</c:if>
                          		</c:forEach>
							</a>
						</td>
						<td><a href="javascript:$.Nav('go', './estimate_write', {estimateSeq:'${m.estimateSeq }'});"><tt:abbr length="50" value="${m.writer }"/></a></td>
						<td><a href="javascript:$.Nav('go', './estimate_write', {estimateSeq:'${m.estimateSeq }'});"><fmt:formatDate value="${m.regDate }" pattern="yyyy-MM-dd HH:mm"/></a></td>
						<td>${m.phone}</td>
						
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list }">
					<tr>
						<td colspan="12"><s:message code="common.noData" /></td>
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
	$(function() {
		//기준 CSS 너비 +
		$('div.scon').width($('div.scon').width() + 150);
	});
	
	function doSearch() {
		$('#form1').submit();	
	}
	
	function doDelete(glevel) {
		if(!confirm('삭제하시겠습니까?'))
			 return;
		
		alert('개발스킵 - 게시판 삭제, 숨김 여부 미결');
		return;
		
		$('input[name=bcode]').val(bcode);
		$('input[name=status]').val('d');
		$('#form1').attr('method', 'post');
		$('#form1').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>