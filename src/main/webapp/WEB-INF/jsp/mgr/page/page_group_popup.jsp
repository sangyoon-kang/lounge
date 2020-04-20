<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지관리 - 페이지그룹관리 목록
 --%>

<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<div class="pop_scon">
	<form id="form1" action="./page_group_proc.do" method="post">
		<input type="hidden" name="gseq" />
		<input type="hidden" name="status" />
		
		<div>
			<div class="fl">
				<h3 class="scon_tit">페이지 그룹관리</h3>
			</div>
			<div class="fr mb10">
				<a class="fr btn btn_round bg_sky" onclick="javascript:$.Nav('go', './page_group_write.do', {gseq: ''});">분류 등록</a>
			</div>
		</div>
		<table class="board_st1 mt10">
			<colgroup>
				<col width="20%" />
				<col width="30%" />
				<col width="50%" />
			</colgroup>
			
			<thead>
			<tr>
				<th>번호</th>
				<th>분류명</th>
				<th>기능</th>
			</tr>
			</thead>
			<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
				<tr>
					<td>${s.index+1 }</td>
					<td>${m.groupName }</td>
					<td>
						<a onclick="javascript:$.Nav('go', './page_group_write.do', {gseq:${m.groupSeq}})" class="btn btn_round bg_pink">수정</a> 
						<a onclick="javascript:doDelete(${m.groupSeq})" class="btn btn_round bg_darkgray">삭제</a>
					</td>
				</tr>
</c:forEach>
<c:if test="${empty list}">
					<tr>
						<td colspan="3"><s:message code="common.noData" /></td>
					</tr>
</c:if>			
			</tbody>
		</table>
	</form>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		
		$('input[name=gseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
