<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	
	<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<div id="all_wrp">
	<div id="wrapper">
		<div id="left">
			<div class="left_tit">
				<p class="stxt">SOLUTION</p>
				<p class="sb"> 솔루션 </p>
			</div>

			<jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="cateIdx" value="010200"/>
			</jsp:include>
			<jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="cateIdx" value="010100"/>
			</jsp:include>
			<%-- <jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="catecode" value="30"/>
			</jsp:include>
			<jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="catecode" value="40"/>
			</jsp:include>
			<jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="catecode" value="50"/>
			</jsp:include>
			<jsp:include page="/module/lnb_prd" flush="true" >
				<jsp:param name="srcLink" value="/pages/prd_list.jsp"/>
				<jsp:param name="catecode" value="60"/>
			</jsp:include> --%>

			<div id="left_ban">
				<jsp:include page="/module/banner" flush="true"><jsp:param name="bseq" value="22" /></jsp:include>
			</div>
		</div>
		
		<div id="container">
			<jsp:include page="/module/product" flush="true" />
		</div>
	</div><!-- container -->
</div><!-- wrapper -->

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>