<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 상세
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>회원등급 관리</h2>
		<p>홈 &gt; 회원 관리 &gt; 회원등급 관리</p>
	</div>

	<div class="scon">

		<form id="form1" action="./grade_proc.do" method="post">
			<input type="hidden" name="glevel" value="${search.glevel }" />
			<table class="board_write">
				<colgroup>
					<col width="16%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th><span class="red">*</span> 등급 이름</th>
						<td id="tdBoardCode">
							<input type="text" name="gradeName" class="mr5" maxlength="12" value="${vo.gradeName }" /> 
						</td>
					</tr>
					<tr>
						<th><span class="red">*</span> 회원등급</th>
						<td id="tdGradeLevel">
<c:if test="${empty vo }">						
							<select name="gradeLevel" class="mr10">
	<c:forEach var="i" begin="1" end="20" varStatus="s">
								<option value="${i }">${i }</option>
	</c:forEach>							
							</select>
							<a onclick="javascript:doCheckGradeLevel();" class="btn btn_round bg_darkgray mr10">등급 확인</a>
							<input type="hidden" name="checkedGradeLevel" />
</c:if>
<c:if test="${!empty vo }">	
							<span class="f15 bolder">${vo.gradeLevel } 레벨</span>
							<input type="hidden" name="gradeLevel" value="${vo.gradeLevel }" />
</c:if>
							<div class="red">※ 회원 등급은 숫자가 낮을수록 높은 등급이 됩니다.</div>
						</td>
					</tr>
					<tr>
						<th>설명</th>
						<td>
							<textarea name="gradeMemo" rows="3" cols="70">${vo.gradeMemo }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<br class="clear mb5" />

		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './grade_list.do', {glevel:''});" class="btn2 bg_darkgray">취소</a></li>
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

<script type="text/javascript">
	$(function() {
		$('select[name=gradeLevel]').change(function() {
			$('input[name=checkedGradeLevel]').val('');
		});
	});
	
	function doCheckGradeLevel() {
		$('input[name=checkedGradeLevel]').val('');
		var $gl = $('select[name=gradeLevel]');
		
		oLoader('#tdGradeLevel'
			, './ajax/check_grade_level.do'
			, 'post'
			, {
				key: $gl.val()
			}
			, false
			, function(data) {
				if (data.result) {
					alert(data.result + ' 회원등급은 사용할 수 없습니다.');
					$('input[name=checkedGradeLevel]').val('N');
					return;
				}
				else {
					alert('사용 가능한 회원등급 입니다.');
					$('input[name=checkedGradeLevel]').val('Y');
				}
			}
		);
	};
	
	function doSubmit() {
		
		if ($('input[name=gradeName]').val().trim().length == 0) {
			alert('회원등급 이름을 입력해야 합니다.');
			return;
		}
		 
		//등록 상태일 때
		if($('select[name=gradeLevel]').length > 0) {
			if ($('input[name=checkedGradeLevel]').val() != 'Y') {
				alert('회원등급 중복 검사를 해야 합니다.');
				return;
			}	
		}
		
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>