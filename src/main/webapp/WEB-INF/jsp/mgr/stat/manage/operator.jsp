<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	접속통계 - 접속자 분석
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include> 
		
		<div class="scon_title">
			<h2>OS/브라우저</h2>
			<p>홈 > 통계 관리 > OS/브라우저</p>
		</div>
		
		<div class="scon">
			
			<div class="scon_search">
				
				<p class="table_aside02" >
					<a href="" class="btn bg_gray">접속자분석 초기화</a>
				</p>
			</div>
			
			<h3 class="scon_tit2">브라우저</h3>
			<table class="board_st1 mb20 gAnalytics" data-dim="ga:browser" data-met="ga:sessions" data-id="Operator">
				<caption></caption>
				<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>브라우저</th>
						<th>접속자수</th>
						<th>비율</th>
						<th>그래프</th>
					</tr>
				</thead>
				<tbody id="ga_browser">
					
					
				</tbody>
			</table>
			
			

			<h3 class="scon_tit2">OS</h3>
			<table class="board_st1 gAnalytics" data-dim="ga:operatingSystem" data-id="Operator">
				<caption></caption>
				<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>브라우저</th>
						<th>접속자수</th>
						<th>비율</th>
						<th>그래프</th>
					</tr>
				</thead>
				<tbody id='ga_operatingSystem'>
					
					
				</tbody>
			</table>
			
		</div>
	</div>
<!--wrap_scon E-->
<!-- ============= JavaScript ============== -->
<!-- Google Analytic Libararies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script>
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" src="https://apis.google.com/js/api.js" onload="this.onload=function(){};googleAnalytics.prepClientLoad();" token="${set.googleAccessToken}" 
view_id="${set.googlelogValue }" client_id="${set.googlelogId}" start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>"></script>


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>