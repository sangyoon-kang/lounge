<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>

<style type="text/css">
	ul.lot-display {
		list-style: none;
		margin-top: 2.5rem;
		text-align: center;
	}
	ul.lot-display li {
	    width: 50%;
	    float: left;
	    padding-bottom: 10px;
	    font-size:13px;
	}
	.ctbtn {
	    padding: 15px 0;
	    width: 100%;
	    float: left;
	    text-align: center;
	}
	.btbuy {
	    background: #ee3f5c;
	}
	.btsell{
		background: #3a47ad;
	}
	.ctbtn button {
	    background: none;
	    padding: 10px 35px;
	    border: 2px solid #fff;
	    color: #fff;
	    font-size: 1.2em;
	}
	.back-blue{
		background: #0066d9 !important;
	}
	.back-dark{
		background: #303030 !important;
	}
	.back-dark:hover {
		background: #1c1c1c !important;
	}
	.text-dark {
		color: #303030 !important;
	}
	.badge {
    	padding: .25em .4em;
   	}
</style>
<!-- 손익 분배 계약서 -->
<form name="fcontract" id="fcontract" action="./contract_proc.do" method="post">
    <input type="hidden" name="bsType" value="${search.bsType}">
    <%-- <input type="hidden" name="goodsDate" value="${vo.goodsDate}">
    <input type="hidden" name="goodsTime" value="${vo.goodsTime}"> --%>
    <c:set var="totalLot" />
    <c:if test="${search.bsType eq 'B'}">
    	<c:set var="totalLot" value="${(search.buyLot1/LOT_01 * 0.1) + (search.buyLot2/LOT_02 * 0.2) + (search.buyLot10/LOT_1) + (search.buyLot20/LOT_2 * 2) + (search.buyLot40/LOT_4 * 4)}" />
    </c:if>
    <c:if test="${search.bsType eq 'S'}">
    	<c:set var="totalLot" value="${(search.sellLot1/LOT_01 * 0.1) + (search.sellLot2/LOT_02 * 0.2) + (search.sellLot10/LOT_1) + (search.sellLot20/LOT_2 * 2) + (search.sellLot40/LOT_4 * 4)}" />
    </c:if>
    <input type="hidden" name="runTime" value="${search.runTime}"/>
    <input type="hidden" name="totalLot" value="<fmt:formatNumber pattern="#,##0" maxFractionDigits="2" value="${totalLot}" />">
    <input type="hidden" name="buyLot1" value="<fmt:formatNumber pattern="#,##0" value="${search.buyLot1/LOT_01}"/>">
    <input type="hidden" name="buyLot2" value="<fmt:formatNumber pattern="#,##0" value="${search.buyLot2/LOT_02}"/>">
    <input type="hidden" name="buyLot10" value="<fmt:formatNumber pattern="#,##0" value="${search.buyLot10/LOT_1}"/>">
    <input type="hidden" name="buyLot20" value="<fmt:formatNumber pattern="#,##0" value="${search.buyLot20/LOT_2}"/>">
    <input type="hidden" name="buyLot40" value="<fmt:formatNumber pattern="#,##0" value="${search.buyLot40/LOT_4}"/>">
    <input type="hidden" name="sellLot1" value="<fmt:formatNumber pattern="#,##0" value="${search.sellLot1/LOT_01}"/>">
    <input type="hidden" name="sellLot2" value="<fmt:formatNumber pattern="#,##0" value="${search.sellLot2/LOT_02}"/>">
    <input type="hidden" name="sellLot10" value="<fmt:formatNumber pattern="#,##0" value="${search.sellLot10/LOT_1}"/>">
    <input type="hidden" name="sellLot20" value="<fmt:formatNumber pattern="#,##0" value="${search.sellLot20/LOT_2}"/>">
    <input type="hidden" name="sellLot40" value="<fmt:formatNumber pattern="#,##0" value="${search.sellLot40/LOT_4}"/>">
