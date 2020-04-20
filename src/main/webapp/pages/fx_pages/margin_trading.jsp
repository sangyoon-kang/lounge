<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<script src="https://unpkg.com/webp-hero@0.0.0-dev.21/dist-cjs/polyfills.js"></script>
<script src="https://unpkg.com/webp-hero@0.0.0-dev.21/dist-cjs/webp-hero.bundle.js"></script>
<script>
 var webpMachine = new webpHero.WebpMachine();
 webpMachine.polyfillDocument();
</script>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<section class="wrap_scon">
		<div class="scon">
			<ul class="board_tab_sty01 board_tab_sty01_num04">
				<li class="current" data-tab="board-tab-1">FX마진거래</li>
				<li class="" data-tab="board-tab-2">시장 현황 및 규모</li>
				<li class="" data-tab="board-tab-3">시장구조</li>
				<li class="" data-tab="board-tab-4">거래 통화</li>
			</ul>
		</div>
		<div id="board-tab-1" class="board-tab-content current">
			<div class="scon" style="padding-top:0;">
				<div class="fx_con">
					<h3 class="fx_tit"><strong>FX마진거래란</strong> 외국통화의 매수 혹은 매도를 통해 차익을 실현하는 거래 형태를 말합니다.</h3>
					<p>전세계 통화의 환율은 시시각각 변하고 있는데, 이러한 변화를 이용하여 이익을 창출하는 것이 FX마진거래의 핵심입니다. FX마진거래의 기본 성격은 이종 통화 간 현물환 거래이지만, 현물환보다는 계약 단위가 작고 증거금율도 낮으며, 현물이 오고 가지 않는 차액결제 방식을 채택하고 있습니다.</p>
					<p>FX마진거래의 최대 장점은 양방향 수익구조를 가지고 있어 매수 또는 매도 포지션 진입이 모두 가능하다는 것입니다. 환율 변동에 따른 차익 외에도, 통화 간 금리차로 인해 발생하는 “Swap Point”에 따른 차익, 적은 자금으로도 큰 규모의 거래가 가능하다는 점 등이 FX마진거래의 특징이라고 할 수 있습니다.</p>
					<p>달러/엔 (USD/JPY)을 예로 들자면, 달러 당 환율이 100엔일 경우 1달러를 100엔과 교환할 수 있습니다. 환율이 달러 당 120엔으로 상승하면 (엔화 약세), 보유하고 있는 1달러를 120엔과 교환함으로써 20엔의 차익을 얻을 수 있습니다. 이를 환차익이라고 부릅니다.</p>
					<p>환율시장의 변동은 달러를 엔으로 교환하고자 하는 사람과, 엔을 달러로 교환하고자 하는 사람 간의 균형 (수요와 공급)에 의해 결정되므로, 인기가 높은 통화의 환율은 오르고, 반대로 인기가 낮은 통화의 환율은 내려갑니다.</p>
				</div>
			</div>
		</div>


		<div id="board-tab-2" class="board-tab-content">
			<div class="scon" style="padding-top:0;">
				<p class="fx_con02">외환시장은 본래 국제적으로 은행 간 거래가 주를 이루는 제한된 시장이었으나, 지금은 각국의 중앙은행, 상업 및 투자은행, 헤지펀드, 일반기업, 개인 등 다양한 주체들이 참가하고 있습니다.</p>
				<p class="fx_con02">국내에서는 2005년 선물거래법 시행령 개정을 기하여 개인투자자들에게도 FX시장 참여를 허용하였으며, 통신사업의 급속한 발전으로 말미암아 온라인 거래가 가능해지면서 개인투자자들은 HTS (Home Trading System)을 통해 24시간 동안 거래를 할 수 있게 되었습니다.</p>
				<p class="fx_con02">외환시장은 전세계에서 규모가 가장 큰 금융시장입니다. 하루 평균거래량은 무려 3.2조 달러에 육박하며, 이는 전세계 증권시장의 일일 평균거래량의 10배 이상, NYSE (뉴욕증권거래소)의 일일 평균거래량의 35배 이상, 남녀노소 막론 전세계 인구가 하루 평균 $500 가까이 거래하는 규모입니다. 동 규모 중 현물환 시장이 차지하는 비중은 1/3 수준입니다</p>
				<div class="fx_con02_box">
					<h3>외환상품 별 <br/>일일 평균거래량<span>출처 : BIS Triennial Survey 2007</span></h3>
					<img src="/images/contents/fx_con02_img01.png" />
				</div>
			</div>
			<div class="fx_con02_bg">
				<div class="scon">
					<p class="fx_con02_02">FX시장에서의 주요 시장으로는 런던, 미국, 도쿄가 있으며, 이 중 미국과 영국이 전체 거래량의 50% 이상을 차지하고 있습니다. 따라서, 미국과 영국 시장이 겹치는 오후 10시부터 익일 오전 2시 (한국시간 기준)까지 거래가 가장 활발합니다. 특히, 미국 달러의 경우 전체 외환거래의 80% 이상에 관여하고 있으며, 이는 일 2.7조 달러에 상당하는 규모입니다.</p>

					<!--list_basic_type01-->
					<div class="board_basic_type01 fx_board_basic_type01">
						<table>
							<colgroup>
								<col width="17%"></col>
								<col width="17%"></col>
								<col width="17%"></col>
								<col width="17%"></col>
								<col width="16%"></col>
								<col width="16%"></col>
							</colgroup>
							<tbody>
								<tr>
									<th colspan="2">지역 별 일일 평균 거래량</th>
									<th colspan="2">통화 별 일일 평균 거래량</th>
									<th colspan="2">통화 별 일일 평균 거래량</th>
								</tr>
								<tr>
									<th>국가</th>
									<th>점유율</th>
									<th>통화</th>
									<th>점유율</th>
									<th>통화조합</th>
									<th>점유율</th>
								</tr>
								<tr>
									<td>영국</td>
									<td>34.1%</td>
									<td>USD</td>
									<td>86.3%</td>
									<td>EUR/USD</td>
									<td>27%</td>
								</tr>
								<tr>
									<td>미국</td>
									<td>16.6%</td>
									<td>EUR</td>
									<td>37.0%</td>
									<td>USD/JPY</td>
									<td>13%</td>
								</tr>

								<tr>
									<td>스위스</td>
									<td>6.1%</td>
									<td>JPY</td>
									<td>16.5%</td>
									<td>GBP/USD</td>
									<td>12%</td>
								</tr>
								<tr>
									<td>일본</td>
									<td>6.0%</td>
									<td>GBP</td>
									<td>15.0%</td>
									<td>AUD/USD</td>
									<td>6%</td>
								</tr>
								<tr>
									<td>싱가포르</td>
									<td>5.8%</td>
									<td>CHF</td>
									<td>6.8%</td>
									<td>AUD/CAD</td>
									<td>4%</td>
								</tr>
								<tr>
									<td>홍콩</td>
									<td>4.4%</td>
									<td>AUD</td>
									<td>6.7%</td>
									<td>AUD/CAD</td>
									<td>4%</td>
								</tr>
								<tr>
									<td>호주</td>
									<td>4.3%</td>
									<td>CAD</td>
									<td>4.2%</td>
									<td>EUR/JPY</td>
									<td>2%</td>
								</tr>
								<tr>
									<td>프랑스</td>
									<td>3.0%</td>
									<td>SEK</td>
									<td>2.8%</td>
									<td>EUR/GBP</td>
									<td>2%</td>
								</tr>
								<tr>
									<td>독일</td>
									<td>2.5%</td>
									<td>HKD</td>
									<td>2.2%</td>
									<td>EUR/CHF</td>
									<td>2%</td>
								</tr>
								<tr>
									<td>덴마크</td>
									<td>2.2%</td>
									<td>NOK</td>
									<td>2.2%</td>
									<td>기타</td>
									<td>27%</td>
								</tr>
								<tr>
									<td>기타</td>
									<td>15.0%</td>
									<td>NZD</td>
									<td>1.9%</td>
									<td>-</td>
									<td>-</td>
								</tr>

								<tr>
									<td>-</td>
									<td>-</td>
									<td>기타</td>
									<td>17.8%</td>
									<td>-</td>
									<td>-</td>
								</tr>
								<tr>
									<td>합계</td>
									<td>100%</td>
									<td>합계</td>
									<td>100%</td>
									<td>합계</td>
									<td>100%</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!--//list_basic_type01-->
					<p class="f_con02_aside_txt">거래 별 두 종류의 통화가 관여되기 때문에 개별 통화의 백분율 합계는 200%임</p>
					<p class="f_con02_aside_txt02">※ 출처 : BIS Triennial Survey 2007</p>
				</div>
			</div>

		</div>

		<div id="board-tab-3" class="board-tab-content ">
			<div class="scon" style="padding-top:0;">
				<p class="fx_con02">FX마진거래에서 개인 투자자가 국내 증권사 또는 선물사 (Introducing Broker)를 통해 주문을 넣으면, 해당 주문은 해외파생상품시장회원 (FDM: Forex Dealer Member)을 통해 은행으로 넘어가게 되고, 은행은 국제은행 간 시장 (Interbank Market)에서 타 은행과 주문을 거래합니다. 즉, FX마진거래의 거래 참여자는 개인 투자자, IB (Introducing Broker), FDM (Forex Dealer Member), 은행 (Interbank)으로 요약될 수 있습니다.</p>
				<div class="fx_con02_box fx_con02_box02">
					<img src="/images/contents/fx_con03_img01.png" class="pc_img"/>
					<img src="/images/contents/fx_con02_img01_m.jpg" class="m_img"/>
				</div>
			</div>
		</div>

		<div id="board-tab-4" class="board-tab-content">
			<div class="scon" style="padding-top:0;">
				<p class="fx_con02">아래와 같이 거래 가능한 상품을 제공하고 있으며, 추후 거래대상 종목은 추가 또는 삭제될 수 있습니다.</p>
				<!--list_basic_type01-->
				<div class="board_basic_type01 fx_board_basic_type02">
					<table>
						<colgroup>
							<col width="34%"></col>
							<col width="33%"></col>
							<col width="33%"></col>
						</colgroup>
						<thead>
							<tr>
								<th>외화기호 (FX Symbol)</th>
								<th>통화조합 (Currency Pair)</th>
								<th>통화명 (Trading Terms)</th>
							</tr>
						</thead>
						<tbody>
							
							<tr>
								<td>EUR/USD</td>
								<td>Euro/US Dollar</td>
								<td>Euro Dollar</td>
							</tr>
							<tr>
								<td>USD/JPY</td>
								<td>US Dollar/Japanese Yen</td>
								<td>Dollar Yen</td>
							</tr>

							<tr>
								<td>GBP/USD</td>
								<td>British Pound/US Dollar</td>
								<td>Sterling Dollar</td>
							</tr>
							<tr>
								<td>USD/CHF</td>
								<td>US Dollar/Swiss Franc</td>
								<td>Dollar Swissy</td>
							</tr>
							<tr>
								<td>USD/CAD</td>
								<td>US Dollar/Canadian Dollar</td>
								<td>Dollar Loonie</td>
							</tr>
							<tr>
								<td>AUD/USD</td>
								<td>Australian Dollar/US Dollar</td>
								<td>Aussie Dollar</td>
							</tr>
							<tr>
								<td>EUR/JPY</td>
								<td>Euro/Japanese Yen</td>
								<td>Euro Yen</td>
							</tr>
							<tr>
								<td>EUR/GBP</td>
								<td>Euro/British Pound</td>
								<td>Euro Sterling</td>
							</tr>
							<tr>
								<td>EUR/CHF</td>
								<td>Euro/Swiss Franc</td>
								<td>Euro Swissy</td>
							</tr>
							<tr>
								<td>GBP/JPY</td>
								<td>British Pound/Japanese Yen</td>
								<td>Sterling Yen</td>
							</tr>
							<tr>
								<td>EUR/AUD</td>
								<td>Euro/Australian Dollar</td>
								<td>Euro Aussie</td>
							</tr>

							<tr>
								<td>NZD/USD</td>
								<td>New Zealand Dollar/US Dollar</td>
								<td>Kiwi Dollar</td>
							</tr>
							<tr>
								<td>NZD/JPY</td>
								<td>New Zealand Dollar/Japanese Yen</td>
								<td>Kiwi Yen</td>
							</tr>
							<tr>
								<td>GBP/CHF</td>
								<td>British Pound/Swiss Franc</td>
								<td>Sterling Swissy</td>
							</tr>
							<tr class="tr_bg">
								<td>GBP/AUD</td>
								<td>British Pound/ Australian Dollar</td>
								<td>Sterling Aussie</td>
							</tr>
							<tr>
								<td>CHF/JPY</td>
								<td>Swiss Franc/Japanese Yen</td>
								<td>Swissy Yen</td>
							</tr>
							<tr>
								<td>AUD/JPY</td>
								<td>Australian Dollar/Japanese Yen</td>
								<td>Aussie Yen</td>
							</tr>
							<tr>
								<td>AUD/NZD</td>
								<td>Australian Dollar/New Zealand Dollar</td>
								<td>Aussie Kiwi</td>
							</tr>
							<tr>
								<td>CAD/JPY</td>
								<td>Canadian Dollar/Japanese Yen</td>
								<td>Loonie Yen</td>
							</tr>
							<tr>
								<td>EUR/NZD</td>
								<td>Euro/New Zealand Dollar</td>
								<td>Euro Kiwi</td>
							</tr>
						</tbody>
					</table>
				</div>
				<!--//list_basic_type01-->
			</div>
		</div>

		
	</section>
<script>

$(document).ready(function(){
	
	$('.board_tab_sty01 li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('.board_tab_sty01 li').removeClass('current');
		$('.board-tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})    
	
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>