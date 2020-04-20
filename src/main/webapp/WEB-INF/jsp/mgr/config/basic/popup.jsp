<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 팝업관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>팝업관리</h2>
			<p>홈  &gt; 환경설정  &gt; 팝업관리</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">팝업관리 생성코드</h3>
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/popup" flush="true" /&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn_round bg_gray mb10 vc_bottom">생성코드복사</a>
			
			<div class="check_conbox mt15 mb15">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 홈페이지의 팝업을 관리할 수 있는 기능입니다.</li>
					<li>- 위의 팝업생성 코드를 웹사이트 첫페이지(main.jsp)에 삽입합니다.</li>
					<li>- 팝업 내용은 기본설정 > 팝업관리에서 작성할 수 있습니다.</li>
				</ul>
			</div>
			
			<h3 class="scon_tit2">적용예제</h3>
			<div class="check_conbox mb15">
				<ul>
					<li>&lt;body&gt;</li>
					<li class="red bold">&lt;jsp:include page="/module/popup" flush="true" /&gt;</li>
					<li>&lt;/body&gt;</li>
				</ul>
			</div>
			
			
		</div>
	</div>
	<!--wrap_scon E-->

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>