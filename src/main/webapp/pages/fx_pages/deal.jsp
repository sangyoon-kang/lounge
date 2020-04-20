<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<div class="sub-visual" style="background-image:url(/images/fx_assets/main.jpg)">
     <div class="container">
          <div class="row">
               <div class="col-sm-12">
                    <p>국내 FX렌트서비스의 차세대 업체</p>
                    <h1>${SITE_NAME_U}</h1>
               </div>
          </div>
     </div>
</div>
<div class="container main">
               <div class="row">
                    <div class="col-sm-12">
                         <h5 class="table-title">FX거래</h5>
                    </div>
               </div>
               <div class="row">
                    <div class="col-sm-6">

                         <table class="table">
                              <thead>
                                   <tr>
                                        <th>회원명</th>
                                        <th>지점명</th>
                                        <th>예치금</th>
                                        <th>종목</th>
                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td>홍길동</td>
                                        <td>서울점</td>
                                        <td>8,000,000원</td>
                                        <td>GBP/AUD</td>
                                   </tr>
                              </tbody>
                         </table>
                    </div>
                    <div class="col-sm-6">
                         <table class="table">
                              <thead>
                                   <tr>
                                        <th>회차</th>
                                        <th>시작시간</th>
                                        <th>종료시간</th>
                                        <th>남은시간</th>

                                   </tr>
                              </thead>
                              <tbody>
                                   <tr>
                                        <td>1회</td>
                                        <td>09:00</td>
                                        <td>09:03</td>
                                        <td class="text-red">02분 58초</td>
                                   </tr>
                              </tbody>
                         </table>
                    </div>

                    <div id="tradingview_5ee24" class="col-sm-12"></div>
                    <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                    <script type="text/javascript">
                    new TradingView.widget(
                    {
                      "width": '100%',
                      "height": 450,
                    "symbol": "OANDA:GBPAUD",
                    "interval": "3",
                    "timezone": "Etc/UTC",
                    "theme": "Light",
                    "style": "1",
                    "locale": "kr",
                    "toolbar_bg": "#f1f3f6",
                    "enable_publishing": false,
                    "allow_symbol_change": true,
                    "container_id": "tradingview_5ee24"
                    }
                    );
                    </script>


               </div>
               <div class="row my-5 ">
                    <div class="col-sm-12">
                         <div class="" id="tabs">
                              <a id="tab1" class="danger btn">
                                   <i data-feather="chevrons-up" class=""></i>
                                   매수(상승)
                              </a>
                              <a  id="tab2" class="blue btn">
                                   <i data-feather="chevrons-down" class=""> </i>
                                   매도(하락)
                              </a>
                         </div>
                         <div id="tab1C" class="tab-content">
                              <div  class="row">
                                   <div class="col-md-8">
                                        <table class="table danger center">
                                             <colgroup>
                                                  <col width="10%">
                                                  <col width="14%">
                                                  <col width="14%">
                                                  <col width="10%">
                                                  <col width="">
                                                  <col width="10%">
                                             </colgroup>
                                             <thead>
                                                  <tr>
                                                       <th>렌트수량</th>
                                                       <th>Stop 실격</th>
                                                       <th>Limit 실현</th>
                                                       <th>렌트보증금</th>
                                                       <th>렌트하기</th>
                                                       <th>거래잔량</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                  <tr>
                                                       <td>0.1Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td>
                                                            <div class="input-group">
                                                                 <div class="input-group-append" id="count">1</div>
                                                                 <div class="flex align-center flex-sm-row">
                                                                      <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                      <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                                 </div>
                                                                 <input type="text" readonly class="form-control down-100">
                                                            </div>
                                                       </td>
                                                       <td>
                                                            <div class="battery">
                                                                 <span></span>
                                                                 <span></span>
                                                                 <span></span>
                                                            </div>
                                                       </td>
                                                  </tr>
                                                  <tr>
                                                       <td>0.2Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                                  <tr>
                                                       <td>2Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                             </tbody>
                                        </table>
                                   </div>
                                   <div class="col-md-4">
                                        <table class="table bordered">
                                             <tbody>
                                                  <tr>
                                                       <th>거래일</th>
                                                       <td>5월13일 09시 03분</td>
                                                  </tr>
                                                  <tr>
                                                       <th>종목</th>
                                                       <td>GBP/AUD</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청구분</th>
                                                       <td>매수</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청수량</th>
                                                       <td>O Lot</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청금액</th>
                                                       <td>0원</td>
                                                  </tr>
                                                  <tr>
                                                       <th>남은 약정시간</th>
                                                       <td>02 분 58초</td>
                                                  </tr>
                                             </tbody>
                                        </table>
                                   </div>
                              </div>
                         </div>
                         <div id="tab2C" class="tab-content">
                              <div  class="row">
                                   <div class="col-md-8">
                                        <table class="table blue center">
                                             <colgroup>
                                                  <col width="10%">
                                                  <col width="14%">
                                                  <col width="14%">
                                                  <col width="10%">
                                                  <col width="">
                                                  <col width="10%">
                                             </colgroup>
                                             <thead>
                                                  <tr>
                                                       <th>렌트수량</th>
                                                       <th>Stop 실격</th>
                                                       <th>Limit 실현</th>
                                                       <th>렌트보증금</th>
                                                       <th>렌트하기</th>
                                                       <th>거래잔량</th>
                                                  </tr>
                                             </thead>
                                             <tbody>
                                                  <tr>
                                                       <td>0.1Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td>
                                                            <div class="input-group">
                                                                 <div class="input-group-append" id="count">1</div>
                                                                 <div class="flex align-center flex-sm-row">
                                                                      <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                      <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                                 </div>
                                                                 <input type="text" readonly class="form-control down-100">
                                                            </div>
                                                       </td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                                  <tr>
                                                       <td>0.2Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                                  <tr>
                                                       <td>1Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                                  <tr>
                                                       <td>2Lot</td>
                                                       <td class="text-blue ">&#9660; 50</td>
                                                       <td class="text-red">&#9650; 50</td>
                                                       <td>5,000</td>
                                                       <td><div class="input-group">
                                                            <div class="input-group-append" id="count">1</div>
                                                            <div class="flex align-center flex-sm-row">
                                                                 <a onclick="plus()"><i data-feather="plus-square"></i></a>
                                                                 <a onclick="minus()"><i data-feather="minus-square"></i></a>
                                                            </div>
                                                            <input type="text" readonly class="form-control down-100">
                                                       </div></td>
                                                       <td><div class="battery">
                                         <span></span>
                                         <span></span>
                                         <span></span>
                                    </div></td>
                                                  </tr>
                                             </tbody>
                                        </table>
                                   </div>
                                   <div class="col-md-4">
                                        <table class="table bordered">
                                             <tbody>
                                                  <tr>
                                                       <th>거래일</th>
                                                       <td>5월13일 09시 03분</td>
                                                  </tr>
                                                  <tr>
                                                       <th>종목</th>
                                                       <td>GBP/AUD</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청구분</th>
                                                       <td>매수</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청수량</th>
                                                       <td>O Lot</td>
                                                  </tr>
                                                  <tr>
                                                       <th>신청금액</th>
                                                       <td>0원</td>
                                                  </tr>
                                                  <tr>
                                                       <th>남은 약정시간</th>
                                                       <td>02 분 58초</td>
                                                  </tr>
                                             </tbody>
                                        </table>
                                   </div>
                              </div>
                         </div>
                    </div>
                    <div class="col-sm-8">
                              1회차 당 매도, 매수 한가지만 신청 가능합니다. 1회차 당 최대 구매 금액은 1,000,000원 입니다.
                    </div>
                    <div class="col-sm-4 text-right">
                         <button type="button" class="btn blue w-100  btn-lg ml-auto" name="button" onclick="window.open('/pages/fx_pages/contract.jsp', 'contract', 'width=500,height=640,location=no,status=no,scrollbars=yes');">신청</button>
                    </div>
               </div>
          </div>

<script>
setInterval(function(){
    $('.battery').toggleClass("animate");
}, 2000);
feather.replace({
    width:24,
    height:24,
});
     $(document).ready(function() {

          $('#tabs  a:not(:first)').addClass('inactive');
          $('.tab-content').hide();
          $('.tab-content:first').show();

          $('#tabs  a').click(function(){
              var t = $(this).attr('id');
            if($(this).hasClass('inactive')){ //this is the start of our condition
              $('#tabs  a').addClass('inactive');
              $(this).removeClass('inactive');

              $('.tab-content').hide();
              $('#'+ t + 'C').fadeIn('slow');
           }
          });

     });
     var n = 1

     function minus(){
          $('#count').text(--n)
     }
     function plus(){
          $('#count').text(++n)
     }
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
