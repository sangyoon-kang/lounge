<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<nav id="menu" style="display: none;">
		<div class="cate_content">
			<div class="cate_all">
				<ul class="nav_list" >
					<li class='nav_depth1 lcd_category' id="runTimeParentMob" id='lcd_category1' link='#'><span>FX거래하기</span></li>
					
					<c:if test="${!empty tagoplusSolution1_session_user}">
                    	<li class="nav_depth2 lcd_category1 " style="display: none;" link="/fxresult/list.do">거래결과</li>
                    </c:if>
					
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>FX소개</span></li>
					
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/margin_trading.jsp">FX거래란?</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/instruction.jsp">이용방법</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/investment.jsp">투자정보</li>
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>입출금 신청</span></li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/deposit/list.do">입출금 거래</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/deposit/deposit_popup.do">입금 신청</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/deposit/withdraw_popup.do">출금 신청</li>
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>회사소개</span></li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/about_us.jsp">회사소개</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/address.jsp">오시는 길</li>
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>고객센터</span></li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/notice.jsp">공지사항</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/consulting.jsp">1:1문의</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/pages/fx_pages/bugreport.jsp">버그바운티</li>
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>나의 거래내역</span></li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/mypage/history_popup.do">나의 거래내역</li>
					<li class="nav_depth1 lcd_category" id="lcd_category1" link="#"><span>마이페이지</span></li>
<c:if test="${empty tagoplusSolution1_session_user}">
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/login">로그인</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/join">회원가입</li>
</c:if>
<c:if test="${!empty tagoplusSolution1_session_user}">
	<c:if test="${tagoplusSolution1_session_user.gradeLevel lt 6}">
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="/mypage/ms_shop">대리점관리</li>
     </c:if>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="javascript:$.Nav('go', '${!tagoplusSolution1_session_user.snsYn ? '/auth' : '/request_modify.do'}', {id: '${tagoplusSolution1_session_user.userId}'});">정보수정</li>
					<li class="nav_depth2 lcd_category1 " style="display: none;" link="javascript:doLogout();">로그아웃</li>
</c:if>
				</ul>
			</div>
		</div> 
	</nav>
	<style>
	.nav_list li.nav_depth2 a {
   
    font-size: 14px;
    font-weight: 400;
    color: rgba(255,255,255,0.9);
    text-align: right;
   
}

</style>
<header id="wrap_header" class="">
<div class="snb_bg" style="display: none;"></div>
<div class="header">

          <h1 class="logo"><a href="/"><img src="/images/common/logo.png" alt="FX라운지"></a></h1>
         
