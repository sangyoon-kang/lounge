<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		게시판 - 상세
 --%>
 <style>
 	ul.nested-comment li {padding-left: 1.5rem;}
 </style>

<div class="row b-1-light-grey pb-3">

   
    <div class="col-sm-12 pt-2">
<c:if test="${ bm.boardTypeFixedCode ne '001002' and bm.boardTypeFixedCode ne '001003' and bm.boardTypeFixedCode ne '001008'}">
   	
	   
		<section class="wrap_scon">

		<div class="scon">

			<!--board_detail_sty01-->
			<div class="board_detail_sty01">
				<!--tit-->
				<div class="tit">
					
					<h2>${vo.subject }</h2>
					<ul>
						<li>${vo.userName }</li>
						<li>조회: ${vo.readCount }건</li>
						<li><em class="italic text-light float-right"> <fmt:formatDate value="${vo.regDate }" pattern="${bm.dateFormatView }"/></em></li>
					</ul>
				</div>
				<!--// tit-->
				<div class="wrap_con">
					<div class="con">
						<p>${vo.body }</p>
					</div>

					<!--첨부파일에 없을때는 안나오게 해주세요.-->
					 <c:if test="${!empty vo.fileVOList }">
					<div class="con_file">
						<ul>
						 <c:forEach items="${vo.fileVOList }" var="l" >
			    <li>
					<c:choose>
						<c:when test="${bm.imageSizeView gt 0}">
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-left:auto;'" />
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style=' display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-left:auto;'" />
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:if test="${bm.imageSizeView gt 0}">
						<c:set var="imageSizeView" value="style='width:${bm.imageSizeView }px;'" />
					</c:if>
					<a class="mb-2 pl-3" onclick="javascript:viewFile('${UPLOAD_ROOT }${l.saveFilename }', '${l.originalFilename }', 'isChecked');" title="다운로드">
						
						<c:if test="${bm.previewImageYn eq 'Y' and l.isImageFile }">
							<img src="${UPLOAD_ROOT }${l.saveFilename}" ${imageSizeAlignView } class="img-responsive">
						</c:if>
				
						<c:if test="${bm.previewImageYn ne 'Y' or !l.isImageFile }">
							${l.originalFilename }
						</c:if>
					</a>
				</li>
				</c:forEach>
				
							
						</ul>
					</div>
					</c:if>
				</div>
				
				
		
				
			</div>
			<!--// board_detail_sty01-->
			
			<div class="board_bt_set01">
			 
		<c:if test="${bm.showPrevNextYn eq 'Y'}">
     
		     
				<c:if test="${!empty vo.prevSubject }">
					<a href="javascript:$.Nav('self', {bseq: '${vo.prevBoardSeq }'});" class="">
				       이전 글
				       </a>
			     	
			     </c:if>
			     <a href="javascript:$.Nav('self', {bseq: '', bcseq: '', mode: ''});" class="bt_list">목록 </a>
				 <c:if test="${!empty vo.nextSubject }">
				 	
				 	<a href="javascript:$.Nav('self', {bseq: '${vo.nextBoardSeq }'});" class="">
				 	다음 글
				 	</a>
			      </c:if>
			 
		 </c:if>
			</div>
		</div>
	</section>
	</c:if>
	    
	<c:if test="${ bm.boardTypeFixedCode eq '001002'}">

		 <div class="col-sm-12 pr-3 pl-3">
		    <ul >
			    <li>
			    <c:forEach items="${vo.fileVOList }" var="l" >
					<c:choose>
						<c:when test="${bm.imageSizeView gt 0}">
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style='max-width:${bm.imageSizeView }px; display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='max-width:${bm.imageSizeView }px; display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='max-width:${bm.imageSizeView }px; display:block; margin-left:auto;'" />
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style=' display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-left:auto;'" />
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:if test="${bm.imageSizeView gt 0}">
						<c:set var="imageSizeView" value="style='width:${bm.imageSizeView }px;'" />
					</c:if>
					<a class="mb-2 pl-3" onclick="javascript:viewFile('${UPLOAD_ROOT }${l.saveFilename }', '${l.originalFilename }');" title="다운로드">
						<c:if test="${bm.previewImageYn eq 'Y' and l.isImageFile }">
							<img src="${UPLOAD_ROOT }${l.saveFilename}" ${imageSizeAlignView } class="img-responsive">
						</c:if>
				
						<c:if test="${bm.previewImageYn ne 'Y' or !l.isImageFile }">
							${l.originalFilename }
						</c:if>
					</a>
				</li>
				</c:forEach>
			</ul>
		</div>
	    <div class="col-sm-12 board-buttons justify-between mt-3 break">
	    	${vo.body }
	    </div>
	</c:if>
	</div>
