<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 그룹 등록/수정 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="form1" action="./board_group_proc" method="post">
		<input type="hidden" name="groupSeq" value="${!empty vo ? vo.groupSeq : 0 }" />
		<input type="hidden" name="status" value="${search.status }" />
		<div class="clear">
			<h3 class="scon_tit">게시판 그룹관리</h3>
		</div>
		<br class="clear mb5" />
		<table class="board_write mt10">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>그룹명</th>
					<td><input type="text" name="groupName" class="w100" value="${vo.groupName }" /></td>
				</tr>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './board_group_popup', {gseq:''});" class="btn2 bg_darkgray">목록</a></li>
		</ul>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	
	function doSubmit() {
		if ($('input[name=groupName]').val().trim().length == 0) {
			alert('그룹명을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
				
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>