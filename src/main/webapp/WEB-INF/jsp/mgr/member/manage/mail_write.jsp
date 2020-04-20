<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원관리 > 이메일 설정 - 등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>이메일 설정</h2>
		<p>홈 &gt; 회원관리 &gt; 이메일 설정</p>
	</div>

	<div class="scon">

		<form id="form1" action="./mail_proc.do" method="post">
			<input type="hidden" name="emseq" value="${search.emseq }" />
			
			<table class="board_write mb20">
				<colgroup>
					<col width="10%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th><span class="red">*</span> 분류명</th>
						<td>
							<input type="text" name="mailName"  value="${vo.mailName}"  class="w50" />
						</td>
					</tr>
					<tr>
						<th>메일발송</th>
						<td>
							<label><input type="checkbox" name="adminSend" value="Y" />관리자</label>
							<label><input type="checkbox" name="userSend" value="Y"  class="ml10"/>회원</label>
							<input name="adminSendYn" type="hidden" value="" />
							<input name="userSendYn" type="hidden" value="" />
							<script>
								$(function() {
									checkCheckbox('adminSend', 'adminSendYn', '${vo.adminSendYn}', 'N');
									checkCheckbox('userSend', 'userSendYn', '${vo.userSendYn}', 'N');
								});
							</script>
						</td>
					</tr>
					<tr>
						<th>메일 제목</th>
						<td>
							<input type="text" name="subject" value="${vo.subject }" class="w50" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
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
			<table class="board_write" style="border-top: 1px solid #cacaca">
				<colgroup>
					<col width="20%" />
					<col width="20%" />
					<col width="20%" />
				</colgroup>
				<tbody>
					<tr>
						<td><strong>#|date|</strong> 오늘날짜</td>
						<td><strong>#|mem_id|</strong> 회원아이디</td>
						<td><strong>#|mem_pw|</strong> 회원비밀번호</td>
					</tr>
					<tr>
						<td><strong>#|mem_name|</strong> 회원이름</td>
						<td><strong>#|site_name|</strong> 사이트명</td>
						<td><strong>#|site_email|</strong> 사이트 이메일</td>
					</tr>
					<tr>
						<td><strong>#|site_tel|</strong> 사이트 전화번호</td>
						<td colspan="2"><strong>#|site_url|</strong> 사이트 주소로 변경되어 발송됩니다.</td>
					</tr>
				</tbody>
			</table>
		</form>
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './mail_list.do');" class="btn2 bg_darkgray">목록</a></li>
		</ul>

	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		
	});
	
	
	function doSubmit() {
		
		if (isNull($('input[name=mailName]').val())) {
			alert('분류명을 확인 해주세요.');
			return;
		}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>