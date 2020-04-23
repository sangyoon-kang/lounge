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
	.bg-yellow{
		background: #ececae; 
	}
	.bg-orange{
		background: #ecd8b2; 
	}
	.bg-gray{
		opacity: 0.6; 
	}
	.dbn{ display: none}
	.btn2.active{ background:#258ace; border: 1px solid #258ace;}
	.scon, .search {width: 1200px;}
	td.uBPrice, td.uSPrice{cursor: pointer;}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>상품관리</h2>
		<p>홈 &gt; 상품 /정산관리  &gt; 상품관리</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>시간대별 Time의 Lot을 관리합니다.</li>
			</ul>
		</div>
		<c:forEach var="s" items="${runTimeList}" varStatus="status" begin="0" step="1">
			<a href="/mgr/payment/mng/list.do?runTime=${s.runTime}&searchDate=${search.searchDate}&searchTime=${search.searchTime}" class="btn2 bg_navy <c:if test="${s.runTime == search.runTime}"> active</c:if>">
					${s.runTime} 분거래
			</a>
		</c:forEach>
		<div style="height: 15px"></div>
		<form id="form1" action="./list.do" method="GET">
			<div class="scon_search">
				<span class="table_aside w60">
					<input type="text" name="searchDate" class="input_type2 w20 mb10 datepicker" value="${search.searchDate }" />
					<a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
					<select class="w10 ml5" name="searchTime">
						<c:forEach items="${timeHoursMap}" var="m" varStatus="s">
							<option ${search.searchTime eq m.key ? 'selected' : ''} value="<c:if test="${m.key < 10}">0</c:if>${m.key}">${m.value }</option>
						</c:forEach>
					</select>
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ml5">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml5 ">검색 초기화</a>
				</span>
				<span class="table_aside02 mt15">
					합계금액 단위 : 만원
				</span>
			</div>
		</form>

		<table class="board_st1">
			<colgroup>
				<col width="7%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="8%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="6%" />
				<col width="8%" />
				<col width="7%" />
			</colgroup>
			<thead>
				<tr>
					<th rowspan="2">시작시간</th>
					<th colspan="6">매수</th>
					<th colspan="6">매도</th>
					<th rowspan="2">결과</th>
				</tr>
				<tr>
					<th>0.1Lot</th>
					<th>0.2Lot</th>
					<th>1Lot</th>
					<th>2Lot</th>
					<th class="dbn">4Lot</th>
					<th>합계(Lot)</th>
					<th>금액(만원)</th>
					<th>0.1Lot</th>
					<th>0.2Lot</th>
					<th>1Lot</th>
					<th>2Lot</th>
					<th class="dbn">4Lot</th>
					<th>합계(Lot)</th>
					<th>금액(만원)</th>
				</tr>
			</thead>
			<tbody id="fxGoods">
			<c:if test="${!empty list}">
				<c:forEach items="${list}" var="m" varStatus="s">
				<fmt:formatNumber pattern="###0.#" var="BUY_USER_TOTAL" maxFractionDigits="2" value="${(m.buyLot1 * 0.1) + (m.buyLot2 * 0.2) + (m.buyLot10) + (m.buyLot20 * 2) + (m.buyLot40 * 4)}" />
				<fmt:formatNumber pattern="###0.#" var="BUY_LOT_TOTAL" maxFractionDigits="2" value="${(m.buyLot1Total * 0.1) + (m.buyLot2Total * 0.2) + (m.buyLot10Total * 1) + (m.buyLot20Total * 2) + (m.buyLot40Total * 4)}" />
				<fmt:formatNumber pattern="###0.#" var="SELL_USER_TOTAL" maxFractionDigits="2" value="${(m.sellLot1 * 0.1) + (m.sellLot2 * 0.2) + (m.sellLot10) + (m.sellLot20 * 2) + (m.sellLot40 * 4)}" />
				<fmt:formatNumber pattern="###0.#" var="SELL_LOT_TOTAL" maxFractionDigits="2" value="${(m.sellLot1Total * 0.1) + (m.sellLot2Total * 0.2) + (m.sellLot10Total * 1) + (m.sellLot20Total * 2) + (m.sellLot40Total * 4)}" />
				<fmt:formatNumber var="BUY_USER_TOTAL_PRICE" maxFractionDigits="2" pattern="#,##0" value="${(BUY_USER_TOTAL * 5)}"/>
				<fmt:formatNumber var="BUY_LOT_TOTAL_PRICE" maxFractionDigits="2" pattern="#,##0" value="${(BUY_LOT_TOTAL * 5)}"/>
				<fmt:formatNumber var="SELL_USER_TOTAL_PRICE" maxFractionDigits="2" pattern="#,##0" value="${(SELL_USER_TOTAL * 5)}"/>
				<fmt:formatNumber var="SELL_LOT_TOTAL_PRICE" maxFractionDigits="2" pattern="#,##0" value="${(SELL_LOT_TOTAL * 5)}"/>
				<fmt:parseNumber var="goodTime1" integerOnly="true" type="number" value="${fn:split(m.goodsTime, ':')[0]}" />
				<fmt:parseNumber var="goodTime2" integerOnly="true" type="number" value="${fn:split(search.currentHourMinute, ':')[0]}" />
				<fmt:parseNumber var="goodMin1" integerOnly="true" type="number" value="${fn:split(m.goodsTime, ':')[1]}" />
				<fmt:parseNumber var="goodMin2" integerOnly="true" type="number" value="${fn:split(search.currentHourMinute, ':')[1]}" />
				<jsp:useBean id="now" class="java.util.Date" />
				<fmt:formatDate var="currDate" value="${now}" pattern="${DATE_FORMAT}" />
				<c:if test="${goodTime1 eq search.searchTime and ((search.searchDate eq currDate and ((goodTime1 eq goodTime2 and goodMin1 le goodMin2) or goodTime1 lt goodTime2)) or search.searchDate lt currDate)}">
					<tr id="${vo.goodsTime eq m.goodsTime ? 'currentRow' : ''}" class="${empty m.goodsResult and (search.searchDate ne vo.goodsDate or vo.goodsTime ne m.goodsTime) ? 'bg-yellow' : ''} ${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime ? 'bg-orange' : ''}">
						<td height="28">${m.goodsTime}</td>
						<td class="bLot1"><span>${m.buyLot1}/${m.buyLot1Total}</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.buyLot1State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'buyLot1State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="bLot2"><span>${m.buyLot2}/${m.buyLot2Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.buyLot2State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'buyLot2State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="bLot3"><span>${m.buyLot10}/${m.buyLot10Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.buyLot10State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'buyLot10State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="bLot4"><span>${m.buyLot20}/${m.buyLot20Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.buyLot20State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'buyLot20State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="bLot5 dbn"><span>${m.buyLot40}/${m.buyLot40Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.buyLot40State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'buyLot40State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="uBLot"><span>${BUY_USER_TOTAL}/${BUY_LOT_TOTAL}</span></td>
						<td class="uBPrice" 
						<c:if test="${vo.goodsTime ne m.goodsTime}">
							onclick="javascript:$.Nav('go', './mng_detail.do', {goodsDate: '${search.searchDate}', goodsTime: '${m.goodsTime}', bsType: 'B', runTime: ${search.runTime}});"
						</c:if> >
						<span class="${m.goodsResult eq 'U' ? 'red' : ''}">${BUY_USER_TOTAL_PRICE}/${BUY_LOT_TOTAL_PRICE}</span>
						</td> 
						<td class="sLot1"><span>${m.sellLot1}/${m.sellLot1Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.sellLot1State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'sellLot1State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="sLot2"><span>${m.sellLot2}/${m.sellLot2Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.sellLot2State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'sellLot2State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="sLot3"><span>${m.sellLot10}/${m.sellLot10Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.sellLot10State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'sellLot10State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="sLot4"><span>${m.sellLot20}/${m.sellLot20Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.sellLot20State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'sellLot20State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="sLot5 dbn"><span>${m.sellLot40}/${m.sellLot40Total }</span>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime and m.goodsResult ne 'N' and m.sellLot40State eq 'U'}">
								<a onclick="javascript:changeStatus('L', '${m.goodsTime}', '${search.searchDate }', 'sellLot40State')" class="btn bg_gray txt_center">마감</a>
							</c:if>
						</td>
						<td class="uSLot"><span>${SELL_USER_TOTAL}/${SELL_LOT_TOTAL}</span></td>
						<td class="uSPrice" 
							<c:if test="${vo.goodsTime ne m.goodsTime}">
								onclick="javascript:$.Nav('go', './mng_detail.do', {goodsDate: '${search.searchDate}', goodsTime: '${m.goodsTime}', bsType: 'S', runTime: ${search.runTime}});"
							</c:if> >
							<span class="${m.goodsResult eq 'D' ? 'red' : ''}">${SELL_USER_TOTAL_PRICE}/${SELL_LOT_TOTAL_PRICE}</span>
						</td>
						<td>
							<c:if test="${search.searchDate eq vo.goodsDate and vo.goodsTime eq m.goodsTime}">
								<span class="remain-time red bold"></span>
							</c:if>
							<c:if test="${(search.searchDate ne vo.goodsDate or vo.goodsTime ne m.goodsTime) and empty m.goodsResult}">
								<a onclick="javascript:doPopup('${search.searchDate}', '${m.goodsTime}');" class="btn bg_red">결과</a>
							</c:if>
							<c:if test="${!empty m.goodsResult}">
								<a style="display: inline-block" onclick="javascript:doCancle('${search.searchDate}', '${m.goodsTime}');">${m.goodsResultText}</a>
							</c:if>
						</td>
					</tr>
				</c:if>
				<c:if test="${isCurrent and (search.searchDate eq currDate and (((goodTime1 eq goodTime2 and goodMin1 gt goodMin2) or goodTime1 gt goodTime2) and goodTime2 le search.searchTime)) or search.searchDate gt currDate}">
					<tr class="bg-gray">
						<td height="28">${m.goodsTime}</td>
						<td>${m.buyLot1Total }</td>
						<td>${m.buyLot2Total }</td>
						<td>${m.buyLot10Total }</td>
						<td>${m.buyLot20Total }</td>
						<td class="dbn">${m.buyLot40Total }</td>
						<td>${BUY_LOT_TOTAL}</td>
						<td>${BUY_LOT_TOTAL_PRICE}</td> 
						<td>${m.sellLot1Total }</td>
						<td>${m.sellLot2Total }</td>
						<td>${m.sellLot10Total }</td>
						<td>${m.sellLot20Total }</td>
						<td class="dbn">${m.sellLot40Total }</td>
						<td>${SELL_LOT_TOTAL}</td>
						<td>${SELL_LOT_TOTAL_PRICE}</td>
						<td>대기</td>
					</tr>
				</c:if>
				</c:forEach>
			</c:if>
			<c:if test="${empty list}">
				<tr>
					<td colspan="16"><s:message code="common.noData" /></td>
				</tr>
			</c:if>
			</tbody>
		</table>
		<br class="clear mb5" />
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
	</div>
</div>
<!--wrap_scon E-->
<div id="popup" class="w100 txt-center" hidden>
	<form id="form3" action="./mng_proc.do" method="POST">
		<input type="hidden" name="lotType"  value=""/>
		<input type="hidden" name="goodsDate"  value=""/>
		<input type="hidden" name="goodsTime"  value=""/>
		<input type="hidden" name="runTime"  value="${search.runTime}"/>
		<input type="hidden" name="status"  value=""/>
	</form>
	<a onclick="javascript:changeStatus('U')" class="btn bg_pink w20 ml10 mb10 txt_center">상승</a>
	<a onclick="javascript:changeStatus('D')" class="btn bg_blue w20 ml10 mb10 txt_center">하락</a>
	<a onclick="javascript:changeStatus('T')" class="btn bg_gray w20 ml10 mb10 txt_center">틱차트</a>
	<a onclick="javascript:changeStatus('N')" class="btn bg_gray w20 ml10 mb10 txt_center">미거래</a>
	<a onclick="javascript:$('#popup').dialog('close');" class="btn bg_gray ml10 w60 txt_center">닫기 </a>
</div>
<script type="text/javascript">
$(document).ready(function() {
  $('a[href="/mgr/payment/mng/list"]').addClass('depth2_on');
  //remaining Time
  setInterval(function() {
    remainCheck();
  }, 1000);
  
  setInterval(function() {
	  var elapse = moment().diff(cst);
      var diff = sr - elapse;
      if(diff >= 5000)
	  	doRefresh5Sec();
  }, 5000);
  
});

//for remaining time
var st = moment(${search.currentTime});
var next = moment(${search.nextTime});
var sr = next.diff(st);
var cst = moment();
var remainCheck = function() {
    var elapse = moment().diff(cst);
    var diff = sr - elapse;
    if(sr <= 0){
    	return false;
    }
    if (diff >= 0) {
        var remain = moment.utc(diff);
        var reminTxt = remain.format("mm:ss");
        $('.remain-time').html(reminTxt);
    } else {
        $('.remain-time').html('00:00');
        setTimeout(function() {
            location.reload();
        }, 3000);
    }
};

function doSearch(){
	$('#form1').submit();
}

function doPopup(date, time) {
	$("#popup").dialog({
		title:"결과 등록",
		width:200,
		modal:true,
		open: function() {
			$(this).children('#form3').children('input[name="goodsDate"]').val(date);
			$(this).children('#form3').children('input[name="goodsTime"]').val(time);
	    }
    });
}

function doCancle(date, time) {
	if (confirm('결과를 취소 하시겠습니까?')) {
		$('input[name="goodsDate"]').val(date);
		$('input[name="goodsTime"]').val(time);
		$('input[name="status"]').val('C');
		$('#form3').submit();
	}
}

function changeStatus(status, time, date, type){
	if(!isNull(date) && !isNull(time)){
		$('input[name="lotType"]').val(type);
		$('input[name="goodsDate"]').val(date);
		$('input[name="goodsTime"]').val(time);
	}
	if(status == 'U'){
		if (!confirm('상승으로 결과를 등록 하시겠습니까?')) 
			return;
	}
	if(status == 'D'){
		if (!confirm('하락으로 결과를 등록 하시겠습니까?')) 
			return;
	}
	if(status == 'T'){
		if (!confirm('틱차트로 결과를 등록 하시겠습니까?')) 
			return;
	}
	if(status == 'N'){
		if (!confirm('미거래로 결과를 등록 하시겠습니까?')) 
			return;
	}
	
	if(status == 'L'){
		if (!confirm('마감으로 상태를 변경하시겠습니까?')) 
			return;
	}
	$('input[name="status"]').val(status);
	$('#form3').submit();

}

function doRefresh5Sec(){
	return $.ajax({
        url : "./refresh_row.do",
        type : "get",
        async : true,
        cache: false,
        success: function(data) {
        	if(!isNull(data)){
    			$('tbody#fxGoods > tr#currentRow > td').each(function(i,a){
    				if(!isNull(data[a.className])){
    					$(this).children().eq(0).text(data[a.className]);
    				}
    			});
    		}
        }
    });
}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>