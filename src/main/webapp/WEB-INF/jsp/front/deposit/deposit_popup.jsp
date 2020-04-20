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
							<td>입금하실 때에는 인터넷뱅킹, 폰뱅킹, 무통장 입금, ATM이체 등의 방법을 이용하여 입금이 가능 합니다.<strong>아래의 입금 계좌는 수시로 변경될 수 있습니다. 입금하시기 전에 다시한번 입금계좌 확인을 해주시기 바랍니다.</strong></td>
						</tr>
						<tr>
							<th>STEP 02</th>
							<td>입금하실 금액은 금액버튼을 클릭하시거나 직접 입력하실 수 있습니다.<strong>입금 최소 금액은 10,000원 부터이며 입력이 잘못된 경우에는 정정버튼을 클릭하여 재입력 하시면 됩니다.</strong></td>
						</tr>
						<tr>
							<th>STEP 03</th>
							<td>입금자 이름 란에는 송금하시는 통장의 입금주(통장명의자) 성함을 넣어주셔야 하며, <strong>닉네임 또는 통장명의자와 다른 이름을 넣으실 경우 입금확인이 불가하여 입금이 되지 않거나 지연될 수 있습니다.</strong></td>
						</tr>
						<tr>
							<th>STEP 04</th>
							<td>입금신청 버튼을 클릭하시면 신청이 완료 됩니다.</td>
						</tr>
					</tbody>
				</table>
			</div>



			<h2 class="con_tit03 mt50">주의사항</h2>
			<div class="inout_box">
				<ul>
					<li>입금하시기 전에 항상 계좌확인을 부탁드리며, 계좌확인을 안하시면 입금신청을 하실 수 없습니다.</li>
					<li>입금신청 후 5분 이내에 실제 입금이 되지 않는 경우에는 신청하신 내용이 자동 삭제(취소) 됩니다.<strong>입금신청후 5분이 초과 되신 분들께서는 다시 한번 입금 신청을 해주시기 바랍니다.</strong></li>
					<li>입금자명(입금통장명의자) / 입금신청금액 / 실제입금금액이 일치하시면 입금 후 빠르게 처리가됩니다.</li>
					<li>입금신청은 신청하신 내용이 완료되지 않거나 삭제(취소)되지 않은 상태에서는 중복신청 또는 추가신청이 불가 합니다.</li>
					<li>수표입금 시 입금 처리가 되지 않습니다.</li>
					<li>입금 완료 5분 내에 추가 신청할 수 없습니다.</li>
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
		if(!$('input[name=bankSeq]').val()){
			alert('입금계좌를 선택하세요.');
			return;
		}
		if(checkNull($('input[name="cash"]'), '입금하실 금액을 입력해 주세요.'))
			return;
		
		if (!confirm('${MSG_COMM_SAVE}'))
			return;
		$('#form1').submit();
	}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>