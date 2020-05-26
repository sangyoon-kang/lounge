<%@ page language="java" contentType="text/html;charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<script type="text/javascript" src="/common/js/charting_library/charting_library/charting_library.min.js"></script>
<script type="text/javascript" src="/common/js/charting_library/datafeeds/udf/dist/polyfills.js"></script>
<script type="text/javascript" src="/common/js/charting_library/datafeeds/udf/dist/bundle.js"></script>
<script type="text/javascript" src="/common/js/jquery/waitMe/waitMe.js"></script>
<link href="/common/js/jquery/waitMe/waitMe.css" rel="stylesheet" type="text/css" />
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<script type="text/javascript">
	var device ='';
	var limit;
	$(document).ready(function(){
		if (window.matchMedia('(max-width: 767px)').matches) {
			device = 'mobile';
			limit = 600;
		} else{
			limit = 3600;
		}
		setTimeout(function(){
			getUserCash();
		},1000)
	})

	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
				results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function initOnReady() {
		var widget = window.tvWidget = new TradingView.widget({
			// debug: true, // uncomment this line to see Library errors and warnings in the console
			//fullscreen: false,
			width: '100%',
			autosize: true,
			symbol: 'GBPAUD',
			interval: ${search.runTime},
			container_id: "tv_chart_container",
			timezone: "Asia/Seoul",
			//	BEWARE: no trailing slash is expected in feed URL
			datafeed: new Datafeeds.UDFCompatibleDatafeed("http://chart.fxlounge.co.kr",1000),
			library_path: "/common/js/charting_library/charting_library/",
			locale: getParameterByName('lang') || "ko",
			client_id: '${URL_HOST_OP}',
			user_id: 'public_user_id',
			theme: 'light',
			preset:device,
		});

		var ts = Math.round((new Date()).getTime() / 1000);
		var min = ts - limit * ${search.runTime};
		var range = {
			from: min,
			to : ts
		};
		var options = {
			applyDefaultRightMargin: false,
			percentRightMargin: 10
		}
		widget.onChartReady(function() {
			widget.chart().setVisibleRange(range,options);
			var button = widget.createButton();
			button.setAttribute('title', '툴바와 함께 차트 크게 보기');
		    button.addEventListener('click', function() {
				openPop('?runTime=${search.runTime}','largeChartPopup');
		    });
		    button.textContent = '차트 크게보기';
		});



	};

	window.addEventListener('DOMContentLoaded', initOnReady, false);
