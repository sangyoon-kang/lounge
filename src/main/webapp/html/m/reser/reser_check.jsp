<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<article>
<script type="text/javascript">
	jQuery.fn.center = function () {
		this.css("position","absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}
	
	agency = function() {
		$("#agency").show();
		$("#agency").center();
	}

	period = function() {
		$("#period").show();
		$("#period").center();
	}

	taketime = function() {
		$("#taketime").show();
		$("#taketime").center();
	}
	
	returntime = function() {
		$("#returntime").show();
		$("#returntime").center();
	}
	
	option = function() {
		$("#option").show();
		$("#option").center();
	}
</script>


    <div class="container">
        <h2>실시간 예약</h2>
        <div class="contents">
        	<div class="reser_wrp">
                <ul class="reser">
                    <li><div class="inbox">
                            <a href="javascript:;" onclick="javascript:agency()"><span class="tit">서울 / 김포공항</span></a>
                        </div>
                    </li>
                    <li><div class="col-5 fleft pdR4">
                            <div class="inbox  on">
                                <a href="javascript:;" onclick="javascript:period()"><span class="sel_cons">2015-09-30</span></a>
                            </div>
                        </div>
                        <div class="col-5  fright pdL4">
                            <div class="inbox">
                                <a href=""><span class="tit">반납일</span></a>
                            </div>
                        </div>
                    </li>
                    <li><div class="col-5 fleft pdR4">
                            <div class="inbox">
                                <a href="javascript:;" onclick="javascript:taketime()"><span class="tit">인수시간</span></a>
                            </div>
                        </div>
                        <div class="col-5  fright pdL4">
                            <div class="inbox">
                                <a href="javascript:;" onclick="javascript:returntime()"><span class="tit">반납시간</span></a>
                            </div>
                        </div>
                    </li>
                    <li><div class="col-33 fleft pdR4">
                            <div class="inbox">
                                <a href=""><span>소형/준중형</span></a>
                            </div>
                        </div>
                        <div class="col-33 fleft pdL4 pdR4">
                            <div class="inbox">
                                <a href=""><span>중형/대형</span></a>
                            </div>
                        </div>
                        <div class="col-33 fleft pdL4">
                            <div class="inbox">
                                <a href=""><span>승합차</span></a>
                            </div>
                        </div>
                    </li>
                    <li><div class="inbox">
                            <a href="javascript:;" onclick="javascript:option()"><span class="tit">상세옵션을 선택하세요</span></a>
                        </div>
                    </li>
                </ul>
                <div class="btn_wrp">
               		<span class="col-5 fleft"><a href="" class="btn_b_black">초기화</a></span>
                    <span class="col-5 pdL2"><a href="/m/reser/car_list.asp" class="btn_b_cor">검색</a></span>
               	</div>
                
        	</div><!--reser_wrp -->
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

<div id="agency" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">지점선택</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<dl class="agy_part">
        	<dt>서울</dt>
            <dd><a href="">김포공항</a></dd>
            <dd><a href="">서울역</a></dd>
            <dd><a href="">강남구</a></dd>
            <dd><a href="">마포구</a></dd>
        </dl><!-- 서울 -->
        <dl class="agy_part">
        	<dt>제주</dt>
            <dd><a href="">제주공항</a></dd>
            <dd><a href="">제주항</a></dd>
        </dl><!-- 서울 -->
        <dl class="agy_part">
        	<dt>부산</dt>
            <dd><a href="">부산역</a></dd>
            <dd><a href="">김해공항</a></dd>
        </dl><!-- 서울 -->
    </div><!-- cons -->

</div><!-- 지점선택 -->


<div id="period" class="pop_wrp">
	<div class="pop_tit"><span class="f;eft">인수일</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<div class="in">
            <div class="calendar_wrp">
                <div class="sb">2018년 9월</div>
                <table class="calendar">
                    <colgroup>
                        <col width="38x">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="sun">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td>1</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>3</td>
                            <td>4</td>
                            <td>5</td>
                            <td>6</td>
                            <td>7</td>
                            <td>8</td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td>10</td>
                            <td>11</td>
                            <td>12</td>
                            <td>13</td>
                            <td>14</td>
                            <td>15</td>
                        </tr>
                        <tr>
                            <td>16</td>
                            <td>17</td>
                            <td><a href="" class="pres">18</a></td>
                            <td><a href="">19</a></td>
                            <td><a href="">20</a></td>
                            <td><a href="">21</a></td>
                            <td><a href="">22</a></td>
                        </tr>
                        <tr>
                            <td ><a href=""><span class="sun">23</span></a></td>
                            <td><a href="">24</a></td>
                            <td><a href="">25</a></td>
                            <td><a href="">26</a></td>
                            <td><a href="">27</a></td>
                            <td><a href="">28</a></td>
                            <td><a href="">29</a></td>
                        </tr>
                         <tr>
                            <td ><a href=""><span class="sun">30</span></a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- calendar_wrp -->
            <div class="calendar_wrp">
                <div class="sb">2018년 10월</div>
                <table class="calendar">
                    <colgroup>
                        <col width="38x">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="sun">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td><a href="">1</a></td>
                            <td><a href="">2</a></td>
                            <td><a href="">3</a></td>
                            <td><a href="">4</a></td>
                            <td><a href="">5</a></td>
                            <td><a href="">6</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">7</span></a></td>
                            <td><a href="">8</a></td>
                            <td><a href="">9</a></td>
                            <td><a href="">10</a></td>
                            <td><a href="">11</a></td>
                            <td><a href="">12</a></td>
                            <td><a href="">73</a></td>
                        </tr>
                         <tr>
                            <td><a href=""><span class="sun">14</span></a></td>
                            <td><a href="">15</a></td>
                            <td><a href="">16</a></td>
                            <td><a href="">17</a></td>
                            <td><a href="">18</a></td>
                            <td><a href="">19</a></td>
                            <td><a href="">20</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">21</span></a></td>
                            <td><a href="">22</a></td>
                            <td><a href="">23</a></td>
                            <td><a href="">24</a></td>
                            <td><a href="">25</a></td>
                            <td><a href="">26</a></td>
                            <td><a href="">27</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">28</span></a></td>
                            <td><a href="">29</a></td>
                            <td><a href="">30</a></td>
                            <td><a href="">31</a></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- calendar_wrp -->
            <div class="calendar_wrp">
                <div class="sb">2018년 11월</div>
                <table class="calendar">
                    <colgroup>
                        <col width="38x">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                        <col width="38px">
                    </colgroup>
                    <thead>
                        <tr>
                            <th class="sun">일</th>
                            <th>월</th>
                            <th>화</th>
                            <th>수</th>
                            <th>목</th>
                            <th>금</th>
                            <th>토</th>
                         </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td><a href="">1</a></td>
                            <td><a href="">2</a></td>
                            <td><a href="">3</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">4</span></a></td>
                            <td><a href="">5</a></td>
                            <td><a href="">6</a></td>
                            <td><a href="">7</a></td>
                            <td><a href="">8</a></td>
                            <td><a href="">9</a></td>
                            <td><a href="">10</a></td>
                        </tr>
                         <tr>
                            <td><a href=""><span class="sun">11</span></a></td>
                            <td><a href="">12</a></td>
                            <td><a href="">13</a></td>
                            <td><a href="">14</a></td>
                            <td><a href="">15</a></td>
                            <td><a href="">16</a></td>
                            <td><a href="">17</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">18</span></a></td>
                            <td><a href="">19</a></td>
                            <td><a href="">20</a></td>
                            <td><a href="">21</a></td>
                            <td><a href="">22</a></td>
                            <td><a href="">23</a></td>
                            <td><a href="">24</a></td>
                        </tr>
                        <tr>
                            <td><a href=""><span class="sun">25</span></a></td>
                            <td><a href="">26</a></td>
                            <td><a href="">27</a></td>
                            <td><a href="">28</a></td>
                            <td><a href="">29</a></td>
                            <td><a href="">30</a></td>
                            <td></td>
                        </tr>
                    </tbody>
                </table>
            </div><!-- calendar_wrp -->
        </div>
        
    </div><!-- cons -->
    <div>
       	<span class="fleft col-5"><a href="" class="btn_b_cor">확인</a></span>
        <span class="fleft col-5 pdL2"><a href="" class="btn_b_black">취소</a></span>
     </div>
</div><!-- 인수일 -->

 <div id="taketime" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">인수시간</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<ul class="take_time">
        	<li><a href="" class="sel">08시</a></li>
            <li><a href="">09시</a></li>
            <li><a href="">10시</a></li>
            <li><a href="">11시</a></li>
            <li><a href="">12시</a></li>
            <li><a href="">13시</a></li>
            <li><a href="">14시</a></li>
            <li><a href="">15시</a></li>
            <li><a href="">16시</a></li>
            <li><a href="">17시</a></li>
            <li><a href="">18시</a></li>
            <li><a href="">19시</a></li>
        </ul><!--take_time -->
    </div><!-- cons -->
</div><!-- 인수시간 -->

 <div id="returntime" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">반납시간</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<ul class="take_time">
        	<li><a href="" class="sel">08시</a></li>
            <li><a href="">09시</a></li>
            <li><a href="">10시</a></li>
            <li><a href="">11시</a></li>
            <li><a href="">12시</a></li>
            <li><a href="">13시</a></li>
            <li><a href="">14시</a></li>
            <li><a href="">15시</a></li>
            <li><a href="">16시</a></li>
            <li><a href="">17시</a></li>
            <li><a href="">18시</a></li>
            <li><a href="">19시</a></li>
        </ul><!--take_time -->
    </div><!-- cons -->
</div><!-- 반납시간 -->

 <div id="option" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">옵션선택</span><a href="" class="ico btn_close"></a></div>
	<div class="cons">
   		<div class="pop_option">
       		<div class="sb">기간</div>
            <div class="info">
               	<div ><input type="text" value="86,000" style="width:80px;"> 원 &nbsp; ~ &nbsp; <input type="text" value="86,000" style="width:80px;"> 원</div>
                  <div class="price_slider_wrp mT15">
                       <div class="price_slider" style="width:50%;">
                            <span class="ico slider_bar" style="left:0;"></span>
                            <span class="ico slider_bar" style="right:0;"></span>
                        </div>
               	 </div>
             </div>
       </div> <!-- pop_option  기간-->
       
       <div class="pop_option">
       		<div class="sb">연 료</div>
            <div class="info">
                <ul class="option_sel">
                    <li><a href="">휘발유</a></li>
                    <li><a href="">경유</a></li>
                    <li><a href="">LPG</a></li>
                    <li><a href="">전기차</a></li>
                    <li class="sel"><a href="">하이브리드</a></li>
                </ul><!-- car_kind_sel-->
            </div>
        </div><!--연료 -->

        <div class="pop_option">
            <div class="sb">연 식</div>
            <div class="info">
                <ul class="option_sel">
                    <li class="sel"><a href="">2019</a></li>
                    <li><a href="">2018</a></li>
                    <li><a href="">2017</a></li>
                    <li><a href="">2016</a></li>
                    <li><a href="">2015</a></li>
                    <li><a href="">2014</a></li>
                    <li><a href="">2013</a></li>
                </ul><!-- car_kind_sel-->
            </div>
      	</div><!-- 연식 -->

        <div class="pop_option">
       		<div class="sb">보 험</div>
            <div class="info">
                <ul class="option_sel">
                    <li class="sel"><a href="">일반자차</a></li>
                    <li><a href="">완전자차</a></li>
                    <li><a href="">완전자차(무제한)</a></li>
                </ul><!-- car_kind_sel-->
            </div>
        </div><!-- 보험 -->

        <div class="pop_option">
        	<div class="sb">제조사</div>
            <div class="info">
                <ul class="option_sel">
                    <li><a href="">현대</a></li>
                    <li><a href="">기아</a></li>
                    <li class="sel"><a href="">쉐보레</a></li>
                    <li><a href="">삼성</a></li>
                    <li><a href="">제네시스</a></li>
                    <li><a href="">수입차</a></li>
                </ul><!-- car_kind_sel-->
            </div>
        </div><!-- 제조사 -->

        <div class="pop_option">
        	<div class="sb">모 델</div>
       		<div class="info"><input type="text" placeholder="모델을 입력하세요"></div>
        </div><!-- 모델 -->

         <div class="pop_option">
        	<div class="sb">옵 션</div>
            <div class="info">
                <ul class="option_sel">
                    <li><a href="">금연차량</a></li>
                    <li><a href="">후방카메라</a></li>
                    <li><a href="">후방센서</a></li>
                    <li class="sel"><a href="">블랙박스</a></li>
                    <li><a href="">4륜구동</a></li>
                    <li><a href="">네비게이션</a></li>
                    <li><a href="">썬루프</a></li>
                    <li><a href="">블루투스</a></li>
                    <li><a href="">DMB</a></li>
                </ul><!-- car_kind_sel-->
            </div>
        </div><!-- 옵션 -->
       
    </div><!-- cons -->
	<div>
       <a href="" class="btn_b_cor">선택완료</a>
    </div>
</div><!-- 옵션선택 -->