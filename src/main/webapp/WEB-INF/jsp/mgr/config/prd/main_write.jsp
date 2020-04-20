<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2><strong>상품 관리</strong> 메인 & 추첨 상품 등록/수정</h2>
		<p>홈 &gt; 상품 관리 &gt; 메인 & 추첨 상품  </p>
	</div>

	<div class="scon">

	<form id="form1" action="./main_proc.do" method="post">	
		<input type="hidden" name="rpseq" value="${search.rpseq }" />
		
		<table class="board_write">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th><span class="red">*</span> 출력 구분 </th>
					<td>
						<tt:select name="listType" list="${type1 }" listKey="value" listValue="text" selected="${vo.listType }"/>
					</td>
					<th><span class="red">*</span> 노출 상품 수</th>
					<td>
						<input type="text" name="prdCount" class="onlyNumber w80p" maxlength="2" value="${empty vo.prdCount ? 12 : vo.prdCount }" />
						<input type="hidden" name="lfCount" class="onlyNumber w80p" maxlength="2" value="${empty vo.lfCount ? 4 : vo.lfCount }" />
					</td>
				</tr>
				<tr>
					<th><span class="red">*</span> 연결 페이지 </th>
					<td colspan="3">
						http://${pageContext.request.serverName } <input type="text" name="linkUrl" class="ml5 w60" value="${vo.linkUrl }" />
						<div class="red">
							※ 연결 페이지를 빈 값으로 설정하면 링크가 적용되지 않습니다.
						</div>
					</td>
				</tr>
				<tr>
					<th><span class="red">*</span> 제목 글자 수 </th>
					<td>
						<input type="text" name="subjectCharCount" class="onlyNumber w80p" maxlength="2" value="${empty vo.subjectCharCount ? 10 : vo.subjectCharCount }" />
					</td>
					<th><span class="red">*</span> 간단설명 글자 수 </th>
					<td>
						<input type="text" name="summaryCharCount" class="onlyNumber w80p" maxlength="2" value="${empty vo.summaryCharCount ? 10 : vo.summaryCharCount }" />
					</td>
				</tr>
				<tr>
					<th><span class="red">*</span> 코딩 시작 </th>
					<td colspan="3">
						<textarea name="codingStart" style="width:95%;" cols="120" rows="1" class="coding">${vo.codingStart }</textarea>
					</td>
				</tr>
				<tr>
					<th><span class="red">*</span> 코딩 반복 </th>
					<td colspan="3">					
						<textarea name="codingLoop" style="width:95%;" cols="120" rows="10" class="coding">${vo.codingLoop }</textarea>
					</td>
				</tr>
				<tr>
					<th><span class="red">*</span> 코딩 종료 </th>
					<td colspan="3">					
						<textarea name="codingEnd" style="width:95%;" cols="120" rows="1" class="coding">${vo.codingEnd }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<br class="clear mb5" />
		<div class="check_conbox mt15 mb15">
			<h4 class="check_tit">체크사항</h4>
			<ul class="ml10">
				<li>- 상품이 반복되는 부분은 [코딩 반복] 영역에 입력합니다.</li>
				<li>- CSS 스타일이 별도로 필요할 경우 [코딩 시작] 부분에 class로 적용합니다.</li>
				<li>- 주의 : 미리보기의 경우 CSS 차이로 스타일이 정상적으로 나오지 않을 수 있습니다.</li>
				<li>- \#{SUBJECT} : 제목, \#{LINK} : 링크([연결 페이지]에 입력한 URL로 구성), \#{SUMMARY} : 간단 설명</li>
			</ul>
		</div>
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './main_manage.do', {rpseq: ''});" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	</form>

	</div>
</div>


<script type="text/javascript">
	//코딩 샘플
	// 포토, 썸네일은 임시 - 수정 필요
	var _codingSamples = {
		'prd': {
			'start': '<ul class="m_solution">'
			, 'loop': '<li><p class="sb">\#{SUBJECT}</p><p class="sol_img text-center"><a href="\#{LINK}" class="thumbnail"><img src="\#{URL}" style="height: 121px;" alt="상품이미지"></a></p><p class="ex">\#{SUMMARY}</p><p class="price">\#{PRICE}(VAT 별도)</p></li>'
			, 'end': '</ul>'
		}
	};

	$(function() {
		var rpseq = $('input[name=rpseq]').val();

		//수정 상태일 경우 저장된 코딩 저장
		if (rpseq > 0) {
			_codingSamples.save = {
				'start': $('textarea[name=codingStart]').val().trim()
				,'loop': $('textarea[name=codingLoop]').val().trim()
				, 'end' : $('textarea[name=codingEnd]').val().trim()
			};
		} else {
			bindCodingSample('prd');
		}
	});
	
	function bindCodingSample(key) {
		$('textarea[name=codingStart]').val(_codingSamples[key].start);
		$('textarea[name=codingLoop]').val(_codingSamples[key].loop);
		$('textarea[name=codingEnd]').val(_codingSamples[key].end);
	}
		
	function doSubmit() {	

		if ($('input[name=subjectCharCount]').val().trim().length == 0) {
			alert('제목 글자 수를 입력해야 합니다.');
			return;
		}
		
		if ($('input[name=summaryCharCount]').val().trim().length == 0) {
			alert('간단설명 글자 수를 입력해야 합니다.');
			return;
		}
				
		if ($('input[name=prdCount]').val().trim().length == 0) {
			alert('노출 상품 수를 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingStart]').val().trim().length == 0) {
			alert('코딩 시작 내용을 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingLoop]').val().trim().length == 0) {
			alert('코딩 반복 내용을 입력해야 합니다.');
			return;
		}
		
		if ($('textarea[name=codingEnd]').val().trim().length == 0) {
			alert('코딩 종료 내용을 입력해야 합니다.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?'))
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>