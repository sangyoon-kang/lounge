<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

 <div class="pop_wrp">
	<div class="pop_tit">옵션선택</div>
	<div class="cons">
    	<div>
    		<div class="in">
       			<div class="fleft pop_st w100 mT8">기간</div>
                <div class="fleft">
                	<div><input type="text" value="86,000" style="width:100px;"> 원 &nbsp; ~ &nbsp; <input type="text" value="86,000" style="width:100px;"> 원</div>
                    <div class="price_slider_wrp mT20">
                    	<div class="price_slider" style="width:60%;">
                        	<span class="ico slider_bar" style="left:0;"></span>
                            <span class="ico slider_bar" style="right:0;"></span>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
        <div class="mline" style="margin-top:15px;"></div>
        <div class="in">
       		<div class="fleft pop_st w100 mT8">연 료</div>
            <ul class="fleft option_sel">
                <li><a href="#">휘발유</a></li>
                <li><a href="#">경유</a></li>
                <li><a href="#">LPG</a></li>
                <li><a href="#">전기차</a></li>
                <li class="sel"><a href="#">하이브리드</a></li>
            </ul><!-- car_kind_sel-->
        </div><!--연료 -->
        <div class="mline"></div>
        <div class="in">
            <div class="fleft pop_st w100 mT8">연 식</div>
            <div class="in">
                <ul class="option_sel">
                    <li class="sel"><a href="#">2019</a></li>
                    <li><a href="#">2018</a></li>
                    <li><a href="#">2017</a></li>
                    <li><a href="#">2016</a></li>
                    <li><a href="#">2015</a></li>
                    <li><a href="#">2014</a></li>
                    <li><a href="#">2013</a></li>
                </ul><!-- car_kind_sel-->
            </div><!-- 연식 -->
      	</div>
        <div class="mline"></div>
        <div class="in">
       		<div class="fleft pop_st w100 mT8">보험</div>
        	<ul class="option_sel">
            	<li class="sel"><a href="#">일반자차</a></li>
                <li><a href="#">완전자차</a></li>
                <li><a href="#">완전자차(무제한)</a></li>
            </ul><!-- car_kind_sel-->
        </div><!-- 보험 -->
        <div class="mline"></div>
        <div class="in">
        	<div class="fleft pop_st w100 mT8">제조사</div>
        	<ul class="option_sel">
            	<li><a href="#">현대</a></li>
                <li><a href="#">기아</a></li>
                <li class="sel"><a href="#">쉐보레</a></li>
                <li><a href="#">삼성</a></li>
                <li><a href="#">제네시스</a></li>
                <li><a href="#">수입차</a></li>
            </ul><!-- car_kind_sel-->
        </div><!-- 제조사 -->
        <div class="mline"></div>
        <div class="in">
        	<div class="fleft pop_st w100 mT8">모 델</div>
       		<div class="fleft"><input type="text" placeholder="모델을 입력하세요" style="width:300px;"></div>
        </div><!-- 모델 -->
        <div class="mline" style="margin-top:20px;"></div>
        <div class="in">
        	<div class="fleft pop_st w100 mT8">옵 션</div>
        	<ul class="option_sel">
            	<li><a href="#">금연차량</a></li>
                <li><a href="#">후방카메라</a></li>
                <li><a href="#">후방센서</a></li>
                <li class="sel"><a href="#">블랙박스</a></li>
                <li><a href="#">4륜구동</a></li>
                <li><a href="#">네비게이션</a></li>
                <li><a href="#">썬루프</a></li>
                <li><a href="#">블루투스</a></li>
                <li><a href="#">DMB</a></li>
            </ul><!-- car_kind_sel-->
        </div><!-- 옵션 -->
        <div class="mline"></div>
        <div class="btn_wrp">
        	<a href="#" class="btn_m_cor">선택완료</a>
        </div>
    </div><!-- cons -->

</div><!-- pop_wrp -->

