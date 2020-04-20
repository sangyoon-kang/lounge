<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<header class="header">
	<div class="inner">
		<h1 class="navi_logo"><span><a href="javascript:alert('메인 페이지 없음')"><img src="/images/logo.png" /></a></span></h1>
        <div class="utmu">
        	<ul>
            	<li><a href="/html/member/login.jsp"><i class="ico ico_login"></i>
                	<span class="sb">로그인</span></a></li>
                <li><a href="/html/member/join.jsp"><i class="ico ico_join"></i>
                	<span class="sb">회원가입</span></a></li>
                <li style="display:none;"><a href="/html/member/login.jsp"><i class="ico ico_out"></i>
                	<span class="sb">로그아웃</span></a></li>
                <li style="display:none;"><a href="/html/member/join.jsp"><i class="ico ico_my"></i>
                	<span class="sb">정보수정</span></a></li>
            </ul>
        </div><!--"utmu -->
        <div class="navi">
        	<ul>
            	<li class="on"><a href="/html/reser/reser_check.jsp">실시간 예약</a><span class="ico navi_arr"></span></li>
                <li><a href="/html/mypage/reserve_list.jsp">예약확인</a><span class="ico navi_arr"></span></li>
                <li><a href="/html/agency/agency.jsp">지점안내</a><span class="ico navi_arr"></span></li>
                <li><a href="/html/promotion/promotion.jsp">프로모션</a><span class="ico navi_arr"></span></li>
                <li><a href="/html/customer/notice.jsp">고객센터</a><span class="ico navi_arr"></span></li>
            </ul>
        </div><!-- navi -->
	</div><!-- inner -->
</header>