</form>
<div class="contract">
     <div class="contract-header bg-dark-grey py-2 text-center column">
          <small class="upper letter-space bold "><span class="text-red">${SITE_NAME_L}</span></small>
          <h4 class="text-300">손익 분배 계약서 <small class="badge ${search.bsType eq 'B' ? 'bg-red' : 'bg-blue'}">${search.bsType eq 'B' ? '매수' : '매도'}</small></h4>
          <div class="flex offer justify-center">
               <span></span>
               <small class="upper">${search.bsType eq 'B' ? 'buying offer' : 'selling offer'}</small>
               <span></span>
          </div>
     </div>
     <div class="container-fluid bg-light-grey">
          <div class="flex py-3 align-stretch">
               <div class="w-50 px-2">
                    <div class="bg-white p-1 h-100 bt-4-red">
                    	<ul class="lot-display">
                    		<c:if test="${search.bsType eq 'B' and !empty search.buyLot1 and search.buyLot1 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_01}" /> * <fmt:formatNumber pattern="#,##0" value="${search.buyLot1/LOT_01}" /></li></c:if>
                    		<c:if test="${search.bsType eq 'B' and !empty search.buyLot2 and search.buyLot2 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_02}" /> * <fmt:formatNumber pattern="#,##0" value="${search.buyLot2/LOT_02}" /></li></c:if>
                    		<c:if test="${search.bsType eq 'B' and !empty search.buyLot10 and search.buyLot10 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_1}" /> * <fmt:formatNumber pattern="#,##0" value="${search.buyLot10/LOT_1}" /></li></c:if>
                    	 	<c:if test="${search.bsType eq 'B' and !empty search.buyLot20 and search.buyLot20 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_2}" /> * <fmt:formatNumber pattern="#,##0" value="${search.buyLot20/LOT_2}" /></li></c:if>
							<c:if test="${search.bsType eq 'B' and !empty search.buyLot40 and search.buyLot40 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_4}" /> * <fmt:formatNumber pattern="#,##0" value="${search.buyLot40/LOT_4}" /></li></c:if>
                    	 	<c:if test="${search.bsType eq 'S' and !empty search.sellLot1 and search.sellLot1 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_01}" /> * <fmt:formatNumber pattern="#,##0" value="${search.sellLot1/LOT_01}" /></li></c:if>
                    	 	<c:if test="${search.bsType eq 'S' and !empty search.sellLot2 and search.sellLot2 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_02}" /> * <fmt:formatNumber pattern="#,##0" value="${search.sellLot2/LOT_02}" /></li></c:if>
                    	 	<c:if test="${search.bsType eq 'S' and !empty search.sellLot10 and search.sellLot10 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_1}" /> * <fmt:formatNumber pattern="#,##0" value="${search.sellLot10/LOT_1}" /></li></c:if>
                    	 	<c:if test="${search.bsType eq 'S' and !empty search.sellLot20 and search.sellLot20 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_2}" /> * <fmt:formatNumber pattern="#,##0" value="${search.sellLot20/LOT_2}" /></li></c:if>
							<c:if test="${search.bsType eq 'S' and !empty search.sellLot40 and search.sellLot40 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_4}" /> * <fmt:formatNumber pattern="#,##0" value="${search.sellLot40/LOT_4}" /></li></c:if>
                    	</ul>
                    </div>
               </div>
               <div class="w-50 px-2">
                    <div class="bg-white p-2 text-center bt-4-red">
                   		 <c:set var="date" value="${fn:split(vo.goodsDate, '-')}" />
                         <c:set var="time" value="${fn:split(next, ':')}" />
                         <h5 class="text-300">렌트시작</h5>
                         <p class="bold">${date[1]}월 ${date[2]}일 ${time[0]}시${time[1]}분</p>
                         <h5 class="text-300">렌트보증금</h5>
                         <p class="bold">
                         	<c:if test="${search.bsType eq 'B'}">
                         		<fmt:formatNumber pattern="#,##0" value="${search.buyLot1 + search.buyLot2 + search.buyLot10 + search.buyLot20 + search.buyLot40}" />
                         	</c:if>
                         	<c:if test="${search.bsType eq 'S'}">
                         		<fmt:formatNumber pattern="#,##0" value="${search.sellLot1 + search.sellLot2 + search.sellLot10 + search.sellLot20 + search.sellLot40}" />
                         	</c:if>
                         </p>
                    </div>
               </div>
          </div>
     </div>
     <div class="text-center py-3">
          <ul>
               <li class="small mb-1">FX마진거래 손익분배 계약 보증금은 차손발생 시 귀속되는 계약입니다.</li>
               <li class="small mb-1">FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서</li>
               <li class="small mb-1">반드시 이용약관 및 설명서를 읽어보시고 계약하시기 바랍니다.</li>
          </ul>
          <div class="row py-2">
          	<div class="col-12 mb-3">
          		<div class="flex h-100 w-100 align-center justify-center">
          			<img src="/images/fx_assets/logo/${SITE_NAME_L}.png" width="180px">
          		</div>
          	</div>
          	<div class="col-6 br-1-black">
         			<p class=" ">입출금관련전화</p>
               	<h4>${tagoplusSolution1_session_site.depositWithdrawalTelephone}</h4>
               </div>
               <div class="col-6 bl-1-black">
               	<p class="">출금업무시간</p>
               	<h4>${tagoplusSolution1_session_site.withdrawalTime }</h4>
          		
          	</div>
          </div>
     </div>
     <div class="contract-action  px-1 no-print ${search.bsType eq 'S' ? 'bg-blue' : 'bg-red'}">
          <div class=" flex flex-wrap text-center align-center py-1 bg-transparent">
               <small class="bold">남은 시간</small>
               <h3 class="text-300 mx-2 remain-time">00:00:00</h3>
               <button type="button" class=" btn b-2-white dark bg-transparent ml-auto ${search.bsType eq 'S' ? 'bg-red' : 'bg-blue'}" name="button" onclick="submit_contract(this)"> ${search.bsType eq 'S' ? '매도신청' : '매수신청'}
               </button>
               <a type="button" onclick="window.print()" class="print ml-3 ${search.bsType eq 'S' ? 'text-red' : 'text-blue'}" name="button">
                    <i data-feather="printer" class=""></i>
               </a>
          </div>
     </div>
     <div class="container">
          <div class="alert warning">
               <i data-feather="alert-circle" class="mr-1"></i>
              <span> 본 상품은 고객님께서 <strong> 계약하신 상품의 금액</strong>만 해당합니다</span>
          </div>
          <table class="table striped">
               <thead>
                    <tr>
                         <th width="30%">상품구분</th>
                         <th width="70%">당사보유(MOU) 금융투자(FX 마진거래 GBP/AUD)</th>
                    </tr>
               </thead>
               <tbody>
                    <tr>
                         <td class="px-1">
                              <span class="${search.bsType eq 'B' ? 'text-red' : 'text-blue'} small">0.1랏 ${search.bsType eq 'B' ? '매수' : '매도'}</span>
                              <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                         </td>
                         <td class="px-1">
                              <p class="text-left my-1 small">렌트보증금 <span class="bold">$5(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01}" />)</span>으로 렌트 시작</p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
                                   <span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01}" />(차손)</span> 소멸 종료
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
                                   <span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01 - (rateVo.lineRateT*LOT_01/100)}" />(차익)</span> 지급 종료
                                   <span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
                              </p>
                         </td>
                    </tr>
                    <tr>
                         <td class="px-1">
                              <span class="${search.bsType eq 'B' ? 'text-red' : 'text-blue'} small">0.2랏 ${search.bsType eq 'B' ? '매수' : '매도'}</span>
                              <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                         </td>
                         <td class="px-1">
                              <p class="text-left my-1 small">렌트보증금
                                   <span class="bold">$10(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02}" />)</span>으로 렌트 시작
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
                                   <span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02}" />(차손)</span> 소멸 종료
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
                                   <span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02 - (rateVo.lineRateT*LOT_02/100)}" />(차익)</span> 지급 종료
                                   <span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
                              </p>
                         </td>
                    </tr>
                    <tr>
                         <td class="px-1">
                              <span class="${search.bsType eq 'B' ? 'text-red' : 'text-blue'} small">1랏 ${search.bsType eq 'B' ? '매수' : '매도'}</span>
                              <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                         </td>
                         <td class="px-1">
                              <p class="text-left my-1 small">렌트보증금
                                   <span class="bold">$50(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1}" />)</span>으로 렌트 시작
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
                                   <span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1}" />(차손)</span> 소멸 종료
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
                                   <span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1 - (rateVo.lineRateT*LOT_1/100)}" />(차익)</span> 지급 종료
                                   <span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
                              </p>
                         </td>
                    </tr>
                    <tr>
                         <td class="px-1">
                              <span class="${search.bsType eq 'B' ? 'text-red' : 'text-blue'} small">2랏 ${search.bsType eq 'B' ? '매수' : '매도'}</span>
                              <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                         </td>
                         <td class="px-1">
                              <p class="text-left my-1 small">렌트보증금
                                   <span class="bold">$100(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2}" />)</span>으로 렌트 시작
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
                                   <span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2}" />(차손)</span> 소멸 종료
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
                                   <span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2 - (rateVo.lineRateT*LOT_2/100)}" />(차익)</span> 지급 종료
                                   <span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
                              </p>
                         </td>
                    </tr>
					<tr>
                         <td class="px-1">
                              <span class="${search.bsType eq 'B' ? 'text-red' : 'text-blue'} small">4랏 ${search.bsType eq 'B' ? '매수' : '매도'}</span>
                              <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                         </td>
                         <td class="px-1">
                              <p class="text-left my-1 small">렌트보증금
                                   <span class="bold">$200(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4}" />)</span>으로 렌트 시작
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
                                   <span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4}" />(차손)</span> 소멸 종료
                              </p>
                              <p class="text-left my-1 small">단위
                                   <span class="bold">${search.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
                                   <span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4 - (rateVo.lineRateT*LOT_4/100)}" />(차익)</span> 지급 종료
                                   <span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
                              </p>
                         </td>
                    </tr>
               </tbody>
          </table>
     </div>  
