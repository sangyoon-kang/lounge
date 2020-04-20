<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<c:if test="${!empty list }">
<c:forEach items="${list }" var="ls">
<ul class="comments" style="display:none;">
	<li>
		<div class="comment mt-2">
			<div class="comment-title">
				<div class="comment-left flex" style="overflow:hidden;">
					<p class="regUser float-left">${ls.userName }</p>
					<em class="ml-auto flex"><img class="mr-1" src="/images/fx_assets/clock.svg" height="14px"/><p class="regDate small pr-1"><fmt:formatDate value="${ls.regDate }" pattern="${ls.dateFormatList }"/></p></em>
				</div>
			</div>
			<div class="comment-body w-100 pt-1 pb-1" style="background: #f8fafb;">
				<textarea class="w-100" name="body" disabled style="background: #f8fafb; border:none;">${ls.body}</textarea>
				<div class="comment-right text-right pr-1">
					<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and search.maxLevel lt bm.commentLevel}">
						<a href="#" class="mr-1 btn light replyC" data-id="${ls.commentSeq }" data-user="${tagoplusSolution1_session_user.userName}" data-level="${search.maxLevel}">답글</a>
					</c:if>
					<c:if test="${(bm.authComment eq 0 or bm.authComment ge tagoplusSolution1_session_user.gradeLevel) and ls.regUser eq tagoplusSolution1_session_user.userId }">
						<a href="#" class="mr-1 btn light editC" data-status='u' data-pid="${ls.parentSeq }" data-id="${ls.commentSeq }">수정</a>
						<a href="#" class="btn light removeC" data-status='d' data-id="${ls.commentSeq }">삭제</a>
					</c:if>	
				</div>
			</div>
		</div>
		<jsp:include page="/module/comment/sublist" flush="true">
			<jsp:param name="bseq" value="${ls.commentSeq }" />
			<jsp:param name="maxLevel" value="${search.maxLevel}" />
		</jsp:include>
	</li>
</ul>
</c:forEach>
</c:if>
