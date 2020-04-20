<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너그룹관리 - 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>배너 관리</h2>
			<p>홈 &gt; 배너 관리</p>
		</div>
		<div class="scon">
			<form id="form1" action="./banner_proc" method="post">
			<input type="hidden" name="bmSeq" value="${vo.bmSeq }">
				<div class="check_conbox mb10">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>- 코드(영문)는 반드시 영문으로 입력 하고 변경이 불가합니다.</li>
						<li>- <b>배너형태</b>, <b>배너간격</b>, <b>줄바꿈 배너 수</b> 속성은 이미지를 배너로 출력할 때 사용하는 속성 입니다. </li>
						<li>- 배너간격은 배너와 배너 사이의 간격을 조절합니다.</li>
						<li>-  배너형태가 가로형인 경우 줄바꿈 배너 수만큼 가로로 배너가 나오고 줄바꿈이 됩니다. </li>
					</ul>
				</div>
				
				<h3 class="scon_tit2">배너그룹관리</h3>
				
				<table class="board_write">
					<colgroup>
						<col width="20%" />
						<col width="" />
						<col width="20%" />
						<col width="" />
					</colgroup>
					<tbody>
						<tr>
<c:set var="read" value="" />
<c:if test="${search.bseq > 0 }">
	<c:set var="read" value="readonly" />
</c:if>
							<th><strong>코드(영문) <span class="txt_red">*</span></strong></th>
							<td><input class="input w95" name="masterCode" value="${vo.masterCode }" maxlength="" type="text" ${read } /></td>
							<th><strong>그룹이름 <span class="txt_red">*</span></strong></th>
							<td><input  class="input w95" name="masterName" value="${vo.masterName }" maxlength="" type="text" /></td>
						</tr>
						
						<tr>
							<th><strong>배너형태</strong></th>
							<td>
								<label><input class="input" name="direction" type="radio" value="V" />세로형</label>
								<label><input class="input ml20" name="direction" type="radio" value="H" />가로형</label>
								<script>
									$(function() {
										checkRadio('direction', '${vo.direction}', 'V');
									});
								</script>
							</td>
							<th><strong>배너간격</strong></th>
							<td ><input  class="input onlyNumber w50" name="margin" value="${vo.margin }" maxlength="" type="text" /></td>
						</tr>
						
						<tr>
							<th><strong>사용여부</strong></th>
							<td>
								<label><input class="input" name="useYn" type="radio" value="Y" />사용함</label>
								<label><input class="input ml20" name="useYn" type="radio" value="N" />사용안함</label>
								<script>
									$(function() {
										checkRadio('useYn', '${vo.useYn}', 'Y');
									});
								</script>
							</td>
							<th><strong>줄바꿈 배너 수</strong></th>
							<td>
								<select name="lfCount">
<c:forEach var="m" begin="1" end="9">							
									<option value="${m }"<c:if test="${vo.lfCount == m }">selected</c:if>>${m }</option>
</c:forEach>
								</select>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<div class="summmit_btn">
					<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a>
					<a onclick="javascirpt:$.Nav('go', './banner_list');" class="btn2 bg_gray">목록</a>
				</div>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->
<script type="text/javascript">
	$(function() {
	});
	function doSubmit() {
		var bseq = '${search.bseq}';
		if (!checkPattern($('input[name=masterCode]').val(), 'ENG') && bseq == 0) {
			alert('코드는 영문으로 입력 해주세요.');
			$('input[name=masterCode]').focus();
			return;
		}
		if (isNull($('input[name=masterName]').val())) {
			alert('그룹이름을 입력 해주세요.');
			$('input[name=masterName]').focus();
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