</div>
<script>
feather.replace()
</script>
<script>
     function submit_contract(el) {
          $(document.fcontract).submit();
     }

     $(document).on("submit", "form", function() {
          $(this).submit(function() {
               return false;
          });
          return true;
     });

     (function(window, document, $) {
          $(function() {
               $('i.fa-print').on('click', function(e) {
                    window.print();
               });
               function getServerTime(){
                    return $.ajax({
                    	url : "./getCurrentTime.do",	
                         type: 'post',
                         dataType: 'json',
                         data: {},
                         success: function (data) {
                              remainCheck(data);
                         }
                    });
               };
               // remain time
               var next = moment(${search.nextTime});
               var remainCheck = function(time) {
                    var diff = next - time;
                    var allLimit = ${runTimeVO.autoCloseAll};
                    console.log(diff);
                    if (diff >= allLimit*1000) {
                         var remain = moment.utc(diff).format("HH:mm:ss");
                         $('.remain-time').html(remain);
                    } else {
                         $('.remain-time').html('00:00:00');
                         clearInterval(window.remainTimer);
                         alert("거래시간이 종료되었습니다.");
                         window.close();
                    }
               };
               window.remainTimer = setInterval(function() {
                    getServerTime();
               }, 1000);

          });
     })(window, document, jQuery);
</script>