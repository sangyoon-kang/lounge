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
	
	<form id="form1" action="./estimate_proc" method="post">
		<input type="hidden" name="estimateSeq" value="${search.estimateSeq }" />
        <input type="hidden" name="status" value="${search.status }">
		<br class="clear mb5" />
		<table class="board_write mt10">
			<colgroup>
				<col width="20%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th class="center">등록일</th>
					<td class="left"><fmt:formatDate value="${vo.regDate }" pattern="yyyy-MM-dd HH:mm"/></td>
				</tr>
				<tr>
					<th class="center">작성자</th>
					<td class="left">${vo.writer }</td>
				</tr>
				<tr>		
					
					<th class="center">견적종류</th>
					<td class="left">
						<c:forEach items="${listEstimateType }" var="e" varStatus="s" >
                   			<c:if test="${fn:contains(vo.estimateFlag, e.value)}">
                   				${e.text},
                   			</c:if>
                   		</c:forEach>
					</td>
				</tr>
				<tr>
					<th class="center">회사구분</th>
					<td class="left">
						<c:if test="${vo.companyFlag eq 'C'}">
							회사 (회사명 : ${vo.companyName}, 직책/직위: ${vo.companyPosition} ) 
						</c:if>
						<c:if test="${vo.companyFlag eq 'P'}">
							개인 
						</c:if>
					</td>
				</tr>
				<tr>
					<th class="center">이메일</th>
					<td class="left">${vo.email }</td>
				</tr>
				<tr>
					<th class="center">전화</th>
					<td class="left">휴대전화: ${vo.phone } 전화 :${vo.tel } </td>
				</tr>
				<tr>
					<th class="center">작업내용</th>
					<td class="left">${vo.workType }</td>
				</tr>
				<tr>
					<th class="center">희망 예산</th>
					<td class="left">${vo.budget }</td>
				</tr>
				<tr>
					<th class="center">희망 오픈일</th>
					<td class="left">${vo.openDate}</td>
				</tr>
				<tr>
					<th class="center">기존 홈페이지</th>
					<td class="left">${vo.site }</td>
				</tr>
				<tr>
					<th class="center">참고 사이트</th>
					<td class="left">${vo.siteReference }</td>
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
				<tr>
					<th class="center">첨부파일</th>
					<td class="left">
						<c:forEach items="${vo.attachList }" var="m" varStatus="s">
							<a href="javascript:downloadFile('${UPLOAD_ROOT }${m.saveFilename}', '${m.originalFilename}');">${m.originalFilename}</a>
						</c:forEach>
					</td>
				</tr>
			</tbody>
		</table>
		
		<ul class="summmit_btn">
			<li><a onclick="javascript:doDelete('${vo.estimateSeq}');" class="btn2 bg_navy">삭제</a></li>
			<li><a onclick="javascript:$.Nav('go', './estimate_list', {estimateSeq:''});" class="btn2 bg_darkgray">목록</a></li>
		</ul>
	</form>
</div>
</div>

<script>
function doDelete(estimateSeq) {	
	if (!confirm("삭제하시겠습니까"))
		return;
	
	$('input[name=estimateSeq]').val(estimateSeq);
	$('input[name=status]').val('d');
	
	$('#form1').submit();
}

</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>