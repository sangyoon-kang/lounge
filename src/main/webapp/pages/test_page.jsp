<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 웹사이트 개발 - 견적 안내 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/website.jsp"%>
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>MEMBER CONFIG TEST</strong></h2>
					<div class="tit_ex">TEST</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 웹사이트 개발 > 견적 안내</div>
			</div><!--  end title -->
			<div id="content">
					
					<jsp:include page="/module/join" flush="true" />
					<jsp:include page="/module/login" flush="true" />
					<jsp:include page="/module/findidpw" flush="true" />
					<jsp:include page="/module/findid" flush="true" />
					<jsp:include page="/module/findpw" flush="true" />
					<jsp:include page="/module/member_edit" flush="true" />
					<jsp:include page="/module/withdrawal" flush="true" />
					<jsp:include page="/module/loginbox" flush="true" />
					<jsp:include page="/module/toplogin" flush="true" />
					<jsp:include page="/module/topjoin" flush="true" />
				
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	

	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>