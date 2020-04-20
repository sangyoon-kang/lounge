<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<nav id="wrap_lnb">
	<div>
	<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
	<div class="lnb_select">
		<h3 class="lnb_select_tit first">회원가입</h3>
		<ul class="select_menu_wrapper ">
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
               </ul>
		</div>
	</div>
</nav>
	<script type="text/javascript">
		window.name ="Parent_window";
		function ipinCheck(){
			window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
			document.form_chk.action = "${IPIN_CHECK}";
			document.form_chk.target = "popupChk";
			document.form_chk.submit();
		}
	</script>
	<form name="joinForm" id="joinForm" method="post" action="/join" style="display:none;">
		<input type="hidden" name="cert_type">
		<input type="hidden" name="ipin_param1">
		<input type="hidden" name="ipin_param2">
		<input type="hidden" name="ipin_param3">
		<input type="hidden" name="ipin_encdata">
		<input type="hidden" name="recomm_code" value="${recomm_code}">
		<input type="hidden" name="mode" value="check">
	</form>
	<form name="form_chk" method="post" style="display:none;">
		<input type="hidden" name="param_r1">
		<input type="hidden" name="param_r2">
		<input type="hidden" name="param_r3" value="${recomm_code}">
		<input type="hidden" name="m" value="checkplusSerivce">
		<input type="hidden" name="EncodeData" value="${checkplus.sEncDataCheckPlus}">
	</form>
<section class="wrap_scon">
		<div class="scon">
			<div class="section_login">
				<ul class="login_p01">
					<li>
					회원가입을 위해서 휴대폰 본인확인이 필요합니다.
					</li>
					<li>
						          <a type="button" class="btn btn-lg primary mt-4 mb-4" name="button" onclick="javascript:ipinCheck();">휴대폰 본인확인</a>    
					
					</li>
				</ul>
			</div>
		</div>
</section>
			

<script>
     feather.replace();

</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>