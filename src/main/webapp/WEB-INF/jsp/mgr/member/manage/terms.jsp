<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원관리 > 가입약관 및 개인정보 보호정책
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>가입약관 및 개인정보 보호정책</h2>
		<p>홈 &gt; 회원관리 &gt; 가입약관 및 개인정보 보호정책</p>
	</div>

	<div class="scon">

		<form id="form1" action="./terms_proc.do" method="post">
			<input type="hidden" name="siteSeq" value="${empty vo.siteSeq ? 0 : vo.siteSeq }" />
			
			<table class="board_write">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>가입약관</th>
						<td>
							<textarea name="term" class="w100" style="height:250px;"  class="editor">${vo.term }</textarea>
						</td>
					</tr>
					<tr>
						<th>개인정보 보호정책</th>
						<td>
							<textarea name="privacyInfo" class="w100" style="height:250px;"  class="editor">${vo.privacyInfo }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './member_list.do');" class="btn2 bg_darkgray">목록</a></li>
		</ul>

	</div>
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

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>