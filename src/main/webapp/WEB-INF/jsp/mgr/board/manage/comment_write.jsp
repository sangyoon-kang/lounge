<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너관리 - 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>코멘트 통합관리</h2>
		<p>홈 &gt; 게시판 관리 &gt; 코멘트 통합관리</p>
		</div>
		<div class="scon">
			<form id="form1" action="./comment_proc" method="post" enctype="multipart/form-data">
			
				<input type="hidden" name="commentSeq" value="${vo.commentSeq }" />
				<input type="hidden" name="boardSeq" value="${vo.boardSeq }" />
				<input type="hidden" name="boardCode" value="${vo.boardCode }" />
				<input type="hidden" name="status" value="u" />
				<h3 class="scon_tit2">코멘트 : ${bm.masterName }</h3>
				<table class="board_write">
					<colgroup>
						<col width="15%" />
						<col width="35%" />
						<col width="15%" />
						<col width="" />
					</colgroup>
					<tbody>
						
						<tr>
							<th><strong>Registered User</strong></th>
							<td>
								<input name="regUser" class="w100" value="${vo.regUser}" maxlength="20" type="text" readonly /> 
							</td>
							<th><strong>Registerd Date</strong></th>
							<td>
								<fmt:formatDate value="${vo.regDate }" pattern="${vo.dateFormatList }"/>
							</td>
						</tr>
						<tr>
							<th class=""><strong>코멘트</strong></th>
							<td colspan="3">
								<textarea name="body" id="body" class="w100" style="height:300px;"  class="editor">${vo.body }</textarea>
							</td>
						</tr>
						
					</tbody>
				</table>
				
					<div class="summmit_btn">
						<a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a>
						<a onclick="javascript:$.Nav('go', './comment_list');" class="btn2 bg_gray">목록</a>
					</div>
				</form>
		</div>
	</div>
	<!--wrap_scon E-->
<script type="text/javascript">
	function doSubmit() {
		if (!confirm('저장하시겠습니까?'))
			return;
		
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	