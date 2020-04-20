<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

		<style>
			/* new scc base_info.jsp */
			.active{ background:#258ace; border: 1px solid #258ace;}
		</style>
	<!--wrap_scon S-->
	<div id="wrap_scon">

		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>기본수량설정</h2>
			<p>홈  &gt; 상품 /정산관리  &gt; 기본수량설정 </p>
		</div>
		<div class="scon">
			<div class="check_conbox mb10">
				<ul>
					<li>상품의 기본 수량을 설정합니다.</li>
				</ul>
			</div>
			<c:forEach var="s" items="${runTime}" varStatus="status" begin="0" step="1">
				<a href="/mgr/payment/base_info?runTime=${s.runTime}" class="btn2 bg_navy <c:if test="${s.runTime == search.runTime}"> active</c:if>">
					${s.runTime} 분거래
				</a>
			</c:forEach>
			<br class="clear mb5" />
			<br class="clear mb5" />
			<form id="form1" action="./base_proc.do" method="post">
				<input type="hidden" name="runTime"  value="${search.runTime}"/>
				<table class="board_st1">
					<colgroup>
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<tbody>
						<tr>
							<th>구분</th>
							<th>상품</th>
							<th>렌트보증금</th>
							<th>설정수량</th>
							<th>합계수량</th>
							<th>합계금액</th>
						</tr>
						<tr class="col">
							<td rowspan="4">매수</td>
							<td data-lot="0.1">0.1 Lot</td>
							<td data-price="${LOT_01}">5,000원</td>
							<td><input type="text" maxlength="4" name="buyLot1" value="${!empty gb.buyLot1 ? gb.buyLot1 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.buyLot1 * 0.1}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.buyLot1 * LOT_01}" /> 원</td>
						</tr>
						<tr class="col">
							<td data-lot="0.2">0.2 Lot</td>
							<td data-price="${LOT_02}">10,000원</td>
							<td><input type="text" maxlength="4" name="buyLot2" value="${!empty gb.buyLot2 ? gb.buyLot2 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.buyLot2 * 0.2}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.buyLot2 * LOT_02}" />원</td>
						</tr>
						<tr class="col">
							<td data-lot="1">1 Lot</td>
							<td data-price="${LOT_1}">50,000원</td>
							<td><input type="text" maxlength="4" name="buyLot10" value="${!empty gb.buyLot10 ? gb.buyLot10 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.buyLot10}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.buyLot10 * LOT_1}" />원</td>
						</tr>
						<tr class="col">
							<td data-lot="2">2 Lot</td>
							<td data-price="${LOT_2}">100,000원</td>
							<td><input type="text" maxlength="4" name="buyLot20" value="${!empty gb.buyLot20 ? gb.buyLot20 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.buyLot20 * 2}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.buyLot20 * LOT_2}" />원</td>
						</tr>
<%--						<tr class="col">--%>
<%--							<td data-lot="2">4 Lot</td>--%>
<%--							<td data-price="${LOT_4}">200,000원</td>--%>
<%--							<td><input type="text" maxlength="4" name="buyLot40" value="${!empty gb.buyLot40 ? gb.buyLot40 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>--%>
<%--							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.buyLot40 * 4}" /> Lot</td>--%>
<%--							<td><fmt:formatNumber pattern="#,##0" value="${gb.buyLot40 * LOT_4}" />원</td>--%>
<%--						</tr>--%>
						<tr class="total">
							<td colspan="3" height="26">총합계</td>
							<td colspan="2" class="totalLot"><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${(gb.buyLot1 * 0.1)  + (gb.buyLot2 * 0.2) + (gb.buyLot10 * 1) + (gb.buyLot20 * 2) + (gb.buyLot40 * 4)}" /> Lot</td>
							<td class="totalPrice"><fmt:formatNumber pattern="#,##0" value="${(gb.buyLot1 * LOT_01)  + (gb.buyLot2 * LOT_02) + (gb.buyLot10 * LOT_1) + (gb.buyLot20 * LOT_2) + (gb.buyLot40 * LOT_4)}" />원</td>
						</tr>
					</tbody>
				</table>
				<table class="board_st1">
					<colgroup>
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
						<col width="15%" />
					</colgroup>
					<tbody>
						<tr class="col">
							<td rowspan="4">매도</td>
							<td data-lot="0.1">0.1 Lot</td>
							<td class="price" data-price="${LOT_01}">5,000원</td>
							<td><input type="text" maxlength="4" name="sellLot1" value="${!empty gb.sellLot1 ? gb.sellLot1 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.sellLot1 * 0.1}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.sellLot1 * LOT_01}" />원</td>
						</tr>
						<tr class="col">
							<td data-lot="0.2">0.2 Lot</td>
							<td data-price="${LOT_02}">10,000원</td>
							<td class="lot"><input type="text" maxlength="4" name="sellLot2" value="${!empty gb.sellLot2 ? gb.sellLot2 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.sellLot2 * 0.2}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.sellLot2 * LOT_02}" />원</td>
						</tr>
						<tr class="col">
							<td data-lot="1">1 Lot</td>
							<td data-price="${LOT_1}">50,000원</td>
							<td><input type="text" maxlength="4" name="sellLot10" value="${!empty gb.sellLot10 ? gb.sellLot10 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.sellLot10}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.sellLot10 * LOT_1}" />원</td>
						</tr>
						<tr class="col">
							<td data-lot="2">2 Lot</td>
							<td data-price="${LOT_2}">100,000원</td>
							<td><input type="text" maxlength="4" name="sellLot20" value="${!empty gb.sellLot20 ? gb.sellLot20 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>
							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.sellLot20 * 2}" /> Lot</td>
							<td><fmt:formatNumber pattern="#,##0" value="${gb.sellLot20 * LOT_2}" />원</td>
						</tr>
