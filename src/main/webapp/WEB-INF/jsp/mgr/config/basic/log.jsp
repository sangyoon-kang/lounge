<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>로그 분석</h2>
		<p>홈 &gt; 환경설정 &gt; 로그분석</p>
	</div>

	<div class="scon">

		<br>
		<h3 class="scon_tit2">로그분석</h3>
		<!-- <div class="check_conbox mb10 pl10">
		<ul>	<span class="txt_red" id="hitCode"> 
			<strong>&lt;jsp:include
					page="/module/connect" flush="true" /&gt;</strong>
				
			</span>
			 <a href="" class="bt_copy">생성코드복사</a>
			<a onclick="javascript:copyClipboard('#hitCode');"
				class="btn btn_round bg_gray">생성코드복사</a></ul>
		</div> -->
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/connect" flush="true" /&gt;
</code></pre> <a onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn_round bg_gray mb10 vc_bottom">생성코드복사</a>
		<script>
			hljs.initHighlighting();
		</script>
		<h3 class="scon_tit2">적용예제</h3>
		<div class="check_conbox mb15">
			<ul>
				<li>
				코드가 &lt;head/&gt; tag 윗 부분 근처에 그리고 다른 script들이나 CSS tag 앞에 추가되어야 한다</li>
				
			</ul>
		</div>


		<div class="check_conbox mb10">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>홈페이지의 접속자를 분석할 수 있는 기능입니다.</li>
				<li>- 분실하기 쉬운 정보를 작성하여 추후 사이트 관리에 이용하는 부분입니다.</li>
				<li>- 위의 로그분석 코드를 웹사이트 첫페이지(index.htm, index.html, index.jsp)
					첫줄에 삽입합니다.</li>
				<li>- 분석내용은 접속통계 > 접속자분석,접속경로분석 에서 확인 가능합니다.</li>
				<li>- 프레임으로 나눈 사이트의 경우 프레임 페이지 상단에 삽입합니다.</li>
			</ul>
		</div>

	</div>
</div>
<!--wrap_scon E-->



<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>