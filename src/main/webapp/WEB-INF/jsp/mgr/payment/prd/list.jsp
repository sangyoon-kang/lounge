<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 상품 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<style type="text/css">
 .inline{
 	display: inline-block;
 }
 .scon_tit2{
 	margin: 5px 0 !important;
 }
	.btn2.active{ background:#258ace; border: 1px solid #258ace;}
	.auto {
		display: none;
	}
	th{
	white-space: nowrap}
	.dbn {display: none;}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>상품설정</h2>
		<p>홈 &gt; 상품 /정산관리  &gt; 상품설정</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>시간대별 Time의 Lot을 설정합니다.</li>
				<li>미래의 시간대만 설정 가능합니다.</li>
				<li>회색버튼은 Lot설정을 완료, 주황색 버튼은 Lot설정을 미완료한 상태입니다.</li>
			</ul>
		</div>
        <c:forEach var="s" items="${runTime}" varStatus="status" begin="0" step="1">
            <a href="/mgr/payment/prd_list?runTime=${s.runTime}&goodsTime=${search.goodsTime}&goodsDate=${search.goodsDate}" class="btn2 bg_navy <c:if test="${s.runTime == search.runTime}"> active</c:if>">
                    ${s.runTime} 분거래
            </a>
        </c:forEach>
        <c:if test="${goodsCount eq 0}">
      		<a onclick="javascript:doCopyLastDate()"  class="btn2 bg_navy" style='float:right'>일일등록</a>
        </c:if>
        <div style="height: 10px; width: 100%"></div>
		<form id="form1" action="./prd_proc.do" method="POST">
			<div class="scon_search">
				<div class="search mb20">
					<table class="mem_search">
						<colgroup>
							<col width="20%" />
							<col width="*%" />
						</colgroup>
						<tbody>
							<tr>
								<td rowspan="4" class="txt_center">
									<input type="hidden" name="runTime" value="${search.runTime}" />
									<input type="hidden" name="goodsTime" value="${search.goodsTime}" />
									<input type="text" name="goodsDate" class="input_type2 w50 mb10 datepicker" value="${search.goodsDate }" />
									<a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ">검색</a>
								</td>
							</tr>
							<c:forEach items="${timeHoursMap}" begin="0" end="7" var="l" varStatus="s">
								<c:if test="${s.index eq 0}"><tr><td></c:if>
									<input type="button" class="btn bg_gray dateFilter ${isCurrent and l.key ge currentHour and l.key ne search.goodsTime  ? 'bg_orange ' : ''} ${l.key eq search.goodsTime ? 'bg_green' : ''}" data-id="${l.key}" value="${l.value}" />
								<c:if test="${s.index eq 7}"></td></tr></c:if>
							</c:forEach>
							<c:forEach items="${timeHoursMap}" begin="8" end="15" var="l" varStatus="s">
								<c:if test="${s.index eq 8}"><tr><td></c:if>
									<input type="button" class="btn bg_gray dateFilter ${isCurrent and l.key ge currentHour and l.key ne search.goodsTime ? 'bg_orange ' : ''} ${l.key eq search.goodsTime ? 'bg_green' : ''} " data-id="${l.key}" value="${l.value}" />
								<c:if test="${s.index eq 15}"></td></tr></c:if>
							</c:forEach>
							<c:forEach items="${timeHoursMap}" begin="16" end="23" var="l" varStatus="s">
								<c:if test="${s.index eq 16}"><tr><td></c:if>
									<input type="button" class="btn bg_gray dateFilter ${isCurrent and l.key ge currentHour and l.key ne search.goodsTime ? 'bg_orange ' : ''} ${l.key eq search.goodsTime ? 'bg_green' : ''}" data-id="${l.key}" value="${l.value}" />
								<c:if test="${s.index eq 23}"></td></tr></c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<h3 class="scon_tit2 inline">${search.goodsDate }. ${search.goodsTime }시 ${search.runTime} <span style="font-weight: lighter">분거래</span></h3>
				<ul class="table_aside02">
					<li>
						<a onclick="javascript:doReset();" class="btn btn_round bg_gray">초기화 </a>
						<a onclick="javascript:doCopyLastHour('${search.runTime}', '${search.goodsTime - 1}', '${search.goodsDate }')" class="btn btn_round bg_gray">이전시간 복사</a>
						<a onclick="javascript:doCopyPrevRow()" class="btn btn_round bg_gray">연속적용</a>
						<a onclick="javascript:doCopyBaseSetting()" class="btn btn_round bg_gray">기본수량</a>
						<a onclick="javascript:doSubmit();" class="btn btn_round bg_gray">일괄저장</a>
					</li>
				</ul>
			</div>
			<table class="board_st1">
				<colgroup>
					<col width="">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
<%--					<col width="50">--%>
					<col width="60">
					<col width="120">
					<col width="50">
					<col width="50">
					<col width="50">
					<col width="50">
<%--					<col width="50">--%>
					<col width="60">
					<col width="120">
				</colgroup>
				<thead>
					<tr>
						<th rowspan="2" width="50">시작<br>시간</th>
						<th colspan="6">매수</th>
						<th colspan="6">매도</th>
<%--						<th colspan="5">임의의</th>--%>
					</tr>
					<tr>
						<th>0.1</th>
						<th>0.2</th>
						<th>1.0</th>
						<th>2.0</th>
						<th class="dbn">4.0</th>
						<th>합계</th>
						<th>금액</th>
						<th>0.1</th>
						<th>0.2</th>
						<th>1.0</th>
						<th>2.0</th>
						<th class="dbn">4.0</th>
						<th>합계</th>
						<th>금액</th>
<%--						<th>시간1</th>--%>
<%--						<th>시간2</th>--%>
<%--						<th>시간3</th>--%>
<%--						<th>시간4</th>--%>
<%--						<th>시간5</th>--%>
					</tr>
				</thead>
				<tbody id="fxGoods">
				<fmt:parseNumber var="goodsTime" type="number" value="${search.goodsTime}" />
				<fmt:parseNumber var="currentHour" type="number" value="${currentHour}" />
				<c:if test="${isCurrent and empty list and goodsTime ge currentHour}">
					<c:forEach items="${timeMinutsMap}" var="j" varStatus="s">
						<tr>
							<td class="goodsTime">${j.value}<input type="hidden" name="prd[${s.index }].goodsTime" value="${j.value}" /></td>
							<td class="buy buyLot1Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot1Total" value="0" /> </td>
							<td class="buy buyLot2Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot2Total" value="0" /> </td>
							<td class="buy buyLot10Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot10Total" value="0" /> </td>
							<td class="buy buyLot20Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot20Total" value="0" /> </td>
							<td class="buy buyLot40Total dbn"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot40Total" value="0" /> </td>
							<td class="buy_lot_total">0 </td>
							<td class="buy_price_total">0 </td> 
							<td class="sell sellLot1Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot1Total" value="0" /> </td>
							<td class="sell sellLot2Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot2Total" value="0" /> </td>
							<td class="sell sellLot10Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot10Total" value="0" /> </td>
							<td class="sell sellLot20Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot20Total" value="0" /> </td>
							<td class="sell sellLot40Total dbn"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot40Total" value="0" /> </td>
							<td class="sell_lot_total">0 </td>
							<td class="sell_price_total">0 </td>
							<td class="auto autoClose1"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose1" value="0" /></td>
							<td class="auto autoClose2"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose2" value="0" /></td>
							<td class="auto autoClose10"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose10" value="0" /></td>
							<td class="auto autoClose20"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose20" value="0" /></td>
							<td class="auto autoClose40"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose40" value="0" /></td>
						</tr>
					</c:forEach>	
				</c:if>
				<c:if test="${isCurrent and !empty list and goodsTime ge currentHour}">
					<c:forEach items="${list}" var="m" varStatus="s">
						<tr>
							<td class="goodsTime">${m.goodsTime}<input type="hidden" maxlength="7" name="prd[${s.index }].goodsTime" value="${m.goodsTime}" /></td>
							<td class="buy buyLot1Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot1Total" value="${m.buyLot1Total }" /> </td>
							<td class="buy buyLot2Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot2Total" value="${m.buyLot2Total }" /> </td>
							<td class="buy buyLot10Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot10Total" value="${m.buyLot10Total }" /> </td>
							<td class="buy buyLot20Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot20Total" value="${m.buyLot20Total }" /> </td>
							<td class="buy buyLot40Total dbn"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].buyLot40Total" value="${m.buyLot40Total }" /> </td>
							<td class="buy_lot_total"><fmt:formatNumber pattern="#,##0" value="${(m.buyLot1Total * 0.1) + (m.buyLot2Total * 0.2) + (m.buyLot10Total * 1) + (m.buyLot20Total * 2) + (m.buyLot40Total * 4)}"/></td>
							<td class="buy_price_total"><fmt:formatNumber pattern="#,##0" value="${(m.buyLot1Total * LOT_01) + (m.buyLot2Total * LOT_02) + (m.buyLot10Total * LOT_1) + (m.buyLot20Total * LOT_2) + (m.buyLot40Total * LOT_4)}"/> </td> 
							<td class="sell sellLot1Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot1Total" value="${m.sellLot1Total }" /> </td>
							<td class="sell sellLot2Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot2Total" value="${m.sellLot2Total }" /> </td>
							<td class="sell sellLot10Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot10Total" value="${m.sellLot10Total }" /> </td>
							<td class="sell sellLot20Total"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot20Total" value="${m.sellLot20Total }" /> </td>
							<td class="sell sellLot40Total dbn"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].sellLot40Total" value="${m.sellLot40Total }" /> </td>
							<td class="sell_lot_total"><fmt:formatNumber pattern="#,##0" value="${(m.sellLot1Total * 0.1) + (m.sellLot2Total * 0.2) + (m.sellLot10Total * 1) + (m.sellLot20Total * 2) + (m.sellLot40Total * 4)}" /></td>
							<td class="sell_price_total"><fmt:formatNumber pattern="#,##0" value="${(m.sellLot1Total * LOT_01) + (m.sellLot2Total * LOT_02) + (m.sellLot10Total * LOT_1) + (m.sellLot20Total * LOT_2) + (m.sellLot40Total * LOT_4)}"/> </td>
							<td class="auto autoClose1"><input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose1" value="${m.autoClose1 }" /></td>
							<td class="auto autoClose2"> <input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose2" value="${m.autoClose2 }" /></td>
							<td class="auto autoClose10"> <input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose10" value="${m.autoClose10 }" /></td>
							<td class="auto autoClose20"> <input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose20" value="${m.autoClose20 }" /></td>
							<td class="auto autoClose40"> <input class="onlyNumber w100 prd" maxlength="7" name="prd[${s.index }].autoClose40" value="${m.autoClose40 }" /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${!empty list and (goodsTime lt currentHour or !isCurrent)}">
					<c:forEach items="${list}" var="m" varStatus="s">
					<tr>
						<td>${m.goodsTime}</td>
						<td>${m.buyLot1Total }</td>
						<td>${m.buyLot2Total }</td>
						<td>${m.buyLot10Total }</td>
						<td>${m.buyLot20Total }</td>
						<td class="dbn">${m.buyLot40Total }</td>
						<td><fmt:formatNumber pattern="#,##0" value="${(m.buyLot1Total * 0.1) + (m.buyLot2Total * 0.2) + (m.buyLot10Total * 1) + (m.buyLot20Total * 2) + (m.buyLot40Total * 4)}"/></td>
						<td><fmt:formatNumber pattern="#,##0" value="${(m.buyLot1Total * LOT_01) + (m.buyLot2Total * LOT_02)+ (m.buyLot10Total * LOT_1) + (m.buyLot20Total * LOT_2) + (m.buyLot40Total * LOT_4)}"/></td> 
						<td>${m.sellLot1Total }</td>
						<td>${m.sellLot2Total }</td>
						<td>${m.sellLot10Total }</td>
						<td>${m.sellLot20Total }</td>
						<td class="dbn">${m.sellLot40Total }</td>
						<td><fmt:formatNumber pattern="#,##0" value="${(m.sellLot1Total * 0.1) + (m.sellLot2Total * 0.2) + (m.sellLot10Total * 1) + (m.sellLot20Total * 2) + (m.sellLot40Total * 4)}"/></td>
						<td><fmt:formatNumber pattern="#,##0" value="${(m.sellLot1Total * LOT_01) + (m.sellLot2Total * LOT_02)+ (m.sellLot10Total * LOT_1) + (m.sellLot20Total * LOT_2) + (m.sellLot40Total * LOT_4)}"/></td>
						<td class="auto">${m.autoClose1}</td>
						<td class="auto">${m.autoClose2}</td>
						<td class="auto">${m.autoClose10}</td>
						<td class="auto">${m.autoClose20}</td>
						<td class="auto">${m.autoClose40}</td>
					</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list and (search.goodsTime lt currentHour or !isCurrent)}">
					<tr>
						<td colspan="20"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<br class="clear mb5" />
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
$(document).on('click', '.dateFilter', function(e){
	doSearch($(this).data('id'), $('input[name="goodsDate"]').val());
});