<nav class="gnb">

          <ul >
               <li class="gnb_list" id="gnb">
                    <a href="#" class="gnb_tit">FX거래하기</a>
                  <div class="gnb_bg">
                   <ul class="menu" id="runTimeParent" style="display: none;">
                        <c:if test="${!empty tagoplusSolution1_session_user}">
                           <li class="sub-item">
                               <a href="/fxresult/list.do" class="sub-link">거래결과</a>
                           </li>
                        </c:if>
                   </ul>
                   </div>
               </li>
               <li class="gnb_list" id="gnb">
                    <a href="#" class="gnb_tit">FX소개</a>
                    <div class="gnb_bg">
                    <ul class="menu" style="display: none;">
                         <li class="sub-item">
                              <a href="/pages/fx_pages/margin_trading.jsp" class="sub-link">FX거래란?</a>
                         </li>
                         <li class="sub-item">
                              <a href="/pages/fx_pages/instruction.jsp" class="sub-link">이용방법</a>
                         </li>
                         <li class="sub-item">
                            <a href="/pages/fx_pages/investment.jsp"  class="sub-link">투자정보</a>
                         </li>
                    </ul>
                    </div>
               </li>
               <li class="gnb_list" id="gnb">
                  <a href="#" class="gnb_tit">입출금 신청</a>
                  <div class="gnb_bg">
                    <ul class="menu" style="display: none;">
                      <li class="sub-item">
                          <a href="/deposit/list.do" class="sub-link">입출금 내역</a>
                      </li>
                      <li class="sub-item">
                          <a href="/deposit/deposit_popup.do" class="sub-link">입금신청</a>
                      </li>
                      <li class="sub-item">
                          <a href="/deposit/withdraw_popup.do" class="sub-link">출금신청</a>
                      </li>
                  </ul>
                  </div>
               </li>
               <li class="gnb_list" id="gnb">
                    <a href="#" class="gnb_tit">회사소개</a>
					<div class="gnb_bg">
                    <ul class="menu" style="display: none;">
                         <li class="sub-item">
                              <a href="/pages/fx_pages/about_us.jsp" class="sub-link">회사소개</a>
                         </li>
                         <li class="sub-item">
                              <a href="/pages/fx_pages/address.jsp" class="sub-link">오시는 길</a>
                         </li>
                    </ul>
                    </div>

               </li>
               <li class="gnb_list" id="gnb">
                    <a href="#" class="gnb_tit">고객센터</a>
					<div class="gnb_bg">
                    <ul class="menu" style="display: none;">	
                         <li class="sub-item">
                              <a href="/pages/fx_pages/notice.jsp" class="sub-link">공지사항</a>
                         </li>
                         <!-- li class="sub-item">
                              <a href="/pages/fx_pages/tickchart.jsp" class="sub-link">틱차트공지</a>
                         </li -->
                         <!--li class="sub-item">
                              <a href="/pages/fx_pages/consulting.jsp" class="sub-link">1:1문의</a>
                         </li>
                         <li class="sub-item">
                              <a href="/pages/fx_pages/bugreport.jsp" class="sub-link">버그바운티</a>
                         </li-->
                    </ul>
                    </div>

               </li>
               <li class="gnb_list" id="gnb">
                    <a href="#" class="gnb_tit">나의 거래내역</a>
					<div class="gnb_bg">
                    <ul class="menu" style="display: none;">	
                         <li class="sub-item">
                              <a href="/mypage/history_popup.do" class="sub-link">나의 거래내역</a>
                         </li>
                         
                    </ul>
                    </div>

               </li>
          </ul>
</nav>
<div class="tnb">
             <c:if test="${empty tagoplusSolution1_session_user }">
                 <ul >
                     <li>
                         <a href="/login">로그인</a>
                     </li>
                     <li>
                         <a href="/join" > 회원가입</a>
                     </li>
                 </ul>
             </c:if>
             <c:if test="${!empty tagoplusSolution1_session_user }">
                 <ul>
                     <li>
                         <a href="/">홈</a>
                     </li>
                     <c:if test="${tagoplusSolution1_session_user.gradeLevel lt 6}">
                         <li>
                             <a href="/mypage/ms_shop" target="_blank">대리점관리</a>
                         </li>
                     </c:if>
                     <li>
                         <a href="javascript:$.Nav('go', '/auth', {id: '${tagoplusSolution1_session_user.userId}'});">정보수정</a>
                     </li>
                     <li>
                         <a href="javascript:doLogout();">로그아웃</a>
                     </li>
                 </ul>
             </c:if>
</div>
<div class="right_menu">
				<a href="javascript:togRightMenu();" class="menu-right">
					<ul>
						<li class="">menubar</li>
						<li class="">menubar</li>
						<li class="">menubar</li>
					</ul>
				</a>
			</div>
    
</div>
</header>





<script type="text/javascript">
function doLogout() {
	$.Nav('go', '/logout', null, null, true);	
}

$.ajax({
	url: '/ajax/getRunTimes'
	, type: 'post'
	, dataType: 'json'
	, data: {}
	, success: function (data) {
		if (data.list) {
			for(var i=0; i<data.list.length; i++){
				var a = getRandomInt(100);
				var b = 100 - a;
				//web
				var el="<li class='sub-item'><a href='/prd/deal.do?runTime="+data.list[i].runTime+"' class='sub-link'>"+data.list[i].runTime+"분거래</a></li>";
				$("#runTimeParent").prepend(el);
				//mobile
				var el1="<li class='nav_depth2 lcd_category1' style='display: none;' ><a href='/prd/deal.do?runTime="+data.list[i].runTime+"' >"+data.list[i].runTime+"분거래</a></li>";
				//$("#runTimeParentMob").append(el1);
				$(el1).insertAfter("#runTimeParentMob"); 
				var bread = "<li class=select_menu_option><a class=select_menu_link href='/prd/deal.do?runTime="+data.list[i].runTime+"'>"+data.list[i].runTime+"분거래</a></li>";
				$("#bread_deal").prepend(bread);
				if (typeof renderBread === "function") { 
					renderBread();
				}
				var tableData = 	"<tr>"+
									"<td>"+data.list[i].runTime+"분거래</td>"+
									"<td class=text-blue>"+data.list[i].stopLimit+
									"<ul class=mcon02_arrow><li><img src=/images/main/mcon03_ico_up.png alt=상승 /></li><li><img src=/images/main/mcon03_ico_down.png alt=하락 /></li></ul></td>"+
									"<td>"+a+"%</td>"+
									"<td>"+b+"%</td>"+
									"<td><a class='bordered' href='/prd/deal.do?runTime="+data.list[i].runTime+"'>바로가기</a></td>"+
								"</tr>";
				
				$(".runTable").each(function(){
					$(this).prepend(tableData);
				})
				
				
			}
			
		}
		
		

	}
	, error: function (data) {
		alert('Request Exception (' + data.status + ')\n' + data.statusText);
	}
});



