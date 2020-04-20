<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>


<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">실시간예약</a> </li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>실시간 예약</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
    	<div>
            <div class="fleft gy_box1 w455">
                <ul class="box_info">
                    <li><span class="ic_jm"></span>인 수 : 2018년 08월 01일 09시 </li>
                    <li><span class="ic_jm"></span>반 납 : 2018년 08월 03일 20시 </li>
                </ul>
            </div>
            <div class="fleft gy_box1 w455 mL10">
                <ul class=" box_info">
                    <li><span class="ic_jm"></span>장 소 : 서울/김포공항 </li>
                    <li><span class="ic_jm"></span>차 종 : 소형/준중형차, 중형/대형</li>
                </ul>
            </div>
            <div class="fright btn_b_ser"><a href="#"><span>재검색</span></a></div>
        </div><!-- top_info -->
        <div class="det_wrp">
        	<div class="left_info">
            	<div class="big_img"><img src="/images/sample.jpg"></div>
                <div class="sm_img">
                	<span class="left_arr"><a href="#" class="ico"></a></span>
                	<ul>
                    	<li><a href="#"><img src="/images/sample.jpg"></a></li>
                        <li><a href="#"><img src="/images/sample.jpg"></a></li>
                        <li><a href="#"><img src="/images/sample.jpg"></a></li>
                        <li><a href="#"><img src="/images/sample.jpg"></a></li>
                    </ul>
                    <span class="right_arr"><a href="#" class="ico"></a></span>
                </div>
            </div><!-- left_info -->
        	<div class="det_info">
            	<div>
                	<p class="fleft"><span class="maker">현대/준중형</span>
                    	<span class="kind">그랜져HG<span class="fuel">D</span></span></p>
                    <p class="ico discount"><span class="fig">65</span><span class="per">%</span></p>
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
                <div class="mT20">
                    <ul class="checked">
                        <li>2017년식</li>
                        <li>금연차량</li>
                        <li>후방센서</li>
                        <li>네비게이션</li>
                    </ul><!-- car_kind_sel-->
                </div>
                <div class="mT5  f14">보&nbsp; &nbsp; 험&nbsp; &nbsp;:&nbsp; &nbsp;일반자차, 보상한도 300만원, 자부담한도 50만원</div>
                <div class="compay">
                	<p>업&nbsp; &nbsp; 체&nbsp; &nbsp;:&nbsp; &nbsp;타고렌트카</p>
                    <p class="mT5">주&nbsp; &nbsp; 소&nbsp; &nbsp;:&nbsp; &nbsp;서울시 금천구 가산동 327-32번지</p>
                </div><!-- compay -->
                <div class="btn_reser">
                	<a href="/html/reser/reserve.jsp"><span class="ico ico_clock"></span>예약하기</a>
                </div><!-- btn_reser -->
            </div><!-- det_info -->
        </div><!-- det_wrp -->
        <div class="in mT50">
        	<table class="nor_list">
            	<colgroup>
                	<col width="15%"/>
                    <col width="10%"/>
                    <col width="11%"/>
                    <col width="11%"/>
                    <col width="11%"/>
                    <col width="14%"/>
                    <col width="14%"/>
                    <col width="14%"/>
                 </colgroup>
                 <thead>
                 	<tr>
                    	<th>업체명</th>
                        <th>색상</th>
                        <th>년식</th>
                        <th>연료</th>
                        <th>흡연</th>
                        <th>보험료</th>
                        <th>대요료</th>
                        <th>총금액</th>
                    </tr>
                 </thead>
                 <tbody>
                 	<tr>
                    	<td>타고렌트카</td>
                        <td><span class="c_black"></span></td>
                        <td>2017</td>
                        <td>휘발류</td>
                        <td>금연</td>
                        <td>13,000원</td>
                        <td>40,000원</td>
                        <td>53,000원</td>
                    </tr>
                    <tr>
                    	<td>타고렌트카</td>
                        <td><span class="c_grey"></span></td>
                        <td>2017</td>
                        <td>휘발류</td>
                        <td>금연</td>
                        <td>13,000원</td>
                        <td>40,000원</td>
                        <td>53,000원</td>
                    </tr>
                    <tr>
                    	<td>타고렌트카</td>
                        <td><span class="c_blue"></span></td>
                        <td>2017</td>
                        <td>휘발류</td>
                        <td>금연</td>
                        <td>13,000원</td>
                        <td>40,000원</td>
                        <td>53,000원</td>
                    </tr>
                    <tr>
                    	<td>타고렌트카</td>
                        <td><span class="c_red"></span></td>
                        <td>2017</td>
                        <td>휘발류</td>
                        <td>금연</td>
                        <td>13,000원</td>
                        <td>40,000원</td>
                        <td>53,000원</td>
                    </tr>
                    <tr>
                    	<td>타고렌트카</td>
                        <td><span class="c_white"></span></td>
                        <td>2017</td>
                        <td>휘발류</td>
                        <td>금연</td>
                        <td>13,000원</td>
                        <td>40,000원</td>
                        <td>53,000원</td>
                    </tr>
                 </tbody>
            </table>
        </div>
        <div class="in mT50">
        	<ul class="det_tab">
            	<li class="on"><a href="#">이용안내</a></li>
                <li><a href="#">인수/반납장소</a></li>
                <li><a href="#">보험안내</a></li>
                <li><a href="#">환불/취소규정</a></li>
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
        <div class="in mT50">
        	<ul class="det_tab">
            	<li><a href="#">이용안내</a></li>
                <li class="on"><a href="#">인수/반납장소</a></li>
                <li><a href="#">보험안내</a></li>
                <li><a href="#">환불/취소규정</a></li>
            </ul>
            <div class="det_tab_cons">
            	<div class="ay_map">
                	<img src="/images/ay_map.png">
                </div><!-- ay_map -->
				<div class="ag_info">
                	<dl>
                    	<dt><span class="ic_jm"></span>업체명</dt>
                   		<dd>타고렌트카</dd>
                    	<dt><span class="ic_jm"></span>주 소</dt>
                   		<dd>서울시 금천구 가산디지털2로 14</dd>
                        <dt><span class="ic_jm"></span>대표전화</dt>
                   		<dd>1588-9999</dd>
                        <dt><span class="ic_jm"></span>팩 스</dt>
                   		<dd>02-555-6666</dd>
                    </dl>
                </div>
            </div><!-- det_tab_cons -->
        </div><!-- 인수/반납장소 -->
        <div class="in mT50">
        	<ul class="det_tab">
            	<li><a href="#">이용안내</a></li>
                <li><a href="#">인수/반납장소</a></li>
                <li class="on"><a href="#">보험안내</a></li>
                <li><a href="#">환불/취소규정</a></li>
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
        <div class="in mT50">
        	<ul class="det_tab">
            	<li><a href="#">이용안내</a></li>
                <li><a href="#">인수/반납장소</a></li>
                <li><a href="#">보험안내</a></li>
                <li class="on"><a href="#">환불/취소규정</a></li>
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
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