function doSubmit() {
	var length = 0;
	$('#fxGoods > tr').each(function(i,e){
		length = $(this).children('td.buy, td.sell, td.auto').filter(function(){return $(this).children().val() !== '0'}).length;
		if(length === 0)
			return false;
	})
	if(length === 0){
		alert('수량을 설정하여야 합니다.');
		return;
	}
	if (!confirm('${MSG_COMM_SAVE}'))
		return;
	
	$('#form1').submit();	
}

function doSearch(time, date){
	if(isNull(time) && time != 0) time = $('input[type=button].bg_green').data('id');
	if(isNull(date)) date = $('input[name=goodsDate]').val();
	$.Nav('go', './prd_list', {goodsTime: time, goodsDate: date});
}

function doReset(){
	$('.buy_lot_total, .buy_price_total, .sell_lot_total, .sell_price_total').text(0);
	$('input.prd').val(0);
	//$('#form1')[0].reset();	
}
function doCopyLastDate(){
	$.ajax({
	    url : "./lastDate.do"
		, type : "post"
		, data : {date: $('input[name=goodsDate]').val()}
		, async : false
		, cache : false
		, success : function(data) {
			alert('저장했습니다.')
			location.reload()
		}
	});
}
function doCopyLastHour(runTime ,hour, date){
	$.ajax({
	    url : "./lasthour/lot_list.do"
		, type : "get"
		, data : {runTime: runTime ,hour: hour, date: date}
		, async : false
		, cache : false
		, success : function(data) {
			if (data.result) {
				$.each(data.result, function(i,e){
					var goods = e;
					$('input[name="prd['+i+'].buyLot1Total"]').val(function(){return ($(this).val() === "0") ? goods.buyLot1Total : $(this).val()});
					$('input[name="prd['+i+'].buyLot2Total"]').val(function(){return ($(this).val() === "0") ? goods.buyLot2Total: $(this).val()});
					$('input[name="prd['+i+'].buyLot10Total"]').val(function(){return ($(this).val() === "0") ? goods.buyLot10Total: $(this).val()});
					$('input[name="prd['+i+'].buyLot20Total"]').val(function(){return ($(this).val() === "0") ? goods.buyLot20Total: $(this).val()});
					$('input[name="prd['+i+'].buyLot40Total"]').val(function(){return ($(this).val() === "0") ? goods.buyLot40Total: $(this).val()});
					$('input[name="prd['+i+'].sellLot1Total"]').val(function(){return ($(this).val() === "0") ? goods.sellLot1Total: $(this).val()});
					$('input[name="prd['+i+'].sellLot2Total"]').val(function(){return ($(this).val() === "0") ? goods.sellLot2Total: $(this).val()});
					$('input[name="prd['+i+'].sellLot10Total"]').val(function(){return ($(this).val() === "0") ? goods.sellLot10Total: $(this).val()});
					$('input[name="prd['+i+'].sellLot20Total"]').val(function(){return ($(this).val() === "0") ? goods.sellLot20Total: $(this).val()});
					$('input[name="prd['+i+'].sellLot40Total"]').val(function(){return ($(this).val() === "0") ? goods.sellLot40Total: $(this).val()});
					$('input[name="prd['+i+'].autoClose1"]').val(function(){return ($(this).val() === "0") ? goods.autoClose1: $(this).val()});
					$('input[name="prd['+i+'].autoClose2"]').val(function(){return ($(this).val() === "0") ? goods.autoClose2: $(this).val()});
					$('input[name="prd['+i+'].autoClose10"]').val(function(){return ($(this).val() === "0") ? goods.autoClose10: $(this).val()});
					$('input[name="prd['+i+'].autoClose20"]').val(function(){return ($(this).val() === "0") ? goods.autoClose20: $(this).val()});
					$('input[name="prd['+i+'].autoClose40"]').val(function(){return ($(this).val() === "0") ? goods.autoClose40: $(this).val()});
				});
				$('input.prd').trigger("change");
			}
		}
	});
}

