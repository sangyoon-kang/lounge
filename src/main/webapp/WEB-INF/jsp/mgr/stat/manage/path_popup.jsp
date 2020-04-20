<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	접속통계 - 접속자 분석
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>


<!--wrap_scon S-->
	<div id="pop_scon">
			
			<table class="board_st1  w-100 gAnalytics" data-id="Path-Popup" data-dim = "ga:fullReferrer" data-met="ga:users" >
				
				<input type="hidden" class="gAnalytics" name="statusName" value="${vo.statusName}"/>
				
				<caption></caption>
				<colgroup>
					<col width="" />
					<col width="" />
					<col width="" />
					<col width="" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>접속경로</th>
						<th>접속자수</th>
						<th>비율</th>
					</tr>
				</thead>
				<tbody id="query_result">
						
					
				</tbody>
			</table>
		</div>
	</div>
	<!--wrap_scon E-->

<!-- Google Analytic Libraries -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script> 
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" src="https://apis.google.com/js/api.js" onload="this.onload=function(){};googleAnalytics.prepClientLoad();" token="${set.googleAccessToken}" 
view_id="${set.googlelogValue }" client_id="${set.googlelogId}" start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>"></script>




<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>