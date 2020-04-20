<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>

<nav id="wrap_lnb">
	<div>
	<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
	<div class="lnb_select">
		<h3 class="lnb_select_tit first">회원탈퇴</h3>
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

<section class="wrap_scon">
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
		<div class="scon">
			<ul class="board_tab_sty01 board_tab_sty01_num04">
				<li class="" data-tab="board-tab-1"><a href="javascript:$.Nav('go', '/auth', {id: '${tagoplusSolution1_session_user.userId}'});">FX회원수정</a></li>
				<li class="current" data-tab="board-tab-2"><a href="/mypage/out.do">회원탈퇴</a></li>
			</ul>
		</div>
		
		<div id="board-tab-1" class="board-tab-content current">
			<div class="scon" style="padding-top:0;">
			<div class="inout_apply_table">
				<table>
					<tbody>
						<tr>
							<td>1.아이디 재사용 가능여부안내
							<strong>- 사용중인 아이디는 탈퇴할 경우 재사용 및 복구가 불가합니다.</strong>
						</td>
						</tr>
						<tr>
							<td>2.회원정보 삭제 안내
							<strong>- 회원정보는 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.</strong>
							</td>
						</tr>
						<tr>
							<td>3.보유금액 소멸 안내
							<strong>- 서비스 이용 시 보유하고 있던 잔여 금액은 모두 소멸 됩니다.</strong>
							</td>
						</tr>
						<tr>
							<td>4.회원탈퇴 이후 개인정보 보유에 관한 안내
							<strong>- 회원 탈퇴를 하시면 회원님의 모든 정보가 삭제되며, 결제정보는 법률상에 의거하여 5년간 보존됩니다.</strong>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
				<form id="formOut" action="./out_proc.do" method="post">
            		
						<input type="hidden" name="mseq" value="${tagoplusSolution1_session_user.memberSeq}">
						<input type="hidden" name="id" value="${search.id }">
			            	<div class="section_login">
			            		
			            		<ul class="login_p01">
			            			<li>
			            				<input class="form-control" placeholder="비밀번호를 입력하세요." type="password" name="userPwd">
			            				<span id="outPassCheck"></span>
			            			</li>
			            			<li>
			            				<textarea name="withdrawalReason" rows="6" maxlength="500" placeholder="탈퇴사유를 입력하세요." style="width:100%"></textarea>
			            				<span id="outReason"></span>
			            			</li>
			            			<li>
			            				<a class="btn btn-lg blue w-100" onClick="javascript:doSubmit();">탈퇴하기</a>
			            			</li>
			            		</ul>
			                </div>
		           	 </form>
                     
			</div>
		</div>
</section>

<script>
var lowGrade = '${lowGrade}';
var memberGrade ='${tagoplusSolution1_session_user.gradeLevel}';
function doSubmit() {	
	if (isNull($('input[name=userPwd]').val())) {
		$('#outPassCheck').attr('class','ml-1 mt-1 text-red bold');
		$('#outPassCheck').text('비밀번호를 입력해야 합니다.');	
		$('input[name=userPwd]').focus();
		$('#outReason').text('');
		return;
	}else{$('#outPassCheck').text('');}
	
	if (isNull($('textarea[name=withdrawalReason]').val())) {
		$('#outReason').attr('class','ml-1 mt-1 text-red bold');
		$('#outReason').text('탈퇴사유를 입력해야 합니다.');
		$('textarea').focus();
		return;
	}else{$('#outReason').text('');}
	
	if(memberGrade < lowGrade){
		alert('회원등급이 대리점인 경우 회원탈퇴가 안됩니다.');
		return;
	}
	
	if(!confirm('탈퇴하시겠습니까?')) {
		return;
	}
		
	$('#formOut').submit();
}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