function doCopyPrevRow(){
	$('#fxGoods > tr').each(function(a){
		const row = $(this);
		if(row.children().siblings('td.buy, td.sell, td.auto').filter(function(){return $(this).children().val() !== '0'}).length == 0){
			const prev_row = row.prev();
			row.children('.buyLot1Total').children().val(prev_row.children('.buyLot1Total').children().val());
			row.children('.buyLot2Total').children().val(prev_row.children('.buyLot2Total').children().val());
			row.children('.buyLot10Total').children().val(prev_row.children('.buyLot10Total').children().val());
			row.children('.buyLot20Total').children().val(prev_row.children('.buyLot20Total').children().val());
			row.children('.buyLot40Total').children().val(prev_row.children('.buyLot40Total').children().val());
			row.children('.sellLot1Total').children().val(prev_row.children('.sellLot1Total').children().val());
			row.children('.sellLot2Total').children().val(prev_row.children('.sellLot2Total').children().val());
			row.children('.sellLot10Total').children().val(prev_row.children('.sellLot10Total').children().val());
			row.children('.sellLot20Total').children().val(prev_row.children('.sellLot20Total').children().val());
			row.children('.sellLot40Total').children().val(prev_row.children('.sellLot40Total').children().val());
			row.children('.autoClose1').children().val(prev_row.children('.autoClose1').children().val());
			row.children('.autoClose2').children().val(prev_row.children('.autoClose2').children().val());
			row.children('.autoClose10').children().val(prev_row.children('.autoClose10').children().val());
			row.children('.autoClose20').children().val(prev_row.children('.autoClose20').children().val());
			row.children('.autoClose40').children().val(prev_row.children('.autoClose40').children().val());
		}
	});
	$('input.prd').trigger("change");
}

