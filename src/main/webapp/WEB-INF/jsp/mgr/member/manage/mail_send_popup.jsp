<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원관리 > 이메일발송 팝업
 --%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>


<!--wrap_scon S-->
<div id="pop_scon">
	<form id="form1" action="./mail_send_proc.do" method="post">
<c:forEach var="n" items="${list }">
	<input type="hidden" name="chkseq" value="${n.memberSeq }" />
</c:forEach>	
		<h3 class="scon_tit2 bm10">메일발송</h3>
		
		<table class="board_write mb20">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>보내는이</th>
					<td>
						<span>${tagoplusSolution1_session_site.siteName }(${tagoplusSolution1_session_site.email })</span>
					</td>
				</tr>
				<tr>
					<th>받는이</th>
					<td>
						<textarea rows="5" cols="75"><c:forEach var="m" items="${list }">${m.userName }:${m.email },&nbsp;</c:forEach></textarea>
						<br/>
						<span>형식) 홍길동:test@test.com,</span>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" class="w100" name="subject" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea name="body" id="body" class="w100" style="height:250px;"  class="editor"></textarea>
						<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
						<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
				
						<script type="text/javascript">
							CKEDITOR.replace('body', {
								width : '100%'
								, height : '220px'
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
		<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">발송하기</a></li>
		<li><a onclick="javascript:self.close();" class="btn2 bg_darkgray">닫기</a></li>
	</ul>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		
	});
	
	
	function doSubmit() {
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>