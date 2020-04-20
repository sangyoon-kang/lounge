<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<div>
	<div class="container main">
		<jsp:include page="/module/board.do" flush="true"><jsp:param name="bcode" value="boardcode" /></jsp:include>
	</div>
</div>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>