function getRandomArbitrary(min, max) {
	return (Math.random() * (max - min) + min).toFixed(0);
}

function doCopyBaseSetting(){
	$.ajax({
		url : "./basesetting/lot_list.do",
		type : "get",
		async : false,
		cache: false,
		data : {runTime : ${search.runTime}},
		success: function(data) {
			if (data.result) {
				var arr = Object.keys(data.result);
				var goods = data.result;
				var rn1 = ${runTimeVO.randomTime1};
				var rn2 = ${runTimeVO.randomTime2};
				var rn3 = ${runTimeVO.randomTime3};
				var rn4 = ${runTimeVO.randomTime4};
				var rn5 = ${runTimeVO.randomTime5};
				$('#fxGoods > tr').each(function(a){
						if($(this).children('td.'+arr[2]+'Total').children().val() === "0") $(this).children('td.'+arr[2]+'Total').children().val(goods.buyLot1);
						if($(this).children('td.'+arr[3]+'Total').children().val() === "0") $(this).children('td.'+arr[3]+'Total').children().val(goods.buyLot2);
						if($(this).children('td.'+arr[4]+'Total').children().val() === "0") $(this).children('td.'+arr[4]+'Total').children().val(goods.buyLot10);
						if($(this).children('td.'+arr[5]+'Total').children().val() === "0") $(this).children('td.'+arr[5]+'Total').children().val(goods.buyLot20);
						if($(this).children('td.'+arr[6]+'Total').children().val() === "0") $(this).children('td.'+arr[6]+'Total').children().val(goods.buyLot40);
						if($(this).children('td.'+arr[7]+'Total').children().val() === "0") $(this).children('td.'+arr[7]+'Total').children().val(goods.sellLot1);
						if($(this).children('td.'+arr[8]+'Total').children().val() === "0") $(this).children('td.'+arr[8]+'Total').children().val(goods.sellLot2);
						if($(this).children('td.'+arr[9]+'Total').children().val() === "0") $(this).children('td.'+arr[9]+'Total').children().val(goods.sellLot10);
						if($(this).children('td.'+arr[10]+'Total').children().val() === "0") $(this).children('td.'+arr[10]+'Total').children().val(goods.sellLot20);
						if($(this).children('td.'+arr[11]+'Total').children().val() === "0") $(this).children('td.'+arr[11]+'Total').children().val(goods.sellLot40);
						if($(this).children('td.'+arr[12]).children().val() === "0") $(this).children('td.'+arr[12]).children().val(getRandomArbitrary((goods.autoClose1 - rn1), (goods.autoClose1 + rn1)));
						if($(this).children('td.'+arr[13]).children().val() === "0") $(this).children('td.'+arr[13]).children().val(getRandomArbitrary((goods.autoClose2 - rn2), (goods.autoClose2 + rn2)));
						if($(this).children('td.'+arr[14]).children().val() === "0") $(this).children('td.'+arr[14]).children().val(getRandomArbitrary((goods.autoClose10 - rn3), (goods.autoClose10 + rn3)));
						if($(this).children('td.'+arr[15]).children().val() === "0") $(this).children('td.'+arr[15]).children().val(getRandomArbitrary((goods.autoClose20 - rn4), (goods.autoClose20 + rn4)));
						if($(this).children('td.'+arr[16]).children().val() === "0") $(this).children('td.'+arr[16]).children().val(getRandomArbitrary((goods.autoClose40 - rn5), (goods.autoClose40 + rn5)));
				});
				$('input.prd').trigger("change");
			}
       }
	});
}

