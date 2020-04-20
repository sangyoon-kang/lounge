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
		<h2>인력구성문의</h2>
		<p>홈 &gt; 게시판 관리 &gt; 인력구성문의</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./counselmon_list">
			<input type="hidden" name="counselmonSeq" />
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
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
				</colgroup>
				<thead>
					<tr>
						<th>그룹명</th>
						<th>회사명</th>
						<th>이름</th>
						<th>연락처</th>
						<th>이메일</th>
						<th>필요기술</th>
						<th>등록일</th>
						<th>열람</th>
					</tr>
				</thead>
				<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
					<tr>
						<td>${m.groupCode}</td>
						<td><a href="javascript:$.Nav('go', './counselmon_write', {counselmonSeq:'${m.counselmonSeq }'});"><tt:abbr length="25" value="${m.companyName }"/></a></td>
						<td><a href="javascript:$.Nav('go', './counselmon_write', {counselmonSeq:'${m.counselmonSeq }'});"><tt:abbr length="25" value="${m.userName }"/></a></td>
						<td>${m.phone}</td>
						<td>${m.email}</td>
						<td>${m.skill}</td>
						<td><fmt:formatDate value="${m.regDate }" pattern="yyyy-MM-dd HH:mm"/></td>
						<c:if test="${m.stateCode eq 'N'}">
							<td>열람</td>
						</c:if>
						
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