<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>

<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>

<style>
    .chart-green{
        color:#26A69A;
    }
    .chart-red{
        color:#EF5350;
    }
    .board_search_wrap {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

.board_search_wrap {
  display: -webkit-box;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center;
}

@media (max-width: 767px) {
  .board_search_wrap {
    -webkit-box-orient: vertical;
    -webkit-box-direction: normal;
        -ms-flex-direction: column;
            flex-direction: column;
  }
}

.board_search_wrap .board_search_type05_aside_txt {
  margin-right: auto;
}

.toDeal {
  background: #0088ee;
  color: #fff;
  padding: 8px 10px;
  display:none;
}

@media (max-width: 767px) {
  .toDeal {
    -webkit-box-ordinal-group: 6;
        -ms-flex-order: 5;
            order: 5;
    margin-top: 19px;
  }
}
</style>

	<section class="wrap_scon">
		<div class="scon">
			<!--board_search_type05-->
			<div class="board_search_wrap">
				<div class="board_search_type04 board_search_type05" >
					
					<input type="text" name="startDate"  id="searchDate" value="${search.startDate}"  />
					
					<button onclick="focusInput(searchDate)">달력</button>
				</div>
				<p class="board_search_type05_aside_txt">전체 <strong>${fn:length(list)}건</strong>이 검색되었습니다.</p>
				<a class="toDeal">거래페이지로 돌아가기</a>
				<div class="board_radio">
					
					<label><input type="radio"  ${search.type1 eq '' ? 'checked="checked"' : ''} name="result"  value=""/><span>전체</span></label>
					<label><input type="radio"  ${search.type1 eq 'W' ? 'checked="checked"' : ''} name="result" value="W" /><span>실현</span></label>
					<label><input type="radio"  ${search.type1 eq 'L' ? 'checked="checked"' : ''} name="result" value="L" /><span>실격</span></label>
				</div>
			</div>
			<!--//board_search_type05-->

			<!--list_basic_type01-->
			<div class="board_basic_type01 board_basic_type01_03">
				<table>
					
					<thead>
						<tr>
							<th>번호</th>
							<th>대여일시</th>
							<th>구분</th>
							<th>거래</th>
							<th>실현</th>
							<th>실격</th>
							<th>수량</th>
							<th>보증금</th>
							<th>결과</th>
							<th>약정서</th>
						</tr>
					</thead>
					<tbody id="binddata">
						<c:forEach items="${list }" var="m" varStatus="l">
					          <tr>
					              <td >${search.paging.virtualNumber - l.index}</td>
					               <td>${m.goodsDate }&#x20;${m.goodsTime }</td>
					                <td>
						               <c:if test="${m.bsType eq 'B'}">
						               	매수
						                </c:if>
						               <c:if test="${m.bsType eq 'S'}">
						                매도
						               </c:if>
					               </td>
					               <td>${m.runTime} 분</td>
					              
					             <c:if test="${m.bsType eq 'B' }">
					               <td><span class="trade_f_txt trade_f_red_txt">${m.stopLimit}</span> </td>
					               <td><span class="trade_f_txt trade_f_blue_txt">${m.stopLimit}</span> </td>
					               
					             </c:if>
					             <c:if test="${m.bsType eq 'S' }">
					               <td><span class="trade_f_txt trade_f_blue_txt">${m.stopLimit}</span> </td>
					               <td><span class="trade_f_txt trade_f_red_txt">${m.stopLimit}</span> </td>
					               
					             </c:if>
					               <td><fmt:formatNumber pattern="#,##0.#" value="${m.lot }" /> Lot</td>
					               <td><fmt:formatNumber pattern="#,##0" value="${m.deposit }" />원</td>
					               <td>
					               		<c:if test="${m.orderResult eq 'W'}">
					               			<span style="color:#ef5350">실현</span>
					               		</c:if>
					               		<c:if test="${m.orderResult eq 'L' }">
					               			<span style="color:#0088ee">실격</span>
					               		</c:if>
					               		<c:if test="${m.orderResult eq 'T' }">
					               			<span class="badge grey">틱차트</span>
					               		</c:if>
					               		<c:if test="${m.orderResult eq null}">
					               			<span class="badge dark">대기</span>
					               		</c:if>
					               </td>
					               <td>
					              
					              
					               
					               <a  onclick="javascript:viewAgreement (${m.orderSeq})" class="bt_trade_paper">보기</a>
					                   
					               </td>
					          </tr>
					          
          				</c:forEach>
          				<c:if test="${empty list}">
							<tr>
								<td colspan="10"><s:message code="common.noData" /></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
			<%@ include file="/WEB-INF/jsp/common/tp_new_paging/inc-paging-front.jsp"%>
			
			<!--//list_basic_type01-->

			<div id="printview" class="popup_wrap pop_agreement" style="display:none">
				<div class="popup">
					<div class="title_area">
						<h1>거래약정서</h1>
						<a href="javascript:closeView();" class="btn_close"></a>
					</div>
					<div class="pop_cons">
						<div class="pop_agree_up">
							<h3 class="pop_agree_tit">손익분배계약서<span class="pop_agreement_tag_red" id="buyOrSell">매수</span></h3>
							<p class="pop_agree_txt">금융투자상품(FX마진거래) 투자자(당사)의 <br/>±손익권 조건부 손익분배계약서</p>
							<div class="pop_agree_con">
								<p id="vDate" class="txt"></p>
								<p id="vLoss" class="price"><span>보증금</span> </p>
								
								<p  id="ctbox"class="aside_con">
								
								</p>
							</div>
							<ul class="pop_agree_list">
								<li>FX마진거래 손익분배 계약 보증금은 차손발생시 귀속되는 계약입니다.</li>
								<li>FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서 반드시 이용약관 및 설명서를 읽어보시고 계약하시기 바랍니다.</li>
							</ul>
							
							<p class="pop_agree_txt02"><span class="tit">문의전화</span><strong>${tagoplusSolution1_session_site.customerCenter }</strong></p>
							<script>
							function printContent(el){
							var restorepage = $('body').html();
							var printcontent = $('#' + el).clone();
							
							$('body').empty().html(printcontent);
							window.print();
							$('body').html(restorepage);
							
							}
							</script>
							
							<a onclick="printContent('printview');" class="bt_print">프린트하기</a>
							
						</div>
		
						<div class="pop_agree_down">
							<p>공동투자 및 MOU금융투자상품 FX마진거래 (GBP/AUD) 포지션에서 실시간 발생되는 ± <span id="stopLimit"></span>pip 실현시 (손 익분배율 14%) 차익지급종료 실격시 차손소멸종료 되는 약정입니다.</p>
							<!--list_basic_type01-->
							<div class="board_basic_type01">
								<table>
									<colgroup>
										<col></col>
										<col></col>
									</colgroup>
									<thead>
										<tr>
											<th colspan="2">단위</th>
										</tr>
									</thead>
									<tbody id="lotperunit">
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="bo_area">
						<a class="fright" href="javascript:closeView();">닫기</a>
					</div>
				</div>
			</div>
		<div>
	</section>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
<script>

history.pushState(null, null, location.href);
window.onpopstate = function () {
	history.go(1);
};

if($.urlParam('deal')){
	$('.toDeal').show();
	var url = '/prd/deal.do?runTime='+$.urlParam('deal');
	$('.toDeal').attr('href',url)
}

$('#searchDate').datepicker(
		  {
		    language: 'kr',
		    switchOnClick: true,
		    autoClose:true,
		    onSelect: function(dateText, inst) {
		    	
		    	bindData($('#searchDate').val(),$('input[name=result]:checked').val());
		    }
		  });
		  

$(function(){
	  $('input[name=result]').click(function(){
	    if ($(this).is(':checked'))
	    {
	    	
	     // alert($(this).val());
	     bindData($('#searchDate').val(),$('input[name=result]:checked').val());
	    
	    }
	  });
	});	 
function bindData(date, type){

	$.Nav('self', {startDate: date, type1: type}, null, true);
	
	}
function viewAgreement (orderSeq) {
	$.ajax({
		type : 'post',
		url : '/mypage/order_view_ajax',
		data : {
			orderSeq : orderSeq	
		},
		dataType : 'json',
		success : function(data) {
			var vo=data.vo;
			var search= data.search;
			var runTimeVO= data.runTimeVO;
			var od=data.od;
			var rateVo=data.rateVo;
			
			
			var  txtCtbox="";
			
			if(vo.bsType == 'B' &&  od.buyLot1!="" && od.buyLot1 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_01}' /> * "+od.buyLot1+"</li>";
		   	if(vo.bsType == 'B' &&  od.buyLot2!="" && od.buyLot2 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_02}' /> * "+od.buyLot2+"</li>";
			if(vo.bsType == 'B' &&  od.buyLot10!="" && od.buyLot10 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_1}' /> * "+od.buyLot10+"</li>";
			if(vo.bsType == 'B' &&  od.buyLot20!="" && od.buyLot20 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_2}' /> * "+od.buyLot20+"</li>";
			if(vo.bsType == 'B' &&  od.buyLot40!="" && od.buyLot40 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_4}' /> * "+od.buyLot40+"</li>";
				
			if(vo.bsType == 'S' &&  od.sellLot1!="" && od.sellLot1 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_01}' /> * "+od.sellLot1+"</li>";
		   	if(vo.bsType == 'S' &&  od.sellLot2!="" && od.sellLot2 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_02}' /> * "+od.sellLot2+"</li>";
			if(vo.bsType == 'S' &&  od.sellLot10!="" && od.sellLot10 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_1}' /> * "+od.sellLot10+"</li>";
			if(vo.bsType == 'S' &&  od.sellLot20!="" && od.sellLot20 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_2}' /> * "+od.sellLot20+"</li>";
			if(vo.bsType == 'S' &&  od.sellLot40!="" && od.sellLot40 > 0)
				txtCtbox+="<li>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_4}' /> * "+od.sellLot40+"</li>";
				
				
			$("#ctbox").html(txtCtbox);
				
			txtCtbox="";
			txtCtbox+="<tr><td>0.1Lot</td><td>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_01}' /></td></tr>";
			txtCtbox+="<tr><td>0.2Lot</td><td>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_02}' /></td></tr>";
			txtCtbox+="<tr><td>1Lot</td><td>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_1}' /></td></tr>";
			txtCtbox+="<tr><td>2Lot</td><td>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_2}' /></td></tr>";
			txtCtbox+="<tr><td>4Lot</td><td>₩ <fmt:formatNumber pattern='#,##0' value='${LOT_4}' /></td></tr>";
			$("#lotperunit").html(txtCtbox);
			var loss=(vo.lot * 50000).toFixed(0);
			if (vo.bsType == 'B'){
	            $("#buyOrSell").text("매수");
	            $('#buyOrSell').removeClass('pop_agreement_tag_blue').addClass('pop_agreement_tag_red');
	        	} else {
	            $("#buyOrSell").text("매도");
	            $('#buyOrSell').removeClass('pop_agreement_tag_red').addClass('pop_agreement_tag_blue');
	        	}
			$("#vLoss").html('<span>보증금</span><strong>'+addComma(loss)+'</strong>');
			$('#stopLimit').text(runTimeVO.stopLimit)
			var vdate=vo.goodsDate.split("-");
			var vtime=vo.goodsTime.split(":");
				 $("#vDate").html(vdate[0]+'년 '+vdate[1]+'월 '+vdate[2]+'일 '+ vtime[0]+'시 '+vtime[1]+'분');
				 $('#dim').show();
				 $(".pop_agreement").show()
		}
	});
}
function closeView(){
	$(".pop_agreement").hide();
}
function focusInput(id){
	document.getElementById("searchDate").focus()
}
		  </script>