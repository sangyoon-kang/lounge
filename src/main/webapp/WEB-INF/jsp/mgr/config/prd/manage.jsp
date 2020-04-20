<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>상품 관리</h2>
			<p>홈  &gt; 환경설정  &gt; 상품관리</p>
		</div>
		
		<div class="scon">
			
			<h3 class="scon_tit2">상품 리스트 생성 코드</h3>
<pre class="custom"><code id="codeSample" class="html">
&lt;jsp:include page="/module/prd" flush="true"&gt;&lt;/jsp:include&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#codeSample');" class="btn btn_round bg_gray vc_bottom">생성코드복사</a>
			
			<div class="check_conbox mt15 mb15">
				<h4 class="check_tit">체크사항</h4>
				<ul class="ml10">
					<li>- 게시판을 출력하고자 하는 위치에 예제 코드와 같은 블럭을 추가합니다.</li>					
				</ul>			
			</div>
		</div>
	</div>
	<!--wrap_scon E-->
	
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>