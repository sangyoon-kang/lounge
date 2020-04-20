<%@ page language="java" contentType="text/html;charset=UTF-8"
	trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

	<!-- 대쉬보드용 css 추가 -->
	<div class="scon"    >
	
	<div class="dashboard"  >
		
		<div class="dash_board">
			<div class="chart_title">
					<h4>게시판관리</h4>
					
				</div>
			<div id="chartdiv"></div>
			<div class="dash_board_list">
				
				<div class="board_title">
					<h3>최근게시물</h3>
					<!-- <a href="">&gt;</a> -->
				</div>
				<div class="board_list">

					<c:if test="${!empty hBoardInfoPost}">
						<ul>
							<c:forEach items="${hBoardInfoPost}" var="mb" varStatus="sb">
								<li><a href="${URL_ADMIN_ROOT}/board/write/${mb.bmVO.boardCode}?bseq=${mb.boardSeq}">${mb.subject}</a> <span><fmt:formatDate
											pattern="${DATE_FORMAT}" value="${mb.regDate}" /></span></li>

							</c:forEach>
						</ul>
					</c:if>
				</div>
				<div class="board_total">
					<ul>
						<li>
							<p>총 게시판수</p>
							<h3>
								<b>${hselectBulletinBoardsTotal }</b> 개
							</h3>
						</li>
						<li>
							<p>총 게시물</p>
							<h3>
								<b>${hboardInfoTotalCount }</b> 개
							</h3>
						</li>
						<li>
							<p>오늘 게시물</p>
							<h3>
								<b>${hselectPosttoday }</b> 개
							</h3>
						</li>
						<li>
							<p>오늘 댓글</p>
							<h3>
								<b>${hboardCommentTotalCount}</b> 개
							</h3>
						</li>
					</ul>
				</div>
			</div>
			<div class="dash_member" >
			
			<!-- access analytics list -->
<%-- 			<div class="dash_member_list" style="margin-bottom:140px;margin-top:20px !important">
					<div class="board_title">
						<h3>
							<b>게시판</b> 통계
						</h3>
						<a href="">&gt;</a>
					</div>
					<div class="member_list">
						<table cellpadding="0" cellspacing="0" border="0">
							<tbody>
								<c:if test="${!empty hData}">
									<c:forEach items="${hData}" var="m" varStatus="s">
										<tr>
											<td class="first_td">${m.hitDate}${m.hitTime}</td>
											<td>${m.hitHost}</td>
											<td>${m.hitCnt}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div> --%>
			
			</div>
		</div>

		<div class="dash_member">
			<div class="chart_title">
					<h4>접속통계</h4>
					
				</div>
			<div id="chartdivBoard" style="min-height:500px !important;"></div>
			<div class="dash_member_list">
				<div class="board_title">
					<h3>회원현황</h3>
					<a href="${URL_ADMIN_ROOT}/member/manage/member_list">&gt;</a>
				</div>
				<div class="member_list">
					<table cellpadding="0" cellspacing="0" border="0">
						<c:if test="${!empty hMemberInfo}">
							<c:forEach items="${hMemberInfo}" var="mm" varStatus="sm">
								<tbody>
									<tr>
										<td class="first_td">${mm.memberSeq}</td>
										<td>${mm.userId}</td>
										<td>${mm.userName}</td>
										<td><fmt:formatDate
											pattern="yyyy-MM-dd" value="${mm.regDate}" /></td>
									</tr>

								</tbody>

							</c:forEach>
						</c:if>
					</table>
				</div>
				<div class="member_total">
					<ul>
						<li>
							<p>오늘 가입회원</p>
							<h3>
								<b>${hjointoday }</b> 개
							</h3>
						</li>
						<li>
							<p>전체 회원수</p>
							<h3>
								<b>${hjoinTotal }</b> 개
							</h3>
						</li>
						<li>
							<p>오늘 탈퇴회원</p>
							<h3>
								<b>${hLeavetoday }</b> 개
							</h3>
						</li>
						<li>
							<p>총 탈퇴회원</p>
							<h3>
								<b>${hLeaveTotal }</b> 개
							</h3>
						</li>
					</ul>
				</div>
				<br>
			</div>
		</div>
	</div>
	</div>

<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- <script src="http://changeit.kr/views/admin/chart/amcharts.js"></script> -->

<!-- Chart code -->
<script>
// Themes begin
am4core.useTheme(am4themes_animated);
// Themes end

var chart = am4core.create("chartdiv", am4charts.XYChart);



var jpar = ${hostData};
var data = [];
var value = 0;

 for( var data1 in jpar){
  value = 0; 
  let date = new Date("");
  date.setYear(jpar[data1].hitDate.substr(0,4));
  date.setMonth(jpar[data1].hitDate.substr(4,2)-1);
  date.setDate(jpar[data1].hitDate.substr(6,2));
  date.setHours(jpar[data1].hitTime);
  value = jpar[data1].hitCnt;
  data.push({date:date, value: value});
  
  
} 
 chart.data = data;

 
 
 // Create axes
 var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
 dateAxis.renderer.minGridDistance = 60;
 var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
 // Create series
 var series = chart.series.push(new am4charts.LineSeries());
 series.dataFields.valueY = "value";
 series.dataFields.dateX = "date";
 series.tooltipText = "{value}"
 series.tooltip.pointerOrientation = "vertical";
 chart.cursor = new am4charts.XYCursor();
 //chart.scrollbarY = new am4core.Scrollbar();
 chart.scrollbarX = new am4core.Scrollbar();
 
 
 
 /* ----------------------------------------------------------board-------------------------------------------------------- */
 am4core.useTheme(am4themes_animated);
 var chartBoard = am4core.create("chartdivBoard", am4charts.XYChart);
 

var jBoard = ${hBoard};
var dataBoard = [];

for( var data2 in jBoard){
	  value2 = 0; 
	  let date1 = new Date(jBoard[data2].subject);
	  value2 = jBoard[data2].boardSeq;
	  dataBoard.push({date:date1, value: value2});	  
	} 

chartBoard.data = dataBoard;

 </script>
 <script >
 

  // Create axes
 var dateAxisboard = chartBoard.xAxes.push(new am4charts.DateAxis());
 dateAxis.renderer.minGridDistance = 60;
 var valueAxisBoard = chartBoard.yAxes.push(new am4charts.ValueAxis());
 // Create series
 var seriesBoard = chartBoard.series.push(new am4charts.LineSeries());
 seriesBoard.dataFields.valueY = "value";
 seriesBoard.dataFields.dateX = "date";
 seriesBoard.tooltipText = "{value}"
 seriesBoard.tooltip.pointerOrientation = "vertical";
 chartBoard.cursor = new am4charts.XYCursor();
 chartBoard.scrollbarX = new am4core.Scrollbar();
 
 /* ----------------------------------------------------------end board-------------------------------------------------------- */
 </script>