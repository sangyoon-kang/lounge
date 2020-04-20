<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<script type="text/javascript">
	jQuery.fn.center = function () {
		this.css("position","absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}
	
	saved_money = function() {
		$("#saved_money").show();
		$("#saved_money").center();
	}
	
	lease_clause = function() {
		$("#lease_clause").show();
		$("#lease_clause").center();
	}

	insur_clause = function() {
		$("#insur_clause").show();
		$("#insur_clause").center();
	}

	cancel_clause = function() {
		$("#cancel_clause").show();
		$("#cancel_clause").center();
	}
</script>

<article>
    <div class="container">
        <h2>실시간 예약</h2>
        <div class="contents">
          	<div class="reser_car_info">
            	<div class="info_top">
                	<div class="fleft mT5 mR5 ico ico_d"></div>
                    <div>
                        <p class="maker">현대/준중형<span class="mL8">2017년식</span></p>
                        <p class="kind">그랜져HG</p>
                    </div>
                </div>
                <div class="wrp">
                    <ul class="checked">
                        <li>2017년식</li>
                        <li>금연차량</li>
                        <li>후방센서</li>
                        <li>네비게이션</li>
                    </ul><!-- checked -->
                </div>
                <div  class="re_time">
                	<ul>
                    	<li><p class="re_sb">인 수</p>
                        	<p class="time">2018-08-01 (수)  09시</p></li>
                        <li><p class="re_sb">반 납</p>
                        	<p class="time">2018-08-01 (수)  09시</p></li>
                        <span class="ico arr"></span>
                    </ul>
                </div><!-- re_time_wwp -->
                <div class="wrp">
                    <ul class="mT25 box_info">
                        <li><span class="ic_jm"></span>지 점&nbsp; : &nbsp;서울/김포공항</li>
                        <li><span class="ic_jm"></span>장 소&nbsp; : &nbsp;서울시 금천구 가산동 327-32번지</li>
                        <li><span class="ic_jm"></span>업 체&nbsp; : &nbsp;타고렌트카</li>
               		</ul>
                </div><!-- tblock -->
            </div><!-- car_info -->
			<div class="reser_event">
                <ul class="input_wrp">
                    <li><p class="sb">이벤트</p>
                    	<p class="ex"><select><option>선택하세요</option></select></p></li>
                     <li><p class="sb">쿠 폰</p>
                    	<p class="ex"><input type="text" placeholder="쿠폰번호를 입력하세요" class="col-7"><span class="col-3 pdL5"><a href="" class="btn_s_grey">확인</a></span></p>

                     <li><p class="sb">적립금<a href="javascript:;" onclick="javascript:saved_money()" class="saved_money">?</a></p>
                    	<p class="ex"><input type="text" placeholder="보유적립금 10,000원" class="col-7"><span class="col-3 pdL5"><a href="" class="btn_s_grey">전액사용</a></span></p>
                </ul>
                <ul class="mT10 box_info f_red">
                   <li><span class="ic_jm"></span>이벤트와 쿠폰은 중복 사용이 안됩니다.</li>
                   <li><span class="ic_jm"></span>적립금은 10,000원 이상, 1,000원 단위로 사용 가능합니다.</li>
               	</ul>
            </div><!-- reser_event -->
            <div class="reser_check">
                <ul >
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);">자차손해 고객부담금</a>
                        <div class="check_cons">
                        	<p><input type="radio" id="pr1" name="pr" checked=""><label for="pr1"><span class="ico"></span>50만원 (0원)</label></p>
                            <p><input type="radio" id="pr2" name="pr"><label for="pr2"><span class="ico"></span>0만원 (15,000원)</label></p>
                            <p><input type="radio" id="pr3" name="pr"><label for="pr3"><span class="ico"></span>면제 (25,000원)</label></p>
                        </div>
                    </li>
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);">카시트대여</a>
                        <div class="check_cons">
                        	<p><input type="radio" id="pr1" name="pr" checked=""><label for="pr1"><span class="ico"></span>없음 (0원)</label></p>
                            <p><input type="radio" id="pr2" name="pr"><label for="pr2"><span class="ico"></span>0~36개월용 (30,000원)</label></p>
                            <p><input type="radio" id="pr3" name="pr"><label for="pr3"><span class="ico"></span>4~8세용 (30)</label></p>
                            <p><input type="radio" id="pr3" name="pr"><label for="pr3"><span class="ico"></span>9~13세용 (30,000원)</label></p>
                        </div>
                    </li>
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);">최종결제금액<span class="fright f_red">98,000원</span></a>
                        <div class="check_cons">
                        	<div class="price_info">
                                <ul>
                                    <li><p class="price_sb">대여금액</p>
                                        <p class="price">60,000 원</p></li>
                                    <li><p class="price_sb">추가금액</p>
                                        <p class="price"><span class="part_ex">(자차손해면책)</span>30,000 원</p></li>
                                    <li><p class="price"><span class="part_ex">(카시드)</span>30,000 원</p></li>
                                    <li><p class="price_sb">할인금액</p>
                                        <p class="price"><span class="part_ex">(첫구매)</span>30,000 원</p></li>
                                    <li><p class="price_sb">적 &nbsp;립 &nbsp;금</p>
                                        <p class="price">- 2,000 원</p></li>

                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);">결제방법선택<span class="fright f_blue">카카오페이</span></a>
                        <div class="check_cons">
                        	<div class="price_info">
                                <div class="block">
                                	<span class="fleft"><input type="radio" id="pr1" name="pr" checked=""><label for="pr1"><span class="ico"></span>간편결제</label></span>
                                	<span class="fleft mL20"><input type="radio" id="pr1" name="pr" checked=""><label for="pr1"><span class="ico"></span>일반결제</label></span></div>
                                <div class="method">
                                	<a href="">PAYCO</a>
                                    <a href="">Naver페이</a>
                                    <a href="">카카오페이</a>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);"><input type="checkbox">결제 약관동의</a>
                        <div class="check_cons">
                        	<div class="bold"><input type="checkbox" id="agree" name="agree"><label for="agree"><span class="ico"></span>모든 약관에 동의합니다</label></div>
                        	<ul class="ag_check">
                                <li><p class="fleft"><input type="checkbox" id="agree1" name="agree1"><label for="agree1"><span class="ico"></span>대여약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                                    <p class="fright"><a href="javascript:;" onclick="javascript:lease_clause()" class="btn_ss_grey">보기</a></p></li>
                                <li><p class="fleft"><input type="checkbox" id="agree2" name="agree2"><label for="agree2"><span class="ico"></span>보험약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                                    <p class="fright"><a href="javascript:;" onclick="javascript:insur_clause()" class="btn_ss_grey">보기</a></p></li>
                                <li><p class="fleft"><input type="checkbox" id="agree3" name="agree3"><label for="agree3"><span class="ico"></span>취소/환불약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                                    <p class="fright"><a href="javascript:;" onclick="javascript:cancel_clause()" class="btn_ss_grey">보기</a></p></li>
                            </ul>
                        </div>
                    </li>
             	</ul>
            </div><!-- reser_check -->
            <div class="btn_wrp">
            	<span class="col-5 fleft"><a href="" class="btn_b_black">이전</a></span>
                <span class="col-5 fleft pdL2"><a href="/m/reser/reserve_com.asp" class="btn_b_cor">예약하기</a></span>
            </div>
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

