<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>


<!--wrap_scon E-->
<section class="wrap_scon">
		<div class="scon">
		<form id="form1" action="/module/bbs/proc.do" method="post" enctype="multipart/form-data" class="row">	
		<input type="hidden" name="bcode" value="${search.bcode }" />
		<input type="hidden" name="bseq" value="${search.bseq }" />
		<input type="hidden" name="status" value="${search.status }"/>
		<input type="hidden" name="readCount" value="${vo.readCount }"/>
		
			<!--board_write_sty01-->
			<div class="board_write_sty01">
				<c:if test="${bm.emailYn eq 'Y' }">
				<ul>
					<li>이메일</li>
					<li><input type="text" name="email" value="${tagoplusSolution1_session_user.email}" maxlength="50" placeholder="이메일"/></li>
				</ul>
		
 		</c:if>
 		<c:if test="${bm.phoneYn eq 'Y' }">
 		<ul>
					<li>전화번호</li>
					<li><input type="text" name="phone" value="${tagoplusSolution1_session_user.phone}" id="user_mobile_number"  placeholder="휴대폰번호"/></li>
				</ul>
 		
 		<script type="text/javascript">
	
	
	        // $('#user_name').mask('KKK',{'translation': {
	        //           K : {pattern: /[\u3131-\uD79DA-Za-z]/},
	        //      }
	        // })
	   </script>
 		</c:if>
 		<c:if test="${bm.boardTypeFixedCode ne '001002' }">
				<%-- <ul>
					<li>카테고리</li>
					
					<li class="li_label">
						<c:forEach items="${bm.boardCategoryVO }" var="m" varStatus="s">
					  		<label><input type="radio" value="${m.bcSeq }" name="bcSeq"><span>${m.cateName }</span></label>
						</c:forEach>
				  	</li>
				</ul> --%>
				</c:if>
				<c:if test="${bm.boardTypeFixedCode eq '001005' }">
				<ul>
					<li>이동 경로</li>
					
					<li >
					<input type="text" name="linkUrl" class="w100" value="${empty vo.linkUrl ? 'http://' : vo.linkUrl}"/>
						
				  	</li>
				</ul>
			</c:if>
				<c:if test="${bm.boardTypeFixedCode ne '001005' }">
				<ul>
					<li>제목</li>
					<li>
					
					<label ><input type="text" class="w100" value="${vo.subject }" name="subject" value="${vo.subject }" maxlength="400" placeholder="제목"/></label>
					
					<input type="hidden" name="htmlYn" value="" />
					<input type="hidden" name="secretYn" value="N" />
					<input type="hidden" name="noticeYn" value="${bm.boardTypeFixedCode eq  '001003' or bm.boardTypeFixedCode eq '001008' ? 'N' : 'Y' }" />
					</li>
				</ul>
				<div>
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
</div>
</c:if>
<%-- 				
					
<c:if test="${bm.boardTypeFixedCode ne '001005' and bm.boardTypeFixedCode ne '001006' and bm.fileUploadCount gt 0}">
		<ul>
			<li>파일첨부</li>
			<li>
				<c:if test="${empty vo.fileVOList }">
					<c:set var="fileSize" value="0"/>
				</c:if>
				<c:if test="${!empty vo.fileVOList }">
					<c:set var="fileSize" value="${fn:length(vo.fileVOList) }"/>
				</c:if>
				<ul>
				<c:if test="${bm.boardTypeFixedCode eq '001002'}">
									
					<input type="text" name="linkUrl" class="w50 form-control" value="${empty vo.linkUrl ? 'http://' : vo.linkUrl}">
					
				</c:if>
				<c:forEach items="${vo.fileVOList }" var="l">
					<input type="hidden" name="FileSeqList" value="${l.fileSeq }">
					<input type="file" name="fileList">
					<a href="javascript:viewFile('${UPLOAD_ROOT }${l.saveFilename }');">${l.originalFilename }</a>
				</c:forEach>
				
				</ul>
			</li>
		</ul>		
</c:if> --%>
					
				<c:forEach varStatus="s" step="1" begin="1" end="${bm.fileUploadCount - fileSize }">
					<ul>
						<li>파일첨부</li>
						<li>
							
								<input type="hidden" name="FileSeqList" value="0">
								<input type="file" name="fileList">
							
							
						</li>
					</ul>
				</c:forEach>
						
			</div>
			
			
			
			
			</form>
			<div class="board_bt_set01">
				
				<!-- <a href="javascript:$.Nav('self', {bseq: '', bcseq: '', mode: ''});" class=" btn-lg btn dark ml-auto">목록가기</a> -->
				
				
				<a href="javascript:doSubmit();" class="bt_list">저장</a>
			</div>
		</div>
	</section>
<script type="text/javascript">
	var bTypeCode = '${bm.boardTypeFixedCode }';	

	function doCancel () {		
		var iBseq = '${search.bseq}';
		
		if (iBseq != '0') {
			$.Nav('self', {mode: 'view'});
		} else {
			$.Nav('self', {mode: 'list'});
		}
	}
	
	function doSubmit() {
		if('${bm.emailYn}' == 'Y'){
			if (checkNull($('input[name=email]') , '이메일를 입력해야 합니다.')) {
				return;
			}
			if(!checkPattern($('input[name=email]').val(), 'EMAIL')){
				$('input[name=email]').focus();
				alert('이메일 주소에 "@"를 포함하십시오. 이메일에 "@"이 없습니다.');
				return;
			}
		}
		if('${bm.phoneYn}' == 'Y'){
			if (checkNull($('input[name=phone]') , '휴대폰번호를 입력해야 합니다.')) {
				return;
			}
			if(!checkPattern($('input[name=phone]').val(), 'PHONE')){
				$('input[name=phone]').focus();
				alert('휴대폰번호를 입력해야 합니다.');
				return;
			}
		}
		
		if (checkNull($('input[name=subject]') , '제목을 입력해야 합니다.')) {
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
</script>