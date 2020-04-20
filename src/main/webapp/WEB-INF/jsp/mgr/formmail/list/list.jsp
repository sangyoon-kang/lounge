<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일 관리 - 폼메일 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>폼메일 관리</h2>
		<p>홈 &gt; 폼메일 관리 &gt; 폼메일 관리</p>
	</div>

	<div class="scon">
	
		<form id="form1">
		<input type="hidden" name="fseq" value="${search.fseq }" />
			<div class="scon_search">
				<div class="search mb20">
					<tt:select list="${type1s }" name="type1" listKey="value" listValue="text" indexKey="" indexValue="= 처리상태 =" selected="${search.type1 }"/>
					<tt:select list="${type2s}" name="type2" listKey="value" listValue="text" indexKey="" indexValue="= 작성내용 ="  selected="${search.type2 }"/>
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
				</div>
				<span class="table_aside">총 등록 수 : ${search.totalCount }</span>
				<ul class="table_aside02">
					<li><a onclick="javascript:$.Nav('go', '../form_excel.do', {fseq:${search.fseq}});" class="btn btn_round bg_purple">엑셀파일저장</a></li>
				</ul>
			</div>
		
			<table class="board_st1">
				<colgroup>
					<!-- <col width="5%" /> -->
					<col width="5%" />
					<col width="10%" />
					<col width="*" />
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="20%" />
				</colgroup>
				<thead>
					<tr>
						<!-- <th><input type="checkbox" id="checkAll" /></th> -->
						<th>번호</th>
						<th>유형</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>처리상태</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:if test="${!empty list}">
	<c:forEach items="${list }" var="m" varStatus="s">
					<tr>
						<%-- <td><input type="checkbox" name="formWritingSeq" value="${m.formWritingSeq }" /></td> --%>
						<td>${s.index + 1 }</td>
						<td>${m.formName }</td>
						<td><a href="javascript:doWrite(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });">${m.subject }</a></td>
						<td>${m.regUser }</td>
						<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
						<td>${m.processName }</td>
						<td>
							<a onclick="javascript:doWrite(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });" class="btn btn_round bg_blue btnh_22">보기</a>
							<a onclick="javascript:doDelete(${m.formWritingSeq}, ${m.formSeq }, ${search.fseq });" class="btn btn_round bg_red btnh_22">삭제</a>
						</td>
					</tr>
	</c:forEach>
</c:if>
<c:if test="${empty list }">
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

<script type="text/javascript">
	$(function() {
		//기준 CSS 너비 +
		$('div.scon').width($('div.scon').width() + 150);
		
		$('#checkAll').click(function(){
			if ($(this).prop('checked'))
				$('input[name=formWritingSeq]').prop('checked', true);
			else
				$('input[name=formWritingSeq]').prop('checked', false);
		});
	});
	
	function doWrite(fwseq, seq, fseq) {
		$.Nav('go', '../write/' + seq + '.do', {fwseq:fwseq, fseq:fseq});
	}
	
	function doSearch() {
		var $fseq = $('input[name=fseq]').val();
		var sUrl = '';
		if ($fseq > 0)
			sUrl += '../list/' + $fseq + '.do';
		else
			sUrl = './list.do';
		
		$('#form1').attr('action', sUrl);
		$('#form1').submit();	
	}
	
	function doDelete(fwseq, seq, fseq) {
		if(!confirm('삭제하시겠습니까?'))
			 return;
		$.Nav('go', '../proc.do', {fwseq:fwseq, formSeq:seq, fseq:fseq, status:'d'});
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>