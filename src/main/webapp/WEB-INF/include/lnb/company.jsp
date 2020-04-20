<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 화사소개
--%>
	
	<div id="left">
		<div class="left_tit">
			<p class="stxt">COMPANY</p>
			<p class="sb">회사소개</p>
		</div>
		<ul class="left_mu">
			<li><a href="/pages/company/intro.jsp" suffix="/company/intro">화사개요</a></li>
			<li><a href="/pages/company/history.jsp" suffix="/company/history">회사연혁</a></li>
			<li><a href="/pages/company/business.jsp" suffix="/company/business">사업분야</a></li>
			<li><a href="/pages/company/patner.jsp" suffix="/company/patner">협력업체</a></li>
			<li><a href="/pages/company/contact_us.jsp" suffix="/company/contact_us">CONTACT US</a></li>
			<li><a href="/pages/company/location.jsp" suffix="/company/location">찾아오시는 길</a></li>
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