<%--						<tr class="col">--%>
<%--							<td data-lot="2">4 Lot</td>--%>
<%--							<td data-price="${LOT_4}">200,000원</td>--%>
<%--							<td><input type="text" maxlength="4" name="sellLot40" value="${!empty gb.sellLot40 ? gb.sellLot40 : 0}" class="input_type1 w90" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value=''" onblur="if(this.value=='') this.value = 0;" /></td>--%>
<%--							<td><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${gb.sellLot40 * 4}" /> Lot</td>--%>
<%--							<td><fmt:formatNumber pattern="#,##0" value="${gb.sellLot40 * LOT_4}" />원</td>--%>
<%--						</tr>--%>
						<tr class="total">
							<td colspan="3" height="26">총합계</td>
							<td colspan="2" class="totalLot"><fmt:formatNumber maxFractionDigits="1" pattern="#,###.#" value="${(gb.sellLot1 * 0.1)  + (gb.sellLot2 * 0.2) + (gb.sellLot10 * 1) + (gb.sellLot20 * 2) + (gb.sellLot40 * 4)}"/> Lot</td>
							<td class="totalPrice"><fmt:formatNumber pattern="#,##0" value="${(gb.sellLot1 * LOT_01)  + (gb.sellLot2 * LOT_02) + (gb.sellLot10 * LOT_1) + (gb.sellLot20 * LOT_2) + (gb.sellLot40 * LOT_4)}" />원</td>
						</tr>
					</tbody>
				</table>
			</form>
			<ul class="summmit_btn">
				<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			</ul>
		</div>
	</div>
	<!--wrap_scon E-->
	<script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">

		$(document).on('onblur input', '.input_type1', function(e){
			if(isNull(e.target.value) && e.type == 'focusout') $(this).val(0);
			var lot_val = parseInt($(this).parent().prev().prev().data('lot') * e.target.value * 10) / 10;
			var price_val = $(this).parent().prev().data('price') * e.target.value;
			$(this).parent().next().text(lot_val + " Lot");
			$(this).parent().next().next().text(addComma(price_val) + "원");
			var totalLotPrice = $(this).closest('tr').nextAll('.total:first');
			var totalLot = 0, totalPrice = 0;
			totalLotPrice.prevAll('tr.col').map(function(){
				const l = (!$(this).children().eq(0).attr('rowspan')) ? 0 : 1;
				const p = (!$(this).children().eq(0).attr('rowspan')) ? 1 : 2;
				const c = (!$(this).children().eq(0).attr('rowspan')) ? 2 : 3;
				if($(this).children().eq(c).children().val()){
					totalLot += $(this).children().eq(l).data('lot') * $(this).children().eq(c).children().val();
					totalPrice += $(this).children().eq(p).data('price') * $(this).children().eq(c).children().val();
				}
			});
			totalLotPrice.children('.totalLot').text(parseInt(totalLot * 10) / 10 + " Lot");
			totalLotPrice.children('.totalPrice').text(addComma(totalPrice) + " 원");
/*
			if(totalLot > 200 ){
				alert("수량의 합계는 최대 200Lot까지만 설정이 가능합니다.\n입력하신 수량의 합계는 " + parseInt(totalLot * 10) / 10 + "Lot 입니다.\n" + parseInt((200 * 10) - (totalLot * 10)) * -0.1  +"Lot이 초과 되었습니다.");
				$(this).val(0);
				$(this).parent().next().text(0 + " Lot");
				$(this).parent().next().next().text(addComma(0) + "원");
				totalLot = totalLot - lot_val;
				totalPrice = totalPrice - price_val;

				totalLotPrice.children('.totalLot').text(((totalLot * 10) / 10).toFixedNumber(1) + " Lot");
				totalLotPrice.children('.totalPrice').text(addComma(totalPrice) + " 원");

				$(this).focus();
			}
*/
		});
		function doSubmit() {
/*
			if($('td.totalLot').filter(function(){return parseInt($(this).text()) > 200}).length > 0 || $('td.totalPrice').filter(function(){return parseInt($(this).text()) > 10000000}).length > 0){
				alert('총합계 수량이 200 Lot 초과하거나 합계금액이 10,000,000원 초과하였습니다.');
				return;
			}
*/
			if (!confirm('저장하시겠습니까?'))
				return;

			$('#form1').submit();
		}
	</script>

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>