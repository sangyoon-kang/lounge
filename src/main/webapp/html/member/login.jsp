<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">로그인</a> </li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>로그인</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
    	<div class="login_wrp">
        	<p><input type="text" class="ico input_id" placeholder="아이디 입력"><span class="ico ico_id "></span></p>
            <p class="mT8"><input type="password" class="input_pwd ico" placeholder="비밀번호 입력"><span class="ico ico_pwd "></span></p>
            <p class="mT15"><input type="checkbox" name="loginon" id="loginon"><label for="loginon"><span class="ico"></span>로그인 상태 유지</label></p>
            <p class="mT20"><a href="#" class="btn_login">로그인</a></p>
            <div class="et_mu">
           		<ul>
            		<li><a href="/html/member/id_search.jsp">아이디 찾기</a></li>
                    <li><a href="/html/member/pwd_search.jsp">비밀번호 찾기</a></li>
					<li><a href="/html/member/join.jsp">회원가입</a></li>                    
            	</ul>
            </div>
            <div class="sns">
            	<div class="sns_st">SNS 계정 로그인</div>
                <ul>
                	<li><a href="#" class="ico ico_f">페이스북</a></li>
                    <li><a href="#" class="ico ico_n">네이버</a></li>
                    <li><a href="#" class="ico ico_g">구글플러스</a></li>
                    <li><a href="#" class="ico ico_k">카카오톡</a></li>
                </ul>
            </div><!-- sns -->
        </div><!-- login_srp -->
        
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
