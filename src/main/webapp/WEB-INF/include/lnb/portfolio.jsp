<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 포트폴리오
--%>
	<div id="left">
		<div class="left_tit">
			<p class="stxt">PROTFOLIO</p>
			<p class="sb">포트폴리오</p>
		</div>
		<ul class="left_mu">
			<li>
				<a href="/pages/portfolio/website.jsp" suffix="/portfolio/website">웹사이트</a>
			</li>			
			<li>
				<a href="/pages/portfolio/mobile.jsp" suffix="/portfolio/mobile">모바일 및 앱</a>
			</li>
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

