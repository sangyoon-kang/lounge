<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 카테고리 목록 - 팝업
		- 주의 : pk 파라미터 : bcseq, 모델 pk : bcSeq
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="form1" action="./board_category_proc" method="post">
		<input type="hidden" name="bcSeq" />
		<input type="hidden" name="boardCode" value="${search.bcode }" />
		<input type="hidden" name="status" />
		<div class="clear">
			<h3 class="scon_tit">${bm.boardCode }(${bm.boardName }) 게시판 카테고리</h3>
			<a class="fr btn btn_round bg_sky" onclick="javascript:$.Nav('go', './board_category_write', {bcseq: '', bcode: '${search.bcode}'});">카테고리 등록</a>
		</div>
		
		<table class="board_st1 mt10">
			<colgroup>
<c:if test="${search.mode eq 'move' or search.mode eq 'copy' }">
				<col width="10%" />
</c:if>			
				<col width="10%" />
				<col width="*" />
				<col width="30%" />
			</colgroup>
			<tbody>
				<tr>
<c:if test="${search.mode eq 'move' or search.mode eq 'copy' }">
					<th></th>
</c:if>				
					<th>번호</th>
					<th>분류명</th>
					<th>기능</th>
				</tr>
<c:forEach var="m" items="${list }" varStatus="s">
				<tr>
	<c:if test="${search.mode eq 'move' or search.mode eq 'copy' }">
					<td>
						<input type="checkbox" class="checkboxs" name="bcCheck" value="${m.bcSeq }"/>
					</td>
	</c:if>					
					<td>${s.index + 1 }</td>
					<td>${m.cateName }</td>
					<td>
						<a onclick="javascript:$.Nav('go', './board_category_write', {bcseq: '${m.bcSeq}', bcode: '${m.boardCode}'});" class="btn btn_round bg_pink">수정</a>
						<a onclick="javacript:doDelete('${m.bcSeq}');" class="btn btn_round bg_darkgray">삭제</a>
					</td>
				</tr>
</c:forEach>

<c:if test="${empty list }">
				<tr>
	<c:if test="${search.mode eq 'move' or search.mode eq 'copy' }">
					<td colspan="4">
	</c:if>
	<c:if test="${search.mode ne 'move' and search.mode ne 'copy' }">
					<td colspan="3">
	</c:if>
						<s:message code="common.noData" />
					</td>
				</tr>
</c:if>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
<c:if test="${search.mode eq 'move' }">
			<li><a onclick="javascript:doSelectBc('move');" class="btn2 bg_darkgray">이동</a></li>
</c:if>
<c:if test="${search.mode eq 'copy' }">
			<li><a onclick="javascript:doSelectBc('copy');" class="btn2 bg_darkgray">복사</a></li>
</c:if>
		
			<li><a onclick="javascript:self.close();" class="btn2 bg_darkgray">닫기</a></li>
		</ul>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function () {
		//체크 박스 하나만 선택하게 하기
		$('.checkboxs').click(function() {
		  $('.checkboxs').attr("checked", false);
		  $(this).attr("checked", true);
		});
	});
	
	//선택된 카테고리로 이동 이나 복사
	function doSelectBc (mode) {
		if (!$('input[name=bcCheck]').is(':checked')) {
			alert('카테고리를 선택해 주세요');
			return;
		}
		
		var bseqs = new Array();
		<c:forEach items="${search.bseqs}" var="l" varStatus="s">		
			bseqs['${s.index}'] = '${l }';
		</c:forEach>
		
		var bcSeq = 0;
		$('input[name=bcCheck]').each(function() {
			if ($(this).prop('checked')) {
				bcSeq = $(this).val();
			}
		});
		
		$.Nav('go','../board_toCategory_proc', {bcseq : bcSeq, bseqs : bseqs, mode : mode, bcode: '${search.bcode }'} );
	}

	function doDelete(seq) {
		if(!confirm('삭제하시겠습니까?'))
			 return;

		$('input[name=bcSeq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>