<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 팝업관리 글쓰기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	<style>
	td span.ml15 {
    display: inline;
	}
</style>
	<div class="scon_title">
		<h2>팝업관리</h2>
		<p>홈 &gt; 기본설정 &gt; 팝업관리</p>
	</div>
	<div class="scon">
		<form id="form1" action="./popup_proc" method="post">
		<input type="hidden" name="popupSeq" value="${vo.popupSeq }" />
			<div class="check_conbox mb10">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 팝업형태에서 레이어팝업을 이용하여 창이아닌 레이어로 공지할 수 있습니다.</li>
					<li>- 팝업을 생성하였으나 뜨지않을 경우 세가지를 체크해보세요. 게시기간, 사용여부, 브라우저>도구>인터넷옵션>쿠키삭제</li>
				</ul>
			</div>
			<h3 class="scon_tit2">팝업등록</h3>
			<table class="board_write">
				<caption>팝업등록</caption>
				<colgroup>
					<col width="15%" />
					<col width="*" />
					<col width="15%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th ><strong>제목 <span class="txt_red">*</span></strong></th>
						<td colspan="3"><input name="subject" class="input w50" value="${vo.subject }" maxlength="" type="text"/></td>
					</tr>
					<tr>
						<th>
							<strong>게시기간 <span class="txt_red">*</span></strong>
						</th>
						<td>
						<input name="startDt" class="input datepicker" value="${vo.startDt }" maxlength="" type="text" /> 
							<a href="#" class=""></a> <span class="ml5">~</span> 
						<input name="endDt" class="input datepicker ml5" value="${vo.endDt }" maxlength="" type="text" /> 
							<a href="#" class=""></a> 
						<!-- <span class="txt_caution01">게시일지남</span> -->
						</td>
						<th><strong>팝업형태</strong></th>
						<td>
							<label><input type="radio" name="popupType" class="input" value="W" /> 일반팝업</label>
							<label class="ml20"><input type="radio" name="popupType" class="input" value="L" /> 레이어팝업</label>
							<script>
								$(function() {
									checkRadio('popupType', '${vo.popupType}', 'L');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th><strong>사용여부</strong></th>
						<td colspan="3">
							<label><input type="radio" name="useYn"  class="input" value="Y"/> 사용함</label>
							<label class="ml20"><input type="radio" name="useYn" class="input" value="N"/> 사용안함</label>
							<script>
								$(function() {
									checkRadio('useYn', '${vo.useYn}', 'Y');
								});
							</script>
						</td>
						<!-- <th><strong>스크롤여부</strong></th>
						<td>
							<label><input type="radio" name=""  class="input"/>허용함</label>
							<label class="ml20"><input type="radio" name="" class="input"/>허용안함</label>
						</td> -->
					</tr>
					<tr>
						<th><strong>지점 이상만 공지</strong></th>
						<td colspan="3">
							<label><input type="radio" name="limitGradeYn"  class="input" value="Y"/> 사용함</label>
							<label class="ml20"><input type="radio" name="limitGradeYn" class="input" value="N"/> 사용안함</label>
							<script>
								$(function() {
									checkRadio('limitGradeYn', '${vo.limitGradeYn}', 'N');
								});
							</script>
						</td>
						<!-- <th><strong>스크롤여부</strong></th>
						<td>
							<label><input type="radio" name=""  class="input"/>허용함</label>
							<label class="ml20"><input type="radio" name="" class="input"/>허용안함</label>
						</td> -->
					</tr>
					<tr>
						<th><strong>위치</strong></th>
						<td>
							<span class="ml15">X :<input name="positionX" class="input onlyNumber ml5 w20" value="${!empty vo.positionX ? vo.positionX : 0 }" maxlength="" type="number"/></span>
							<span class="ml15">Y :<input name="positionY" class="input onlyNumber ml5 w20" value="${!empty vo.positionY ? vo.positionY : 0 }" maxlength="" type="number" /></span>
						</td>
						<th><strong>크기</strong></th>
						<td>
						<span class="ml15">가로 :<input name="horizontalSize" class="input onlyNumber ml5 w20" value="${!empty vo.horizontalSize ? vo.horizontalSize : 0}" maxlength="" type="number" /></span>
						<span class="ml15">세로 :<input name="verticalSize" class="input onlyNumber ml5 w20" value="${!empty vo.verticalSize ? vo.verticalSize : 0}" maxlength="" type="number" /></span>
						</td>
					</tr>
					<tr>
						<th><strong>링크주소</strong></th>
						<td colspan="3"><input name="linkUrl" class="input" value="${vo.linkUrl }" maxlength="" type="text" style="width:50%"/></td>
					</tr>
					<tr>
						<th><strong>팝업내용</strong></th>
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
								CKEDITOR.on('dialogDefinition', function(ev) {
									var dialogName = ev.data.name;
									var dialogDefinition = ev.data.definition;
									switch (dialogName) {
										case 'image': //Image Properties dialog
											//dialogDefinition.removeContents('info');
											dialogDefinition.removeContents('Link');
											dialogDefinition.removeContents('advanced');
											break;
									}
								});
							</script>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="summmit_btn">
				<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a>
				<a onclick="javascirpt:history.back();" class="btn2 bg_gray">목록</a>
			</div>
		</form>
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSubmit() {
		if ($('input[name=subject]').val() == '') {
			alert('제목을 입력해주세요.');
			$('input[name=subject]').focus();
			return;
		}
		
		if (!checkPattern($('input[name=startDt]').val(), 'DATE')){
			alert('날짜 형식을 확인해주세요.');
			$('input[name=startDt]').focus();
			return;
		}
		if (!checkPattern($('input[name=endDt]').val(), 'DATE')){
			alert('날짜 형식을 확인해주세요.');
			$('input[name=endDt]').focus();
			return;
		}
		
		var sBody = CKEDITOR.instances.body.getData();
		$('textarea[name=body]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>