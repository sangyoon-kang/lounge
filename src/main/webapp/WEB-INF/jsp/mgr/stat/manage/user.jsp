<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	접속통계 - 접속자 분석
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<!-- <div id="ga-login-box" >
			<p>Please login on your google account to access Google Analytics.</p>
			<button id="ga-btnLogin" onclick="googleAnalytics.handleAuthClick()" class="btn2 btnh_30 bg_gray mt10">Login</button>
</div> -->

<!--wrap_scon S-->
<div id="wrap_scon" >
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include> 
		
		
		
		<div class="scon_title">
			<h2>접속자 분석</h2>
			<p>홈 > 설문관리 > 접속자 분석</p>
		</div>
		<div class="scon">
			<div class="search">
			 	<h3 class="scon_tit2">접속자 분석</h3>
				
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
								<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="today"/> 
									오늘&nbsp;&nbsp;&nbsp;</label>
								<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="ga:hour"/> 
									시간대별&nbsp;&nbsp;&nbsp;</label>
								<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="ga:date"/> 
									일별&nbsp;&nbsp;&nbsp;</label>
								<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="ga:yearMonth"/> 
									월별&nbsp;&nbsp;&nbsp;</label>
								<label><input class="input_type_radio01" type="radio" name = "ga_Radio" value="ga:year"/> 
									년별</label>
							</td>
						</tr>
						<tr>
							<th>기간</th>
							<td class="left" colspan="3">
								<input name="sDate" class="input_type2 datepicker" value="" maxlength="" type="text" /> 
									<a class="datepicker ml5"><img src="/images/ic_calender.png" alt="" /></a> ~ 
								<input name="eDate" class="input_type2 datepicker" value="" maxlength="" type="text" style="width:100px;"/> 
									<a class="datepicker ml5"><img src="/images/ic_calender.png" alt="" /></a> 
								<a class="btn bg_blue ml10" onclick="doSearch('ga:users');">검색</a> 
								<a href="" class="btn bg_gray ml10">접속자분석 초기화</a>
							</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			<h3 class="scon_tit2">접속자 분포도</h3>

			<table class="board_st1 mb20 gAnalytics"  data-met="ga:users" data-id="User">
				<caption></caption>
				<colgroup>
					<col width="20%" />
					<col width="" />
					<col width="20%" />
					<col width="" />
				</colgroup>
				<tbody>
					<tr>
						<th class="">총 접속자 수</th>
						<td class="left"  id="totalVisitors"></td>
						<th class="">평균 접속자 수</th>
						<td class="left" id="avgVisitors"></td>
					</tr>
					<tr>
						<th class=""> 오늘 접속자 수  </th>
						<td class="left" id="tdayVisitors"></td>
						<th class=""> 어제 접속자 수  </th>
						<td class="left" id="ydayVisitors"></td>
					</tr>
					<tr>
						<th class=""> 이번달 접속자 수  </th>
						<td class="left" id="mVisitors"></td>
						<th class=""> 이번달 평균 접속자 수  </th>
						<td class="left" id="avgMVisitors"></td>
					</tr>
					
			</tbody>
		</table> 
		
		<table class="board_st1 mt50 w-100 hide" id="ga_result_table"  >
				<caption></caption>
				<colgroup>
					<col width="10%" />
					<col width="" />
					<col width="" />
					
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>날짜/시간</th>
						<th>접속자 수</th>
						
					</tr>
				</thead>
				<tbody id="query_result">
					
					
				</tbody>
			</table>
		
		
		
	</div>
</div>
<!--wrap_scon S-->

		
<!-- ============= JavaScript ============== -->
<!-- Google Analytic Libararies -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bluebird/3.3.5/bluebird.min.js"></script>
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" async defer src="https://apis.google.com/js/api.js" 
      onload="this.onload=function(){};googleAnalytics.prepClientLoad()" 
      token="${set.googleAccessToken}" view_id="${set.googlelogValue }" client_id="${set.googlelogId}" 
      start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>">
</script>


<script>
	function doSearch(metric){
		
		//Validation radio button
		if(!($('input[name=ga_Radio]').is(':checked'))){
			alert("Must be chosen 분석방법");
			return;
		};
		
		//Sending data to Query function
		googleAnalytics.searchQuery($('input[name=sDate]').val(), $('input[name=eDate]').val(), metric, $('input[name=ga_Radio]:checked').val());
	
	}	
</script>



<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>