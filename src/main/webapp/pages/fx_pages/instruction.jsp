<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<style>

</style>
<section class="wrap_scon">
		<div class="scon">
			<ul class="board_tab_sty01 board_tab_sty01_num03">
				<li class="current" data-tab="board-tab-1">회원가입 방법</li>
				<li class="" data-tab="board-tab-2">서비스이용방법</li>
				<li class="" data-tab="board-tab-3">입금ㆍ출금 방법</li>
			</ul>
			<div id="board-tab-1" class="board-tab-content current">
				<div class="use_con_img row">
					<ul>
						<li>
							<h3><span>STEP 01</span>회원가입 클릭</h3>
							<ul>
								<li><strong>01</strong> <span>우측상단 회원가입 버튼 클릭</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 02</span>회원정보  입력</h3>
							<ul>
								<li><strong>01</strong> <span>정보 입력</span></li>
								<li><strong>02</strong> <span>휴대폰 인증 시 이름, 휴대폰 번호가 자동 입력되며 수정 불가 합니다.</span></li>
								<li><strong>03</strong> <span>출금계좌는 본인계좌만 사용가능 합니다. </span></li>
								<li><strong>04</strong> <span>추천인은 안내 받으신 대리점을 입력 바라며, 지정 대리점이 없을 시 고객센터로 연락 바랍니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 03</span>약관동의</h3>
							<ul>
								<li><strong>01</strong> <span>개인정보 수집 이용 및 서비스 이용관련 사항 확인 후 전체동의 및 개별 체크 합니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 04</span>가입완료</h3>
							<ul>
								<li><strong>01</strong> <span>가입완료 되었습니다. </span></li>
								<li><strong>02</strong> <span>로그인 후 서비스이용 가능합니다.</span></li>
							</ul>
						</li>
					</ul>
				</div>

				
			</div>


			<div id="board-tab-2" class="board-tab-content">
				<div class="use_con_img row">
					<ul>
						<li>
							<h3><span>STEP 01</span>거래하기</h3>
							<ul>
								<li><strong>01</strong> <span>로그인 후 메뉴바에서 FX거래하기 메뉴를 클릭 합니다. </span></li>
								<li><strong>02</strong> <span>1분,2분,5분거래 항목을 클릭 합니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 02</span>매수 신청</h3>
							<ul>
								<li><strong>01</strong> <span>매수/ 매도 중 투자할 항목 설정 후 금액을 설정 합니다.</span></li>
								<li><strong>02</strong> <span>매수 / 매도 신청 버튼을 클릭 합니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 03</span>매수/매도 수익계약 </h3>
							<ul>
								<li><strong>01</strong> <span>손익분배계약서 확인 후 매수/매도 수익계약 버튼을 클릭 합니다. </span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 04</span>계약완료</h3>
							<ul>
								<li><strong>01</strong> <span>거래내역조회 메뉴를 통해 내역을 확인 할 수 있습니다. </span></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>

			<div id="board-tab-3" class="board-tab-content">

				<div class="use_con_img row">
					<ul>
						<li>
							<h3><span>STEP 01</span>입금 신청</h3>
							<ul>
								<li><strong>01</strong> <span>로그인 후 입출금 신청 메뉴에서 입금신청을 클릭 합니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 02</span>입금액 기입</h3>
							<ul>
								<li><strong>01</strong> <span>입금방법 및 주의사항을 확인 합니다.</span></li>
								<li><strong>02</strong> <span>입금계좌정보를 확인 및 선택 합니다.</span></li>
								<li><strong>03</strong> <span>입금하실 금액을 입력 합니다.</span></li>
								<li><strong>04</strong> <span>입금신청을 클릭 합니다. </span></li>
							</ul>
						</li>
					</ul>
				</div>

				
				<div class="use_con_img pt60 row">
					<ul>
						<li>
							<h3><span>STEP 01</span>출금 신청</h3>
							<ul>
								<li><strong>01</strong> <span>로그인 후 입출금 신청 메뉴에서 출금신청을 클릭 합니다.</span></li>
							</ul>
						</li>
						<li>
							<h3><span>STEP 02</span>출금액 기입</h3>
							<ul>
								<li><strong>01</strong> <span>출금 은행, 계좌번호, 예금주를 확인 합니다.</span></li>
								<li><strong>02</strong> <span>출금 가능 금액을 입력 합니다.</span></li>
								<li><strong>03</strong> <span>출금신청을 클릭 합니다.</span></li>
							</ul>
						</li>
					</ul>
				</div>

				<div class="inout_box inout_box02">
					<h4 class="use_tit">주의사항</h4>
					<ul>
						<li>출금신청 대상자는 가입 시 본인인증을 통해 입력한 고객명 기준으로 표시됩니다.</li>
						<li>본인의 보유액을 다른 회원에게 양도 및 양수할 수 없습니다.</li>
						<li>'출금신청금액'란 이외의 항목들은 수정할 수 없습니다.</li>
						<li>입출금 관련전화 : ${tagoplusSolution1_session_site.depositWithdrawalTelephone }</li>
						<li>상담 업무시간 : ${tagoplusSolution1_session_site.businessHours }</li>
						<li>입금 업무시간 : ${tagoplusSolution1_session_site.depositTime }</li>
						<li>출금 업무시간 : ${tagoplusSolution1_session_site.withdrawalTime }</li>
					</ul>
				</div>
			</div>

		<div>
	</section>
	


          
<script>
console.log($.urlParam('tab'))
$(document).ready(function(){
	
	$('.board_tab_sty01 li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('.board_tab_sty01 li').removeClass('current');
		$('.board-tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})
	var tabIndex = $.urlParam('tab');
	$('li[data-tab=board-tab-'+tabIndex+']').click()
})    
	
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
