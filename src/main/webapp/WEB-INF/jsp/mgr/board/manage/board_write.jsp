<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 상세
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>게시판 관리</h2>
		<p>홈 &gt; 게시판 관리 &gt; 게시판 관리</p>
	</div>

	<div class="scon">

		<form id="form1" action="./board_proc" method="post">
			<span class="fl mb10">
				<a onclick="javascript:$.Nav('go', './board_list', {bcode:''});" class="btn btn_round bg_gray">게시판 목록</a>
			</span>
		<c:if test="${!empty vo }">			
			<span class="fr">
				<a onclick="javascript:$.Nav('go', '../list/${vo.boardCode}', {bcode:''});" class="btn btn_round bg_orange">${vo.boardName } 게시물 목록</a>
			</span>
		</c:if>
			
			<br class="clear" />
			
			<table class="board_write">
				<colgroup>
					<col width="20%" />
					<col width="30%" />
					<col width="20%" />
					<col width="30%" />
				</colgroup>
				<tbody>
					<tr>
						<th><span class="red">*</span> 게시판 코드</th>
						<td id="tdBoardCode">
						<c:if test="${empty vo }">
							<input type="text" name="boardCode" class="w60" style="ime-mode: inactive;" maxlength="20" />
							<a onclick="javascript:doCheckBoardCode();" class="btn btn_round bg_darkgray">중복검사</a>
							<input type="hidden" name="checkedBoardCode" />
						</c:if>
						<c:if test="${!empty vo }">
							<input type="text" name="boardCode" class="w60" maxlength="20" readonly value="${vo.boardCode }" />	
						</c:if>
						</td>
						<th><span class="red">*</span> 게시판 이름</th>
						<td colspan="3">
							<input type="text" name="boardName" class="mr5" value="${vo.boardName }" />
						</td>
					</tr>
					<tr>
						<th>게시판 그룹</th>
						<td colspan="3">
							<tt:select name="groupSeq" list="${listGroup }" listKey="groupSeq" listValue="groupName" indexKey="0" indexValue="= 게시판 그룹 =" selected="${vo.groupSeq }"/> 
							<a onclick="javascript:openPop('', 'boardGroup');" class="btn btn_round bg_darkgray mr20">그룹 관리</a> 
							<span class="mr5">그룹 정렬번호 : </span> 
							<select name="priority" class="mr10">
							<c:set var="prioritySeleceted" value="" />							
							<c:forEach var="i" begin="1" end="10" varStatus="s">
								<c:set var="prioritySeleceted" value="" />
								<c:if test="${vo.priority eq i }">
									<c:set var="prioritySeleceted" value=" selected" />
								</c:if>
								<option value="${i }"${prioritySeleceted }>${i }</option>
							</c:forEach>
							</select>
							<span class="red">※ 게시판 관리 편의를 위한 그룹 - 왼쪽 메뉴에 게시판이 그룹핑되어 나타납니다.</span>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td colspan="3">
						<c:if test="${!empty vo}">
							<tt:select name="boardCategory" list="${vo.boardCategoryVO }" listKey="bcSeq" listValue="cateName" indexKey="" indexValue="= 카테고리 =" />
							<a onclick="javascript:openPop('?bcode=${vo.boardCode}', 'boardCategory');" class="btn btn_round bg_darkgray">카테고리 관리</a>
							<!-- <span class="red" style="float: none;">※ 카테고리를 추가하면 [전체] 분류 탭도 사용할 수 있습니다.</span> -->
						</c:if>
						<c:if test="${empty vo}">
							<span class="red" style="float: none;">※ 게시판 추가 후 카테고리를 관리할 수 있습니다.</span>
						</c:if>							
						</td>
					</tr>
					<tr>
						<th>게시판 관리자</th>
						<td colspan="3">
							<input type="text" name="boardAdmin" class="w80 mr5" value="${vo.boardAdmin }" />
							<script>
								$(function() {
									$('input[name=boardAdmin]').selectize({
										persist: false
										, create: false
										, allowEmptyOption: true
										, valueField: 'userID'
										, labelField: 'userName'
										, searchField: 'userName'
										, options : JSON.parse('${listAdmin }') || JSON.parse('[]')
									});
								});
							</script>
						</td>
					</tr>
					<tr>
						<th><span class="red">*</span> 게시판 형태</th>
						<td>
							<tt:select id="boardTypeFixedCode" name="boardTypeFixedCode" class="w50" list="${listBoardType }" listKey="codeCode" listValue="codeName" indexKey="" indexValue="= 선택 =" selected="${vo.boardTypeFixedCode }"/>
						</td>
						<th>게시판 스킨</th>
						<td><input type="text" name="cssPrefix" style="ime-mode: disabled;" value="${vo.cssPrefix }" /></td>
					</tr>
					<tr>
						<th>권한 (회원등급)</th>
						<td colspan="3" class="center">

							<c:if test="${!empty listGrade }">
								<table class="board_write">
									<colgroup>
										<col width="20%" />
										<col width="20%" />
										<col width="20%" />
										<col width="20%" />
										<col width="20%" />
									</colgroup>
									<tbody>
										<tr>
											<th>목록보기</th>
											<th>내용보기</th>
											<th>글쓰기</th>
											<th>답글쓰기</th>
											<th>코멘트쓰기</th>
										</tr>
										<tr>
											<td class="center">
												<tt:select name="authList" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authList }"/>
											</td>
											<td class="center">
												<tt:select name="authView" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authView }"/>
											</td>
											<td class="center">
												<tt:select name="authWrite" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authWrite }"/>
											</td>
											<td class="center">
												<tt:select name="authReply" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authReply }"/>
											</td>
											<td class="center">
												<tt:select name="authComment" list="${listGrade }" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체 =" selected="${vo.authComment }"/>
											</td>
										</tr>
									</tbody>
								</table>
							</c:if>
							<c:if test="${empty listGrade }">
								<span class="red">회원등급이 설정되지 않았습니다. [회원관리 &gt; 회원등급 관리] 메뉴에서 회원 등급을 설정해야 합니다.</span>
								<input type="hidden" name="authList" value="0" />
								<input type="hidden" name="authView" value="0" />
								<input type="hidden" name="authWrite" value="0" />
								<input type="hidden" name="authReply" value="0" />
								<input type="hidden" name="authComment" value="0" />
							</c:if>
								<div class="red left mt5">※ [관리자]를 선택하면 일반 사용자는 권한이 부여되지 않습니다. [전체]를 선택하면 비회원도 권한이 부여됩니다.</div>
						</td>
					</tr>
					<tr>
						<th>권한 없을 경우 처리</th>
						<td colspan="3">
							경고 메시지 : <input type="text" name="noAuthMsg" class="w50 mr5 mb10" value="${empty vo.noAuthMsg ? '권한이 없습니다.' : vo.noAuthMsg}" /><br/>
							경고 후 이동 페이지 : <input type="text" name="noAuthRedirect" class="w50 mr5" value="${vo.noAuthRedirect }" />
						</td>
					</tr>
					<tr>
						<th>자동 비밀글</th>
						<td>
							<label><input type="checkbox" name="secretYn" value="Y" /> 운영자와 작성자만 열람 가능</label>
							<input type="hidden" name="autoSecretYn" />
							<script>
								$(function() {
									checkCheckbox('secretYn', 'autoSecretYn', '${vo.autoSecretYn}', 'N');
								});
							</script>
						</td>
						<th>이미지 첨부파일 정렬</th>
						<td>
							<label><input type="radio" name="previewImageAlign" value="left" /> 좌측</label>
							<label><input type="radio" name="previewImageAlign" class="ml20" value="center" /> 가운데</label>
							<label><input type="radio" name="previewImageAlign" class="ml20" value="right" /> 우측</label>
							<script>
								$(function() {
									checkRadio('previewImageAlign', '${vo.previewImageAlign}', 'left');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>이미지 파일</th>
						<td>
							<label><input type="checkbox" name="previewImage" value="Y" /> 첨부파일이 이미지인 경우 보기 페이지에서 이미지 보이기</label>
							<input type="hidden" name="previewImageYn" value="${vo.previewImageYn }" />
							<script>
								$(function() {
									checkCheckbox('previewImage', 'previewImageYn', '${vo.previewImageYn}', 'N');
								});
							</script>
						</td>
						<th>이미지 크기 <span class="navy">(너비)</span></th>
						<td>
							목록 : <input type="text" name="imageSizeList" class="w20 mr5 onlyNumber" value="${empty vo.imageSizeList ? '0' : vo.imageSizeList}" />
							보기 : <input type="text" name="imageSizeView" class="w20 mr5 onlyNumber" value="${empty vo.imageSizeView ? '0' : vo.imageSizeView}" />
						</td>
					</tr>
					<tr>
						<th>상세 보기 하단<br/> 목록 표시</th>
						<td>
							<label><input type="radio" name="showListYn" value="Y" /> 사용</label>
							<label><input type="radio" name="showListYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('showListYn', '${vo.showListYn}', 'N');
								});
							</script>
						</td>
						<th>이전글 다음글 표시</th>
						<td>
							<label><input type="radio" name="showPrevNextYn" value="Y" /> 사용</label>
							<label><input type="radio" name="showPrevNextYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('showPrevNextYn', '${vo.showPrevNextYn}', 'N');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>스팸 체크 기능</th>
						<td>
							<label><input type="radio" name="checkSpamYn" value="Y" /> 사용</label>
							<label><input type="radio" name="checkSpamYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('checkSpamYn', '${vo.checkSpamYn}', 'N');
								});
							</script>
						</td>
						<th>작성자 표시 형식</th>
						<td>
							<tt:select list="${writerFormats }" name="writerFormatFixedCode" listKey="codeCode" listValue="codeName" indexKey="" indexValue="= 작성자 형식 =" selected="${vo.writerFormatFixedCode }"/>
						</td>
					</tr>
					<tr>
						<th>날짜 형식(목록)</th>
						<td>
						<c:set var="today" value="<%=new Date() %>"></c:set>
							<select name="dateFormatList">
							<c:forEach items="${dateFormats }" var="m" varStatus="s">
								<option value="${m }"<c:if test="${m eq vo.dateFormatList }"> selected</c:if>><fmt:formatDate value="${today }" pattern="${m}"/></option>
							</c:forEach>
							</select>
						</td>
						<th>날짜 형식(상세)</th>
						<td>
							<select name="dateFormatView">
							<c:forEach items="${dateFormats }" var="m" varStatus="s">
								<option value="${m }"<c:if test="${m eq vo.dateFormatView }"> selected</c:if>><fmt:formatDate value="${today }" pattern="${m }"/></option>
							</c:forEach>							
							</select>
						</td>
					</tr>
					<tr>
						<th>이메일 사용</th>
						<td>
							<label><input type="radio" name="emailYn" value="Y" /> 사용</label>
							<label><input type="radio" name="emailYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('emailYn', '${vo.emailYn}', 'Y');
								});
							</script>
						</td>
						<th>휴대폰 사용</th>
						<td>
							<label><input type="radio" name="phoneYn" value="Y" />사용</label>
							<label><input type="radio" name="phoneYn" class="ml20" value="N" />미사용</label>
							<script>
								$(function() {
									checkRadio('phoneYn', '${vo.phoneYn}', 'Y');
								});
							</script>
						</td> 
					</tr>
					<tr>
						<th>웹 에디터 사용</th>
						<td>
							<label><input type="radio" name="editorYn" value="Y" /> 사용</label>
							<label><input type="radio" name="editorYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('editorYn', '${vo.editorYn}', 'Y');
								});
							</script>
						</td>
						<th>적립금 지급 여부</th>
						<td>
							<label><input type="radio" name="pointComment" value="1" />지급함</label>
							<label><input type="radio" name="pointComment" class="ml20" value="0" />지급 안 함</label>
							<script>
								$(function() {
									checkRadio('pointComment', '${vo.pointComment}', '1');
								});
							</script>
						</td> 
					</tr>
					<tr>
						<th>추천 기능</th>
						<td>
							<label><input type="radio" name="recommYn" value="Y" /> 사용</label>
							<label><input type="radio" name="recommYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('recommYn', '${vo.recommYn}', 'N');
								});
							</script>
						</td>
						<th>코멘트 기능</th>
						<td>
							<label><input type="radio" name="commentYn" value="Y" /> 사용</label>
							<label><input type="radio" name="commentYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('commentYn', '${vo.commentYn}', 'N');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>파일 업로드</th>
						<td ${vo.commentYn eq 'N' ? 'colspan="3"' : ''} }>
							<select name="fileUploadCount">
								<option value="0">사용안함</option>
							<c:forEach var="i" begin="1" end="5" step="1">
								<option value="${i }"<c:if test="${i eq vo.fileUploadCount }"> selected</c:if>>${i }개</option>
							</c:forEach>
							</select>
						</td>
						<!-- <th>동영상</th>
						<td>
							<select name="moviewUploadCount"></select>
						</td> -->
						<c:if test="${vo.commentYn eq 'Y'}">
						<th>Comment Level</th>
						<td>
							<input type="number" name="commentLevel" value="${vo.commentLevel }">
						</td>
						</c:if>
					</tr>
					<tr>
						<th>한 페이지 <br/>게시물 개수</th>
						<td>
							<input type="text" name="pagerRowCount" class="mr5 w20 onlyNumber" value="${empty vo.pagerRowCount ? 10 : vo.pagerRowCount}" />
						</td>
						<th>페이저 개수</th>
						<td>
							<input type="text" name="pagerBlockCount" class="mr5 w20 onlyNumber" value="${empty vo.pagerBlockCount ? 10 : vo.pagerBlockCount}" />
						</td>
					</tr>
					<tr>
						<th>새 게시물 표시 기간</th>
						<td>
							<input type="text" name="newPeriod" class="mr5 w20 onlyNumber" value="${empty vo.newPeriod ? 2 : vo.newPeriod}" />
						</td>
						<th>hot 조회 수 </th>
						<td>
							<input type="text" name="hotCount" class="mr5 w20 onlyNumber" value="${empty vo.hotCount ? 100 : vo.hotCount}" />
						</td>
					</tr>
					<tr>
						<th>제목 글자 수</th>
						<td>
							<input type="text" name="subjectCharCount" class="mr5 w20 onlyNumber" value="${empty vo.subjectCharCount ? 50 : vo.subjectCharCount}" />
						</td>
						<th>줄바꿈 게시물 수</th>
						<td>
							<input type="text" name="lfCount" class="mr5 w20 onlyNumber" value="${empty vo.lfCount ? 4 : vo.lfCount}" />
							<div class="red" style="float:none;">※ 포토갤러리 형식일 경우</div>
						</td>
					</tr>
					<tr>
						<th>욕설, 비방 필터링</th>
						<td colspan="3">
							<label><input type="checkbox" name="filtering" class="mr5" value="Y" /> 사용 (공백 사용금지, 콤마(,)구분)</label>
							<input type="hidden" name="filteringYn" value="" />
							<script>
								$(function() {
									checkCheckbox('filtering', 'filteringYn', '${vo.filteringYn}', 'N');
								});
							</script>
							<br/>
							<textarea name="filter" rows="3" cols="70">${vo.filter }</textarea>
						</td>
					</tr>
					<tr>
						<th>게시판 사용 여부</th>
						<td colspan="3">
							<label><input type="radio" name="useYn" value="Y" /> 사용</label>
							<label><input type="radio" name="useYn" class="ml20" value="N" /> 미사용</label>
							<script>
								$(function() {
									checkRadio('useYn', '${vo.useYn}', 'Y');
								});
							</script>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<br class="clear mb5" />

		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './board_list', {bcode:''});" class="btn2 bg_darkgray">취소</a></li>
		</ul>

	</div>
