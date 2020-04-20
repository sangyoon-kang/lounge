<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">
		<div id="left">
			<div class="left_tit">
				<p class="stxt">Board Management</p>
				<p class="sb">Board</p>
			</div>
			<ul class="left_mu">
				<li><a href="/pages/board/board.jsp">board</a></li>
			</ul>
		</div>
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2>
						<strong>Board Management</strong>
					</h2>
					<div class="tit_ex">Board</div>
				</div>
				<div class="fright location">
					<img src="/images/ic_home.png" /> > Home > Board
				</div>
			</div>
			<!--  end title -->
			<div id="content">
				<jsp:include page="/module/board.do" flush="true">
					<jsp:param name="bcode" value="image" />
				</jsp:include>
			</div>
			<!-- content -->
		</div>
		<!-- container -->
	</div>
	<!-- wrapper -->
</div>
<!-- all_wrp -->

<script type="text/javascript">
	
</script>

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>