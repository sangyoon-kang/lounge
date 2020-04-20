<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
<style type="text/css">
	.board_st1 > tbody > tr > td{
		word-wrap: break-word;
		-ms-word-break:break-all;
	}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>게시물 통합관리</h2>
		<p>홈 &gt; 게시판 관리 &gt; 게시물 통합관리</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./article_list">
			<input type="hidden" name="status" />
			<input type="hidden" name="bcode" />
			
			<div class="scon_search">
				<div class="search mb10">
					<select name="type1">
						<option value="">제목 + 내용</option>
						<option value="subject">제목</option>
						<option value="body">내용</option>
						<option value="username">이름 + 닉네임</option>
						<option value="id">아이디</option>
					</select>
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
				</div>
				<span class="table_aside">전체 게시물 수 : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" /></span>				
			</div>		
		
			<table class="board_st1">
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="10%" />
				<col width="*" />
				<col width="10%" />
				
				<col width="12%" />
				<col width="7%" />
				<col width="16%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="chkAll" style="background:#E0F3FD" /> </th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					
					<th>작성일</th>
					<th>조회수</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
				<tr>
					<td class="first">
						<input type="checkbox" name="chks" value="${m.boardSeq }" />
					</td>
					<td>${search.paging.virtualNumber - s.index }</td>
					<td>${m.cateName }</td>
					<td class="left">
						<a href="javascript:$javascript:$.Nav('go', '../write/${m.boardCode}', {bseq: '${m.boardSeq }'});">[${m.boardName }] ${m.subject }</a>
					</td>
					<td>
		<c:choose>
			<c:when test="${m.writerFormatFixedCode eq '002001'}">
						<!-- 이름 --> 
						${m.userName }
			</c:when>
			<c:when test="${m.writerFormatFixedCode eq '002002'}">
						<!-- 닉네임 --> 
						${m.nickname }
			</c:when>
			<c:when test="${m.writerFormatFixedCode eq '002003'}">
						<!-- 닉네임(이름) --> 
						${m.nickname }(${m.userName })
			</c:when>
			<c:when test="${m.writerFormatFixedCode eq '002004'}">
						<!-- 이름(아이디) --> 
						${m.userName }(${m.regUser })
			</c:when>
			<c:when test="${m.writerFormatFixedCode eq '002005'}">
						<!-- 닉네임(아이디) --> 
						${m.nickname }(${m.regUser })
			</c:when>
			<c:otherwise>
						${m.regUser }
			</c:otherwise>
		</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${m.regDate }" pattern="${m.dateFormatList }"/>
					</td>
					<td><fmt:formatNumber value="${m.readCount }" pattern="#,###" /></td>
					<td>
						<a onclick="javascript:$.Nav('go', './../write/${m.boardCode}', {bseq: '${m.boardSeq }'});" class="btn btn_round bg_blue btnh_22">수정</a>
						<a onclick="javacript:doDelete('${m.boardSeq }');" class="btn btn_round bg_red btnh_22">삭제</a>
					</td>
				</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list}">
				<tr>
					<td colspan="8"><s:message code="common.noData" /></td>
				</tr>
</c:if>
			</tbody>
		</table>

		</form>
		<br class="clear mb5" />
		<div>
			<div class="fl">
				<a onclick="javascript:doDelete('');" class="btn bg_green">선택삭제</a>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		<br class="clear mb5" />

	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		//기준 CSS 너비 +
		
		
		$('#chkAll').change(function() {
			$('input[name=chks]').prop('checked', $(this).is(':checked'));
		});
	});
	
	function doSearch() {
		$('#form1').submit();	
	}
	
	function doDelete (bSeq) {
		if (bSeq == '') {
			if (!$('input[name=chks]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			var bseqs = new Array();
			$('input[name=chks]').each(function() {
				if ($(this).prop('checked')) {
					bseqs.push($(this).val());
				}
			});
			
			$.Nav('go', '../proc.do', {status : 'd', bseqs : bseqs });		
			
		} else {			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			
			$.Nav('go', '../proc.do', {bseq : bSeq, status : 'd' });
		}		
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>