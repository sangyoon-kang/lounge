<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 모바일 웹/앱 제작(앱개발) - 모바일 웹/앱 제작 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/app.jsp"%>
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>Mobile 웹/앱 제작</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 앱 개발 > Mobile 웹/앱 제작</div>
			</div><!--  end title -->
			<div id="content">
			
				<jsp:include page="/module/page" flush="true"><jsp:param name="pseq" value="14" /></jsp:include>
			
			
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	

	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>