<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
     
<div class="sub-visual" style="background-image:url(/images/fx_assets/main.jpg)">
     <div class="container">
          <div class="row">
               <div class="col-sm-12">
                    <p>국내 FX렌트서비스의 차세대 업체</p>
                    <h1>${SITE_NAME_U}</h1>
               </div>
          </div>
     </div>
</div>
<div class="container main">
     <div class="row">
          <div class="col-sm-12">
               <h5 class="table-title">
                    입출금화면
               </h5>
          </div>
          <div class="col-sm-12">
               <button class="btn danger btn-lg" onclick="window.open('/front/deposit/withdraw_popup', 'withdraw_popup.do', 'width=450,height=640,top=50, left=600,location=no,status=no,scrollbars=yes');">입금</button>
               <button class="btn blue  btn-lg" onclick="window.open('/front/deposit/deposit_popup', 'deposit_popup.do', 'width=450,height=640,top=50, left=600,location=no,status=no,scrollbars=yes');">출금</button>
               <table class="table mt-2">
                    <thead>
                         <tr>
                              <th>번호</th>
                              <th>거래일시</th>
                              <th>거래종류</th>
                              <th>출금</th>
                              <th>입금</th>
                              <th>상태</th>
                              <th>잔액</th>
                         </tr>
                    </thead>
                    <tbody>
                         <tr>
                              <td>1</td>
                              <td>2019-04-22 16:37:24 </td>
                              <td>입금</td>
                              <td>0</td>
                              <td> 25,000 </td>
                              <td><span class="badge success">승인</span></td>
                              <td> 27,400 </td>
                         </tr>
                    </tbody>
               </table>
          </div>
     </div>
</div>

          
<script>
     feather.replace();

</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
