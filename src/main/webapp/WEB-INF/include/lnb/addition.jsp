<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 부가서비스
--%>
	
	<div id="left">
		<div class="left_tit">
			<p class="stxt">SERVICE</p>
			<p class="sb">부가서비스</p>
		</div>
		<ul class="left_mu">
			<li><a href="/pages/addition/sms_service.jsp" suffix="/addition/sms_service">SMS서비스</a></li>			
			<li><a href="/pages/addition/maintenance.jsp" suffix="/addition/maintenance">유지관리</a></li>
			<li><a href="/pages/addition/web_hosting.jsp" suffix="/addition/web_hosting">웹호스팅</a></li>
			<li><a href="/pages/addition/online_ad.jsp" suffix="/addition/online_ad">온라인 광고검색</a></li>
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