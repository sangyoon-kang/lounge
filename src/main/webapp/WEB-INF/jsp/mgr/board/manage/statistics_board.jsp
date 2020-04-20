<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판별 게시물 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">
<c:set var="pageMenuPath" value="/board/manage/statistics_boards" />
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>게시판통계</h2>
		<p>홈 &gt; 게시판 관리 &gt; 게시판통계</p>
	</div>

	<div class="scon">
	<form id="form1" action="./statistics_boards">
		<div>
			<table class="board_write">
				<colgroup>
					<col width="15%" />
					<col width="*" />
				</colgroup>
				<tr>
					<th>게시판</th>
					<td>
						<tt:select list="${bmList }" id="type1" name="type1" listKey="boardCode" listValue="boardName" indexKey="" indexValue="전체" selected="${search.type1 }"/>
					</td>
				</tr>
				<tr>
					<th>기간</th>
					<td>
						<tt:select list="${type2s }" id="type2" name="type2" listKey="value" listValue="text" indexKey="" indexValue="전체" selected="${search.type2 }"/>
						<select id="type3" name="type3">
							<option value="">전체</option>
<c:forEach varStatus="s" begin="1" end="12" step="1">
							<option value="${s.count }">${s.count }</option>
</c:forEach>
						</select>
						<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
					</td>
				</tr>
			</table>
		</div>
	</form>	
		
		<div class="tab mb5 mT30">
			<table class="board_write">
				<colgroup>
					<col width="15%" />
					<col width="35" />
					<col width="15%" />
					<col width="35" />
				</colgroup>			
				<tr>
					<th>총 게시글 수</th>
					<td>${countMap.BOARD_COUNT }</td>
					<th>총 코멘트 수</th>
					<td>${countMap.COMMENT_COUNT }</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function () {
		$('#type3 option:eq(${search.type3})').prop('selected', true);
	});

	$('#type1, #type2, #type3').change(function () {
		$('#form1').submit();
	});
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>