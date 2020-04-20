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
		<h2>게시판 관리</h2>
		<p>홈 &gt; 게시판 관리 &gt; 게시판 관리</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./board_list">
			<input type="hidden" name="status" />
			<input type="hidden" name="bcode" />
			<div class="scon_search">
				<div class="search mb20">
					<tt:select list="${listGroup }" name="type1" listKey="groupSeq" listValue="groupName" indexKey="" indexValue="= 그룹선택 =" />
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
				</div>
				<span class="table_aside">전체 게시판 수 : ${search.totalCount }</span>

<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">				
				<ul class="table_aside02">
					<li><a onclick="javascript:$.Nav('go', './board_write', {bcode:''});" class="btn btn_round bg_purple">게시판 추가</a></li>
				</ul>
</c:if>				
			</div>
		
			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="8%" />
					<col width="*" />
					<col width="9%" />
					
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
					<col width="8%" />
					<col width="11%" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>그룹 이름</th>
						<th>코드</th>
						<th>게시판 이름</th>
						<th>게시판 유형</th>
						
						<th>스킨</th>
						<th>목록 보기</th>
						<th>내용 보기</th>
						<th>글 쓰기</th>
						<th>답글 쓰기</th>
						<th>코멘트 쓰기</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
					<tr>
						<td class="first">${search.paging.virtualNumber - s.index }</td>
						<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.groupName }</a></td>
						<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.boardCode }</a></td>
						<td><a href="javascript:$.Nav('go', './board_write', {bcode:'${m.boardCode }'});">${m.boardName }</a></td>
						<td>${m.boardTypeFixedCodeName }</td>
						
						<td>${m.cssPrefix }</td>
						<td>${m.authListName }</td>
						<td>${m.authViewName }</td>
						<td>${m.authWriteName }</td>
						<td>${m.authReplyName }</td>
						<td>${m.authCommentName }</td>
						<td>
							<a onclick="javascript:$.Nav('go', './board_write', {bcode: '${m.boardCode}'});" class="btn btn_round bg_blue btnh_22">수정</a>
							<a onclick="javacript:doDelete('${m.boardCode}');" class="btn btn_round bg_red btnh_22">삭제</a>
						</td>
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

		</form>
		
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	
	
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