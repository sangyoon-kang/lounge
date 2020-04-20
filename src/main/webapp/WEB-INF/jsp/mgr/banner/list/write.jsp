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
			<h2>${bm.masterName }</h2>
			<p>홈 &gt; 배너관리 &gt; ${bm.masterName }</p>
		</div>
		<div class="scon">
			<form id="form1" action="../info_proc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="biseq" value="${search.biseq }" />
			<input type="hidden" name="bseq" value="${bm.bmSeq }" />
			<input type="hidden" name="fseq" value="${file.fileSeq }" />
				<div class="check_conbox mb10">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>- 디자인방법에 따라 이미지 또는 배너내용을 출력합니다.</li>
						<li>- 배너 그룹에 속한 N개의 배너는 디자인방법을 통일 하지 않으면 출력에 문제가 생길 수 있습니다 </li>
						<li>- 링크 주소는 배너 이미지를 클릭시 이동 되는 링크입니다.</li>
						<li>- 배너내용에 HTML 작성시 에디터의 소스 버튼을 누르고 작업 하셔야 합니다.</li>
						<li>- 작성된 HTML의 화면은 적용되는 화면과 다소 다를 수 있습니다. </li>
					</ul>
				</div>
				<h3 class="scon_tit2">배너 : ${bm.masterName }</h3>
				<table class="board_write">
					<colgroup>
						<col width="10%" />
						<col width="35%" />
						<col width="15%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>디자인방법</strong></th>
							<td>
								<select name="bannerType" class="w40">
									<option value="I" <c:if test="${vo.bannerType == 'I' }">selected</c:if>>이미지</option>
									<option value="B" <c:if test="${vo.bannerType == 'B' }">selected</c:if>>HTML</option>
								</select>
							</td>
							<th><strong>사용여부</strong></th>
							<td>
								<label><input class="" name="useYn" type="radio" value="Y" />사용함</label>
								<label><input class="ml20" name="useYn" type="radio" value="N" />사용안함</label>
								<script>
									$(function() {
										checkRadio('useYn', '${vo.useYn}', 'Y');
									});
								</script>
							</td>
						</tr>
						<tr>
							<th><strong>배너그룹 <span class="txt_red">*</span></strong></th>
							<td>
							<tt:select list="${masterList }"  class="w40" name="bmSeq" listKey="bmSeq" listValue="masterName"  selected="${bm.bmSeq }"/>
							</td>
							<th><strong>우선순위</strong></th>
							<td>
							<select name="ordering">
<c:set var="orderingSeleceted" value="" />							
<c:forEach var="i" begin="1" end="10" varStatus="s">
	<c:set var="orderingSeleceted" value="" />
	<c:if test="${vo.ordering eq i }">
		<c:set var="orderingSeleceted" value=" selected" />
	</c:if>
								<option value="${i }"${orderingSeleceted }>${i }</option>
</c:forEach>
							</select>
							</td>
						</tr>
						
						<tr>
							<th><strong>링크주소</strong></th>
							<td colspan="3">
								<input name="linkUrl" class="w40" value="${vo.linkUrl }" maxlength="" type="text" /> 
								<label><input class="ml5" name="link" type="checkbox" value="_blank" />새창으로</label>
								<input name="linkTarget" type="hidden" value="" />
								<script>
									$(function() {
										checkCheckbox('link', 'linkTarget', '${vo.linkTarget}', '_self');
									});
								</script>
							</td>
						</tr>
						
						<tr>
							<th><strong>배너이미지</strong></th>
							<td colspan="3">
								<input name="imgFile" type="file" />

<c:if test="${fn:contains(file.mimeType, 'image/')}">
							<a href="${UPLOAD_ROOT }${file.saveFilename}" target="_blank">${file.originalFilename } (${file.fileSize})</a>
							<label><input type="checkbox" class="ml20" name="deleteFlag" value="${file.saveFilename }" />이미지삭제</label>
</c:if>

							</td>
						</tr>
							
						<tr>
							<th class=""><strong>배너내용</strong></th>
							<td colspan="3">
							<textarea name="body" id="body" class="w100" style="height:300px;"  class="editor">${vo.body }</textarea>
							<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
							<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
					
							<script type="text/javascript">
								CKEDITOR.replace('body', {
									width : '100%'
									, height : '270px'
									, startupFocus : false
								});
							</script>
							
							</td>
						</tr>
						
					</tbody>
				</table>
				
					<div class="summmit_btn">
						<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a>
						<a onclick="javascirpt:$.Nav('go', '../list/${bm.bmSeq}');" class="btn2 bg_gray">목록</a>
					</div>
				</form>
		</div>
	</div>
	<!--wrap_scon E-->
<script type="text/javascript">
	function doSubmit() {
		
		var sBody = CKEDITOR.instances.body.getData();
		$('textarea[name=body]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	