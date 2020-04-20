<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 웹사이트 개발
--%>
	
	<div id="left">
		<div class="left_tit">
			<p class="stxt">CUSTOMER WEBSITE</p>
			<p class="sb">웹사이트 개발</p>
		</div>
		<ul class="left_mu">
			<li><a href="/pages/consulting.jsp" suffix="/consulting">견적안내</a></li>			
			<li><a href="/pages/customer/estimate.jsp" suffix="/customer/estimate">견적상담문의</a></li>
		</ul>
		<div id="left_ban">
			<jsp:include page="/module/banner" flush="true"><jsp:param name="bseq" value="22" /></jsp:include>
		</div>
	</div>
<script type="text/javascript">
var sURL = '${pageContext.request.requestURL}';
$('.left_mu a').each(function () {
	var suffix = $(this).attr('suffix').split(',');
	for(var i in suffix) {
		if (sURL.indexOf(suffix[i]) > -1){
			$(this).attr('class', 'on');
		}
	}
});
</script>	