<div id="saved_money" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">적립금</span><a href="" class="ico btn_close"></a></div>
	<div class="cons ">
    	<div class="gy_box1">
        	<ul class="box_info aleft">
            	<li><span class="ic_jm"></span>적립금은 1,000원 이상부터 사용 가능합니다.</li>
                <li><span class="ic_jm"></span>1회 사용 가능한 최대 적립금은 100,000원입니다.</li>
                <li><span class="ic_jm"></span>사용 가능 적립금은 적립금, 1회 사용 가능한 최대 적립금, 차량 이용료를 계산하여 제공됩니다.</li>
            </ul>
        </div>
        <div class="mT20 f16 bold">
        	<p>보유 적립금 : <span class="f_blue">300,000원</span></p>
            <p class="mT5">사용 가능 적립금 : <span class="f_red">120,000원</span></p>
        </div>
    </div><!-- cons -->
	<div>
       	<a href="" class="btn_b_cor">확인</a>
     </div>
</div><!-- 적립금 -->

<div id="lease_clause" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">대여약관</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<textarea style="height:300px;">대애약관 내용</textarea>
    </div><!-- cons -->
	<div>
       	<span class="fleft col-5"><a href="" class="btn_b_cor">확인</a></span>
        <span class="fleft col-5 pdL2"><a href="" class="btn_b_black">취소</a></span>
     </div>
</div><!-- 대여약관 -->

<div id="insur_clause" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">보험약관</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<textarea style="height:300px;">보험약관 내용</textarea>
    </div><!-- cons -->
	<div>
       	<span class="fleft col-5"><a href="" class="btn_b_cor">확인</a></span>
        <span class="fleft col-5 pdL2"><a href="" class="btn_b_black">취소</a></span>
     </div>
</div><!-- 보험약관 -->

<div id="cancel_clause" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">취소/환불약관</span><a href="" class="ico btn_close"></a></div>
	<div class="cons acen">
    	<textarea style="height:300px;">취소/환불약관 내용</textarea>
    </div><!-- cons -->
	<div>
       	<span class="fleft col-5"><a href="" class="btn_b_cor">확인</a></span>
        <span class="fleft col-5 pdL2"><a href="" class="btn_b_black">취소</a></span>
     </div>
</div><!-- 취소/환불약관 -->