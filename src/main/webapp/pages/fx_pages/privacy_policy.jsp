<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<c:if test="${empty tagoplusSolution1_session_user}">
	<c:redirect url = "${URL_FRONT_LOGIN}"/>
</c:if>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<nav id="wrap_lnb">
	<div>
		<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
		<div class="lnb_select">
		<h3 class="lnb_select_tit first">개인정보취급방침</h3>
		<%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp"%>
		</div>
	</div>
</nav>

<section class="wrap_scon">
		<div class="scon">
		<h2 class="con_tit03">개인정보취급방침</h2>
		<p id="area" class="paper_per"></p>
		</div>
</section>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({url: "/ajax/term.do", 
		data: {type: "privacy"},
		method: 'GET',
		dataType: 'json',
		success: function(result){
			$("#area").html(result.contents);
  		}
	});
});
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>