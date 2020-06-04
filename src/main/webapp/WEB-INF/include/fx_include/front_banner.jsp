<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<nav id="wrap_lnb">
		<div>
			<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
			<div class="lnb_select first">
				<h3 class="lnb_select_tit ">FX거래</h3>
				<ul class="select_menu_wrapper visible">
							   <li class="">
                                       <a href="/prd/deal.do?runTime=1" data-menu="1">FX거래</a>
                                  </li>
                                   <li class="">
                                        <a href="/pages/fx_pages/margin_trading.jsp" data-menu="2">FX소개</a>
                                   </li>
                                   <li class="" >
                                        <a href="/deposit/list.do" data-menu="3">입출금신청</a>
                                   </li>
                                   <li class="">
                                        <a href="/pages/fx_pages/about_us.jsp" data-menu="4">회사소개</a>
                                   </li>
                                   <li class="">
                                        <a href="/pages/fx_pages/notice.jsp" data-menu="5">고객센터</a>
                                   </li>
                                   <li class="">
                                        <a href="/mypage/history_popup.do" data-menu="6">나의 거래내역</a>
                                   </li>
                </ul>
			</div>
			<div class="lnb_select second">
				<h3 class="lnb_select_tit ">FX거래</h3>
					  	<ul class="select_menu_wrapper" data-parent="1" id="bread_deal">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/fxresult/list.do">거래결과</a>
                                   </li>
                              </ul>
                              <ul class="select_menu_wrapper" data-parent="2">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/margin_trading.jsp">FX거래란?</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/instruction.jsp">이용방법</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/investment.jsp">투자정보</a>
                                   </li>
                              </ul>
                              <ul class="select_menu_wrapper" data-parent="3">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/deposit/list.do">입출금내역</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link"  href="/deposit/deposit_popup.do">입금 신청</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link"  href="/deposit/withdraw_popup.do">출금 신청</a>
                                   </li>
                              </ul>
                              <ul class="select_menu_wrapper" data-parent="4">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/about_us.jsp">회사소개</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/address.jsp">오시는 길</a>
                                   </li>
                              </ul>
                              <ul class="select_menu_wrapper" data-parent="5">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/notice.jsp">공지사항</a>
                                   </li>
                                   <!--li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/consulting.jsp">1:1문의</a>
                                   </li>
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/pages/fx_pages/bugreport.jsp">버그바운티</a>
                                   </li-->
                              </ul>
                              <ul class="select_menu_wrapper" data-parent="6">
                                   <li class="select_menu_option">
                                        <a class="select_menu_link" href="/mypage/history_popup.do">나의 거래내역</a>
                                   </li>
                              </ul>
			</div>
			

			
			

		</div>
	</nav>
<script>
	$.urlParam = function(name){
		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		if (results == null){
			return null;
			}
		else {
			return decodeURI(results[1]) || 0;
			}
		}
	function renderBread(){
		var url  = location.pathname + location.search;
		
		if(!$.urlParam('runTime')){
			url = location.pathname;
		}
		 	
	        current = $(".second .select_menu_link[href='"+url+"']"),
	        secondary = $(current).closest('.select_menu_wrapper'),
	        parent_index = $(secondary).data('parent'),
	        parent_menu = $(".first .select_menu_wrapper>li>a[data-menu='"+parent_index+"']");
		 secondary.addClass('visible');
		 $('.second h3').text(current.text());
		 $('.first h3').text(parent_menu.text());
		 if(parent_menu.text()){
		      $('#PageTitle').text(parent_menu.text())
		 }else{
		      $('#PageTitle').text("${tagoplusSolution1_session_site.siteName }")
		 }
	}
     $('.select_menu').on('click',function(){
          $(this).toggleClass('open');
          // $(this).closest('.breadcrumb').find('.visible').hide();
          $(this).find('.visible').slideToggle('fast');
     })
     

</script>


