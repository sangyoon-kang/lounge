<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 카테고리 등록/수정 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="form1" action="./board_category_proc" method="post">
		<input type="hidden" name="bcSeq" value="${!empty vo ? vo.bcSeq : 0 }" />
		<input type="hidden" name="boardCode" value="${search.bcode }" />
		<input type="hidden" name="status" value="${search.status }" />
		<div class="clear">
			<h3 class="scon_tit">${bm.boardCode }(${bm.boardName }) 게시판 카테고리</h3>
		</div>
		<br class="clear mb5" />
		<table class="board_write mt10">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>카테고리 이름</th>
					<td><input type="text" name="cateName" class="w100" value="${vo.cateName }" /></td>
				</tr>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './board_category_popup', {bcseq:''});" class="btn2 bg_darkgray">목록</a></li>
		</ul>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSubmit() {
		if ($('input[name=cateName]').val().trim().length == 0) {
			alert('카테고리 이름을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>