<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시물 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<style>
		th.th{
		text-align: center;
		}
		td.content{
		    max-width: 400px;
		    overflow-wrap: break-word;
		}



</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2><strong>간편상담</strong> 게시물 등록/수정</h2>
		<p>홈 &gt; 게시판 관리 &gt; 간편상담 </p>
	</div>

	<div class="scon">

<form id="form1" action="./quick_proc.do" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="idx" value="${search.idx }" />
		<input type="hidden" name="status" value="${search.status }" />
		<input type="hidden" name="email" value="${vo.email }" />
		<input type="hidden" name="content" value="${vo.content }" />
		
		<table class="board_write">
			<colgroup>
				<col width="15%" />
				<col width="*" />
				
			</colgroup>
			
				<tr>
					<th class="th">이름 </th>
					<td >${vo.userName}</td>
				</tr>
				<tr>
					<th class="th">연락처 </th>
					<td >${vo.contact}</td>
				</tr>
				<tr>
					<th class="th">이메일 </th>
					<td >${vo.email}</td>
				</tr>
				<tr>
					<th class="th">내용 </th>
					<td class="content">${vo.content}</td>
				</tr>
				<tr>
					<th class="th">메모 </th>
					<td>
						<textarea name="answer" id="answer" class="w100" style="height:300px;" class="editor">${vo.answer }</textarea>
								<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
								<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
								<script type="text/javascript">
									CKEDITOR.replace('answer', {
										width : '100%'
										, height : '270px'
										, startupFocus : false
									});
								</script>
					</td>
			</tr>
						
			<tbody>

			</tbody>
		</table>

		<br class="clear mb5" />
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:doDelete();" class="btn2 bg_navy">삭제</a></li>
			<li><a onclick="javascript:$.Nav('go', './quick_list');" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	
	</div>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
function doSubmit() {		
		
	if(!confirm('저장하시겠습니까?')){
		return;
	}
	
	$('#form1').submit();
}
function doDelete() {		
	
	if(!confirm('저장하시겠습니까?')){
		return;
	}
	$('input[name="status"]').val("d");
	
	$('#form1').submit();
}
</script>


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>