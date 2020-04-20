<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<nav id="wrap_lnb">
	<div>
	<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
	<div class="lnb_select">
		<h3 class="lnb_select_tit first"> 비밀번호 변경</h3>
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
<style>
.w-40{
height:40px;
margin:10px 0 10px 20px;
}
</style>
<div class="wrap_con">
    	
    <div class="scon">
        <div class="mem_pwdchange">
            	<h3 class="con_tit">비밀번호는 주기적으로 변경하는 것이 좋습니다 최근 비밀버호 변경일</h3>
				
				<form id="formPwd" method="post" action="/pwd_change_proc.do">
					<input type="hidden" name="id" value="${search.id}">
					<div>
						<ul class="join_list">
								<li>기존 비밀번호</li>
								<li>
									<input type="password" class="w-40" name="beforePwd" maxlength="20">
								</li>
						</ul>
						<ul class="join_list">
								<li>신규 비밀번호</li>
								<li>
									<input type="password" class="w-40" name="userPwd" maxlength="20">
									<span class="mL10 red" id="userPwdCheck"> 영문, 숫자 혼합 8자리 이상 입력하세요.</span>
								</li>
						</ul>
						<ul class="join_list">
								<li>비밀번호 확인</li>
								<li>
									<input type="password" class="w-40" name="userPwd2" maxlength="20">
									<span class="mL10 red" id="userPwdCheck2"> 비밀번호를 다시 입력하세요.</span>
								</li>
						</ul>
					</div>
					
				</form>
        </div><!-- mem_search -->
				<div class="join_agree_bt_set">
					<a onClick="javascript:doSubmit();" class="bt_blue">회원가입</a><a href="javascript:$.Nav('go', '/')">취소</a>
				</div>
    </div><!--content -->        
</div><!-- container -->
<script type="text/javascript">

//비밀번호 체크
$('input[name=userPwd], input[name=userPwd2]').change(function () {
	//공백 제거
	var sUserPwd = trim($('input[name=userPwd]').val()); 
	$('input[name=userPwd]').val(trim($('input[name=userPwd]').val()));
	var sUserPwd2 = trim($('input[name=userPwd2]').val());
	$('input[name=userPwd2]').val(trim($('input[name=userPwd2]').val()));
	
	if (sUserPwd.length < 8) {
		$('#userPwdCheck').prop('class', 'mL10 red bold');
		$('#userPwdCheck').text('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');

	} else {
		$('#userPwdCheck').prop('class', 'mL10 blue bold');
		$('#userPwdCheck').text('비밀번호가 입력되었습니다.');
	}

	if (sUserPwd != '' && sUserPwd2 != '') {
		if (sUserPwd != sUserPwd2) {
			$('#userPwdCheck2').prop('class', 'mL10 red bold');
			$('#userPwdCheck2').text('비밀번호가 다릅니다.');
		
		} else {
			$('#userPwdCheck2').prop('class', 'mL10 blue bold');
			$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
		}
	}
});


function doSubmit () {
	if ($('#userPwdCheck').prop('class').indexOf('blue') < 0 || $('#userPwdCheck2').prop('class').indexOf('blue') < 0) {
		alert('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
		return;
	}	

	if (!confirm('수정 하시겠습니까?')) {
		return;
	}
	
	$('#formPwd').submit();
}
</script>

	<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>