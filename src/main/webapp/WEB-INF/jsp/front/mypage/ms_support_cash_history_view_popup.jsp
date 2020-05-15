<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<style>
	#wrap_pop {float:left; width:950px !important; margin:20px; height: auto;}
	.back-red{
		color:#ff3000 !important;
	}
	.back-sky{
		color:#0066d9 !important;
	}
	.board_st1{
		padding-top: 30px;
	}

</style>
<div class="scroll-x w-100">

	<table class="board_write">
		<tbody>
		<colgroup>
			<col width="15%" />
			<col width="35%" />
			<col width="15%" />
			<col width="35%" />
		</colgroup>
		<tr>
			<th>아이디</th>
			<td >
				<span>${user.userId}</span>
			</td>
			<th>이름</th>
			<td >
				<span>${user.accountOwner}</span>
			</td>
		</tr>
		<tr>
			<th>잔액</th>
			<td colspan="4">
				<span id="cash" >
					<fmt:formatNumber pattern="#,##0" value="${user.cash }" /> 원
					(
					캐쉬입금 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashR }" /> 원,
					지원금 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashA }" /> 원,
					거래수익 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashC }" /> 원
					)
				</span>
			</td>
		</tr>
		<tr>

			<th>캐쉬지원</th>
			<td colspan="4">
				<span>&nbsp;&nbsp;&nbsp;금액</span>
				<input type="text" name="cash" numberOnly class="w20">
				<span>&nbsp;&nbsp;&nbsp;지급사유</span>
				<input type="text" name="memo" class="w30" placeholder="지급 사유를 입력하세요(기본 : 관리자 지급)">
				<button type="button" class="btn btn_round bg_blue ml5" onclick="rechargeCash(true)">CASH추가</button>
				<button type="button" class="btn btn_round bg_red ml5" onclick="rechargeCash(false)">CASH회수</button>
			</td>
		</tr>
		</tbody>
	</table>


	<table class="table board_st1" >
		<colgroup>
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
			<col width="20%" />
		</colgroup>
		<thead>
		<tr>
			<th>일자</th>
			<th>시간</th>
			<th>금액</th>
			<th>지급자ID</th>
			<th>지급사유</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${list }" var="m" varStatus="l">
			<tr>
				<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT}"/></td>
				<td><fmt:formatDate value="${m.regDate }" pattern="${TIME_FORMAT}"/></td>
				<td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
				<td>${m.regUser}</td>
				<td>${m.memo}</td>
			</tr>
		</c:forEach>
		<c:if test="${empty list}">
			<tr>
				<td colspan="10"><s:message code="common.noData" /></td>
			</tr>
		</c:if>
		</tbody>
	</table>
	<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
</div>

<script>

	function rechargeCash(isAdd){

		var cash = $('input[name=cash]').val();
		var userid = '${user.userId}';
		var memo = $('input[name=memo]').val();

		if(!cash){
			alert('CASH 입력하세요');
			return false;
		}
		if(isAdd){
			if(!confirm("지원금을 추가 하시겠습니가?")){
				return;
			};
			if(!memo){
				memo = "관리자 지급";
			}
		}else{
			if(!confirm("지원금을 회수 하시겠습니가?")){
				return;
			};
			if(!memo){
				memo = "관리자 회수";
			}
		}

		$.ajax({
			type : 'post',
			url : '/mypage/ajax/addCash',
			data : {
				'uid': userid,
				'cash': cash,
				'memo': memo,
				'type' : isAdd
			},
			dataType : 'json',
			success : function(data) {
				alert(data.message);
				if(data.code == 0){
					location.reload()
				}
			}
		});
	}

</script>