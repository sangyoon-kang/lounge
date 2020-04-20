<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인 게시물
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">

		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>메인 & 추천 상품 설정</h2>
			<p>홈  &gt; 환경설정  &gt; 메인 & 추천 상품</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">메인 상품 생성 코드</h3>
<pre class="custom"><code id="codeMain" class="html">
&lt;jsp:include page="/module/rp.do" flush="true"&gt;
	&lt;jsp:param name="rpseq" value="[게시물 순번]"/&gt;
&lt;/jsp:include&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#codeMain');" class="btn btn_round bg_gray vc_bottom">생성코드복사</a>
			
			<div class="check_conbox mt15 mb15">
				<h4 class="check_tit">체크사항</h4>
				<ul class="ml10">
					<li>- 해당 체크 상품을 가져올 수 있습니다.</li>
					<li>- 출력하고자 하는 위치에 예제 코드와 같은 블럭을 추가합니다.</li>					
				</ul>
			</div>
			
			<div>
				<span class="fl">
					<span>메인게시물 수 : ${search.totalCount }</span>
				</span>
				<span class="fr mb10">
					<a href="./main_write.do" class="btn btn_round bg_purple">메인게시물 생성</a>
				</span>
			</div>
			
			<br class="clear"/>
			<form id="form1" action="./main_proc.do" method="post">	
		<input type="hidden" name="rpseq" value="${search.rpseq }" />
		<input type="hidden" name="status" value="${search.status }" />		
			<table class="board_st1">
				<caption></caption>
				<colgroup>
					<col width="6%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />					
					<col width="15%" />
					<col width="*" />
				</colgroup>
				
				<thead>
					<tr>
						<th>순번</th>
						<th>출력 구분</th>
						<th>상품 노출 수</th>
						<th>제목 글자 수</th>
						<th>상세 글자 수</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<%-- <td>${search.paging.virtualNumber - s.index }</td> --%>	
	<c:if test="${m.listType eq 'A' }">
		<c:set var="listType" value="최근 등록"/>
	</c:if>
	<c:if test="${m.listType eq 'B' }">
		<c:set var="listType" value="추천 상품"/>
	</c:if>
	<c:if test="${m.listType eq 'C' }">
		<c:set var="listType" value="메인 노출"/>
	</c:if>
						<td>${s.index+1 }</td>
						<td>${listType }</td>						
						<td>${m.prdCount }</td>
						<td>${m.subjectCharCount }</td>
						<td>${m.summaryCharCount}</td>
						<td>
							<span id="spanCode_${m.rpSeq }" class="pl10 pr10 hide">
&lt;jsp:include page="/module/rp.do" flush="true"&gt;
	&lt;jsp:param name="rpseq" value="${m.rpSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>
							<a href="javascript:copyClipboard('#spanCode_${m.rpSeq }');" class="btn btn_round bg_gray btnh_22">생성코드복사</a>
							<a href="javascript:openPop('?rpseq=${m.rpSeq }', 'previewRecentPrd');" class="btn btn_round bg_sky btnh_22">미리보기</a>
							<a href="javascript:$.Nav('go', './main_write.do', {rpseq: '${m.rpSeq }'});" class="btn btn_round bg_blue btnh_22">수정</a>
							<a href="javascript:deleteSubmit(${m.rpSeq})" class="btn btn_round bg_red btnh_22">삭제</a>
						</td>
					</tr>
</c:forEach>
<c:if test="${empty list }">
					<tr>
						<td colspan="7"><s:message code="common.noData" /></td>
					</tr>
</c:if>
				</tbody>
			</table>
</form>
		</div>
	</div>
	<script type="text/javascript">
		function deleteSubmit(seq ) {
			$('input[name="rpseq"]').val(seq);
			$('input[name="status"]').val("d");
			$('#form1').submit();
		}
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>