</div>		

<c:if test="${bm.boardTypeFixedCode eq '001003' or bm.boardTypeFixedCode eq '001008'}">

<section class="wrap_scon">

		<div class="scon">
			<div class="board_detail_sty01_bt">
			 <c:if test="${tagoplusSolution1_session_user.userId eq vo.regUser }">
		<c:if test="${(bm.boardTypeFixedCode eq '001003' or bm.boardTypeFixedCode eq '001008') and empty vo.answer}">			
			<a href="javascript:$.Nav('self', {mode: 'write', status: 'u'});" class="bt_blue">수정</a>
		</c:if>				
	<a href="javascript:deleteBoard('d');" class="bt_gray">삭제</a>
	</c:if>	
				
				
			</div>
			<!--board_detail_sty01-->
			<div class="board_detail_sty01">
				<!--tit-->
				<div class="tit">
					
					<h2>${vo.subject }</h2>
					<ul>
						<li>${vo.userName }</li>
						<li>${vo.cateName }</li>
						<li><fmt:formatDate value="${vo.regDate }" pattern="${bm.dateFormatView }"/></li>
					</ul>
				</div>
				<!--// tit-->
				<div class="wrap_con">
					<div class="con">
						<p>${vo.body }</p>
					</div>

					<!--첨부파일에 없을때는 안나오게 해주세요.-->
					<c:if test="${!empty vo.fileVOList }">
					<div class="con_file">
						<ul>
						 
						 <c:forEach items="${vo.fileVOList }" var="l" >
			    <li>
					<c:choose>
						<c:when test="${bm.imageSizeView gt 0}">
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='width:${bm.imageSizeView }px; display:block; margin-left:auto;'" />
							</c:if>
						</c:when>
						<c:otherwise>
							<c:if test="${bm.previewImageAlign eq 'center'}">
								<c:set var="imageSizeAlignView" value="style=' display:block; margin-right: auto; margin-left:auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'left'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-right: auto;'" />
							</c:if>
							<c:if test="${bm.previewImageAlign eq 'right'}">
								<c:set var="imageSizeAlignView" value="style='display:block; margin-left:auto;'" />
							</c:if>
						</c:otherwise>
					</c:choose>
					<c:if test="${bm.imageSizeView gt 0}">
						<c:set var="imageSizeView" value="style='width:${bm.imageSizeView }px;'" />
					</c:if>
					<a class="mb-2 pl-3" onclick="javascript:viewFile('${UPLOAD_ROOT }${l.saveFilename }', '${l.originalFilename }', 'isChecked');" title="다운로드">
						
						<c:if test="${bm.previewImageYn eq 'Y' and l.isImageFile }">
							<img src="${UPLOAD_ROOT }${l.saveFilename}" ${imageSizeAlignView } class="img-responsive">
						</c:if>
				
						<c:if test="${bm.previewImageYn ne 'Y' or !l.isImageFile }">
							${l.originalFilename }
						</c:if>
					</a>
				</li>
				</c:forEach>
				
							
						</ul>
					</div>
					</c:if>
				</div>
				
				<c:if test="${!empty vo.answer }">			
					<div class="wrap_con">
						<div class="con">
								
							<span class="bold mr-1 ml-1 float-left">작성자:</span>
							<span class="mL40 float-left">${vo.modUser }</span>
						
						<div class="col-sm-10 break">
							<span class="ml-6 ">${vo.answer }</span>
						
						</div>
						</div>
					</div>
				</c:if>	
				<c:if test="${empty vo.answer }">	
					<div class="wrap_con">
						<div class="con">
								<p>고객님의 문의에 대한 답변을 준비 중입니다.</p>
						</div>
					</div>
					
				</c:if>
				<c:if test="${empty vo.answer and bm.authReply eq 0 or bm.authReply ge tagoplusSolution1_session_user.gradeLevel }">											
					<tr>
						<td class="text-left pt-3 pb-3"><span class="bold mr-1 ml-1">작성자</span>
							<span class="mL40">${tagoplusSolution1_session_user.userId }</span>
						</td>
					</tr>
					<tr>					
						<td>
							<form id="formAnswer" action="/module/bbs/proc.do" method="post">
								<input type="hidden" name="modeUser" value="${tagoplusSolution1_session_user.userId }" />						
								<input type="hidden" name="boardSeq" value="${vo.boardSeq }"/>
								<input type="hidden" name="status" value="a"/>
								<input type="hidden" name="productCode" value="${vo.productCode }"/>
								<textarea class="w-100 mt-2" style="height: 150px;" name="answer"></textarea>
							</form>							
							<a onclick="javascript:doAnswerSubmit();" class="bt_gray">등록</a>							
						</td>
					</tr>	
				</c:if>	
				
			</div>
			<!--// board_detail_sty01-->
			
			<div class="board_bt_set01">
			 <a href="javascript:$.Nav('self', {bseq: '', bcseq: '', mode: ''});" class="bt_list">목록 </a>
		<c:if test="${bm.showPrevNextYn eq 'Y'}">
     
		     
				<c:if test="${!empty vo.prevSubject }">
					<a href="javascript:$.Nav('self', {bseq: '${vo.prevBoardSeq }'});" class="">
				       <tt:abbr length="50" value="이전 글"/>
				       </a>
			     	
			     </c:if>
				 <c:if test="${!empty vo.nextSubject }">
				 	
				 	<a href="javascript:$.Nav('self', {bseq: '${vo.nextBoardSeq }'});" class="">
				 	<tt:abbr length="50" value="다음 글"/>
				 	</a>
			      </c:if>
			 
		 </c:if>
			</div>
		</div>
	</section>
