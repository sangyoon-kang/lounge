<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>


<script type="text/javascript">
		$(function() {
			$('#lease_clause').colorbox({
				href : '/html/reser/lease_clause.jsp'
				, overlayClose: false
				, width: 700
				, height:480
			});
			$('#insur_clause').colorbox({
				href : '/html/reser/insur_clause.jsp'
				, overlayClose: false
				, width: 700
				, height:480
			});
			$('#cancel_clause').colorbox({
				href : '/html/reser/cancel_clause.jsp'
				, overlayClose: false
				, width: 700
				, height:480
			});
		});
</script>

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
    	<div class="reser_option">
        	<div class="in">
                <div class="reser_st">이벤트 및 쿠폰</div>
                <ul class="input_wrp">
                    <li><span class="ic_jm"></span>
                    	<p class="sb">이벤트</p>
                    	<p><select style="width:300px;"><option>선택하세요</option></select></p></li>
                     <li><span class="ic_jm"></span>
                     	<p class="sb">쿠폰</p>
                    	<p><input type="text" style="width:300px;" placeholder="쿠폰번호를 입력하세요"></p></li>
                     <li><span class="ic_jm"></span>
                     	<p class="sb">적립금</p>
                    	<p><input type="text" style="width:300px;"  placeholder="보유적립금 10,000원"></p></li>
                </ul>
                <div class="etc_ex">
                	<p>- 이벤트와 쿠폰은 중복 사용이 안됩니다.</p>
                    <p>- 적립금은 10,000원 이상, 1,000원 단위로 사용 가능합니다</p>
                </div>
            </div><!-- 이벤트 및 쿠폰 -->
            <div class="in mT50">
                <div class="reser_st">자차손해 고객부담금</div>
                <div>
                	<span><input type="radio" id="pr1" name="pr"checked><label for="pr1"><span class="ico"></span>50만원 (0원)</label></span>
                    <span class="mL30"><input type="radio" id="pr2" name="pr"><label for="pr2"><span class="ico"></span>0만원 (15,000원)</label></span>
                    <span class="mL30"><input type="radio" id="pr3" name="pr"><label for="pr3"><span class="ico"></span>면제 (25,000원)</label></span>
                </div>
            </div><!-- 자차손해 고객부담금 -->
            <div class="in mT50">
                <div class="reser_st">카시트 대여</div>
                <div>
                	<span><input type="radio" id="mon1" name="mon" checked><label for="mon1"><span class="ico"></span>없음 (0원)</label></span>
                    <span class="mL30"><input type="radio" id="mon2" name="mon"><label for="mon2"><span class="ico"></span>0~36개월용 (30,000원)</label></span>
                    <span class="mL30"><input type="radio" id="mon3" name="mon"><label for="mon3"><span class="ico"></span>4~8세용 (30)</label></span>
                    <span class="mL30"><input type="radio" id="mon4" name="mon"><label for="mon4"><span class="ico"></span>9~13세용 (30,000원)</label></span>
                </div>
            </div><!-- 카시트 대여 -->
            <div class="in mT50">
                <div class="reser_st">운전자 정보 사전등록</div>
                <div class="bold"><input type="checkbox" name="ap" id="ap"checked><label for="ap"><span class="ico"></span>운전자 정보 사전등록 신청</label></div>
                <div class="mT10">
                	<textarea style="width:100%; height:100px;">운전자 정보 사전등록에 관한 개인정보제공 동의
