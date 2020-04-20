<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
 integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
 <style>
<!--
.ContractWrap{
margin-bottom:50px;
}
.print{
	border: 1px solid #ccc;
}
.fa{
font-size: 200%;
color:black;
}
.cttxt_info p {
	display: inline-block;
	padding: 10px 5px 0px 5px;
}
.ctbox {
	width: 40%;
	float: left;
	padding: 10px 5px;
	text-align: center;
	margin-top: 40px;
	margin-left: 28px;
	margin-bottom: 30px;
	border: 5px solid #ccc;
	height:130px;
	 font-size: 0.85em;
}
.ctbox:last-child {
	width: 40%;
	float: right;
	padding: 10px 5px;
	text-align: center;
	margin-right: 28px;
}
.cttxt {
	text-align: center;
	background-color:#f2f2f2;
	word-wrap: normal;
	color: #30295f;
	font-size: 0.85em;
}
.cform_wrap h4 {
	margin: 20px auto;
	background: #f2f2f2;
	padding: 14px ;
	text-align: center;
	font-weight: 300;
	font-size: 0.85em;
}
.cform_wrap {
	font-size: 0.85em;
	padding: 10px;
}
.cform_wrap table tr td {
	padding: 10px;
	text-align: center;
	word-break: keep-all;
}
.tredB{
color:#ee3f5c;
display: block;
}
.tblue{
color:#3a47ad;
}
.cgreen{
color:#26A69A;
}
.cred{
color:#EF5350;
}
img{
width:24%;
}
.tred{
color:#ee3f5c;
}
.cform_wrap table thead tr td {
	border-top: 2px solid #666;
	border-bottom: 1px solid #666;
	padding: 5px;
}
.text-light{
background-color:#ff1a66;
 font-size: 20px;
}
.cform_wrap table tr td:nth-child(2n) {
	text-align: left;
}
.cform_wrap table tbody tr td:first-child {
	font-size: 0.85em;
}
-->
</style>
<div class="ContractWrap">
<div class="cw100">
	<div class="contract">
		<h1></h1>
		<a href="" class="print"><i class="fa fa-print" aria-hidden="true"></i></a>
	</div>
</div>
<div class="sub-visual">
	 <div class="container">
		  <div class="row">
			   <div class="col-sm-12">
			   <img src="/images/fx_assets/logo/${SITE_NAME_L}.png" alt="">
					 <h3>손익 분배 계약서<span class="badge ${vo.bsType eq 'B' ? 'danger bg-red' : 'blue bg-blue'}">${vo.bsType eq 'B' ? '매수' : '매도'}</span></h3>
					<h6 class="upper">${vo.bsType eq 'B' ? 'buying offer' : 'selling offer'}</h6>
			   </div>
		  </div>
	 </div>
