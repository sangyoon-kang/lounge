<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<div class="scroll-x w-100">
<table class="table">
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
          <tr>
               <td>1</td>
               <td>2019-04-22 16:50:00</td>
               <td>530395</td>
               <td>매수</td>
               <td class="text-red">&#9660;50</td>
               <td class="text-blue ">&#9650;50</td>
               <td>0.1 Lot</td>
               <td>5,000</td>
               <td><span class="badge blue">
                    실현
               </span></td>
               <td>
                    <a onclick="window.open('/pages/fx_pages/tx_form.jsp', 
                               'tx-form', 'width=600,height=680,top=50, left=600,location=no,status=no,scrollbars=yes');" class="btn btn-sm dark">보기</a>
               </td>
          </tr>
          <tr>
               <td>1</td>
               <td>2019-04-22 16:50:00</td>
               <td>530395</td>
               <td>매수</td>
               <td class="text-red">&#9660;50</td>
               <td class="text-blue ">&#9650;50</td>
               <td>0.1 Lot</td>
               <td>5,000</td>
               <td><span class="badge primary">
                    실격
               </span></td>
               <td>
                    <a onclick="window.open('/pages/fx_pages/tx_form.jsp', 
                               'tx-form', 'width=600,height=680,top=50, left=600,location=no,status=no,scrollbars=yes');" class="btn btn-sm dark">보기</a>
               </td>
          </tr>
     </tbody>
</table>
</div>