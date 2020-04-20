<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">마이페이지</a></li>
            <li><span class="ico rjrs"></span><a href="#">회원수정</a></li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>마이페이지</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
		<div class="in">
        	<ul class="sub_mu">
                <li style="width:33.333%;" class="on"><a href="/html/mypage/modify.jsp">회원수정</a></li>
               	<li style="width:33.333%;"><a href="/html/mypage/reserve_list.jsp">에약내역</a></li>
                <li style="width:33.333%;"><a href="/html/mypage/out.jsp">회원탈퇴</a></li>
            </ul>
        </div>
        <div class="mT60 join_frm">
            <ul>
            	<li><p class="sb">아이디</p>
                  	<p class="frm"><input type="text" style="width:100%" placeholder="아이디를 입력하세요."></p></li>
                <li><p class="sb">이 름</p>
                  	<p class="frm"><input type="text" style="width:100%" placeholder="이름을 입력하세요."></p></li>
                <li><p class="sb">연락처</p>
                   	<p class="frm"><input type="text" style="width:100%" placeholder="예) 01022223333"></p></li>
                <li><p class="sb">이메일</p>
                   	<p class="frm"><input type="text" style="width:100%" placeholder="이메일을 입력하세요."></p></li>
            </ul>
         </div><!-- gy_box1 -->
         <div class="btn_wrp">
           	<a href="#" class="btn_b_cor">정보수정</a>
         </div><!-- btn_wrp -->
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>