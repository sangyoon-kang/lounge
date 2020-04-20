<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>

	<section class="wrap_scon">
		<div class="scon">
			<p class="board_search_type05_aside_txt board_search_type05_aside_txt02">전체 <strong>${fn:length(list)}건</strong>이 검색되었습니다.</p>
			<p class="inout_bt">
			<a href="/deposit/deposit_popup.do" class="bt_red">입금 신청</a>
			<a href="/deposit/withdraw_popup.do"  class="bt_blue">출금 신청</a>
			
            
			</p>
			<!--list_basic_type01-->
			<div class="board_basic_type01 inout_table">
				
				<table>
					<colgroup>
						<col>
						<col>
						<col>
						<col>
						<col>
						<col>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>요청일시</th>
							<th>종류</th>
							<th>금액</th>
							<th>상태</th>
							<th>잔액</th>
						</tr>
					</thead>
					<tbody class="deposit_list">
					<c:forEach items="${list}" var="m" varStatus="s">
                         <tr>
                              <td>${search.paging.virtualNumber - s.index }</td>
                              <td><fmt:formatDate value="${m.regDate }" pattern="${DATE_TIME_FORMAT}"/></td>
                              <td><span class="${m.ioTypeName eq '입금' ? 'txt_blue' : 'txt_red'}">${m.ioTypeName}</span></td>
                              <td><fmt:formatNumber pattern="#,##0" value="${m.cash}" /></td>
                             <%--  <td><fmt:formatNumber pattern="#,##0" value="${m.ioType eq 'O' ? m.cash : 0}" /></td> --%>
                              <td>
                              <span class="${m.state eq 'A' ? 'inout_now_done':'' }${m.state eq 'C' ? 'inout_now_cancel':''}${m.state eq 'R' ? 'inout_now_wait':'' }">
                              ${getStateMap[m.state]}
                              
                              </span>
                              </td>
                              <td><fmt:formatNumber pattern="#,##0" value="${m.balance }" /></td>
                              
                         </tr>
                         </c:forEach>
                         
                         <c:if test="${empty list}">
							<tr>
								<td colspan="14"><s:message code="common.noData" /></td>
							</tr>
						</c:if>
						
						
					</tbody>
				</table>
				 
			</div>
			
			<div class="inout_bt02"><a href="javascript:getNextPage()">더보기</a></div>
		</div>
	</section>

<script id="depositTmpl" type="text/x-jquery-tmpl">
	<tr>
		<td>\${order}</td>
		<td>\${regDate}</td>
		<td>\${ioTypeName}</td>
		<td>\${addComma(balance)}</td>
		<td><span class="\${state == 'A' ? 'inout_now_done':'' } \${state == 'C' ? 'inout_now_cancel':''}\${state == 'R' ? 'inout_now_wait':'' }">
          \${state == 'A' ? '승인':'' } \${state == 'C' ? '취소':''}\${state == 'R' ? '요청':'' }
          </span></td>
		<td>\${addComma(balance)}</td>
	</tr>
</script>
<script>
     var currentpage = ${search.paging.pageIndex};
     var total = ${search.paging.totalCount};
     function getNextPage(){
 		var nextPage = currentpage + 1;
         $.ajax({
             type: 'POST',
             url: './ajax/extend_stats.do',
             data: { cpage: nextPage},
             success: function(data){
            	 for (i = 0; i < data.length; i++) {
            		 data[i].regDate = moment(data[i].regDate).format("YYYY-MM-DD HH:mm")
            		 data[i].order = total-currentpage*10-i;
            		}
                 if(!isNull(data)){
                 	setTimeout(function(){
                     	$('#depositTmpl').tmpl(data).appendTo($('.deposit_list'));
                     	currentpage = nextPage;
                		}, 1000);
                 	
                 } else {								 
                 	alert("더 이상 내용이 없습니다.")
                 }
             }
         });
         
 	}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