</div>
<!--wrap_scon E-->
<script id="groupTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 게시판 그룹 =</option>
{{each group}}
		<option value="\${groupSeq}">\${groupName}</option>
{{/each}}
</script>

<script id="categoryTmpl" type="text/x-jquery-tmpl">
		<option value="">= 카테고리 =</option>
{{each category}}
		<option value="\${bcSeq}">\${cateName}</option>
{{/each}}
</script>

<script type="text/javascript">
	$(function() {
	});
	
	function doCheckBoardCode() {
		$('input[name=checkedBoardCode]').val('');
		var $bc = $('input[name=boardCode]');
		
		if ($bc.val().trim().length == 0) {
			alert('게시판 코드를 입력한 후 중복검사 버튼을 클릭해 주세요.');
			return;
		}
		
		if (!checkPattern($bc.val(), 'BOARD_CODE')) {
			alert('게시판 코드는 첫 글자 영문, 4자리 이상, 10자리 이하의 영문 또는 숫자의 문자열로 구성해야 합니다.');
			return;
		}
		
		
		oLoader('#tdBoardCode'
			, './ajax/check_board_code'
			, 'post'
			, {
				key: $bc.val().trim()
			}
			, false
			, function(data) {
				if (data.result) {
					alert(data.result + '게시판 코드는 사용할 수 없습니다.');
					$('input[name=checkedBoardCode]').val('N');
					return;
				}
				else {
					alert('사용 가능한 게시판 코드입니다.');
					$('input[name=checkedBoardCode]').val('Y');
				}
			}
		);
	};
	
	//부모 페이지 - 게시판 그룹 셀렉트 박스 업데이트
	function updateGroup() {
		$.ajax({
			url: './ajax/update_group'
			, type: 'post'
			, dataType: 'json'
			, data: { 
			}
			, success: function (data) {
				console.log(data);
				if (data.result != null) {
					var selectedValue = $('select[name=groupSeq]').val();
					//console.log('>>>>>>>> selectedValue : ' + selectedValue)
					$('select[name=groupSeq]').empty();
					$('#groupTmpl').tmpl({group: data.result}).appendTo('select[name=groupSeq]');
					
					$('select[name=groupSeq]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	//부모 페이지 - 게시판 카테고리 셀렉트 박스 업데이트
	function updateCategory() {
		$.ajax({
			url: './ajax/update_category'
			, type: 'post'
			, dataType: 'json'
			, data: {
				bcode: '${vo.boardCode }'
			}
			, success: function (data) {
				if (data.result != null) {
					var selectedValue = $('select[name=boardCategory]').val();
					$('select[name=boardCategory]').empty();
					$('#categoryTmpl').tmpl({category: data.result}).appendTo('select[name=boardCategory]');
					
					$('select[name=boardCategory]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	function doSubmit() {
		//checkedBoardCode
		var $cbc = $('input[name=checkedBoardCode]');
		if ($cbc.length > 0) {
			if ($('input[name=checkedBoardCode]').val() != 'Y') {
				alert('게시판 코드 중복 검사를 해야 합니다.');
				return;
			}
		}
		
		if ($('input[name=boardName]').val().trim().length == 0) {
			alert('게시판 이름을 입력해야 합니다.');
			return;
		}
		
		if ($('select[name=boardTypeFixedCode]').val() == '') {
			alert('게시판 형태를 선택해야 합니다.');
			return;
		}
		
		//var status = '${search.status}';
		//if (status == 'i') {
		//	
		//}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>