<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 보기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>폼메일 관리</h2>
			<p>홈 &gt; 폼메일 관리 &gt; 폼메일 관리</p>
		</div>
		<div class="scon">
			<form id="form1" action="../proc.do" method="post">
			<input type="hidden" name="fseq" value="${search.fseq}" />
			<input type="hidden" name="fwseq" value="${vo.formWritingSeq }" />
			<input type="hidden" name="mailseq" value="1" />
				<h3 class="scon_tit2">폼메일관리</h3>
				
				<table class="board_write">
					<colgroup>
						<col width="15%" />
						<col width="" />
						<col width="20%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>제목</strong></th>
							<td colspan="3">
								<input class="w100" name="subject" value="${vo.subject }"  type="text"  />
							</td>
						</tr>
						<tr>
							<th><strong>첨부파일</strong></th>
							<td colspan="3">
<!-- 다운로드 , 파일보기 필요(수정중) -->
<c:if test="${!empty fileList }">
	<c:forEach var="f" items="${fileList }">
		<c:choose>
			<c:when test="${fn:contains(f.mimeType, 'image/')}">
						<a href="${UPLOAD_ROOT}${f.saveFilename }">${f.originalFilename }</a>
			</c:when>
			<c:otherwise>
						<span>${f.originalFilename }</span>
			</c:otherwise>
		</c:choose>			
	</c:forEach>
</c:if>
<c:if test="${empty fileList }">
						<span>첨부파일 없음</span>
</c:if>						
							</td>
						</tr>
						<tr>
							<th><strong>이름</strong></th>
							<td><input class="w100" name="name" type="text" value="${vo.name }" /></td>
							<th><strong>연락처</strong></th>
							<td><input class="w100" name="phone" type="text" value="${vo.phone }" /></td>
						</tr>
						<tr>
							<th><strong>이메일</strong></th>
							<td><input class="w100" name="email" type="text" value="${vo.email }" /></td>
							<th><strong>처리상태</strong></th>
							<td><tt:select list="${type1s }" name="process" listKey="value" listValue="text" indexKey="" indexValue="= 처리상태 =" selected="${vo.process }"/></td>
						</tr>
						<tr>
							<th>작성내용</th>
							<td colspan="4">
							<!-- 임시 수정 필요-->	
								<table class="writing w100">
									<colgroup>
										<col width="15%" />
										<col width="*" />
									</colgroup>
									<tbody>
<c:forEach var="m" items="${vo.valueVO }">
										<tr>
											<th><strong>${m.formInfoName }</strong></th>
											<td>
	<c:forEach var="n" items="${m.formInfoValueArr }">
		<c:if test="${m.property == 'email' }">
			<input type="hidden" name="userEmail" value="${n }" />
		</c:if>
											<span class="ml5">${n}</span> 
	</c:forEach>										
											</td>
										</tr>
</c:forEach>

									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<th>답변내용</th>
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
				<label><input type="checkbox" name="answer" value="Y"/><span class="ml5">답변 메일로 보내기 (체크시 작성자 이메일로 답변을 보냅니다.)</span></label>
							<input name="answerYn" type="hidden" value="" />
							<script>
								$(function() {
									checkCheckbox('answer', 'answerYn', '', 'N');
								});
							</script>
				<div class="summmit_btn">
					<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">확인</a>
					<a onclick="javascirpt:$.Nav('go', '../list/${vo.formSeq}.do')" class="btn2 bg_gray">목록</a>
				</div>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->
<script type="text/javascript">
	$(function() {
		//$('input[name=writebody]').val($('#writebody').html());
		//console.log($('#body').val());
		//console.log($('input[name=writebody]').val());
		//$('#body').text($('#writebody').html() + $('#body').val());
	});
	function doSubmit() {
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
