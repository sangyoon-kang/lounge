<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<article>
    <div class="container">
        <h2>실시간 예약</h2>
        <div class="contents">
        	<div class="sel_det_corm">
            	<div class="stit">
                   <a href="javascript:void(0)" class="ar mu_tit" >검색조건 상세 확인</a>
                   <div class="det_corm">
                        <ul class=" box_info">
                            <li><span class="ic_jm"></span><b>지 점</b> : 서울 > 김포공항  </li>
                            <li><span class="ic_jm"></span><b>인 수</b> : 2018년 08월 01일 09시 </li>
                            <li><span class="ic_jm"></span><b>반 납</b> : 2018년 08월 03일 20시 </li>
                            <li><span class="ic_jm"></span><b>차 종</b> : 소형/준중형차, 중형/대형, SUV/승합차 </li>
                        </ul>
                        <div class="mline"></div>
                        <ul class="option_checked">
                            <li><span class="ico ico_check"></span>10,000원~60,000원</li>
                            <li><span class="ico ico_check"></span>휘발유</li>
                            <li><span class="ico ico_check"></span>금연차량</li>
                            <li><span class="ico ico_check"></span>현대</li>
                            <li><span class="ico ico_check"></span>후방카메라</li>
                            <li><span class="ico ico_check"></span>후방센서</li>
                            <li><span class="ico ico_check"></span>블랙박스</li>
                        </ul>
                   </div>
               </div>
            </div><!-- sel_det_corm -->  
			<div class="mT15 swiper-container">
                <div class="swiper-wrapper">
                	<div class="swiper-slide"><img src="/images/sample.jpg"></div>
                  	<div class="swiper-slide"><img src="/images/sample2.jpg"></div>
                  	<div class="swiper-slide"><img src="/images/sample3.jpg"></div>
                 </div><!-- swiper-wrapper -->
            	<!-- Add Pagination -->
                <div class="swiper-pagination"></div>
                <!-- Add Arrows -->
                <div class="ico swiper-button-next"></div>
                <div class="ico swiper-button-prev"></div>
          </div><!-- sel_det_corm -->

          <!-- Initialize Swiper -->
          <script>
            var swiper = new Swiper('.swiper-container', {
              pagination: {
                el: '.swiper-pagination',
                type: 'fraction',
              },
              navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
              },
            });
          </script>
          
            <div class="mT15 car_det_info">
            	<div class="block">
                	<div class="fleft" >
                    	<p class="fleft mT5 mR5 ico ico_d"></p>
                        <p>
                            <span class="maker">현대/준중형<span class="mL8">217년식</span></span>
                            <span class="kind">그랜져HG</span>
                        </p>
                    </div>
                    <div class="discount">65<span class="per">%</span></div>
                </div>
                <div>
                	<ul class="price">
                    	<li><p class="ic_jm"></p>
                        	<p class="sb">할인금액</p>
                        	<p class="re_price"><span class="org_price">168,000원</span>53,000원</p>
                        </li>
                        <li><p class="ic_jm"></p>
                        	<p class="sb">보험금액</p>
                        	<p class="re_price">30,000원</p>
                        </li>
                        <li><p class="ic_jm"></p>
                        	<p class="sb">대여금액</p>
                        	<p class="re_price">60,000원</p>
                        </li>
                        <li><p class="ic_jm"></p>
                        	<p class="sb bold">총&nbsp; 합 &nbsp;계</p>
                        	<p class="re_price total">90,000원</p>
                        </li>
                    </ul>
                </div><!-- price -->
            </div><!-- car_det_info -->
            <div class="btn_det_reser">
              	<a href="/m/reser/reserve.asp">예약하기</a>
            </div><!-- btn_det_reser -->
            <div class="mT30">
              <table class="nor_list f12">
                    <colgroup>
                        <col width="25%">
                        <col width="13%">
                        <col width="19%">
                        <col width="18%">
                        <col width="25%">
    
                     </colgroup>
                     <thead>
                        <tr>
                            <th>업체명</th>
                            <th>색상</th>
                            <th>년식</th>
                            <th>흡연</th>
                            <th>금액</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr>
                            <td>타고렌트카</td>
                            <td><span class="c_black"></span></td>
                            <td>2017</td>
                            <td>금연</td>
                            <td>53,000원</td>
                        </tr>
                        <tr>
                            <td>타고렌트카</td>
                            <td><span class="c_grey"></span></td>
                            <td>2017</td>
                            <td>금연</td>
                            <td>53,000원</td>
                        </tr>
                         <tr>
                            <td>타고렌트카</td>
                            <td><span class="c_blue"></span></td>
                            <td>2017</td>
                            <td>금연</td>
                            <td>53,000원</td>
                        </tr>
                         <tr>
                            <td>타고렌트카</td>
                            <td><span class="c_red"></span></td>
                            <td>2017</td>
                            <td>금연</td>
                            <td>53,000원</td>
                        </tr>
                         <tr>
                            <td>타고렌트카</td>
                           <td><span class="c_white"></span></td>
                            <td>2017</td>
                            <td>금연</td>
                            <td>53,000원</td>
                        </tr>
                     </tbody>
                </table>
            </div>
             <script>
				function tabchk(num) {
					  if(num == "01"){
					  tab01.style.display="";tab02.style.display="none";tab03.style.display="none";tab04.style.display="none";
					  }
					
					  if(num == "02"){
					  tab01.style.display="none";tab02.style.display="";tab03.style.display="none";tab04.style.display="none";
					  }
					  
					  if(num == "03"){
					  tab01.style.display="none";tab02.style.display="none";tab03.style.display="";tab04.style.display="none";
					  }
					  
					  if(num == "04"){
					  tab01.style.display="none";tab02.style.display="none";tab03.style.display="none";tab04.style.display="";
					  }
				 }
			 </script>
            <div id="tab01" class="block mT20" style="display:block;">
                <ul class="det_tab">
                    <li class="on"><a href="javascript:tabchk(01)">이용안내</a></li>
                    <li><a href="javascript:tabchk(02)">인수/반납</a></li>
                    <li><a href="javascript:tabchk(03)">보험안내</a></li>
                    <li><a href="javascript:tabchk(04)">환불/취소</a></li>
                </ul>
                <div class="det_tab_cons">
                    - 본 상품은 별도의 해피콜 서비스를 제공하지 않습니다.<br/>
                    - 본 상품은 결제 후 즉시 예약이 진행되며, 별도 예약이 필요하지 않습니다.<br/>
                    - 여행일 하루 전 배정업체에서 인수안내 문자가 발송이 되오니, 구매 전 연락처 정보를 정확하게 기재바랍니다. <br/>
                    - 상품 결제 후 차량 관련 문의사항은 이용차량 렌트카업체로 문의바랍니다.<br/>
                    -  전차종 금연.<br/>
                    - 악취,오염 발생 가능 물품(낚시용품,생선운반박스,페인트,시멘트,기름통 등) 차량내 탑재시 대여불가.<br/> 
                    - 차량 인수,반납 시간은 08:00 ~20:00 로 이외시간에는 인수,반납이 불가하며 그에따른 불이익은 렌트카이용자가 받게 됩니다.(차량인수불가 및 당일취소적용으로 환불이 불가할수 있습니다)<br/><br/>
                    ※ 항공지연 등의 사유로 실제 차량인수시간이 20:00 이후일 경우 21:00까지 야간배차료 1만원 발생.(21시 이후시에는 다음날 인수로 미뤄질수 있습니다)
    
                </div><!-- det_tab_cons -->
            </div><!-- 이용안내 -->
            <div id="tab02" class="block mT20" style="display:none;">
                <ul class="det_tab">
                    <li><a href="javascript:tabchk(01)">이용안내</a></li>
                    <li class="on"><a href="javascript:tabchk(02)">인수/반납</a></li>
                    <li><a href="javascript:tabchk(03)">보험안내</a></li>
                    <li><a href="javascript:tabchk(04)">환불/취소</a></li>
                </ul>
                <div class="det_tab_cons">
                    <div class="ay_map">
                        <img src="/images/ay_map.png">
                    </div><!-- ay_map -->
                    <div class="ag_info">
                        <ul>
                            <li><span class="ic_jm"></span>
                                <p class="sb">업체명</p>
                                <p class="ex">타고렌트카</p>
                            </li>
                            <li>
                                <span class="ic_jm"></span>
                                <p class="sb">주 소</p>
                                <p class="ex">서울시 금천구 가산디지털2로 14</p>
                             </p>
                            <li>
                                <span class="ic_jm"></span>
                                <p class="sb">대표전화</p>
                                <p>1588-9999</p>
                            </li>
                            <li>
                                <span class="ic_jm"></span>
                                <p class="sb">팩 스</p>
                                <p class="ex">02-555-6666</p>
                            </li>
                        </ul>
                    </div>
                </div><!-- det_tab_cons -->
            </div><!-- 인수/반납장소 -->
            <div id="tab03" class="block mT20" style="display:none;">
                <ul class="det_tab">
                    <li><a href="javascript:tabchk(01)">이용안내</a></li>
                    <li><a href="javascript:tabchk(02)">인수/반납</a></li>
                    <li class="on"><a href="javascript:tabchk(03)">보험안내</a></li>
                    <li><a href="javascript:tabchk(04)">환불/취소</a></li>
                </ul>
                <div class="det_tab_cons">
                    - 본 상품은 별도의 해피콜 서비스를 제공하지 않습니다.<br/>
                    - 본 상품은 결제 후 즉시 예약이 진행되며, 별도 예약이 필요하지 않습니다.<br/>
                    - 여행일 하루 전 배정업체에서 인수안내 문자가 발송이 되오니, 구매 전 연락처 정보를 정확하게 기재바랍니다. <br/>
                    - 상품 결제 후 차량 관련 문의사항은 이용차량 렌트카업체로 문의바랍니다.<br/>
                    -  전차종 금연.<br/>
                    - 악취,오염 발생 가능 물품(낚시용품,생선운반박스,페인트,시멘트,기름통 등) 차량내 탑재시 대여불가.<br/> 
                    - 차량 인수,반납 시간은 08:00 ~20:00 로 이외시간에는 인수,반납이 불가하며 그에따른 불이익은 렌트카이용자가 받게 됩니다.(차량인수불가 및 당일취소적용으로 환불이 불가할수 있습니다)<br/><br/>
                    ※ 항공지연 등의 사유로 실제 차량인수시간이 20:00 이후일 경우 21:00까지 야간배차료 1만원 발생.(21시 이후시에는 다음날 인수로 미뤄질수 있습니다)
    
                </div><!-- det_tab_cons -->
            </div><!-- 보험안내 -->
            <div id="tab04" class="block mT20" style="display:none;">
                <ul class="det_tab">
                    <li><a href="javascript:tabchk(01)">이용안내</a></li>
                    <li><a href="javascript:tabchk(02)">인수/반납</a></li>
                    <li><a href="javascript:tabchk(03)">보험안내</a></li>
                    <li class="on"><a href="javascript:tabchk(04)">환불/취소</a></li>
                </ul>
                <div class="det_tab_cons">
                    - 본 상품은 별도의 해피콜 서비스를 제공하지 않습니다.<br/>
                    - 본 상품은 결제 후 즉시 예약이 진행되며, 별도 예약이 필요하지 않습니다.<br/>
                    - 여행일 하루 전 배정업체에서 인수안내 문자가 발송이 되오니, 구매 전 연락처 정보를 정확하게 기재바랍니다. <br/>
                    - 상품 결제 후 차량 관련 문의사항은 이용차량 렌트카업체로 문의바랍니다.<br/>
                    -  전차종 금연.<br/>
                    - 악취,오염 발생 가능 물품(낚시용품,생선운반박스,페인트,시멘트,기름통 등) 차량내 탑재시 대여불가.<br/> 
                    - 차량 인수,반납 시간은 08:00 ~20:00 로 이외시간에는 인수,반납이 불가하며 그에따른 불이익은 렌트카이용자가 받게 됩니다.(차량인수불가 및 당일취소적용으로 환불이 불가할수 있습니다)<br/><br/>
                    ※ 항공지연 등의 사유로 실제 차량인수시간이 20:00 이후일 경우 21:00까지 야간배차료 1만원 발생.(21시 이후시에는 다음날 인수로 미뤄질수 있습니다)
    
                </div><!-- det_tab_cons -->
            </div><!-- 환불/취소규정 -->
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

