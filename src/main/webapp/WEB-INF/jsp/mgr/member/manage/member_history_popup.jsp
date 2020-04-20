<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<style>
#wrap_pop {float:left; width:950px !important; margin:20px; height: auto;}
</style>
<div class="scroll-x w-100">
<table class="table board_st1" >
	<colgroup>
		<col width="5%" />
		<col width="15%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="10%" />
		<col width="5%" />
		<col width="10%" />
	</colgroup>
     <thead>
          <tr>
               <th>번호</th>
               <th>렌트약정시간</th>
               <th>거래</th>
               <th>구분</th>
               <th>실격</th>
               <th>LIMIT 실현</th>
               <th>수량</th>
               <th>보증금</th>
               <th>결과</th>
               <th>약정서</th>
          </tr>
     </thead>
     <tbody>
     	<c:forEach items="${list }" var="m" varStatus="l">
          <tr>
               <td>${l.index+1 }</td>
               <td>${m.goodsDate }&#x20;${m.goodsTime }</td>
               <td>${m.runTime} 분</td>
               <td>
	               <c:if test="${m.bsType eq 'B'}">
	               	매수
	                </c:if>
	               <c:if test="${m.bsType eq 'S'}">
	                                           매도
	               </c:if>
               </td>
             <c:if test="${m.bsType eq 'B' }">
               <td><span>&#9660;${m.stopLimit}</span> </td>
               <td><span>&#9650;${m.stopLimit}</span> </td>
             </c:if>
             <c:if test="${m.bsType eq 'S' }">
               <td><span>&#9650;${m.stopLimit}</span> </td>
               <td><span>&#9660;${m.stopLimit}</span> </td>
             </c:if>
               <td>${m.lot } Lot</td>
               <td><fmt:formatNumber pattern="#,##0" value="${m.deposit }" /></td>
               <td>
               		<c:if test="${m.orderResult eq 'W'}">
               			<span class="red">실현</span>
               		</c:if>
               		<c:if test="${m.orderResult eq 'L' }">
               			<span class="blue">실손</span>
               		</c:if>
               		<c:if test="${m.orderResult eq 'T' }">
               			<span class="grey">틱</span>
               		</c:if>
               		<c:if test="${m.orderResult eq null}">
               			<span class="badge dark">대기</span>
               		</c:if>
               </td>
               <td>
                    <a onclick="javascript:openPop('?orderSeq=${m.orderSeq }', 'historyView' ,600, 650);"class="btn btn-sm dark">보기</a>
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
<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
</div>