<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do"></jsp:include>
	
	<%-- <!-- shalgah -->
	<jsp:include page="/module/access_hit" flush="true" />
	<!-- shalgah end  --> --%>
	<%-- <jsp:include page="/module/counter_admin" flush="true" /> --%>

	<!-- <div id="wrap"> -->
		<!--header S-->
		<!-- <div id="wrap_header">
	    	<h2 class="mg_logo">사이트관리자<br/><a href="" class="bt_gohome">내홈페이지바로가기→</a></h2>
			<ul class="gnb" id="gnb_link">
				<li link="/config/config01.html">환경설정</li>
				<li link="/basic/basic01.html">기본설정</li>
				<li link="/bbs/bbs01.html">게시판관리</li>
				<li link="/member/member01.html">회원관리</li>
				<li link="/poll/poll01.html">설문관리</li>
				<li link="/schedule/sch01.html">일정관리</li>
				<li link="/product/pro01.html">상품관리</li>
				<li link="/banner/banner01.html">배너관리</li>
				<li link="/connect/connect01.html">통계관리</li>
			</ul>
			<script type="text/javascript" language="Javascript">
	
				$(document).ready(function(){
					
					$('#gnb_link li').on("click", function(){
	
						var link_info = $(this).attr("link");
						//alert(link_info+'로 이동합니다.');
						location.href=link_info;
	
					});
	
				});
			</script>
			<p id="LogoutBtn">로그아웃</p>
		</div> -->
		<!--header E-->
	
	<!--wrap_scon S-->
	<div id="wrap_scon">
    	<!--lnb S-->
        <div id="wrap_lnb">
            <h2 class="lnb_title"><span class="title1">요약</span></h2>
            <ul class="lnb">
           <!--   <li class="lnb_depth1"><a href="./member/member01.html" class="depth1_on">회원 목록</a></li>
                <li class="lnb_depth1"><a href="./member/member02.html">회원 등급 관리</a></li>
                <li class="lnb_depth1"><a href="./member/member03.html">탈퇴회원</a></li>
                <li class="lnb_depth1"><a href="./member/member04.html">메일 발송 테스트</a></li>
                <li class="lnb_depth1"><a href="./member/member05.html">포인트 설정</a></li>
                <li class="lnb_depth1"><a href="./member/member06.html">포인트 목록</a></li>	 -->	
            </ul>
            <!--div id="copyright">
                <p>2016 LCDNS<br/>All rights reserved.</p>
            </div-->
        </div>
        <!--lnb E-->
    
		<div class="scon_title">
			<h2>요약</h2>
			<!-- <p>홈 > 게시판관리 > 회원 목록</p> -->
		</div>
		
        <!-- dashboard -->
        <%-- <%@ include file="/WEB-INF/jsp/mgr/dashboard.jsp"%> --%>         
       <jsp:include page="${URL_ADMIN_ROOT }/dashboard/stat_user_list"></jsp:include> 	
       
     </div>
	<!--wrap_scon E-->
	<!-- </div> -->
	<script>
		$(function() {
			//$('#wrap_lnb').hide();
		});
	</script>
	<!-- Styles -->


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>