</script>
<style>
	.input-group-append {
		min-width: 50px;
	}

	.grid-stl {
		display: inline-flex;
		align-items: center;
		justify-content: center;
	}

	.ms2 {
		margin-left: 0.2rem;
	}

	#tv_chart_container {
		height: 400px;
	}

	@media ( max-width :576px) {
		#tv_chart_container {
			height: 300px;
		}
	}


	td.disabled .trade_max, td.disabled .price {
		opacity: .3;
		pointer: disabled !important;
		pointer-events: none;
	}

	td.disabled .price {
		color: transparent !important;
		position: relative;
	}

	td.disabled .price::after {
		content: '마감';
		color: white;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		position: absolute;
	}
	.disabled .trade_stxt{
		color: rgb(255, 255, 255);
		position: relative;
		opacity:.4;
	}
	.disabled .trade_stxt::after{
		color: rgb(255, 255, 255);
		position: relative;
		content: '0';
		color: rgba(0,0,0,.3);
		position: absolute;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
</style>
<fmt:formatNumber pattern="#,##0" var="LOT1_PRICE" value="${LOT_01}" />
<fmt:formatNumber pattern="#,##0" var="LOT2_PRICE" value="${LOT_02}" />
<fmt:formatNumber pattern="#,##0" var="LOT10_PRICE" value="${LOT_1}" />
<fmt:formatNumber pattern="#,##0" var="LOT20_PRICE" value="${LOT_2}" />
<fmt:formatNumber pattern="#,##0" var="LOT40_PRICE" value="${LOT_4}" />


<section class="wrap_scon">
	<div class="scon">
		<form id="contractForm" name="contractForm"
			  action="./contract_proc.do" method="post">
			<input type="hidden" name="goodsDate" value="" /> <input
				type="hidden" name="goodsTime" value="" /> <input type="hidden"
																  name="bsType" value="B" /> <input type="hidden" name="totalLot"
																									value="" /> <input type="hidden" name="runTime" value="" /> <input
				type="hidden" name="buyLot1" value="" /> <input type="hidden"
																name="buyLot2" value="" /> <input type="hidden" name="buyLot10"
																								  value="" /> <input type="hidden" name="buyLot20" value="" /> <input
				type="hidden" name="buyLot40" value="" /> <input type="hidden"
																 name="sellLot1" value="" /> <input type="hidden" name="sellLot2"
																									value="" /> <input type="hidden" name="sellLot10" value="" /> <input
				type="hidden" name="sellLot20" value="" /> <input type="hidden"
																  name="sellLot40" value="" />
		</form>
		<div class="trade_con01">
			<!--PC 에서 나오는 곳-->
			<ul class="m_none">
				<li><span>회원명</span><strong>${tagoplusSolution1_session_user.userName }</strong></li>
				<li><span>지점명</span><strong>${tagoplusSolution1_session_user.gradeLevel ne 6 ? tagoplusSolution1_session_user.nickname : tagoplusSolution1_session_user.recommNickname }</strong></li>
				<li><span>종목</span><strong>GBPAUD</strong></li>
				<li><span>보유보증금</span><strong class="txt_blue userCash"><fmt:formatNumber
						pattern="#,##0" value="${cash}" /></strong></li>
			</ul>
			<!--모바일 에서 나오는 곳-->
			<ul class="m_block">
				<li><span>${tagoplusSolution1_session_user.userName }</span></li>
				<li><span>종목</span><strong>GBP / AUD.M</strong></li>
				<li><span>보유보증금</span><strong class="txt_blue userCash" ><fmt:formatNumber
						pattern="#,##0" value="${cash}" /></strong></li>
			</ul>
		</div>
		<div class="trade_con04">
			<div class="trade_con04_graph">

				<div id="tv_chart_container" class="mb-4"
					 style="border-top: 4px solid rgb(224, 227, 235);"></div>

			</div>
			<div class="trade_con04_list">
				<h3>
					종목<strong>GBP / AUD</strong>
				</h3>
				<div class="trade_con04_list_con">
					<table>
						<colgroup>
							<col></col>
							<col></col>
							<col></col>
						</colgroup>
						<thead>
						<tr>
							<th>진행시간</th>
							<th>시가</th>
							<th>진행사항</th>
						</tr>
						</thead>
						<tbody id="resultbody">
						<c:forEach items="${resultList}" var="m" varStatus="s">
							<tr>
								<fmt:formatDate var="rDate" value="${m.modTime }" pattern="dd" />
								<fmt:formatDate var="rHour" value="${m.modTime }" pattern="HH" />
								<fmt:formatDate var="rMinute" value="${m.modTime }"
												pattern="mm" />
								<td>${rDate }일${rHour }시 ${rMinute }분</td>
								<td>${m.eVal }</td>
								<td><span
										style="color:<c:choose>
										<c:when test="${m.goodsResult == 'U' }">#d92222</c:when>
										<c:when test="${m.goodsResult == 'D' }">#4c84ff</c:when>
											<c:when test="${m.goodsResult == 'T' }"></c:when>
											<c:otherwise></c:otherwise>
												</c:choose>">
										${m.rTime} </span></td>
							</tr>
						</c:forEach>


						</tbody>
					</table>
				</div>
				<a href="/mypage/history_popup.do?deal=${search.runTime}" class="trade_con04_list_bt"><span>나의
						거래내역</span></a>
			</div>
			<div class="trade_con02">
				<ul>
					<li><span>남은 계약시간</span><strong class="text-red remain-time">${diff} </strong></li>
					<li><span>다음 계약시간</span><strong class="next-time">${next}</strong></li>
				</ul>
			</div>
			<div class="mcon02_list trade_con03">
				<table>
					<colgroup>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
					</colgroup>
					<thead>
					<tr>
						<th>다음계약시간</th>
						<th>수량</th>
						<th>실현실격</th>
						<th>매수</th>
						<th>매도</th>
					</tr>
					</thead>
					<tbody class="table_body">
					<c:if test="${isWorkingHour }">
<%--						<tr>--%>
<%--							<td colspan="5"><h3>${SITE_NAME_U}의운영시간은--%>
<%--									${runTimeList.breakEnd}시-${runTimeList.breakStart}시까지 입니다</h3></td>--%>
<%--						</tr>--%>
						<tr>
							<td colspan="5"><h3>${SITE_NAME_U}의 운영시간은
									월요일 ${runTimeList.breakEnd}시 ~ 토요일 ${runTimeList.breakStart}시까지 입니다</h3></td>
						</tr>
					</c:if>


					<c:if test="${!isWorkingHour }">
						<tr>
							<td class="d-m-none next-time next-time">${next}</td>
							<td>0.1Lot</td>
							<td>${runTimeList.stopLimit}
								<ul class="mcon02_arrow">
									<li><img src="/images/main/mcon03_ico_up.png" alt="상승" /></li>
									<li><img src="/images/main/mcon03_ico_down.png" alt="하락" /></li>
								</ul>
							</td>
							<td
									class="${classlist.BLot1class }">
								<span class="trade_stxt" data-maxbuy="maxLot1">${remainList.buyLot1Remain}</span><a
									onclick="javascript:addLot('up',1);" class="price  trade_red">${vo.buyLot1State eq 'E' or empty vo ? '마감' : LOT1_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("up",1,"${runTimeList.maxBuyCnt1}")'
									class="trade_max">MAX</a> <input type="hidden" name="upLot1"
																	 data-val="buyLot1" class="inputLot" data-price="5,000"
																	 data-lot="BLot1" data-amount="1"
																	 data-autoclose="${vo.autoClose1}"
																	 data-max="${runTimeList.maxBuyCnt1}" value="0" />
							</td>
							<td
									class="${classlist.SLot1class }">
								<span class="trade_stxt trade_stxt_blue" data-maxbuy="sellLot1">${remainList.sellLot1Remain}</span><a
									onclick="javascript:addLot('down',1);"
									class=" price trade_red trade_blue">${vo.buyLot1State eq 'E' or empty vo ? '마감' : LOT1_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("down",1,"${runTimeList.maxBuyCnt1}")'
									class="trade_max">MAX</a> <input type="hidden" name="downLot1"
																	 data-val="sellLot1" class="inputLot" data-price="5,000"
																	 data-lot="SLot1" data-amount="1"
																	 data-autoclose="${vo.autoClose1}"
																	 data-max="${runTimeList.maxBuyCnt1}" value="0" />
							</td>
						</tr>
						<tr>
							<td class="d-m-none next-time">${next}</td>
							<td>0.2Lot</td>
							<td>${runTimeList.stopLimit}
								<ul class="mcon02_arrow">
									<li><img src="/images/main/mcon03_ico_up.png" alt="상승" /></li>
									<li><img src="/images/main/mcon03_ico_down.png" alt="하락" /></li>
								</ul>
							</td>
							<td
									class="${classlist.BLot2class }">
								<span class="trade_stxt" data-maxbuy="maxLot2">${remainList.buyLot2Remain}</span><a
									onclick="javascript:addLot('up',2);" class="price  trade_red">${vo.buyLot2State eq 'E' or empty vo ? '마감' : LOT2_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("up",2,"${runTimeList.maxBuyCnt2}")'
									class="trade_max">MAX</a> <input type="hidden" name="upLot2"
																	 data-val="buyLot2" class="inputLot" data-price="10,000"
																	 data-lot="BLot2" data-amount="2"
																	 data-autoclose="${vo.autoClose2}"
																	 data-max="${runTimeList.maxBuyCnt2}" value="0" />
							</td>
							<td
									class="${classlist.SLot2class }">
								<span class="trade_stxt trade_stxt_blue" data-maxbuy="sellLot2">${remainList.sellLot2Remain}</span><a
									onclick="javascript:addLot('down',2);"
									class="price  trade_red trade_blue">${vo.buyLot2State eq 'E' or empty vo ? '마감' : LOT2_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("down",2,"${runTimeList.maxBuyCnt2}")'
									class="trade_max">MAX</a> <input type="hidden" name="downLot2"
																	 data-val="sellLot2" class="inputLot" data-price="10,000"
																	 data-lot="SLot2" data-amount="2"
																	 data-autoclose="${vo.autoClose2}"
																	 data-max="${runTimeList.maxBuyCnt2}" value="0" />
							</td>
						</tr>

						<tr>
							<td class="d-m-none next-time">${next}</td>
							<td>1Lot</td>
							<td>${runTimeList.stopLimit}
								<ul class="mcon02_arrow">
									<li><img src="/images/main/mcon03_ico_up.png" alt="상승" /></li>
									<li><img src="/images/main/mcon03_ico_down.png" alt="하락" /></li>
								</ul>
							</td>
							<td
									class="${classlist.BLot3class }">
								<span class="trade_stxt" data-maxbuy="maxLot10">${remainList.buyLot10Remain}</span><a
									onclick="javascript:addLot('up',10);" class="price  trade_red">${vo.buyLot10State eq 'E' or empty vo ? '마감' : LOT10_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("up",10,"${runTimeList.maxBuyCnt3}")'
									class="trade_max">MAX</a> <input type="hidden" name="upLot10"
																	 data-val="buyLot10" class="inputLot" data-price="50,000"
																	 data-lot="BLot3" data-amount="10"
																	 data-autoclose="${vo.autoClose10}"
																	 data-max="${runTimeList.maxBuyCnt3}" value="0" />
							</td>
							<td
									class="${classlist.SLot3class }">
								<span class="trade_stxt trade_stxt_blue" data-maxbuy="sellLot10">${remainList.sellLot10Remain}</span><a
									onclick="javascript:addLot('down',10);"
									class="price  trade_red trade_blue">${vo.buyLot10State eq 'E' or empty vo ? '마감' : LOT10_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("down",10,"${runTimeList.maxBuyCnt3}")'
									class="trade_max">MAX</a> <input type="hidden" name="downLot10"
																	 data-val="sellLot10" class="inputLot" data-price="50,000"
																	 data-lot="SLot3" data-amount="10"
																	 data-autoclose="${vo.autoClose10}"
																	 data-max="${runTimeList.maxBuyCnt3}" value="0" />
							</td>
						</tr>
						<tr>
							<td class="d-m-none next-time">${next}</td>
							<td>2Lot</td>
							<td>${runTimeList.stopLimit}
								<ul class="mcon02_arrow">
									<li><img src="/images/main/mcon03_ico_up.png" alt="상승" /></li>
									<li><img src="/images/main/mcon03_ico_down.png" alt="하락" /></li>
								</ul>
							</td>
							<td
									class="${classlist.BLot4class }">
								<span class="trade_stxt" data-maxbuy="maxLot20">${remainList.buyLot20Remain}</span><a
									onclick="javascript:addLot('up',20);" class="price  trade_red">${vo.buyLot20State eq 'E' or empty vo ? '마감' : LOT20_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("up",20,"${runTimeList.maxBuyCnt4}")'
									class="trade_max">MAX</a> <input type="hidden" name="upLot20"
																	 data-val="buyLot20" class="inputLot" data-price="100,000"
																	 data-lot="BLot4" data-amount="20"
																	 data-autoclose="${vo.autoClose20}"
																	 data-max="${runTimeList.maxBuyCnt4}" value="0" />
							</td>
							<td
									class="${classlist.SLot4class }">
								<span class="trade_stxt trade_stxt_blue" data-maxbuy="sellLot20">${remainList.sellLot20Remain}</span><a
									onclick="javascript:addLot('down',20);"
									class="price  trade_red trade_blue">${vo.buyLot20State eq 'E' or empty vo ? '마감' : LOT20_PRICE}<span>(0)</span></a><a
									onclick='javascript:addLot("down",20,"${runTimeList.maxBuyCnt4}")'
									class="trade_max">MAX</a> <input type="hidden" name="downLot20"
																	 data-val="sellLot20" class="inputLot" data-price="100,000"
																	 data-lot="SLot4" data-amount="20"
																	 data-autoclose="${vo.autoClose20}"
																	 data-max="${runTimeList.maxBuyCnt4}" value="0" />
							</td>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td><strong class="trade_btxt">신청금액</strong></td>
							<td><strong class="trade_brtxt" id="upTotal">0<input
									type="hidden" name="upTotal"></strong></td>
							<td><strong class="trade_bbtxt" id="downTotal">0<input
									type="hidden" name="downTotal"></strong></td>
						</tr>
					</c:if>
					<tr id="CL" style="display: none">
						<td colspan=5><h3>API데이터 수신 지연으로 인해 서비스가 잠시 중단되었습니다.</h3></td>
					<tr>
					</tbody>
					<!--모바일에서는 사라지는 영역입니다-->
					<tfoot class="m_none">
					<tr>
						<td colspan="2">매수 거래시 LIMIT 실현 <strong
								class="trade_f_txt trade_f_red_txt">${runTimeList.stopLimit}</strong>
							/ STOP 실격 <strong class="trade_f_txt trade_f_blue_txt">${runTimeList.stopLimit}</strong>
							<br /> 매도 거래시 STOP 실현 <strong
									class="trade_f_txt trade_f_blue_txt">${runTimeList.stopLimit}</strong>
							/ LIMIT 실격 <strong class="trade_f_txt trade_f_red_txt">${runTimeList.stopLimit}</strong></td>
						<td></td>
						<td><a id="buyUp" onclick="javascript:doSubmit('B')"
							   class="trade_red_bt trade_submit ${runTimeList.autoCloseAll >=remainingTime ? 'disabled':''}">매수신청</a>
							<a onclick="javascript:resetOne('up')" class="trade_red_bt02">초기화</a>
							<a onclick="maxOne('up')" class="trade_red_bt02">MAX</a>

						</td>
						<td><a id="buyDown" onclick="javascript:doSubmit('S')"
							   class="trade_red_bt trade_blue_bt trade_submit ${runTimeList.autoCloseAll >=remainingTime ? 'disabled':''}">매도신청</a>
							<a onclick="javascript:resetOne('down')" class="trade_red_bt02">초기화</a>
							<a onclick="maxOne('down')" class="trade_red_bt02">MAX</a>
						</td>

					</tr>
					</tfoot>
				</table>
				<!--모바일에서 나오는 부분입니다.-->
				<ul class="trade_con03_mobile_bt">
					<li>
						<a id="buyUp" onclick="javascript:doSubmit('B')" class="trade_red_bt trade_submit ${runTimeList.autoCloseAll >=remainingTime ? 'disabled':''}">매수신청</a>
						<a id="buyDown" onclick="javascript:doSubmit('S')" class="trade_red_bt trade_blue_bt trade_submit ${runTimeList.autoCloseAll >=remainingTime ? 'disabled':''}">매도신청</a>
						<a onclick="javascript:resetOne('up')" class="trade_red_bt02">초기화</a>
						<a onclick="maxOne('up')" class="trade_red_bt02">MAX</a>
						<a onclick="javascript:resetOne('down')" class="trade_red_bt02">초기화</a>
						<a onclick="maxOne('down')" class="trade_red_bt02">MAX</a>
					</li>
					<li>매수 거래시 STOP실적 <strong class="trade_f_txt trade_f_blue_txt">${runTimeList.stopLimit}</strong>
						/ Limit실현 <strong class="trade_f_txt trade_f_red_txt">${runTimeList.stopLimit}</strong><br />매도
						거래시 STOP실적 <strong class="trade_f_txt trade_f_red_txt">${runTimeList.stopLimit}</strong>
						/ Limit실현 <strong class="trade_f_txt trade_f_blue_txt">${runTimeList.stopLimit}</strong></li>
				</ul>

			</div>
		</div>

		<input type="hidden" name="autoCloseAll">




		<!-- mcon02_list -->

		<!-- //mcon02_list -->

		<!-- trade_con04 -->

		<!-- //trade_con04 -->
		<div id="printview" class="popup_wrap pop_agreement"
			 style="display: none">
			<div class="popup">
				<div class="title_area">
					<h1>거래약정서</h1>
					<a href="javascript:closeView();" class="btn_close"></a>
				</div>
				<div class="pop_cons">
					<div class="pop_agree_up">
						<h3 class="pop_agree_tit">
							손익분배계약서<span class="pop_agreement_tag_red" id="buyOrSell">매수</span>
						</h3>
						<p class="pop_agree_txt">
							금융투자상품(FX마진거래) 투자자(당사)의 <br />±손익권 조건부 손익분배계약서
						</p>
						<div class="pop_agree_con">
							<p id="vDate" class="txt"></p>
							<p id="vLoss">
								<span>보증금</span>
								<strong></strong>
							</p>

							<p id="ctbox" class="aside_con"></p>
						</div>
						<p class="pop_agree_time ">
							<span>거래가능시간 </span><span class="remain-time">${diff}</span>
						</p>
						<p class="pop_agree_bt" id="submitBtnP">

							<a id="submitContrBtn" class="bg-blue"
							   onclick="submit_contract(this)"></a>
						</p>
						<ul class="pop_agree_list">
							<li>FX마진거래 손익분배 계약 보증금은 차손발생시 귀속되는 계약입니다.</li>
							<li>FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서 반드시 이용약관 및 설명서를
								읽어보시고 계약하시기 바랍니다.</li>
						</ul>

						<p class="pop_agree_txt02">
							<span class="tit">문의전화</span><strong>${tagoplusSolution1_session_site.customerCenter }</strong>
						</p>
						<script>
							function printContent(el){
								var restorepage = $('body').html();
								var printcontent = $('#' + el).clone();

								$('body').empty().html(printcontent);
								window.print();
								$('body').html(restorepage);

							}
						</script>

						<a onclick="printContent('printview');" class="bt_print">프린트하기</a>

					</div>

					<div class="pop_agree_down">
						<p>공동투자 및 MOU금융투자상품 FX마진거래 (GBP/AUD) 포지션에서 실시간 발생되는 ± ${runTimeList.stopLimit}pip 실현시
							(손 익분배율 ${rateVo.lineRateT }%) 차익지급종료 실격시 차손소멸종료 되는 약정입니다.</p>
						<!--list_basic_type01-->
						<div class="board_basic_type01">
							<table>
								<colgroup>
									<col></col>
									<col></col>
								</colgroup>
								<thead>
								<tr>
									<th colspan="2">단위</th>
								</tr>
								</thead>
								<tbody id="lotperunit">
								<tr><td>0.1Lot</td><td>₩ <fmt:formatNumber type='number' maxFractionDigits='3' value='${LOT_01-(rateVo.lineRateT*LOT_01/100)}' /></td></tr>
								<tr><td>0.2Lot</td><td>₩ <fmt:formatNumber type='number' maxFractionDigits='3' value='${LOT_02-(rateVo.lineRateT*LOT_02/100)}' /></td></tr>
								<tr><td>1Lot</td><td>₩ <fmt:formatNumber type='number' maxFractionDigits='3' value='${LOT_1-(rateVo.lineRateT*LOT_1/100)}' /></td></tr>
								<tr><td>2Lot</td><td>₩ <fmt:formatNumber type='number' maxFractionDigits='3' value='${LOT_2-(rateVo.lineRateT*LOT_2/100)}' /></td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="bo_area">
					<label><input id="aggreCk" type="checkbox"/>하루 동안 거래약정 계약서 동의하고 팝업 안띄우기</label>
					<a class="fright" href="javascript:closeView();">닫기</a>
				</div>
			</div>

		</div>
		<div>

</section>
<script id="result" type="text/x-jquery-tmpl">
<div class="result_wrapper">
	<div class="result \${color}">\${text}</div>
</div>
</script>
<script id="resultTable" type="text/x-jquery-tmpl">
<tr>
	<td>\${Date }</td>
	<td>\${eVal }</td>
	<td><span style="color: \${color}" >\${rTime} </span></td>
</tr>
</script>
<script type="text/javascript">
	var $runtime =  ${search.runTime};
	var next = moment(${search.nextTime});
	var runT = ${search.runTime} * 60000;
	var time;

	$("#aggreCk").change(function(e){
		if($(e.target).is(":checked")){
			if(confirm('체크 시 거래약정 및 약관에 하루 동안 동의 한 것으로 관주 됩니다.\n오늘 하루 해당 거래약정서 없이 매수/매도 신청시 거래가 이루어 집니다.\n동의 하시겠습니까?')){
				return;
			}else{
				$(e.target).removeAttr("checked");
			}
		}
	});

	setInterval(function() {
		getServerTime();

		var diff = next - time;
		var stop = ${runTimeList.autoCloseAll};

		validateAjaxMaxCount(true).then(function(data){
			if(!isNull(data)){
				$('.inputLot').each(function(){
					limit = $(this).data('autoclose');
					if(next - time <= stop*1000){
						closeView();
						$('.trade_submit').addClass('disabled')
					}else{
						$('.trade_submit').removeClass('disabled')
					}

					if((diff <= limit*1000 || diff <= stop*1000) || (data[$(this).data('lot')] <= 0 || $.isEmptyObject(data)) || data.runTimeVO["runType"] != 'R'){
						$(this).closest('td').addClass('disabled');
						if($(this).val() != 0){
							$(this).val(0);
							addLot('up',0);
							addLot('down',0);
							if($(".pop_agreement").is(':visible'))
								alert('선택한 종목이 마감 되었습니다.')
							closeView()
						}

					} else {
						if ($(this).closest('td').hasClass('disabled')){
							resetAll();
							$(this).closest('td').removeClass('disabled');
						}
					}
				});
			}
		});
		getCurrentResultState();
		getRemaining($runtime);
		getUserCash();
	}, 1000);

	//약정서에서 신청 버튼
	function submit_contract(el) {

		if($("#aggreCk").is(":checked")){
			$.cookie("contractFormAggre",true,{ expires: 1});
		}

		var cnt = 0;
        validateAjaxMaxCount(false).then(function(data){cnt = data.count});
        if(cnt > 0){alert('투자는 1회차마다 한 번만 가능합니다.'); return;}

		$('#printview .pop_cons').waitMe({
			effect: 'ios',
			text: '처리증입니다',
			bg : 'rgba(255,255,255,0.7)',
			color : '#000',
		})
		$.ajax({
			url : "./contract_proc.do",
			method : "POST",
			dataType: 'json',
            async: true,
			data: $("#contractForm").serializeArray(),
			success: function(data){
				if(data.hasOwnProperty("totalPrice")){
                    var currentCash;
                    $('.userCash').each(function(){
                        currentCash = $(this).text().replace(/,/g, "");
                        $(this).text(addComma(parseInt(currentCash)-parseInt(data)))
                    });
                }
                alert(data.message);
                closeView();
                resetAll();
				$('#printview .pop_cons').waitMe("hide");

			}
		}).fail(function() {
            alert( "error" );
        });

	}

	//Confirmation
	function doSubmit(tab){
		/*alert("차트 정보에 지연건이 발생하여 약 10여분간 긴급 점검을 진행합니다.\n불편을 드려 죄송합니다.");
		return;*/
		$.ajax({
			type: 'post',
			url: '/ajax/checkSiteClose.do',
			data: {},
			dataType: 'json',
			success: function(data){
				if(data){
					if(data.siteCloseYn == "Y"){
						alert(data.message.replace(/\\n/g,"\n"));
						return;
					}
				}

				var type = tab == 'B' ? 'up': 'down';
				$("#vLoss > strong").text($("#"+type+"Total").text());
				var runTime = ${search.runTime};
				msg = validateForm(type, true, false);
				if(!isNull(msg)){alert(msg);return;}
				var cnt = 0;
				validateAjaxMaxCount(false).then(function(data){cnt = data.count});
				if(cnt > 0){alert('투자는 1회차마다 한 번만 가능합니다.'); return;}


				var thisForm = document.contractForm;
				$(thisForm).children(':input').val(0);

				thisForm.elements["bsType"].value = tab;
				thisForm.elements["runTime"].value = runTime;


				$('.inputLot[name*='+type+'Lot]').each(function(i,e){
					var $data = $(this).data('val');
					thisForm.elements[$data].value = e.value*${LOT_01};
				});

				var bsType = tab;
				var txtCtbox= "";
				var valueHidden = 0;
				var $inputs = $('input[name^='+type+'Lot]');

				for (i = 0; i < $inputs.length; i++) {
					if($inputs.eq(i).val() !="" && $inputs.eq(i).val() > 0){
						var lotCnt = parseInt($inputs.eq(i).val()) / $inputs.eq(i).data('amount');
						txtCtbox+="<li>₩"+addComma($inputs.eq(i).data('price'))+"*"+lotCnt+"</li>";
					}
					valueHidden = valueHidden + parseInt($inputs.eq(i).val())/10;
				}
				$("#ctbox").html(txtCtbox);
				if (tab == 'B'){
					$("#buyOrSell").text("매수");
					$('#buyOrSell').removeClass('pop_agreement_tag_blue').addClass('pop_agreement_tag_red');
					$('#submitContrBtn').text('매수신청');
					$('#submitBtnP').addClass('red');
				} else {
					$("#buyOrSell").text("매도");
					$('#buyOrSell').removeClass('pop_agreement_tag_red').addClass('pop_agreement_tag_blue');
					$('#submitContrBtn').text('매도신청');
					$('#submitBtnP').removeClass('red');
				}

				$("#vDate").html(moment(Math.floor(time/(1000*$runtime*60))*(1000*$runtime*60)).add($runtime, 'minutes').format('YYYY년 MM월 DD일 HH시 mm분'));
				// if(valueHidden!= null && valueHidden!=0)
				// 	$(".pop_agreement").show();

				thisForm.elements["totalLot"].value= valueHidden;
				thisForm.elements["goodsDate"].value = moment(Math.floor(time/(1000*$runtime*60))*(1000*$runtime*60)).format('YYYY-MM-DD');
				thisForm.elements["goodsTime"].value = moment(Math.floor(time/(1000*$runtime*60))*(1000*$runtime*60)).format('HH:mm');

				var aggre = $.cookie("contractFormAggre");
				if(aggre){
					submit_contract();
				}else{
					if(valueHidden!= null && valueHidden!=0)
						$(".pop_agreement").show();
				}
			}
		}).fail(function(data) {
			alert( "사이트 오픈여부 Ajax 호출 에러, 관리자에게 문의 하세요" );
		});
	}
	//Validate Function

	function closeView(){
		$(".pop_agreement").hide();
	}

	function validateAjaxMaxCount(sync){
		return $.ajax({
			url : "./check_count_max.do",
			type : "get",
			async : sync,
			data: {runtime : ${search.runTime}},
			cache: false
		});
	}

	// functions for LOT
	function resetAll(){
		$("input.inputLot").val(0);
		$('.price span').text('(0)');
		setAll(0)
	}
	function resetOne(direction){
		var $inputs = $("input.inputLot[name^="+direction+"Lot]");
		$("input.inputLot[name^="+direction+"Lot]").val(0);
		console.log(direction,$inputs.length)
		$("input.inputLot[name^="+direction+"Lot]").closest('td').find('.price span').text('(0)');
		$("input[name="+direction+"Total]").val(0);
		$("#"+direction+"Total").text('0');
	}
	function maxAll(){
		var tableRows = $('.trade_con03 td').not('.disabled');
		$(tableRows).each(function(){
			$(this).find('.trade_max').click()
		})
	}
	function maxOne(direction){
		var $lots = [1,2,10,20];
		for (i = 0; i < $lots.length; i++) {
			addLot(direction,$lots[i],"100")
		}

	}
	function setAll(value){
		$("input[name=upTotal]").val(value);
		$("input[name=downTotal]").val(value);
		$("#upTotal").text(addComma(value*${LOT_01}));
		$("#downTotal").text(addComma(value*${LOT_01}));
	}

	function addLot(direction,lot,amount){

		amount = typeof amount !== 'undefined' ? amount : 1;
		var target = direction == "up"? "maxLot":"sellLot";

		var inpt = $("input[name="+direction+'Lot'+lot+"]");
		var remLot = parseInt($("span[data-maxbuy="+target+lot+"]").text())
		var $val = inpt.val();
		var limit = remLot < inpt.data('max')? remLot*lot : inpt.data('max')*lot ;
		var cash = parseInt($('.userCash').first().text().replace(/,/g,""));


		if(parseInt(inpt.val())+lot*amount < limit){
			inpt.val(parseInt(inpt.val())+lot*amount);
		}else{
			inpt.val(limit)
		}

		var totalInpt = $("input[name="+direction+"Total]");
		var totalLot = 0;

		$("input[name*="+direction+"Lot]").each(function(){
			totalLot += parseInt($(this).val());
		});

		if(totalLot*${LOT_01} > cash){
			var curr = parseInt(inpt.val());
			var negative = curr*1 >= totalLot ? 0 : totalLot - curr*1;
			var availableLot = Math.floor((cash - negative*${LOT_01})/(${LOT_01}*lot));
			//alert('렌트보증금이 부족합니다.');
			inpt.val(availableLot*lot)
			totalLot = 0;
			$("input[name*="+direction+"Lot]").each(function(){
				totalLot = totalLot + parseInt($(this).val());
			});
		}


		totalInpt.val(totalLot);
		var priceText = addComma(totalLot*${LOT_01});
		$("#"+direction+"Total").text(priceText);


		inpt.closest('td').find('.price span').text('('+inpt.val()/lot+')')
	}

	function validateForm(tab, type, close){
		var msg = '';
		var isWork = ${isWorkingHour};
		if(isWork){
			msg = '운영 시간이 아닙니다.';
			return msg;
		}

		if($('input[name='+tab+'Total]').val() == 0 && type){
			msg = '선택한 종목이 없습니다.';
			return msg;
		}

		if($('input[name='+tab+'Total]').val()*${LOT_01} > ${cash}){
			msg = '렌트보증금이 부족합니다.';
			return msg;
		}
		if(close){
			msg = '마감 되었습니다.';
			return msg;
		}
		var diff = next - time;
		var allLimit = ${runTimeList.autoCloseAll}
		if(diff <= allLimit*1000){
			msg = '마감 되었습니다.';
			return msg;
		}
		return msg;
	}



	var remainCheck = function(time) {
		var diff = next - time;
		if (diff >= 1000 ) {
			var remain = moment.utc(diff);
			var reminTxt = remain.format("mm:ss");
			$('.remain-time').html(reminTxt);

		} else {
			$('.remain-time').html('00:00');
			if(diff > -1*runT){
				next = next + runT;
				nextTime = Math.ceil(next/runT)*runT;
				nextHour = moment(nextTime).format('HH'),
						nextMinute = moment(nextTime).format('mm');
				$('.next-time').text(nextHour+"시 "+nextMinute+"분");
				setTimeout(function(){
					getLastBar($runtime);
				}, 10000)
				closeView();
			}else{
				nextTime = Math.ceil(time/runT)*runT;
				nextHour = moment(nextTime).format('HH'),
						nextMinute = moment(nextTime).format('mm');
				$('.next-time').text(nextHour+"시 "+nextMinute+"분");
			}
		}

	};

	function getLastBar(runtime){
		var last = next - $runtime*120000;
		$.ajax({
			url: './ajaxLastBar.do',
			datatype: 'json',
			data: {
				runtime: $runtime,
				goodsDate: last,
			},
			success: function(data){
				$('#resultbody').empty();

				for (i = 0; i < data.length; i++) {
					var Date = moment(data[i].modTime).format('DD일 HH시 mm분');
					var color;
					if(data[i].goodsResult == "U"){
						color = "#d92222";
					}else if(data[i].goodsResult == "D"){
						color = "#4c84ff";
					}
					$.tmpl( $('#resultTable'), {"Date": Date,"eVal": data[i].eVal.toFixed(5) , "color": color, "rTime": data[i].rTime}).appendTo("#resultbody");
					if(data[i].modTime == last){
						var alertColor = data[i].rTime == "매도" ? 'blue': 'red';
						showResult(alertColor,data[i].rTime);
					}
				}

				getUserCash()

			}
		})
	}

	function getCurrentResultState(){
		return $.ajax({
			url : "./getCurrentResultState.do",
			type: 'post',
			dataType: 'json',
			async: true,
			data: {},
			success: function (data) {
				if (data.result == "S"){
					$('.table_body tr').hide();
					$('#CL').show();
				} else {

					$('.table_body tr').show();
					$('#CL').hide();
				}
			}
		});
	};

	function getRemaining(runtime){
		return $.ajax({
			url : "./ajaxCheckRemaining.do",
			type: 'post',
			dataType: 'json',
			async: true,
			data: {runtime : runtime*1},
			success: function (data) {
				if(data.GS){
					$('.trade_stxt').each(function() {
						if ($(this).data('maxbuy') == 'maxLot1') {
							$(this).text(data.GS.buyLot1Remain);
						}
						if ($(this).data('maxbuy') == 'maxLot2') {
							$(this).text(data.GS.buyLot2Remain);
						}
						if ($(this).data('maxbuy') == 'maxLot10') {
							$(this).text(data.GS.buyLot10Remain);
						}
						if ($(this).data('maxbuy') == 'maxLot20') {
							$(this).text(data.GS.buyLot20Remain);
						}
						if ($(this).data('maxbuy') == 'sellLot1') {
							$(this).text(data.GS.sellLot1Remain);
						}
						if ($(this).data('maxbuy') == 'sellLot2') {
							$(this).text(data.GS.sellLot2Remain);
						}
						if ($(this).data('maxbuy') == 'sellLot10') {
							$(this).text(data.GS.sellLot10Remain);
						}
						if ($(this).data('maxbuy') == 'sellLot20') {
							$(this).text(data.GS.sellLot20Remain);
						}
					});
				}
			}
		});
	};

	function getServerTime(){
		return $.ajax({
			url : "./getCurrentTime.do",
			type: 'post',
			dataType: 'json',
			data: {},
			success: function (data) {
				remainCheck(data);
				time = data;
			}
		});
	};
	function showResult(color,text){
		$.tmpl( $('#result'), {"color": color,"text": text}).appendTo(document.body);
		$('.result_wrapper').fadeOut(2000,function(){
			$(this).remove();
		})
	}
	function getUserCash(){
		$.ajax({
			url: '/ajax/getUserCash',
			datatype: 'json',
			cache:false,
			data: {
				uid: '${tagoplusSolution1_session_user.userId}'
			},
			success: function(data){
				$('.userCash').text(addComma(data))
			}
		})
	}

</script>



<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
