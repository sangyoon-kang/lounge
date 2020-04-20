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
			<h2>접속경로 분석</h2>
			<p>홈 > 설문관리 > 접속경로 분석</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">접속경로 분석</h3>
			
			<table class="board_st1">
				<caption></caption>
				<colgroup>
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th class="">분석방법</th>
						<td class="left">
							<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="ga:fullReferrer"/> 
								접속경로&nbsp;&nbsp;&nbsp;</label>
							<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="useTool"/> 
								검색엔진,링크사이트 </label>
						</td>
					</tr>
					<tr>
						<th>기간</th>
						<td class="left" colspan="3">
							<input name="sDate" class="input_type2 datepicker" value="" maxlength="" type="text" style="width:100px;"/> 
								<a class="datepicker ml5"><img src="/images/ic_calender.png" alt="" /></a> ~ 
							<input name="eDate" class="input_type2 datepicker" value="" maxlength="" type="text" style="width:100px;"/> 
								<a name="" class="datepicker ml5"><img src="/images/ic_calender.png" alt="" /></a> 
						</td>
					</tr>
					<tr>
						<th>검색엔진</th>
						<td class="left" colspan="3">
							<select id="ga_group-result">
								<option>::검색엔진 선택::</option>
							</select> 
							<a class="btn bg_sky ml10" onclick="doSearch('ga:users', 'ga:source');">검색</a> 
							<a href="" class="btn bg_darkgray ml10">접속자분석 초기화</a>
						</td>
					</tr>
					
				</tbody>
			</table>
			
			
			<table class="board_st1 mt50 w-100 gAnalytics" data-id="Path" data-dim = "ga:source" data-met="ga:users" >
				
				
				
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
						<th>방문경로</th>
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


<script>

	function doSearch(metric, dimension){
		
				
		var filter = '';
		
		//Validation radio button
		if(!($('input[name=ga_Radio]').is(':checked'))){
			alert("Must be chosen 분석방법");
			
			return;
		};
		
		if($('input[name=ga_Radio]:checked').val() == 'useTool'){
		 	
			filter = $('#ga_group-result').val();
			
		}else {
			
			dimension = $('input[name=ga_Radio]:checked').val();
			
		}
		
		 //Sending data to Query function
		googleAnalytics.searchQuery($('input[name=sDate]').val(), $('input[name=eDate]').val(), metric, dimension, filter);  
		
		
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>