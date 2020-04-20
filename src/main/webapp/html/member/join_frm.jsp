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
                	<li><p class="num">01</p>
                    	<p class="step_sb">본인인증</p></li>
                    <li class="on"><p class="num"><span class="ico check"></span></p>
                    	<p class="step_sb">정보입력</p></li>
                    <li><p class="num">03</p>
                    	<p class="step_sb">가입완료</p></li>
                </ul>
            </div><!-- join_step -->
            <div class="mT40 join_frm">
               <ul>
               		<li><p class="sb">아이디</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="아이디를 입력하세요."></p></li>
                    <li><p class="sb">비밀번호</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="8~16자리 영문, 숫자, 특수문자 조합"></p></li>
                    <li><p class="sb">비밀번호확인</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="비밀번호를 다시 입력하세요."></p></li>
                    <li><p class="sb">이름</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="이름을 입력하세요."></p></li>
                    <li><p class="sb">연락처</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="예) 01022223333"></p></li>
                    <li><p class="sb">이메일</p>
                    	<p class="frm"><input type="text" style="width:100%" placeholder="이메일을 입력하세요."></p></li>
               </ul>
                <div class="mT40">
               		<p><textarea style="width:100%; height:120px;">이용약관전문</textarea></p>
               		<p class="mT10"><input type="checkbox" name="agree1" id="agree1"><label for="agree1"><span class="ico"></span>이용약관에 동의합니다.</label> <span class="f_red">(필수)</span></p>
                    <p class="mT20"><textarea style="width:100%; height:120px;">개인정보처리방침</textarea></p>
                    <p class="mT10"><input type="checkbox" name="agree2" id="agree2"><label for="agree2"><span class="ico"></span>개인정보처리방침에 동의합니다.</label> <span class="f_red">(필수)</span></p>
               </div>
            </div><!-- gy_box1 -->
			<div class="btn_wrp">
            	<a href="/html/member/join_com.jsp" class="btn_b_cor">회원가입</a><a href="#" class="btn_b_black">취소</a>
            </div><!-- btn_wrp -->
        </div><!-- member_wrp -->
    </div><!--content -->        
</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