</c:if>




<c:if test="${bm.commentYn eq 'Y' }">
		<button class="btn btn-lg ghost hide_comments">댓글목록</button>
		<div class="pt-2" id="commentTable" >
			<c:forEach items="${clist }" var="l">	
				<ul class="nested-comment comments" style="display:none;">
					<li>
						<div class="comment mt-2">
							<div class="comment-title">
								<div class="comment-left flex" style="overflow:hidden;">
									<p class="regUser float-left">${l.userName }</p>
									<em class="ml-auto flex"><img class="mr-1" src="/images/fx_assets/clock.svg" height="14px"/><p class="regDate small pr-1"><fmt:formatDate value="${l.regDate }" pattern="${l.dateFormatList }"/></p></em>
								</div>
								
							</div>
							<div class="comment-body w-100 pt-1 pb-1" style="background: #f8fafb;">
								<textarea  class="w-100" name="body" disabled style="background: #f8fafb; border:none;">${l.body}</textarea>
								<div class="comment-right text-right pr-1">
									<c:if test="${bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel}">
										<a href="#" class="mr-1 btn light replyC" data-id="${l.commentSeq }" data-user="${tagoplusSolution1_session_user.userName}" data-level="1">답글 </a>
									</c:if>
									<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and l.regUser eq tagoplusSolution1_session_user.userId }">
										<a href="#" class="mr-1 btn light editC" data-status='u' data-pid="${l.parentSeq }" data-id="${l.commentSeq }">수정</a>
										<a href="#" class="btn light removeC" data-status='d' data-id="${l.commentSeq }">삭제</a>	
									</c:if>
								</div>
							</div>
						</div>
						<jsp:include page="/module/comment/sublist" flush="true" >
							<jsp:param name="bseq" value="${l.commentSeq }" />
							<jsp:param name="maxLevel" value="1" />
						</jsp:include>
					</li>
				</ul>
			</c:forEach>
		</div>
		<table class="det_top w-100 mb-5 mt-3">
			<tbody>
			<c:if test="${bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel }">		
				<tr>
					<td >
						<form id="formComment" action="/module/comment/proc.do" method="post">
							<input type="hidden" name="regUser" value="${tagoplusSolution1_session_user.userId }" />						
							<input type="hidden" name="boardSeq" value="${vo.boardSeq }">
							<input type="hidden" name="boardCode" value="${vo.boardCode }">
							<input type="hidden" name="productCode" value="${vo.productCode }">
							<input type="hidden" name="allowYn" value="${vo.allowCommYn}"/>
							<input type="hidden" name="commentSeq" value=""/>
							<input type="hidden" name="parentSeq" value="0"/>
							<input type="hidden" name="bcode" value="${search.bcode }"/>
							<input type="hidden" name="maxLevel" value="0"/>
							<input type="hidden" name="status" value=""/>
							<textarea class="w-100" style="height:120px;" name="body" id="commentBody" placeholder="댓글내용을 입력해주세요"></textarea>
						</form>						
						<a class="mt-1 btn float-right" onclick="javascript:doCommentSubmit();">등록</a>	
					</td>
				</tr>
			</c:if>	
			</tbody>
		</table>
