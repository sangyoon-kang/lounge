<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>


<script type="text/javascript">
		$(function() {
			$('#agency').colorbox({
				href : '/html/reser/agency.jsp'
				, overlayClose: false
				, width: 600
				, height:380
			});
			$('#period').colorbox({
				href : '/html/reser/period.jsp'
				, overlayClose: false
				, width: 950
				, height:560
			});
			$('#take_time').colorbox({
				href : '/html/reser/take_time.jsp'
				, overlayClose: false
				, width: 380
				, height:310
			});
			$('#return_time').colorbox({
				href : '/html/reser/return_time.jsp'
				, overlayClose: false
				, width: 380
				, height:310
			});
			$('#option').colorbox({
				href : '/html/reser/option.jsp'
				, overlayClose: false
				, width: 750
				, height:865
			});
		});
</script>


<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">실시간예약</a>      </li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>실시간 예약</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
    	<div class="reser_wrp">
        	<ul class="reser">
            	<li><div class="sb"><span class="ico ico_agy"></span>지 점</div>
                	<div class="sel">
                    	<div class="inbox">
                        	<a href="#" id="agency" ><span class="tit">서울 / 김포공항</span></a>
                        </div>
                    </div></li>
                <li><div class="sb"><span class="ico ico_period"></span>기 간</div>
                	<div class="sel">
                  	 	<div class="inbox fleft on" style="width:303px;">
                        	<a href="#" id="period"><span class="sel_cons">2015-09-30</span></a>
                        </div>
                    	<div class="inbox fright" style="width:303px;">
                        	<a href="#"><span class="tit">반납일</span></a>
                        </div>
                    </div></li>
                <li><div class="sb"><span class="ico ico_time"></span>시 간</div>
                	<div class="sel">
                  	 	<div class="inbox fleft" style="width:303px;">
                        	<a href="#" id="take_time"><span class="tit">인수시간</span></a>
                        </div>
                    	<div class="inbox fright" style="width:303px;">
                        	<a href="#" id="return_time"><span class="tit">반납시간</span></a>
                        </div>
                    </div></li>
                <li><div class="sb"><span class="ico ico_kind"></span>차 종</div>
                	<div class="sel">
                  	 	<div class="inbox fleft" style="width:197px;">
                        	<a href="/html/reser/car_list.jsp"><span class="tit">소형/준중형</span></a>
                        </div>
                    	<div class="inbox fleft mL15" style="width:196px;">
                        	<a href="#"><span class="tit">중형/대형</span></a>
                        </div>
                        <div class="inbox fleft mL15" style="width:197px;">
                        	<a href="#"><span class="tit">SUV/승합차</span></a>
                        </div>
                    </div></li>
                <li><div class="sb"><span class="ico ico_det"></span>상 세</div>
                	<div class="sel">
                    	<div class="inbox">
                        	<a href="#" id="option"><span class="tit">상세옵션을 선택하세요</span></a>
                        </div>
                    </div></li>
            </ul>
            <div class="btn_wrp aright">
            	<a href="#" class="btn_b_black" style="width:305px; margin:0;">초기화</a><a href="#" class="btn_b_cor mL15" style="width:305px; margin:0 0 0 10px;;">검색</a>
            </div>
        </div><!--reser_wrp -->
    </div><!--content -->
</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
