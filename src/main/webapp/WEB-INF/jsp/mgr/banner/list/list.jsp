<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>${bm.masterName }</h2>
			<p>홈  &gt; 배너관리 &gt; ${bm.masterName }</p>
		</div>
		<div class="scon">
			<form id="form1" action="../info_proc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="biseq" />
			<input type="hidden" name="status" />
			<input type="hidden" name="fseq" />
			<input type="hidden" name="bseq" value="${bm.bmSeq }" />
			
			<h3 class="scon_tit2">배너 : ${bm.masterName }</h3>
				<div>
					<span class="fl">
						<span>총 배너수 : ${search.totalCount }</span>
					</span>
					<span class="fr mb10">
						<a href="javascript:doWrite('');" class="btn btn_round bg_purple">배너추가</a>
					</span>
				</div>
				
				<table class="board_st1">
					<caption>배너관리</caption>
					<colgroup>
						<col width="10%" />
						<col width="10%" />
						<col width="*" />
						<col width="15%" />
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
					</colgroup>
					
					<thead>
						<tr>
							<th>번호</th>
							<th>디자인방법</th>
							<th>이미지</th>
							<th>링크주소</th>
							<th>우선순위</th>
							<th>사용여부</th>
							<th>기능</th>
						</tr>
					</thead>
					<tbody>
<c:forEach var="m" items="${list }" varStatus="s">						
						<tr>
							<td>${search.paging.virtualNumber - s.index }</td>
							<td>${m.bannerTypeName }</td>
							
<c:choose>
	<c:when test="${fn:contains(m.file.saveFilename, 'image/')}">
							<td><img src=${UPLOAD_ROOT }${m.file.saveFilename} class="img" style="width:100%;" alt="" /></td>
	</c:when>
	<c:otherwise>
							<td></td>
	</c:otherwise>
</c:choose>								
							
							<td>${m.linkUrl }</td>
							<td>${m.ordering }</td>
							<td>${m.useYnName }</td>
							<td>
								<a href="javascript:doWrite(${m.bannerSeq});" class="btn btn_round bg_pink">수정</a> 
								<a href="javascript:doDelete('${m.bannerSeq }', '${m.file.fileSeq }');" class="btn btn_round bg_darkgray">삭제</a>
							</td>
						</tr>
</c:forEach>						
					</tbody>
				</table>
				<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	$(function() {
		$('.img').find('img').each(function(){
			$(this).load(function(){
				var iWidth = this.naturalWidth;
				var iHeight = this.naturalHeight;
				if (iWidth > el.horizontalSize) {
					while (iWidth > el.horizontalSize) {
						iWidth = iWidth * 0.875;
						iHeight = iHeight * 0.875;
					}
					$(this).width(iWidth).height(iHeight);
					
				}
			});
		});
	});
	
	function doWrite(biseq) {
		var bseq = $('input[name=bseq]').val();
		$.Nav('go', '../write/' + bseq, {biseq:biseq});
	}
	
	function doDelete(seq, fseq) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		
		$('input[name=fseq]').val(fseq);
		$('input[name=biseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>