</c:if>

<%-- <div class="inner2 mT15">
<c:if test="${tagoplusSolution1_session_user.userId eq vo.regUser }">
	<c:if test="${bm.boardTypeFixedCode eq '001003' and empty vo.answer}">			
		<a href="javascript:$.Nav('self', {mode: 'write', status: 'u'});" class="btn_m_nor">수정</a>
	</c:if>				
	<a href="javascript:$.Nav('go', '/module/bbs/proc.do', {status: 'd'});" class="btn ml-1 text-right">삭제</a>
</c:if>	
</div> --%>

<c:if test="${bm.showListYn eq 'Y' }">
	<jsp:include page="/module/board.do" flush="true">
		<jsp:param name="mode" value="list"/>
	</jsp:include>
</c:if>
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript" src="/common/js/custom/datetime.js"></script>
<script type="text/javascript">
$(function() {            
    //댓글열기
    $(".hide_comments").click(function(){
        $(this).toggleClass("show_comments");
        $(".comments").toggle();
    });
});
	feather.replace();
	const ajaxUrl = '/module/comment/proc.do';
	
	const loginUser = '${tagoplusSolution1_session_user.userId}';
	
	const commentLevel = $(!isNull('${bm.commentLevel}')) ? '${bm.commentLevel}' : '0';
	function doAnswerSubmit() {
		$('#formAnswer').submit();
	}	
	function doCommentSubmit() {
		if (loginUser == '') {
			alert('로그인이 필요 합니다.');
			return;
		}
		if(!$('#commentBody').val()){
			alert('body is required');
			return;
		}
		let $form = $('#formComment');
		$form.children('input[name="commentSeq"]').val(''); 
		$form.children('input[name="parentSeq"]').val(0); 
		$form.children('input[name="maxLevel"]').val(0); 
	 	$.ajax({
			type : 'post',
			url : ajaxUrl,
			data : $form.serializeArray(),
			dataType : 'json',
			async: true,
			success : function(data) {
				if (data.result) {
					const html = '<ul class="nested-comment">'+
									'<li>'+
										'<div class="comment mt-2">'+
											'<div class="comment-title">'+
												'<div class="comment-left flex" style="overflow:hidden;">'+
													'<p class="regUser float-left">'+ data.result.userName +'</p>'+
													'<em class="ml-auto flex"><img class="mr-1" src="/images/fx_assets/clock.svg" height="14px"/><p class="regDate small pr-1">'+ formatDate(new Date(data.result.regDate), data.result.dateFormatList) +'</p></em>'+
												'</div>'+
											'</div>'+
											'<div class="comment-body w-100 pt-1 pb-1" style="background: #f8fafb;">'+
												'<textarea class="w-100" name="body" disabled style="background: #f8fafb; border:none;">'+ data.result.body +'</textarea>'+
												'<div class="comment-right text-right pr-1">'+
													'<a href="#" class="btn light mr-1 replyC" data-user="${tagoplusSolution1_session_user.userId}" data-id='+ data.result.commentSeq +' data-level="1">답글 </a>'+
													'<a href="#" class="btn light mr-1 editC" data-status="u" data-pid='+ data.result.parentSeq +' data-id='+ data.result.commentSeq +'>수정</a>'+
													'<a href="#" class="btn light removeC" data-status="d" data-id='+ data.result.commentSeq +'>삭제</a>'+
												'</div>'+
											'</div>'+
										'</div>'+
									'</li>'+
								'</ul>';
					$(html).hide().prependTo('#commentTable').fadeIn('slow', function(){$('#commentBody').val('');});
				} else {
					alert(data.message);
				}
			}
		});
	}
	
	$(document).on('click', '.editC', function(e){
		e.preventDefault();
		const $this = $(this), $body = $this.parent().parent().next().children();
		$(this).addClass('isDisabled');
		const html = '<div class="ml-3 mb-1 mt-1">'+
						'<a href="#" class="btn light mr-1 doModify" data-pid='+ $this.data('pid') +' data-id='+ $this.data('id') +'>등록</a>'+
						'<a href="#" class="btn light doRemove">취소</a>'+
					'</div>';
		$this.parent().parent().addClass('reply-body');
		$this.parent().parent().append(html);
		$this.parent().parent().children().prop('disabled', false);
	});
	
	$(document).on('click', '.doRemove', function(e){
		e.preventDefault();
		$(this).parent().parent().prev().children('.comment-right').children('.editC').removeClass('isDisabled');
		$(this).parent().prev().prop('disabled', true);
		$(this).parent().parent().removeClass('reply-body');
		$(this).parent().remove();
	});
	
	$(document).on('click', '.doModify', function(e){
		e.preventDefault();
		const $this = $(this);
		let $body = $this.parent().parent().children();
		if(!$body.val()){
			alert('body cannot be blank');
			return;
		}
		let $data = {}, $form = $('#formComment');
		$form.children('input[name="commentSeq"]').val($this.data('id')); 
		$form.children('input[name="parentSeq"]').val($this.data('pid')); 
		$form.children('input[name="status"]').val('u'); 
		$('#commentBody').val($body.val());
		$data = $form.serializeArray();
		$.ajax({
			type : 'post',
			url : ajaxUrl,
			data : $data,
			dataType : 'json',
			async: true,
			success : function(data) {
				if (data.result) {
					$body.next('.comment-right').children('.editC').removeClass('isDisabled');
					$body.prop('disabled', true);
					$body.parent().removeClass('reply-body');
					$body.parent().children().next().next().remove();
					$('#commentBody').val('');
				}
			}
		});
	});
	
	$(document).on('click', '.removeC', function(e){
		e.preventDefault();
		if (!confirm('삭제하시겠습니까?')) {
			return;
		}
		const $this = $(this);
		const $data = {commentSeq : $this.data('id'), status: $this.data('status')};
		$.ajax({
			type : 'post',
			url : ajaxUrl,
			data : $data,
			dataType : 'json',
			async: true,
			success : function(data) {
				if(data.result > 0) $this.parent().parent().parent().parent().remove('slow').fadeOut('slow');
			}
		});
	});
	
	$(document).on('click', '.replyC', function(e){
		e.preventDefault();
		$(this).addClass('isDisabled');
		const html = '<ul>'+
						'<li>'+
							'<div class="comment mt-2">'+
								'<div class="comment-title">'+
									'<div class=" comment-left flex " style="overflow:hidden;">'+
										'<p class="regUser float-left">'+ $(this).data('user') +'</p>'+
									'</div>'+
									'<div class="comment-right">'+
									'</div>'+
								'</div>'+
								'<div class="comment-body reply-body w-100 pt-1 pb-1" >'+
									'<textarea name="body" class="w-100" ></textarea>'+
									'<div class="text-right pr-1">'+
										'<a href="#" class="btn mr-1 light doAddParent" data-id='+ $(this).data('id') +' data-level='+ $(this).data('level') +'>등록</a>'+
										'<a href="#" class="btn light doCancel" data-id='+ $(this).data('id') +'>취소</a>'+
									'</div>'+
								'</div>'+
							'</div>'+
						'</li>'+
					'</ul>';
		$(html).hide().appendTo($(this).parent().parent().parent().parent()).fadeIn('slow');
	});
	$(document).on('click', '.doAddParent', function(e){
		e.preventDefault();
		if(!$(this).parent().prev().val()){
			alert('body is required!');
			return;
		}
		const id = $(this).data('id');
		$('.replyC').each(function() { if($(this).data('id') === id) $(this).removeClass('isDisabled') });
		let $data = {}, $form = $('#formComment');
		$('#formComment input[name="parentSeq"]').val($(this).data('id'));
		$('#formComment input[name="maxLevel"]').val($(this).data('level'));
		$('#formComment input[name="commentSeq"]').val('');
		$('#commentBody').val($(this).parent().prev().val());
		$data = $form.serializeArray();
		let $this = $(this);
		$.ajax({
			type : 'post',
			url : ajaxUrl,
			data : $data,
			dataType : 'json',
			async: true,
			success : function(data) {
				if (data.result) {
					const html = '<div class="comment mt-2">'+
									'<div class="comment-title">'+
										'<div class=" comment-left flex " style="overflow:hidden;">'+
											'<p class="regUser float-left">'+ data.result.userName +'</p>'+
											'<em class="ml-auto flex"><img class="mr-1" src="/images/fx_assets/clock.svg" height="14px"/><p class="regDate small pr-1">'+ formatDate(new Date(data.result.regDate), data.result.dateFormatList) +'</p></em>'+
										'</div>'+
									'</div>'+
									'<div class="comment-body pl-2 w-100 pt-1 pb-1" style="background: #f8fafb;">'+
										'<textarea  class="w-100" name="body" disabled style="background: #f8fafb; border:none;">'+ data.result.body +'</textarea>'+
										'<div class="comment-right text-right pr-1">'+
											(data.maxLevel < parseInt(commentLevel) ? '<a href="#" class="btn light mr-1 btn_comment replyC" data-user="${tagoplusSolution1_session_user.userName}" data-id='+ data.result.commentSeq +' data-level='+ data.maxLevel +'>답글 </a>' : '')+
											'<a href="#" class="btn mr-1 light editC" data-status="u" data-pid='+ data.result.parentSeq +' data-id='+ data.result.commentSeq +'>수정</a>'+
											'<a href="#" class="btn light removeC" data-status="d" data-id='+ data.result.commentSeq +'>삭제</a>'+
										'</div>'+
									'</div>'+
								'</div>';
					$(html).hide(function(){$this.parent().parent().parent().hide()}).appendTo($this.parent().parent().parent().parent()).fadeIn('slow', function(){$('#commentBody').val('')});
				} else{
					alert(data.message);
				}
			}
		});
	});
	
	$(document).on('click', '.doCancel', function(e){
		e.preventDefault();
		const id = $(this).data('id');
		$('.replyC').each(function() { if($(this).data('id') === id) $(this).removeClass('isDisabled') });
		$(this).parent().parent().parent().parent().remove('slow').fadeOut('slow');
	});
	
	function deleteBoard(del){
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		
		$.Nav('go', '/module/bbs/proc.do', {status: del});
	}
</script>
