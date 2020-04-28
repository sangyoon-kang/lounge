<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>


	<section class="wrap_scon">
		<div class="scon">
		<form id="form1" action="./deposit_proc.do" method="POST">
               		<input type="hidden" name="status" value="${search.status}" />
               		<input type="hidden" name="bankSeq" value="" />
               		<input type="hidden" name="userId" value="${tagoplusSolution1_session_user.userId}"/>
               		<input type="hidden" name="depositName" value="${tagoplusSolution1_session_user.userName}"/>
               		<input type="hidden" name="memo" value=""/>
			<h2 class="con_tit03">입금방법</h2>
			<a href="/deposit/list.do" class="inout_apply_bt">입금내역확인</a>
			<div class="inout_apply_table">
				<table>
					<colgroup>
						<col width="15%"></col>
						<col width="85%"></col>
					</colgroup>
					<tbody>
						<tr>
							<th>STEP 01</th>
							<td>입금하실 금액은 금액버튼을 클릭하시거나 직접 입력하실 수 있습니다.<strong>입금 최소 금액은 10,000원 부터이며 입력이 잘못된 경우에는 정정버튼을 클릭하여 재입력 하시면 됩니다.</strong></td>
						</tr>
						<tr>
							<th>STEP 02</th>
							<td>입금자 이름 란에는 송금하시는 통장의 입금주(통장명의자) 성함을 넣어주셔야 하며, <strong>닉네임 또는 통장명의자와 다른 이름을 넣으실 경우 입금확인이 불가하여 입금이 되지 않거나 지연될 수 있습니다.</strong></td>
						</tr>
						<tr>
							<th>STEP 03</th>
							<td>입금신청 버튼을 클릭하시면 신청이 완료 됩니다.</td>
						</tr>
						<tr>
							<th>STEP 04</th>
							<td>입금신청을 하신 이후에 입금을 하셔야 합니다.</td>
						</tr>
						<tr>
							<th>STEP 05</th>
							<td>입금하실 때에는 인터넷뱅킹, 폰뱅킹, 무통장 입금, ATM이체 등의 방법을 이용하여 입금이 가능 합니다.<strong>아래의 입금 계좌는 수시로 변경될 수 있습니다. 입금하시기 전에 다시한번 입금계좌 확인을 해주시기 바랍니다.</strong></td>
						</tr>
					</tbody>
				</table>
			</div>



			<h2 class="con_tit03 mt50">
				주의사항
				<span class="pl10 con_title03_alert">[입금전 반드시 읽어보세요!]</span>
			</h2>
			<div class="inout_box">
				<ul>
					<li><span class="alert">입금계좌는 상시 변경될 수 있습니다.</span> 입금하시기 전 항상 하기 입금계좌정보의 계좌확인을 부탁드립니다..</li>
					<li><span class="alert">반드시 입금신청을 먼저 하신 이후 계좌이체(입금)를 진행해 주세요. </span></li>
					<li><span class="alert">입금신청보다 계좌이체를 먼저하신 경우 자동입금이 불가</span>하여 최대 1시간까지 입금이 지연됩니다. </li>
					<li><span class="alert">입금신청을 하신 후 10분내 실제 입금</span>을 하셔야 자동으로 입금처리가 됩니다. 10분 이후 입금시 입금이 지연됩니다.</li>
					<li><span class="alert">입금자명(입금통장명의자) / 입금신청금액 / 실제입금금액이 일치</span>해야만 입금이 처리됩니다.</li>
					<li><span class="alert">입금신청금액과 입금액이 다르지 않도록 주의를 기울이시기 바랍니다.</span></li>
					<li><span class="alert">고의적이며 반복적인 입금신청, 금액 상이 입금시도 행위</span> 등은 악의적인 시스템 악용시도로 판단하여 계좌동결 및 회원탈퇴 등 제재를 받을 수 있습니다.</li>
				</ul>
			</div>
			<ul class="inout_list_form inout_list_form_fir">
				<li><p>입금계좌정보</p></li>
				<li>
					<ul class="bank_list">
						<c:forEach items="${list}" var="r" varStatus="s">
							<li>
								<label>
									<input type="radio" name="bankList" value="${r.bankSeq}">
									<strong>${r.codeName }</strong> ${r.accountNo } [${r.accountName }]
								</label>
							</li>
						</c:forEach>
					</ul>
				</li>
			</ul>
			<ul class="inout_list_form">
				<li><p>입금금액</p></li>
				<li>
					<div class="inout_input_area">
						<div class="inout_input">
						<input type="text" name="cash" maxlength="10" class="onlyNumber equipCatValidation" value="0" />원</div>
						<strong>예금주(보내시는분) : ${tagoplusSolution1_session_user.accountOwner  }</strong>
						<p>(가입시 등록된 예금주 명의로만 입금 가능하며 변경 시 필히 고객센터에 문의 바랍니다.)</p>
					</div>
				</li>
			</ul>
				
				
						
			<div class="board_bt_set01">
				<a onclick="javascript:doSubmit();" class="bt_list">입금신청</a>
			</div>
			</form>
		</div>
	</section>

<script type="text/javascript">
	$('.equipCatValidation').on('keyup keydown', function(e){
		if($(this).val().startsWith("0")){
			$(this).val($(this).val().substring(1));
		}
	});
	$('input[name=bankList]').on('change',function(){
		$('input[name=bankSeq]').val($(this).val());
	})
	function doSubmit(){
		if($('input[name=cash]').val() < 0){
			alert('입금신청금액은 0원보다 커야합니다.');
			$('input[name=cash]').val('0');
			return;
		}
		if($('input[name=cash]').val() < 10000){
			alert('최소 입금금액은 10,000원 이상이어야 합니다.');
			$('input[name=cash]').val('0');
			return;
		}
		
		if(!$('input[name=bankSeq]').val()){
			alert('입금계좌를 선택하세요.');
			return;
		}
		if(checkNull($('input[name="cash"]'), '입금하실 금액을 입력해 주세요.'))
			return;
		
		$.ajax({
			type : 'post',
			url : '/ajax/limitTodaydeposit.do',
			dataType : 'json',
			success : function(data) {
				if(data.requestCount >= 1){
					alert('기존 입금 신청의 처리가 완료되어야 신규 신청이 가능합니다.')
					return;
				}else {
					if (!confirm('${MSG_COMM_SAVE}'))
						return;
							
					$('#form1').submit();
				}
			}
		});
		
		
		
	}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>