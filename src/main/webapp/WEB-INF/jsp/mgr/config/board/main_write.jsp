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
		<h2><strong>${bm.boardName }</strong> 메인게시물 등록/수정</h2>
		<p>홈 &gt; 게시판 관리 &gt; 메인게시물 </p>
	</div>

	<div class="scon">

	<form id="form1" action="./main_proc.do" method="post">	
		<input type="hidden" name="rbseq" value="${search.rbseq }" />
		
		<table class="board_write">
			<colgroup>
				<col width="15%" />
				<col width="35%" />
				<col width="15%" />
				<col width="35%" />
			</colgroup>
			<tbody>
				<tr>
					<th><span class="red">*</span> 게시판코드 </th>
					<td>
						<tt:select name="boardCode" list="${bmList }" listKey="boardCode" listValue="boardName" indexKey="" indexValue="= 게시판 선택 =" selected="${vo.boardCode }"/>
					</td>
					<th>게시판 카테고리 </th>
					<td id="tdCategory">
						<select name="bcSeq">
							<option value="0">= 선택안함 =</option>
						</select>
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
						<input type="text" name="subjectCharCount" class="onlyNumber w80p" maxlength="2" value="${vo.subjectCharCount }" />
					</td>
					<th><span class="red">*</span> 노출 게시물 수</th>
					<td>
						<input type="text" name="articleCount" class="onlyNumber w80p" maxlength="2" value="${vo.articleCount }" />
					</td>
				</tr>
				<tr>
					<th>기본 예제 적용 </th>
					<td colspan="3">
						<label><input type="radio" name="rdoExample" value="save" /> 원래대로</label>
						<label><input type="radio" name="rdoExample" class="ml20" value="default" /> 기본형</label>
						<label><input type="radio" name="rdoExample" class="ml20" value="image" /> 이미지</label>
						<label><input type="radio" name="rdoExample" class="ml20" value="thumb" /> 썸네일</label>
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
				<li>- 메인게시물이 반복되는 부분은 [코딩 반복] 영역에 입력합니다.</li>
				<li>- CSS 스타일이 별도로 필요할 경우 [코딩 시작] 부분에 class로 적용합니다.</li>
				<li>- 주의 : 미리보기의 경우 CSS 차이로 스타일이 정상적으로 나오지 않을 수 있습니다.</li>
				<li>- \#{SUBJECT} : 제목, \#{DATE} : 날짜(SNS타입), \#{LINK} : 링크([연결 페이지]에 입력한 URL로 구성), \#{NEW} : 새 글 아이콘</li>
			</ul>
		</div>
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './main_manage.do', {rbseq: ''});" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	</form>

	</div>
</div>
<!--wrap_scon E-->
<script id="categoryTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 선택안함 =</option>
{{each category}}
	{{if bcSeq != cv}}
		<option value="\${bcSeq}">\${cateName}</option>
	{{else}}
		<option value="\${bcSeq}" selected>\${cateName}</option>
	{{/if}}
{{/each}}
</script>

<script type="text/javascript">
	//코딩 샘플
	// 포토, 썸네일은 임시 - 수정 필요
	var _codingSamples = {
		'default': {
			'start': '<div class="m_board"><ul>'
			, 'loop': '<li><p class="sb"><a href="\#{LINK}">\#{SUBJECT} \#{NEW}</a></p><p class="date">\#{DATE}</p></li>'
			, 'end': '</ul></div>'
		}
		, 'image': {
			'start': '<ul class="m_port">'
			, 'loop': '<li><p class="port_img"><a href="\#{LINK}"><img src="\#{URL}" alt="이미지" width="181" height="139"></a></p><p class="sb"><a href="\#{LINK}" class="thumbnail">\#{SUBJECT} \#{NEW}</a></p></li>'
			, 'end': '</ul>'
		}
		, 'thumb': {
			'start': '<ul class="m_port">'
			, 'loop': '<li><p class="sb"><a href="\#{LINK}" target="_blank"><img src="\#{URL}" alt="이미지" width="181" height="139"></a></p><p class="sb"><a href="\#{LINK}" target="_blank">\#{SUBJECT} \#{NEW}</a></p></li>'
			, 'end': '</ul>'
		}
	};

	$(function() {
		var rbseq = $('input[name=rbseq]').val();

		//수정 상태일 경우 저장된 코딩 저장
		if (rbseq > 0) {
			_codingSamples.save = {
				'start': $('textarea[name=codingStart]').val().trim()
				,'loop': $('textarea[name=codingLoop]').val().trim()
				, 'end' : $('textarea[name=codingEnd]').val().trim()
			};
			
			$('input[name=rdoExample]:eq(0)').prop('checked', true);
		}
		else {
			$('input[name=rdoExample]:eq(0)').prop('disabled', true);
			$('input[name=rdoExample]:eq(1)').prop('checked', true);
			bindCodingSample('default');
		}

		$('input[name=rdoExample]').change(function() {
			bindCodingSample($(this).val());
		});
		
		updateCategory();
		
		$('select[name=boardCode]').change(function() {
			updateCategory();
		});
		
		if ($('input[name=subjectCharCount]').val().length == 0) {
			$('input[name=subjectCharCount]').val(20);
		}
		
		if ($('input[name=articleCount]').val().length == 0) {
			$('input[name=articleCount]').val(5);
		}
	});
	
	function bindCodingSample(key) {
		$('textarea[name=codingStart]').val(_codingSamples[key].start);
		$('textarea[name=codingLoop]').val(_codingSamples[key].loop);
		$('textarea[name=codingEnd]').val(_codingSamples[key].end);
	}
	
	function updateCategory() {
		oLoader('#tdCategory'
			, '${URL_ADMIN_ROOT}/board/manage/ajax/update_category.do'
			, 'post'
			, {
				bcode: $('select[name=boardCode]').val()
			}
			, false
			, function(data) {
				if (data.result != null) {
					var currVal = '${vo.bcSeq}';
					$('select[name=bcSeq]').empty();
					$('#categoryTmpl').tmpl({category: data.result, cv: currVal}).appendTo('select[name=bcSeq]');
				}				
			}
		);
	}
	
	function doSubmit() {
		if ($('select[name=boardCode]').val() == '') {
			alert('게시판코드를 선택해야 합니다.');
			return;
		}
		
// 		if ($('input[name=linkUrl]').val().trim().length == 0) {
// 			alert('연결 페이지를 입력해야 합니다.');
// 			return;
// 		}

		if ($('input[name=subjectCharCount]').val().trim().length == 0) {
			alert('제목 글자 수를 입력해야 합니다.');
			return;
		}
		
		if ($('input[name=articleCount]').val().trim().length == 0) {
			alert('노출 게시물 수를 입력해야 합니다.');
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