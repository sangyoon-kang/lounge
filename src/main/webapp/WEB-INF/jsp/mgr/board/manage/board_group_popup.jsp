<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 그룹 목록 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="form1" action="./board_group_proc" method="post">
		<input type="hidden" name="gseq" />
		<input type="hidden" name="status" />
		<div class="clear">
			<h3 class="scon_tit">게시판 그룹관리</h3>
			<a class="fr btn btn_round bg_sky" onclick="javascript:$.Nav('go', './board_group_write', {gseq: ''});">그룹 등록</a>
		</div>
		
		<table class="board_st1 mt10">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="30%" />
			</colgroup>
			<tbody>
				<tr>
					<th>번호</th>
					<th>분류명</th>
					<th>기능</th>
				</tr>
<c:forEach var="m" items="${list }" varStatus="s">
				<tr>
					<td>${s.index + 1 }</td>
					<td>${m.groupName }</td>
					<td>
						<a onclick="javascript:$.Nav('go', './board_group_write', {gseq: '${m.groupSeq}'});" class="btn btn_round bg_pink">수정</a>
						<a onclick="javacript:doDelete('${m.groupSeq}');" class="btn btn_round bg_darkgray">삭제</a>
					</td>
				</tr>
</c:forEach>
<c:if test="${empty list }">
				<tr>
					<td colspan="3"><s:message code="common.noData" /></td>
				</tr>
</c:if>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
			<li><a onclick="javascript:self.close();" class="btn2 bg_darkgray">닫기</a></li>
		</ul>
	</form>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doDelete(gseq) {
		if(!confirm('삭제하시겠습니까?'))
			 return;

		$('input[name=gseq]').val(gseq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>