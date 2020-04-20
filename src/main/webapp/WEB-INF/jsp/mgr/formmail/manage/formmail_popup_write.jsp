<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 항목추가 - 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="form2" action="./formmail_popup_proc.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="fiseq" value="${search.fiseq }" />
	<input type="hidden" name="fseq" value="${search.fseq }" />
	<input type="hidden" name="fileSeq" value="${file.fileSeq }" />
<c:if test="${!empty vo }">
		<input type="hidden" name="ordering" value="${vo.ordering}" />
</c:if>
<c:if test="${empty vo }">
		<input type="hidden" name="ordering" value="${max+1 }" />
</c:if>
		<table class="board_write mt10">
			<colgroup>
				<col width="30%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th><strong>항목명</strong></th>
					<td>
						<input type="text" class="ml5" name="formInfoName" value="${vo.formInfoName }" />
						<label><input type="checkbox" class="ml5" name="required" value="Y"/>필수</label>
						<input name="requiredYn" type="hidden" value="" />
						<script>
							$(function() {
								checkCheckbox('required', 'requiredYn', '${vo.requiredYn}', 'N');
							});
						</script>
					</td>
				</tr>
				<tr>
					<th><strong>항목이미지</strong></th>
					<td>
						<input type="file" name="formImg" />
					<c:if test="${fn:contains(file.mimeType, 'image/')}"><br/>
						<span class="fileimg">
							<a href="${UPLOAD_ROOT }${file.saveFilename}" class="mr10" target="_blank">${file.originalFilename } (${file.fileSize})</a>
							<label><input type="checkbox" class="ml5" name="deleteFlag" value="${file.saveFilename }" />이미지삭제</label>
						</span>
					</c:if>
					</td>
				</tr>
				<tr>
					<th><strong>항목속성</strong></th>
					<td>
						<tt:select list="${type1s }" class="ml5" name="property" listKey="value" listValue="text" selected="${vo.property}" />
					</td>
				</tr>
				<tr>
					<th><strong>항목사이즈</strong></th>
					<td>
						<input type="text" class="ml5 onlyNumber w20" name="size" value="${vo.size }" /> 
					</td>
				</tr>
				<tr>
					<th><strong>세부항목개수</strong></th>
					<td>
						<select name="detailCount" id="detail" class="ml5">
<c:set var="detailSeleceted" value="" />							
<c:forEach var="i" begin="1" end="20" varStatus="s">
	<c:set var="detailSeleceted" value="" />
	<c:if test="${vo.detailCount eq i }">
		<c:set var="detailSeleceted" value=" selected" />
	</c:if>
								<option value="${i }"${detailSeleceted }>${i }</option>
</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<th><strong>세부항목</strong></th>
					<td>
						<div id="multi">
<c:if test="${!empty list}">
	<c:forEach var="m" items="${list }" varStatus="s">						
		${s.index+1 }<input type="text" class="ml5" name="detailNameArray" value="${m }"/>
								
			<br/>
	</c:forEach>
</c:if>
<c:if test="${empty list }">
							1<input type="text" class="ml5" name="detailNameArray" value=""/>
</c:if>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<label><input type="checkbox" id="continue" onclick="javascript:chkWrite();"  />계속 등록하기</label>
		<ul class="summmit_btn mb20">
			<li><a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:self.close();" class="btn2 bg_gray">닫기</a></li>
		</ul>
		<div class="check_conbox mb10">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>- 수정일때 계속 등록하기 체크시 항목이 새로 추가 됩니다. (기존 항목 수정 X)</li>
				<li>- 항목이미지 : 항목명(텍스트)대신 업로드한 이미지가 항목명 에 노출됩니다.</li>
				<li>- 항목사이즈 : 항목의 크기를 정합니다. 예) &lt;input size="항목사이즈"&gt; </li>
				<li>- 항목속성 : 이름을 입력받을때 text가 아닌 "이름"을 선택하시면 "관리자 > 폼메일" 목록에 보여집니다. 이메일, 연락처도 목록에 보여집니다.</li>
			</ul>
			<br/>
			예제)<br/>
			세부항목 개수 : 3<br/>
			세부항목 : 1 - 가 2 - 나 3 - 다<br/>
			<table class="board_write">
				<colgroup>
				<col width="30%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th><strong>항목속성 : text</strong></th>
					<td>
						<input type="text" class="w10" />가<input type="text" class="w10" />나<input type="text" class="w10" />다
					</td>
				</tr>
				<tr>
					<th><strong>항목속성 : select</strong></th>
					<td>
						<select>
							<option>가</option>
							<option>나</option>
							<option>다</option>
						</select>
					</td>
				</tr>
				<tr>
					<th><strong>항목속성 : radio</strong></th>
					<td>
						<input type="radio" />가<input type="radio" class="ml5"/>나<input type="radio" class="ml5"/>다
					</td>
				</tr>
			</tbody>
			</table>
		</div>
	</form>
</div>
<!--wrap_scon E-->
<script id="detailTmpl" type="text/x-jquery-tmpl">
{{each detail}}
	\${$index+1}<input type="text" class="ml5" name="detailNameArray" value="\${$value}" /><br/>
{{/each}}
</script>
<script type="text/javascript">
	$(function(){
		
		$('#detail').change(function(){
			var $num = $(this).val();
			var $fiseq = $('input[name=fiseq]').val();
			
			$.ajax({
				url: './getFormmailDetail.do',
				//async: false,
				type: 'post',
				dataType: 'json',
				data: { 
					fiseq: $fiseq,
					num: $num
				}, 
				success: function (data) {
					//console.log(data.detail);
					$('#multi').empty();
					$('#detailTmpl').tmpl({detail:data.detail}).appendTo($('#multi'));
				}, 
				error: function (data) {
					alert("error ajax :\n" + data.responseText);
				}
			});
			
		});
	});
	
	function chkWrite() {
		if ($('#continue').prop('checked')) {
			$('input[name=fiseq]').val('0');
			$('input[name=ordering]').val('${max+1 }');
			$('.fileimg').hide();
		} else {
			$('input[name=fiseq]').val('${search.fiseq }');
			$('input[name=ordering]').val('${vo.ordering}');
			$('.fileimg').show();
		}
	}
	
	function doSubmit() {
		if (isNull($('input[name=size]').val())) {
			alert('항목사이즈를 입력해주세요.');
			$('input[name=size]').focus();
			return;
		} 
		
		if (!confirm('저장하시겠습니까?'))
			return;		
		$('#form2').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>