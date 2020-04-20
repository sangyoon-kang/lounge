<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">마이페이지</a></li>
            <li><span class="ico rjrs"></span><a href="#">회원탈퇴</a></li>
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
                <li style="width:33.333%;"><a href="/html/mypage/modify.jsp">회원수정</a></li>
               	<li style="width:33.333%;"><a href="/html/mypage/reserve_list.jsp">에약내역</a></li>
                <li style="width:33.333%;" class="on"><a href="/html/mypage/out.jsp">회원탈퇴</a></li>
            </ul>
        </div>
        <div class="in mT60">
      		<p class="out_top_txt1 acen">탈퇴를 하시면 회원님의 <span class="f_red">모든 정보가 삭제</span>됩니다.</p>
            <p class="out_top_txt2 acen">(단, 결제정보는 법률상에 의거하여 5년간 보존됩니다.) </p>
        </div><!-- list -->
		<div class="out_wrp">
        	<div class="ico out_img"></div>
        	<div class="out_right">
            	<ul class="out">
                	<li class="sb">비밀번호</li>
                    <li class="frm"><input style="width:100%" placeholder="비밀번호를 입력하세요." type="text"></li>
                    <li class="sb">탈퇴사유 입력</li>
                    <li class="frm"><textarea style="width:100%; height:80px;"></textarea></li>
            </div>
        </div>
        <div class="btn_wrp">
           	<a href="#" class="btn_b_cor">탈퇴하기</a>
        </div>
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
