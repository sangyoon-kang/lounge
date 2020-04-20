<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">회원가입</a></li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>회원가입</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
  		<div class="member_wrp">
        	<div class="join_step">
            	<div class="bg_line"></div>
            	<ul class="step">
                	<li class="on"><p class="num"><span class="ico check"></span></p>
                    	<p class="step_sb">본인인증</p></li>
                    <li><p class="num">02</p>
                    	<p class="step_sb">정보입력</p></li>
                    <li><p class="num">03</p>
                    	<p class="step_sb">가입완료</p></li>
                </ul>
            </div><!-- join_step -->
            <div class="mT40 gy_box1">
                <ul class="box_info">
                    <li><span class="ic_jm"></span>회원가입은 본인인증을 받으셔야 합니다.</li>
                    <li><span class="ic_jm"></span>만14세 미만은 본인인증 후 부모님(법정대리인)의 동의가 필요합니다.</li>
                    <li><span class="ic_jm"></span>법인 명의 휴대폰은 통신사의 지점 또는 대리점에서 법인명의 실사용자 등록 후 인증이 가능합니다.</li>
                </ul><!-- box_info -->
            </div><!-- gy_box1 -->
            <div class="cerf">
				<div class="hp_cerf" style="border-right:1px solid #ccc;">
					<i class="ico hp_img"></i>
					<p class="sb">휴대폰 인증 회원가입</p>
					<p class="ex">본인 명의로 등록된 휴대폰 정보를 통해<br>본인 인증을 하실 수 있습니다.</p>
					<p class="mT25"><a href="/html/member/join_frm.jsp" class="btn_m_black">휴대폰 인증</a></p>
				</div>
				<div class="ipin_cerf">
					<i class="ico ipin_img"></i>
					<p class="sb">아이핀 인증 회원가입</p>
					<p class="ex">인터넷상의 주민등록번호 대체 보인인증 수단인<br>아이핀 인증을 통해  보인 인증을 하실 수 있습니다.</p>
					<p class="mT25"><a href="/html/member/join_frm.jsp" class="btn_m_black">아이핀 인증</a></p>
				</div>
			</div>
        </div><!-- member_wrp -->
    </div><!--content -->        
</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>