<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 상세
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>견적상담</h2>
		<p>홈 &gt; 게시판관리&gt; 견적상담 수정</p>
	</div>

	<div class="scon">
	
	<form id="form1" action="./counselmon_proc" method="post">
		<input type="hidden" name="counselmonSeq" value="${search.counselmonSeq }" />
		<input type="hidden" name="status" value="${search.status }">
		<br class="clear mb5" />
		<table class="board_write mt10">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th class="center">회사명</th>
					<td class="left">${vo.companyName }</td>
				</tr>
				<tr>
					<th class="center">담당자명</th>
					<td class="left">${vo.userName }</td>
				</tr>
				<tr>
					<th class="center">휴대번호</th>
					<td class="left">${vo.phone }</td>
				</tr>
				<tr>
					<th class="center">전화번호</th>
					<td class="left">${vo.tel } </td>
				</tr>
				<tr>
					<th class="center">이메일</th>
					<td class="left">${vo.email }</td>
				</tr>
				<tr>
					<th class="center">업종</th>
					<td class="left">${vo.bizType }  </td>
				</tr>
				<tr>
					<th class="center">기술선택</th>
					<td class="left">${vo.skill }</td>
				</tr>
				<tr>
					<th class="center">기타기술</th>
					<td class="left">${vo.skillEtc }</td>
				</tr>
				<tr>
					<th class="center">상담내용</th>
					<td class="left">
						<textarea id="body" name="body" style="width:95%; height:538px;" class="editor">${vo.contents }</textarea>
						<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
						<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('body', {
									width : '100%'
									, height : '300px'
									, startupFocus : false
								});
							});
						</script>
					</td>
				</tr>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
			<li><a onclick="javascript:doDelete('${search.counselmonSeq }');" class="btn2 bg_navy">삭제</a></li>
			<li><a onclick="javascript:$.Nav('go', './counselmon_list', {counselmonSeq:''});" class="btn2 bg_darkgray">목록</a></li>
		</ul>
	</form>
</div>
</div>

<script>
function doDelete(counselmonSeq) {	
	if (!confirm("삭제하시겠습니까"))
		return;
	
	$('input[name=counselmonSeq]').val(counselmonSeq);
	$('input[name=status]').val('d');
	
	$('#form1').submit();
}

</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>