function getRandomInt(max) {
	  return Math.floor(Math.random() * Math.floor(max));
	}
 
$(document).ready(function(){
    $(".trade_con04_graph_tip").click(function(){
        $(".trade_con_04_graph_tip_layer").slideToggle("fast");
		$(this).toggleClass("on");
    });
});
</script>


	<!-- 메뉴드롭 -->
<script type="text/javascript">

$(function(){	
	// 하나씩 나올때
    $('.gnb_list').hover(function(){
        $(this).find(".menu").show();
        //$('.snb_bg').show();
        $("#wrap_header").addClass("active");
		$(this).find(".gnb_tit").addClass("active");
     }, function(){
        $(this).find(".menu").hide();
        //$(".snb_bg").hide();
        $("#wrap_header").removeClass("active");
		$(this).find(".gnb_tit").removeClass("active");
    });
	
	



	


});

</script>

<script type="text/javascript">
//모바일
// 햄버거메뉴
$(function() {
	var bViewMenu = false;
	$('.right_menu').click(function(){
		var obj = $('#menu');	
		obj.slideToggle(200);
		
		bViewMenu = !bViewMenu;
	});
});
	
// 햄버거메뉴 카테고리 메뉴항목 클릭시 하위메뉴 토글	
$(function(){
	var show_cate = "";
	var toggle_val = 0;
	
	$(".nav_depth1").on("click", function(){
		$(this).nextUntil(".nav_depth1").slideToggle();
	});


	$(".nav_depth2").on("click", function(){
		if(typeof($(this).attr("link")) == "undefined")
			$(this).nextUntil(".nav_depth2", ".nav_depth3").slideToggle();
		else
		{
			if($(this).attr("link").indexOf("http://")==0 || $(this).attr("link").indexOf("https://")==0)
				window.open($(this).attr("link"));
			else if($(this).attr("link").indexOf("javascript")!=0)
				location.href = $(this).attr("link");
			else
				eval($(this).attr("link"));
		}
	});
	
	$(".nav_depth3").on("click", function(){
		location.href = $(this).attr("link");
	});
	
});

// 햄버거막대 애니메이션
var bRightMenu = false;
function togRightMenu()
{
	if(!bRightMenu)
	{
		$(".header h1.logo").addClass("on");
		$(".right_menu li").addClass("on");
		bRightMenu = true;
		$('#menu').slideDown();
	}else
	{
		$(".header h1.logo").removeClass("on");
		$(".right_menu li").removeClass("on");
		bRightMenu = false;
		$('#menu').slideUp();
	}
};

// 햄버거메뉴 리사이즈 숨김
$(window).resize(function(){
	if($(this).width()>992)
	{		
		$('#menu').slideUp(0);
	
		$(".right_menu li").removeClass("on");
		bRightMenu = false;
	}
});
</script>


<script type="text/javascript">

$(document).ready(function(){
  $(".lnb_select_list").hide();
  $(".lnb_select_tit").click(function(){
	  var sub = $(this).parent().find('.visible');
	  if(sub.length != 0){
	  	sub.slideToggle(300);
	  	$(".lnb_select_tit").not(this).next().slideUp(300);
	     return false;
	  }else{
		  $(this).next('.select_menu_wrapper').slideToggle(300);;
	  }
  });
  $('.select_menu_wrapper li ').click(function(){
		 var $link = $(this).children('a').attr('href')
		 location.href = $link;
	})
});


</script>