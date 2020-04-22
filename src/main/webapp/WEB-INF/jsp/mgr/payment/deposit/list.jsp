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
	.bold{
		font-weight: bold !important;
	}
	.back-red{
		background-color:#fb8fa1 !important;
	}
	.back-sky{
		background-color:#b8dce8 !important;
	}

	.board_st1 td { padding: 12px 10px;}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>입출금관리</h2>
		<p>홈 &gt; 상품 /정산관리  &gt; 입출금관리 &gt; 리스트</p>
	</div>

	<div class="scon">
		<div class="check_conbox mb10">
			<ul>
				<li>입출금 내역을 관리, 조회</li>
			</ul>
		</div>
		<form id="form1" action="./list.do" method="GET">
			<div class="scon_search">
				<div class="search mb10">
					<table class="board_st1 mb10">
						<colgroup>
							<col width="10%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
							<col width="15%" />
						</colgroup>
						<thead>
						<tr>
							<th>구분</th>
							<th>대기건수</th>
							<th>대기금액</th>
							<th>취소건수</th>
							<th>취소금액</th>
							<th>완료건수</th>
							<th>완료금액</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${totalSum}" var="m" varStatus="s">
							<tr>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold">${m.ioTypeName }</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold">${m.stateR } 건</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold"><fmt:formatNumber pattern="#,##0" value="${m.cashR}" /> 원</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold">${m.stateC } 건</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold"><fmt:formatNumber pattern="#,##0" value="${m.cashC}" /> 원</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold">${m.stateA } 건</td>
								<td class="${m.ioType eq 'I' ? 'red' : 'sky'} bold"><fmt:formatNumber pattern="#,##0" value="${m.cashA}" /> 원</td>
							</tr>
						</c:forEach>
						<c:if test="${empty totalSum}">
							<tr>
								<td colspan="9"><s:message code="common.noData" /></td>
							</tr>
						</c:if>
						</tbody>
					</table>
					<table class="mem_search">
						<colgroup>
							<col width="5%" />
							<col width="15%" />
							<col width="5%" />
							<col width="35%" />
							<col width="5%" />
							<col width="30%" />
						</colgroup>
						<tbody>
						<tr>
							<th>구분</th>
							<td>
								<tt:select name="ioType" onchange="javascript:doSearch();" class="w100" list="${listIoType}" listKey="text" listValue="value" indexKey="" indexValue="= 전체  =" selected="${search.ioType }"/>
							</td>
							<th>일자</th>
							<td>
								<input type="text" name="startDate" class="input_type2 w40 datepicker" value="${search.startDate}" /> <a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								<input type="text" name="endDate" class="input_type2 w40 datepicker" value="${search.endDate }" /> <a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
							</td>
							<th>이름</th>
							<td>
								<input type="text" name="searchWord" class="input_type2 w70" value="${search.searchWord}" />
								<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ">검색</a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
		<div class="all_io_exec" style="padding-bottom: 10px">
			<a class="btn bg_sky">일괄 처리</a>
			<a class="btn bg_gray">일괄 취소</a>
			<label style="float: right"><input class="reloadBox" style="padding: 0 5px" type="checkbox" >자동 새로고침</label>
		</div>
		<form id="deposit" action="./dep_proc.do" method="POST">
			<input type="hidden" name="status" value="I" />
			<input type="hidden" name="moneySeq" value=""/>
			<input type="hidden" name="currentPageNo" value=""/>
			<input type="hidden" name="ioType" value=""/>
			<table class="board_st1">
				<colgroup>
					<col width="4%" />
					<col width="7%" />
					<col width="7%" />
					<col width="10%" />
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
					<col width="7%" />
					<col width="6%" />
					<col width="8%" />
					<col width="8%" />
					<col width="8%" />
					<col width="6%" />
					<col width="10%" />
				</colgroup>
				<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th>구분</th>
					<th>등급</th>
					<th>이름</th>
					<th>ID</th>
					<th>일자</th>
					<th>시간</th>
					<th>금액</th>
					<th>은행</th>
					<th>계좌</th>
					<th>예금주</th>
					<th>입금자명</th>
					<th>메모</th>
					<th>구분</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach items="${list}" var="m" varStatus="s">
					<tr class="${m.ioType eq 'I' and m.state eq 'R' ? 'back-red' : ''} ${m.ioType eq 'O' and m.state eq 'R' ? 'back-sky' : ''}">
						<td class="ck_td" data-money-seq="${m.moneySeq}"><input id="ck_${s.index}" type="checkbox"></td>
						<td>${m.ioTypeName}</td>
						<td>${m.gradeName}</td>
						<td>${m.userName}
							<c:if test="${!empty m.nickName }">(${m.nickName})</c:if>
						</td>
						<td>${m.userId}</td>
						<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT}"/></td>
						<td><fmt:formatDate value="${m.regDate }" pattern="${TIME_FORMAT}"/></td>
						<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
						<td>${m.bankName}</td>
						<td>${m.accountNo}</td>
						<td>${m.accountName}</td>
						<td>${m.depositName}</td>
						<td><c:if test="${!empty m.memo}"><a class="showPopupMemo" data-memo="${m.memo}">메모</a></c:if></td>
						<td>
							<c:if test="${m.ioType eq 'I' and m.state eq 'R'}">
								<a onclick="javascript:doConfirm('${m.moneySeq}', 'A', 'I', '${m.userName}', '${m.nickName}', '${m.gradeName}', '${m.userId}');" class="btn bg_pink">입금</a>
								<a onclick="javascript:doConfirm('${m.moneySeq}', 'C', 'C', '${m.userName}', '${m.nickName}', '${m.gradeName}', '${m.userId}');" class="btn bg_gray">취소</a>
							</c:if>
							<c:if test="${m.ioType eq 'O' and m.state eq 'R'}">
								<a onclick="javascript:doConfirm('${m.moneySeq}', 'A', 'O', '${m.userName}', '${m.nickName}', '${m.gradeName}', '${m.userId}', '${m.cash}');" class="btn bg_sky">출금</a>
								<a onclick="javascript:doConfirm('${m.moneySeq}', 'C', 'C', '${m.userName}', '${m.nickName}', '${m.gradeName}', '${m.userId}');" class="btn bg_gray">취소</a>
							</c:if>
							<c:if test="${m.state eq 'A'}">
								<fmt:formatDate value="${m.acceptDate }" pattern="${DATE_TIME_FORMAT}"/>
							</c:if>
							<c:if test="${m.state eq 'C'}">
								취소
							</c:if>
						</td>
					</tr>
				</c:forEach>
				<c:if test="${empty list}">
					<tr>
						<td colspan="15"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<br class="clear mb5" />
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
		<form id="depositList" action="./api/dep_proc_list.do" method="POST">
			<input type="hidden" name="currentPageNo" value="${search.paging.currentPageNo}"/>
			<input type="hidden" name="checkList" value=""/>
			<input type="hidden" name="ioType" value="${search.ioType}"/>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
	$( function() {

		$("thead > tr > th > input").change(function(e){
			$("tbody .ck_td input").prop("checked",$(e.target).is(":checked"));
		});

		$(".all_io_exec a.bg_sky").click(function(){//입출금

			if (!confirm("일괄 처리 하시겠습니까?"))return;
			var checkBoxList = $("tbody .ck_td input:checkbox:checked");

			if(checkBoxList.length < 1){
				alert("선택된 항목이 없습니다.");
				return;
			}

			var arr_val = new Array();
			checkBoxList.each(function(idx,ele){
				var seq = $($(ele).parent()).data("money-seq").toString();
				arr_val.push({status : "A", moneySeq : seq});
			});

			// json 포맷으로 변환
			$('input[name="checkList"]').val(JSON.stringify(arr_val));
			$('#depositList').submit();

		});

		$(".all_io_exec a.bg_gray").click(function(){//일괄취소

			if (!confirm("일괄 처리 하시겠습니까?"))return;
			var checkBoxList = $("tbody .ck_td input:checkbox:checked");

			if(checkBoxList.length < 1){
				alert("선택된 항목이 없습니다.");
				return;
			}

			var arr_val = new Array();
			checkBoxList.each(function(idx,ele){
				var seq = $($(ele).parent()).data("money-seq").toString();
				arr_val.push({status : "C", moneySeq : seq});
			});

			// json 포맷으로 변환
			$('input[name="checkList"]').val(JSON.stringify(arr_val));
			$('#depositList').submit();

		});

	});


	//Refreshing Every Minute
	var time = new Date().getTime();
	$(document.body).bind("mousemove keypress", function(e) {
		time = new Date().getTime();
	});

	function refresh() {
		if($(".reloadBox").is(":checked")){
			if(new Date().getTime() - time >= 60000)
				window.location.reload(true);
			else
				setTimeout(refresh, 10000);
		}
	}

	setTimeout(refresh, 10000);
	//For Confirm
	function doConfirm(seq, type, dep, name, agent, grade, userId, cash) {
		var msg = '';
		var stragent = "";
		if (agent != "")	stragent =  ' (' + agent + ') ';

		switch(dep){
			case'I':
				msg = name + stragent + grade + '의\n입금을 승인 하시겠습니까?';
				break;
			case'O':
				msg = name + stragent + grade + '의\n출금을 승인 하시겠습니까?';
				break;
			case'C':
				msg = name + stragent + grade + '의\n신청을 취소 하시겠습니까?';
				break;
		}
		if (!confirm(msg))
			return;

		$('input[name="status"]').val(type);
		$('input[name="moneySeq"]').val(seq);
		$('input[name="ioType"]').val("${search.ioType}");
		$('input[name="currentPageNo"]').val("${search.paging.currentPageNo}");

		$('#deposit').submit();
	}

	//For Searching
	function doSearch(){
		$('#form1').submit();
	}


	//For Memo Popup
	$(document).on('click', 'a.showPopupMemo', function(e){
		var markup = '<table class="board_write"><th>메모</th><td>' + $(this).data('memo') +'</td></table>';
		$("<div style='white-space: pre;'></div>").dialog({
			title:"메모",
			width:500,
			modal:true,
			open: function() {
				$(this).html(markup);
			},
			buttons: {
				'확인' : function(){
					$(this).dialog('close');
				}
			}
		});
	});
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>