</div>
<div class="cw100">
			<div class="ctbox">
				<ul>
				   <c:if test="${vo.bsType eq 'B' and !empty od.buyLot1 and od.buyLot1 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_01}" /> * ${od.buyLot1}</li></c:if>
					<c:if test="${vo.bsType eq 'B' and !empty od.buyLot2 and od.buyLot2 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_02}" /> * ${od.buyLot2}</li></c:if>
					<c:if test="${vo.bsType eq 'B' and !empty od.buyLot10 and od.buyLot10 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_1}" /> * ${od.buyLot10}</li></c:if>
					<c:if test="${vo.bsType eq 'B' and !empty od.buyLot20 and od.buyLot20 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_2}" /> * ${od.buyLot20}</li></c:if>
					<c:if test="${vo.bsType eq 'B' and !empty od.buyLot40 and od.buyLot40 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_4}" /> * ${od.buyLot40}</li></c:if>
					<c:if test="${vo.bsType eq 'S' and !empty od.sellLot1 and od.sellLot1 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_01}" /> * ${od.sellLot1}</li></c:if>
					<c:if test="${vo.bsType eq 'S' and !empty od.sellLot2 and od.sellLot2 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_02}" /> * ${od.sellLot2}</li></c:if>
					<c:if test="${vo.bsType eq 'S' and !empty od.sellLot10 and od.sellLot10 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_1}" /> * ${od.sellLot10}</li></c:if>
					<c:if test="${vo.bsType eq 'S' and !empty od.sellLot20 and od.sellLot20 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_2}" /> * ${od.sellLot20}</li></c:if>
					<c:if test="${vo.bsType eq 'S' and !empty od.sellLot40 and od.sellLot40 gt 0}"><li>₩ <fmt:formatNumber pattern="#,##0" value="${LOT_4}" /> * ${od.sellLot40}</li></c:if>
				</ul>
			</div>
			<div class="ctbox margin0">
				<c:set var="date" value="${fn:split(vo.goodsDate, '-')}" />
				 <c:set var="time" value="${fn:split(vo.goodsTime, ':')}" />
				  <strong>렌트시작</strong><br>
					${date[1]}월 ${date[2]}일 ${time[0]}시${time[1]}분</p>
				<span>
				<strong>렌트보증금</strong> <br>
				   <fmt:formatNumber pattern="#,##0" value="${vo.lot * 50000}" />
				</span>
			</div>
		</div>
		<div class=" cttxt">
			FX마진거래 손익분배 계약 보증금은 차손발생 시 귀속되는 계약입니다. <br> FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서 <br>반드시 이용약관 및
			설명서를 읽어보시고 계약하시기 바랍니다.
			<div class="cttxt_info">
				<img src="/images/fx_assets/logo/${SITE_NAME_L}.png" alt=""><span>|</span>
				<p>문의전화<b >1522-1206</b></p>
			</div>
		</div>
		<div class="cform_wrap cw100">
		<h4><i class="fas fa-exclamation-circle"></i>본 상품은 고객님께서 <b>계약하신 상품의 금액</b>만해당됩니다.</h4>
			<table width="100%">
				<thead>
				<tr>
					<th width="30%">상품구분</th>
					<th width="70%">당사보유(MOU) 금융투자(FX 마진거래 GBP/AUD)</th>
				</tr>
				</thead>
				<tbody>
				<tr>
					<td class="px-1">
						<span class="${vo.bsType eq 'B' ? 'text-danger' : 'text-blue'} small">0.1랏 ${vo.bsType eq 'B' ? '매수' : '매도'}</span>
						<p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
					</td>
					<td class="px-1">
						<p class="text-left my-1 small">렌트보증금 <span class="bold">$5(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01}" />)</span>으로 렌트 시작</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
							<span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01}" />(차손)</span> 소멸 종료
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
							<span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_01 - (rateVo.lineRateT*LOT_01/100)}" />(차익)</span> 지급 종료
							<span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
						</p>
					</td>
				</tr>
				<tr>
					<td class="px-1">
						<span class="${vo.bsType eq 'B' ? 'text-danger' : 'text-blue'} small">0.2랏 ${vo.bsType eq 'B' ? '매수' : '매도'}</span>
						<p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
					</td>
					<td class="px-1">
						<p class="text-left my-1 small">렌트보증금
							<span class="bold">$10(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02}" />)</span>으로 렌트 시작
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
							<span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02}" />(차손)</span> 소멸 종료
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
							<span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_02 - (rateVo.lineRateT*LOT_02/100)}" />(차익)</span> 지급 종료
							<span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
						</p>
					</td>
				</tr>
				<tr>
					<td class="px-1">
						<span class="${vo.bsType eq 'B' ? 'text-danger' : 'text-blue'} small">1랏 ${vo.bsType eq 'B' ? '매수' : '매도'}</span>
						<p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
					</td>
					<td class="px-1">
						<p class="text-left my-1 small">렌트보증금
							<span class="bold">$50(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1}" />)</span>으로 렌트 시작
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
							<span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1}" />(차손)</span> 소멸 종료
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
							<span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_1 - (rateVo.lineRateT*LOT_1/100)}" />(차익)</span> 지급 종료
							<span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
						</p>
					</td>
				</tr>
				<tr>
					<td class="px-1">
						<span class="${vo.bsType eq 'B' ? 'text-danger' : 'text-blue'} small">2랏 ${vo.bsType eq 'B' ? '매수' : '매도'}</span>
						<p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
					</td>
					<td class="px-1">
						<p class="text-left my-1 small">렌트보증금
							<span class="bold">$100(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2}" />)</span>으로 렌트 시작
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격
							<span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2}" />(차손)</span> 소멸 종료
						</p>
						<p class="text-left my-1 small">단위
							<span class="bold">${vo.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현
							<span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_2 - (rateVo.lineRateT*LOT_2/100)}" />(차익)</span> 지급 종료
							<span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>
						</p>
					</td>
				</tr>
<%--				<tr>--%>
<%--					<td class="px-1">--%>
<%--						<span class="${vo.bsType eq 'B' ? 'text-danger' : 'text-blue'} small">4랏 ${vo.bsType eq 'B' ? '매수' : '매도'}</span>--%>
<%--						<p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>--%>
<%--					</td>--%>
<%--					<td class="px-1">--%>
<%--						<p class="text-left my-1 small">렌트보증금--%>
<%--							<span class="bold">$200(<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4}" />)</span>으로 렌트 시작--%>
<%--						</p>--%>
<%--						<p class="text-left my-1 small">단위--%>
<%--							<span class="bold">${vo.bsType eq 'B' ? '↓' : '↑'}${runTimeVO.stopLimit}</span> 실격--%>
<%--							<span class="bold chart-red">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4}" />(차손)</span> 소멸 종료--%>
<%--						</p>--%>
<%--						<p class="text-left my-1 small">단위--%>
<%--							<span class="bold">${vo.bsType eq 'B' ? '↑' : '↓'}${runTimeVO.stopLimit}</span> 실현--%>
<%--							<span class="bold chart-green">₩<fmt:formatNumber type = "number" maxFractionDigits = "3" value = "${LOT_4 - (rateVo.lineRateT*LOT_4/100)}" />(차익)</span> 지급 종료--%>
<%--							<span class="bold">(손익분배비율: ${rateVo.lineRateT}%)</span>--%>
<%--						</p>--%>
<%--					</td>--%>
<%--				</tr>--%>
				</tbody>
			</table>
	</div>
</div>

<script src="/static/moment.js">
</script>
<script>
	(function(window, document, $) {
		$(function() {
			$('i.fa-print').on('click', function(e) {
				window.print();
			});
		});
	})(window, document, jQuery);
</script>