제2 운전자 면허정보 제공에 대한 책임도 표시되어 있어야 함.
등록된 운전자는 대여 당일 운전면허증을 확인 후 대여가 가능합니다.</textarea>
                </div>
                <script>
					function tabchk(num) {
						  if(num == "01"){
						  tab01.style.display="";tab02.style.display="none";
						  }
						
						  if(num == "02"){
						  tab01.style.display="none";tab02.style.display="";
						  }
					 }
				 </script>
                <div id="tab01" class="mT20" style="block;">
                    <ul class="s_tab">
                        <li class="on" style="width:160px;"><a href="javascript:tabchk(01)">운전자 면허정보</a></li>
                        <li style="width:160px;"><a href="javascript:tabchk(02)">제2 운전자면허정보</a></li>
          		  	</ul>
                    <ul class="input_wrp mT15">
                        <li><span class="ic_jm"></span>
                        	<p class="sb">면허구분</p>
                            <p><span><input type="radio" name="nat" id="nat1" checked><label for="nat1"><span class="ico"></span>국내</label></span>
                   				<span class="mL30"><input type="radio" name="nat" id="nat2"><label for="nat2"><span class="ico"></span>국제</label></span></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허종류</p>
                            <p><select style="width:300px;"><option>1종보통</option></select></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허증번호</p>
                            <p><input type="text" style="width:60px;">
                            	<input type="text" style="width:60px;" class="mL3">
                                <input type="text" style="width:100px;" class="mL3">
                                <input type="text" style="width:60px;" class="mL3"></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허발급일</p>
                            <p><input type="text" style="width:300px;"  placeholder="예)20170120"></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">법정생년월일</p>
                            <p><input type="text" style="width:300px;"  placeholder="예)1980120 "></p></li>
                	</ul>
                </div><!-- tab01 운전자 면허정보 -->
                <div id="tab02" class="mT20" style="display:none;">
                    <ul class="s_tab">
                        <li style="width:160px;"><a href="javascript:tabchk(01)">운전자 면허정보</a></li>
                        <li class="on" style="width:160px;"><a href="javascript:tabchk(02)">제2 운전자면허정보</a></li>
          		  	</ul>
                    <ul class="input_wrp mT15">
                        <li><span class="ic_jm"></span>
                        	<p class="sb">면허구분</p>
                            <p><span><input type="radio" name="nat" id="nat3" ><label for="nat3"><span class="ico"></span>국내</label></span>
                   				<span class="mL30"><input type="radio" name="nat" id="nat4"><label for="nat4"><span class="ico"></span>국제</label></span></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허종류</p>
                            <p><select style="width:300px;"><option>1종보통</option></select></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허증번호</p>
                            <p><input type="text" style="width:60px;">
                            	<input type="text" style="width:60px;" class="mL3">
                                <input type="text" style="width:100px;" class="mL3">
                                <input type="text" style="width:60px;" class="mL3"></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">면허발급일</p>
                            <p><input type="text" style="width:300px;"  placeholder="예)20170120"></p></li>
                         <li><span class="ic_jm"></span>
                         	<p class="sb">법정생년월일</p>
                            <p><input type="text" style="width:300px;"  placeholder="예)1980120 "></p></li>
                	</ul>
                </div><!-- tab02 >제2 운전자면허정보 -->
            </div><!-- 운전자 정보 사전등록 -->
            <div class="in mT50">
                <div class="reser_st">약과동의</div>
                <div class="bold"><input type="checkbox" id="agree" name="agree"><label for="agree"><span class="ico"></span>모든 약관에 동의합니다</label></div>
                <ul class="ag_check">
                	<li><p class="fleft"><input type="checkbox" id="agree1" name="agree1"><label for="agree1"><span class="ico"></span>대여약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                    	<p class="fright"><a href="#" id="lease_clause" class="btn_s_grey">약관전문보기<span class="ico"></span></a></p></li>
                    <li><p class="fleft"><input type="checkbox" id="agree2" name="agree2"><label for="agree2"><span class="ico"></span>보험약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                    	<p class="fright"><a href="#" id="insur_clause" class="btn_s_grey">약관전문보기<span class="ico"></span></a></p></li>
                    <li><p class="fleft"><input type="checkbox" id="agree3" name="agree3"><label for="agree3"><span class="ico"></span>취소/환불약관에 동의합니다. <span class="f_red">(필수)</span></label></p>
                    	<p class="fright"><a href="#" id="cancel_clause" class="btn_s_grey">약관전문보기<span class="ico"></span></a></p></li>
                </ul>
                
            </div><!-- 약과동의 -->
            <div class="btn_wrp">
            	<a href="#" class="btn_b_black">이전</a><a href="#" class="btn_b_cor">예약하기</a>
            </div><!-- btn_wrp -->
        </div><!-- reser_option -->
        <div class="reser_car_info">
          	<div class="car_info">
            	<div class="wrp">
                    <div class="kind">그랜져HG<span class="mL10">(L)</span></div>
                    <ul class="checked">
                        <li>2017년식</li>
                        <li>금연차량</li>
                        <li>후방센서</li>
                        <li>네비게이션</li>
                    </ul><!-- checked -->
                </div><!-- wrp -->
                <div class="car_img"><img src="/images/sample.jpg"></div>
                <div class="wrp">
                	<ul class="re_time">
                    	<li><p class="re_sb">인 수</p>
                        	<p class="time">2018-08-01 (수)  09시</p></li>
                        <li><p class="re_sb">반 납</p>
                        	<p class="time">2018-08-01 (수)  09시</p></li>
                        <span class="ico arr"></span>
                    </ul>
                    <ul class="mT20 box_info">
                        <li><span class="ic_jm"></span>지 점&nbsp; : &nbsp;서울/김포공항</li>
                        <li><span class="ic_jm"></span>장 소&nbsp; : &nbsp;서울시 금천구 가산동 327-32번지</li>
                        <li><span class="ic_jm"></span>업 체&nbsp; : &nbsp;타고렌트카</li>
               		</ul>
                </div><!-- wrp -->
            </div><!-- car_info -->
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
                    <li class="total"><p class="price_sb">총 &nbsp;합 &nbsp;계</p>
                    	<p class="price">98,000 원</p></li>
                </ul>
            </div><!-- price_info -->
        </div><!-- reser_car_info -->
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
