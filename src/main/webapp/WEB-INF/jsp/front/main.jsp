<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<link href="/common/css/main.css" rel="stylesheet" type="text/css" />
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<jsp:include page="/module/popup" flush="true" />


<section class="mvisual">
	<div>
		<h3>차세대 금융투자의 <strong>새로운 시작</strong></h3>
		<p>
			당사 보유 FX 마진거래의 소득권리 공유로 외환거래의 장벽을 낮춰,
			<br/>
			이제 누구나 손쉬운 투자가 가능한 혁신 금융서비스를 시작합니다.
		</p>
		<div class="button_group"><a class="blue" href="/prd/deal.do?runTime=1">거래하기</a>
<c:if test="${empty tagoplusSolution1_session_user}">
		<a class="orange" href="/login">로그인</a>
</c:if>
		</div>
	</div>
	
</section>

<!-- mcon01_list -->
<section class="section_1">
	<div class="container">
		<div class="row">
			<div class="col-6 col-sm-3 arrow">
				<p>남은 계약시간</p>
				<h2><span class="time" data-time="diffHour"></span>분 <span class="time"  data-time="diffMinute"></span>초</h2>
			</div>
			<div class="col-6 col-sm-3 line">
				<p>다음 계약시간</p>
				<h2><span class="time" data-time="nextHour"></span>시 <span class="time" data-time="nextMinute"></span>분</h2>
			</div>
			<div class="col-sm-6">
				<p>출금가능시간</p>
				<h2><span>09:00 ~ 23:00</span><small>(운영일 기준)</small> </h2>
			</div>
		</div>
		
	</div>
</section>

<section class="section_2 ">
	<div class="container">
		<div class="wrapper">
			<div class="box">
				<div class="img_wrapper"><img src="/images/contents/main_01.png"></div>
				<p>퀀텀레벨의<br> 다중보안 솔루션 적용</p>
			</div>
			<div class="box">
				<div class="img_wrapper"><img src="/images/contents/main_02.png"></div>
				<p>사용자경험 중심의<br> 편리한 플랫폼환경</p>
			</div>
		</div>
		<div class="wrapper">
			<div class="box">
				<div class="img_wrapper"><img src="/images/contents/main_03.png"></div>
				<p>메이저 증권사<br> 실시간 환율정보 제공</p>
			</div>
			<div class="box">
				<div class="img_wrapper"><img src="/images/contents/main_04.png"></div>
				<p>전문적이고 신속한<br> 고객센터 운영</p>
			</div>
		</div>
	</div>
</section>


	<!-- //mcon01_list -->
	<!-- mcon02 -->
<section class="section_3" >
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h5>트레이드</h5>
				<div class="mcon02_list">
					<table>
						<colgroup>
							<col width="20%"></col>
							<col width="20%"></col>
							<col width="20%"></col>
							<col width="20%"></col>
							<col width="20%"></col>
						</colgroup>
						<thead>
							<tr>
								<th>거래목록</th>
								<th>Limit / Stop</th>
								<th>매도량</th>
								<th>매수량</th>
								<th>바로가기</th>
							</tr>
						</thead>
						<tbody class="runTable">
						</tbody>
					</table>
				</div>
			</div>
			<div class="col-sm-6">
				<h5>공지사항<a href="/pages/fx_pages/notice.jsp">+ 더보기</a></h5>
				<jsp:include page="/module/rb.do" flush="true"><jsp:param name="rbseq" value="6" /></jsp:include>
			</div>
		</div>
	</div>
		<!-- mcon02_list -->
		
		
	<!-- //mcon02 -->
</section>
	
	<!-- mcon03 -->
<section class="section_5">
	<div class="container">
		<h2>FX 마진 거래란?
		</h2>
		<p>
			개인 투자자가 국제 외환거래에 참여할수 있는 시장으로 <br>
			2 개국의 통화를 매도와 매수하는 방식으로 거래됩니다.<br>
			외환시장은 현존하는 시장 중 가장 풍부한 유동성, 가격안정성,<br>
			견고한 추세의 장점을 가지고 있습니다 
			
		</p>
		<a href="/pages/fx_pages/margin_trading.jsp">바로가기</a>
	</div>
</section>
	<!-- //mcon03 -->
	
	
	<!-- mcon04 -->
<div class="section_4 container">
	<div class="row">
		<div class="col-sm-3">
			<h4>고객센터</h4>
			<p>${tagoplusSolution1_session_site.customerCenter }<br>
			   ${tagoplusSolution1_session_site.businessHours }</p>
			<a href="/pages/fx_pages/consulting.jsp">1:1문의</a>
		</div>
		<div class="col-sm-3">
			<h4>이용안내</h4>
			<p>${SITE_NAME_U }에 대한 전반적인</p>
			<p>이용방법을 안내해 드립니다.</p>
			<a href="/pages/fx_pages/instruction.jsp">바로가기</a>
		</div>
		<div class="col-sm-3">
			<h4>입출금</h4>
			<p>신속한 입금과 출금처리를<br> 지원해 드립니다.</p>
			<a href="/deposit/list.do">신청하기</a>
		</div>
		<div class="col-sm-3">
			<h4>나의거래</h4>
			<p>실시간 나의 거래를</p>
			<p>확인하실 수 있습니다.</p>
			<a href="/mypage/history_popup.do">바로가기</a>
		</div>
	</div>
</div>
	<!-- //mcon04 -->
	

<script>

var	currentTime,
	nextTime,
	diffTime,
	diffHour,
	diffMinute,
	nextHour,
	nextMinute;
	
setInterval(function() {
	var time = Math.floor(Date.now()/1000);
	currentTime = time*1;
	nextTime = Math.ceil(time/120)*120;
	nextHour = moment(nextTime*1000).format('HH'),
	nextMinute = moment(nextTime*1000).format('mm');
	diffTime = nextTime - currentTime;
	diffHour = moment.utc(diffTime*1000).format('mm'),
	diffMinute = moment.utc(diffTime*1000).format('ss'),
	$('.time').each(function(){
		var value = $(this).data('time');
		$(this).text(eval(value));
	})
}, 1000);
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
