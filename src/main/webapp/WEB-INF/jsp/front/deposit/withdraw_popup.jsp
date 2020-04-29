<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>

<section class="wrap_scon">
		<div class="scon">
		<form id="form1" action="./deposit_proc.do" method="POST">
               		<input type="hidden" name="status" value="${search.status}" />
               		<input type="hidden" name="accountName" value="${tagoplusSolution1_session_user.accountOwner}" />
               		<input type="hidden" name="userId" value="${tagoplusSolution1_session_user.userId}"/>
               		<input type="hidden" name="depositName" value="${memberVO.accountOwner}"/>
               		<input type="hidden" name=bankName value="${memberVO.bank}"/>
               		<input type="hidden" name="accountNo" value="${memberVO.bankAccount}"/>
               		<input type="hidden" name="avaliableCash" value="${memCash}"/>
               		
               		
			<h2 class="con_tit03">출금방법</h2>
			<a href="/deposit/list.do" class="inout_apply_bt">출금내역 확인</a>
			<div class="inout_apply_table">
				<table>
					<colgroup>
						<col width="15%"></col>
						<col width="88%"></col>
					</colgroup>
					<tbody>
						<tr>
							<th>STEP 01</th>
							<td>평일 09:00~22:00까지 출금이 가능합니다.
								<strong>
									출금은 신청즉시 보유머니에서 차감됩니다.
								</strong>
							</td>
						</tr>
						<tr>
							<th>STEP 02</th>
							<td>출금은 4시간에 한번씩 일 4회 일괄승인 방식으로 처리됩니다.
								<strong>
									출금시간은 10:00 / 14:00 / 18:00 / 22:00 로 해당시간까지 출금신청 완료한 건에 한해서 20분내에 처리됩니다.<br/>
									*10:00~14:00 신청시 14:20분 일괄처리<br/>
									&nbsp;&nbsp;14:00~18:00 신청시 18:20분 일괄처리<br/>
									&nbsp;&nbsp;18:00~22:00 신청시 22:20분 일괄처리<br/>
									&nbsp;&nbsp;22:00~10:00 신청시 10:20분 일괄처리<br/>
									*자세한 사항은 공지를 참고하시기 바랍니다.
									<br/>
								</strong>
							</td>
						</tr>
						<tr>
							<th>STEP 03</th>
							<td>고객자산보호를 위한 이상출금 모니터링 강화를 위해 출금액은 1일 4회로 제한하며, 회당 최소 1만원~최대 1,000만원까지 출금이 가능합니다.</td>
						</tr>
					</tbody>
				</table>
			</div>

			<ul class="inout_list_form inout_list_form_fir">
				<li><p>거래은행</p></li>
				<li>
					<ul class="bank_list">
						<li><strong>${memberVO.bank}</strong> ${memberVO.bankAccount} [${memberVO.accountOwner }]</li>
					</ul>
				</li>
			</ul>
			<ul class="inout_list_form">
				<li><p>출금</p></li>
				<li>
					<div class="inout_input_area">
						<div class="inout_input"><input type="text"   class="equipCatValidation" maxlength="10" name="cash" value="0"/>원</div>
						<strong>보유금액 <fmt:formatNumber pattern="#,##0" var="memCash" value="${memberVO.cash}" />${memCash}원</strong>
					</div>
				</li>
			</ul>
			<div class="board_bt_set01">
				<a onclick="javascript:doSubmit();" class="bt_list">출금신청</a>
			</div>
			
			</form>
		</div>
	</section>

<script type="text/javascript">
	function doSubmit(){
		if($('input[name=cash]').val() < 10000){
			alert('최소 출금금액은 10,000원 이상이어야 합니다.')
			$('input[name=cash]').val('0');
			return;
		}
		if($('input[name=cash]').val() > ${withdrawalValueLimit}){
			var limitwithcomma=addComma(${withdrawalValueLimit });
			alert('출금신청금액은 최대 '+limitwithcomma+'원 까지만 신청 가능합니다.');
			$('input[name=cash]').val('0');
			return;
		}
		if($('input[name=cash]').val() < 0){
			alert('출금신청금액은 0원보다 커야합니다.');
			$('input[name=cash]').val('0');
			return;
		}
		if(checkNull($('input[name="cash"]'), '출금하실 금액을 입력해 주세요.'))
			return;
		
		$.ajax({
			type : 'post',
			url : '/ajax/limitToday.do',
			dataType : 'json',
			success : function(data) {
				if(data.requestCount >= 1){
					alert('기존 출금 신청의 처리가 완료되어야 신규 신청이 가능합니다.')
					return;
				}				
				if(data.count >= ${withdrawalCountLimit }){
					alert('출금은 1일 ${withdrawalCountLimit }회까지만 가능합니다.');
					return;
				}else {
					if (!confirm('${MSG_COMM_SAVE}'))
						return;
					
					$('#form1').submit();
				}
			}
		});
	}
	$('.equipCatValidation').on('keyup keydown', function(e){
		const cash = ${memberVO.cash};
		if($(this).val().startsWith("0")){
			$(this).val($(this).val().substring(1));
		}
        if ($(this).val() > cash && e.keyCode != 46&& e.keyCode != 8) {
           e.preventDefault();     
           $(this).val(cash);
        }
    });
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>