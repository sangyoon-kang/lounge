<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%-- 
	<c:out value="${requestScope['javax.servlet.error.status_code'] }" />
	<c:out value="${requestScope['javax.servlet.error.exception'] }" />
	<c:out value="${requestScope['javax.servlet.error.message'] }" />
	<c:out value="${requestScope['javax.servlet.error.request_url'] }" />
	<c:out value="${requestScope['javax.servlet.error.servlet_name'] }" />
	
	오류 페이지 : ErrorController 참조
--%>


	<script type="text/javascript">
		$(function() {
			$(document.body).css('background', 'none');
			$('#wrap_header').remove();
		});
	</script>
	
	<div class="content">
					
		<p style="margin-top:250px; margin-bottom:15px; font-size:30px;  text-align:center; font-weight:600;">페이지 오류입니다.</p>
		<p style="font-size:15px;  text-align:center; font-weight:600;">
			<c:out value="${requestScope['javax.servlet.error.status_code'] }" /> : ${messageEng }
		</p>
		<p style="text-align:center;">
			${message }
		</p>
		
		<p style="margin-top:30px; text-align:center;">
			<a href="javascript:history.back();" class="btn btn-default">돌아가기</a>
		</p>

<c:if test="${WEB_MODE eq 'local'}">		
		<div class="mT20">
			<div class="mB20" style="color: #fff;">- <c:out value="${requestScope['javax.servlet.error.status_code'] }" /></div>
			<div class="mB20" style="color: #fff;">- <c:out value="${requestScope['javax.servlet.error.exception'] }" /></div>
		</div>
</c:if>		
	</div>