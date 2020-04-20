<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<c:if test="${empty tagoplusSolution1_session_user}">
	<c:redirect url = "${URL_FRONT_LOGIN}"/>
</c:if>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<!-- <div class="main_tab_wrapper mt-5">
		<div class="container">
			<div class="tab-big">
				<a href="/pages/fx_pages/notice.jsp">공지사항</a>
				<a href="/pages/fx_pages/consulting.jsp"  class="active">1:1문의</a>
				<a href="/pages/fx_pages/faq.jsp">FAQ</a>
			</div>
		</div>
	</div> -->
	<div class="container main">
		<jsp:include page="/module/board.do" flush="true"><jsp:param name="bcode" value="bugreport" /></jsp:include>
	</div>

<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>