//count of lot, price
$(document).on('change blur', 'input.prd', function(e){
	var totalLot = 0, totalPrice = 0;
	var type = ($(this).parent().hasClass('buy')) ? 'buy' : 'sell';
	if(isNull(e.target.value ))$(this).val(0);
	totalLot = getPriceByLotValue($(this).prop('name'), $(this).val(), type, 'lot');
	totalPrice = getPriceByLotValue($(this).prop('name'), $(this).val(), type, 'price');
	$(this).parent().siblings('.'+type).each(function(){
		totalLot += getPriceByLotValue($(this).children().prop('name'), $(this).children().val(), type, 'lot');
		totalPrice += getPriceByLotValue($(this).children().prop('name'), $(this).children().val(), type, 'price');
	});
	$(this).parent().siblings('.'+type+'_lot_total').text(totalLot.toFixedNumber(1));
	$(this).parent().siblings('.'+type+'_price_total').text(addComma(totalPrice.toFixedNumber(1)));
});

function getPriceByLotValue(lotType, price, type, priceOrLot){
	var totalPrice = 0;
	switch(priceOrLot){
		case 'price':
			if(lotType.indexOf(type+'Lot1') > -1 && lotType[lotType.length-6] !== '0'){
				totalPrice =  parseInt(price) * ${LOT_01};
			}else if(lotType.indexOf(type+'Lot2') > -1  && lotType[lotType.length-6] !== '0'){
				totalPrice =  parseInt(price) * ${LOT_02};
			}else if(lotType.indexOf(type+'Lot10') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * ${LOT_1};
			}else if(lotType.indexOf(type+'Lot20') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * ${LOT_2};
			}else if(lotType.indexOf(type+'Lot40') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * ${LOT_4};
			}
			break;
		case 'lot':
			if(lotType.indexOf(type+'Lot1') > -1 && lotType[lotType.length-6] !== '0'){
				totalPrice =  parseInt(price) * 0.1;
			}else if(lotType.indexOf(type+'Lot2') > -1  && lotType[lotType.length-6] !== '0'){
				totalPrice =  parseInt(price) * 0.2;
			}else if(lotType.indexOf(type+'Lot10') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * 1;
			}else if(lotType.indexOf(type+'Lot20') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * 2;
			}else if(lotType.indexOf(type+'Lot40') > -1  && lotType[lotType.length-6] === '0'){
				totalPrice =  parseInt(price) * 4;
			}
			break;
	}
	return totalPrice;
}

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>