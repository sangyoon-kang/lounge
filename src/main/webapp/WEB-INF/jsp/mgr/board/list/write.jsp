<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시물 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2><strong>${bm.boardName }</strong> 게시물 등록/수정</h2>
		<p>홈 &gt; 게시판 관리 &gt; ${bm.boardName } </p>
	</div>

	<div class="scon">

<%-- <c:if test="${bm.boardTypeFixedCode eq '001002' }">
		<div>
			<div class="fl">
			</div>
			<div class="fr mb10">
				<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}?prSeq=${search.bseq }&bseq=0');" class="btn btn_round bg_blue">답글 쓰기</a>
			</div>
		</div>
		<br class="clear mb5" />
</c:if>	 --%>	
	<form id="form1" action="../proc.do" method="post" enctype="multipart/form-data">	
		<input type="hidden" name="bcode" value="${search.bcode }" />
		<input type="hidden" name="bseq" value="${search.bseq }" />
		<input type="hidden" name="prSeq" value="${search.prSeq }" />
		<input type="hidden" name="status" value="${search.status }" />
		<input type="hidden" name="allowCommYn" value="N" />
		<table class="board_write">
			<colgroup>
				<col width="10%" />
				<col width="23%" />
				<col width="10%" />
				<col width="23%" />
				<col width="10%" />
				<col width="24%" />
			</colgroup>
			<thead>
				<tr>
					<th>제목 </th>
					<td colspan="5"><input type="text" class="w100" maxlength="400" name="subject" value="${vo.subject }" /></td>
				</tr>
				<tr>
					<th>카테고리 </th>
					<td>
						<tt:select name="bcSeq" class="w100" list="${bm.boardCategoryVO }" listKey="bcSeq" listValue="cateName" indexKey="0" indexValue="= 카테고리 =" selected="${vo.bcSeq }" />
					</td>
					<th>작성자 </th>
					<td>
						<input type="text" name="userName" class="w100" value="${vo.userName }" />
						<input type="hidden" name="regUser" value="${vo.regUser }" />
						<script>
							$(function() {
								var sRegUserName = '${vo.regUserName}' || '${tagoplusSolution1_session_admin.adminName}';
								if ($('input[name=userName]').val().trim().length == 0) {
									$('input[name=userName]').val(sRegUserName);
								}
							});
						</script>
					</td>
					<th>조회 수</th>
					<td>
						<input type="text" name="readCount" class="w100 onlyNumber" value="${vo.readCount }" />
						<script>
							$(function() {
								if ($('input[name=readCount]').val().trim().length == 0)
									$('input[name=readCount]').val(0);
							});
						</script>
					</td>
				</tr>
			</thead>			
			<tbody>
		<c:if test="${bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '001006' and bm.fileUploadCount gt 0}">
			<c:if test="${empty vo.fileVOList }">
				<c:set var="fileSize" value="0"/>
			</c:if>
			<c:if test="${!empty vo.fileVOList }">
				<c:set var="fileSize" value="${fn:length(vo.fileVOList) }"/>
			</c:if>
	
				<tr>	
					<td colspan="6">
					<c:forEach items="${vo.fileVOList }" var="l">
						<p class="mT5">
							<input type="hidden" name="FileSeqList" value="${l.fileSeq }">
							<input type="file" name="fileList">
							<a href="javascript:viewFile('${UPLOAD_ROOT }${l.saveFilename }');">${l.originalFilename }</a>
						</p>
					</c:forEach>
	
					<c:forEach varStatus="s" step="1" begin="1" end="${bm.fileUploadCount - fileSize }">
						<p class="mT5">
							<input type="hidden" name="FileSeqList" value="0">
							<input type="file" name="fileList">
						</p>
					</c:forEach>	
					</td>
				</tr>
			</c:if>
			
			<c:if test="${bm.boardTypeFixedCode eq '001005' or bm.boardTypeFixedCode eq '001006' }">
				<tr>
					<th>이미지 파일</th>
					<td colspan="5">					
						<input type="hidden" name="fileSeqList" value="${empty vo.fileVOList[0].fileSeq ? 0 : vo.fileVOList[0].fileSeq }">
						<input type="file" name="fileList">
						<a href="javascript:viewFile('${UPLOAD_ROOT }${vo.fileVOList[0].saveFilename }', '${vo.fileVOList[0].originalFilename }');">${vo.fileVOList[0].originalFilename }</a>
					</td>
				</tr>
			</c:if>
			
			<c:if test="${bm.boardTypeFixedCode eq '001005' }">
				<tr>
					<th>이동 경로</th>
					<td colspan="5">
						<input type="text" name="linkUrl" class="w100" value="${empty vo.linkUrl ? 'http://' : vo.linkUrl}">
					</td>
				</tr>
			</c:if>
			
			<c:if test="${bm.boardTypeFixedCode ne '001005' }">
				<tr>
					<td colspan="6">
						<label><input type="checkbox" name="useHtml" class="" value="Y" /> HTML 사용</label>
						<label><input type="checkbox" name="useSecret" class="ml15" value="Y" /> 비밀글</label>
						<label><input type="checkbox" name="useNotice" class="ml15" value="Y" /> 공지글</label>
						<input type="hidden" name="htmlYn" value="" />
						<input type="hidden" name="secretYn" value="" />
						<input type="hidden" name="noticeYn" value="" />
						<script>
							$(function() {
								checkCheckbox('useHtml', 'htmlYn', '${vo.htmlYn}', 'Y');
								checkCheckbox('useSecret', 'secretYn', '${vo.secretYn}', 'N');
								checkCheckbox('useNotice', 'noticeYn', '${vo.noticeYn}', 'N');
							});
						</script>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<textarea id="body" name="body" style="width:95%; height:538px;" class="editor">${vo.body }</textarea>
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
			</c:if>
			
			<c:if test="${bm.boardTypeFixedCode eq '001003' or bm.boardTypeFixedCode eq '001008' }">
				<tr>
					<th>작성자 </th>
					<td colspan="5">
						<input type="text" name="modUser" class="w30" value="${empty vo.modUser ? tagoplusSolution1_session_admin.adminId : vo.modUser }" />
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<textarea rows="7" class="w80" name="answer">${vo.answer }</textarea>
					</td>
				</tr>
			</c:if>
			</form>
		
			<c:if test="${bm.commentYn eq 'Y' }">
			<%-- <c:forEach items="" var="l">
			테이블 없음	
		
			</c:forEach> --%>
			<form id="formReply" action="../manage/comment_proc.do" method="post">	
				<tr>
					<th>작성자 </th>
					<td colspan="2">
						<input type="text" class="w100" name="userName" value="${vo.userName }" />
						<input type="hidden" name="commentSeq" value="">
						<input type="hidden" name="boardSeq" value="${vo.boardSeq }">
						<input type="hidden" name="boardCode" value="${vo.boardCode }">
						<input type="hidden" name="parentSeq" value="0">
					</td>
					<th>Verify Comment : </th>
			
					<td colspan="2">
						<label><input type="checkbox" name="useAllowCommYn" class="ml15" value="Y" /> Allow</label>
						<script>
							$(function() {
								checkCheckbox('useAllowCommYn', 'allowCommYn', '${vo.allowCommYn}', 'N');
							});
						</script>
					</td>
				</tr>
				<tr>
					<td colspan="6">
						<textarea rows="7" class="w80" name="body" id="commBody"></textarea>						
						<a onclick="javascript:doCommentSubmit();" class="btn2 bg_navy fr">저장</a>
					</td>
				</tr>
			</form>	
			</c:if>
			
			<c:if test="${bm.showPrevNextYn eq 'Y' and !empty vo.boardSeq }">
				<tr>
					<th>이전글</th>
					<td colspan="5">
					<c:if test="${!empty vo.prevSubject }">
						<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${vo.prevBoardSeq }'});"><tt:abbr length="${bm.subjectCharCount}" value="${vo.prevSubject }"/></a>
					</c:if>
					<c:if test="${empty vo.prevSubject }">
						이전글이 없습니다.
					</c:if>
					</td>
				</tr>
				<tr>
					<th>다음글</th>
					<td colspan="5">
					<c:if test="${!empty vo.nextSubject }">
						<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${vo.nextBoardSeq }'});"><tt:abbr length="${bm.subjectCharCount}" value="${vo.nextSubject }"/></a>
					</c:if>
					<c:if test="${empty vo.nextSubject }">
						다음글이 없습니다.
					</c:if>
					</td>
				</tr>
</c:if>
			</tbody>
		</table>

		<br class="clear mb5" />
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', '../list/${bm.boardCode}', {bseq: ''});" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	var bTypeCode = '${bm.boardTypeFixedCode }';	

	function doSubmit() {
		if(bTypeCode == '001004'){
			if($('select[name=bcSeq]').val() == 0){
				alert('카테고리를 입력해야 합니다.');
				return;
			}
		}
		if ($('input[name=subject]').val().trim().length == 0) {
			alert('제목을 입력해야 합니다.');
			return;
		}
		
		if (bTypeCode != '001005') {	
			var sBody = CKEDITOR.instances.body.getData();
			if (sBody.length == 0) {
				alert('본문 내용을 입력해야 합니다.');
				return;
			}
			
			$('#body').val(sBody);
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
	
	function doCommentSubmit() {
		if ($('#commBody').val().trim().length == 0) {
			alert('제목을 입력해야 합니다.');
			return;
		}
		$('#formReply').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>