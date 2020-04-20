<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>


<div class="contract">

               <div class="contract-header bg-dark-grey py-2 text-center column">
                    <small class="upper letter-space bold ">${SITE_NAME_L}</small>
                    <h4 class="text-300">손익 분배 계약서 <small class="badge danger bg-red">매수</small></h4>
                    <div class="flex offer justify-center">
                         <span></span>
                         <small class="upper">buying offer</small>
                         <span></span>
                    </div>
               </div>
               <div class="container-fluid bg-light-grey">
                    <div class="flex py-3 align-stretch">
                         <div class="w-50 px-2">
                              <div class="bg-white p-2 h-100 bt-4-red"> ₩5,000 * 3</div>
                         </div>
                         <div class="w-50 px-2">
                              <div class="bg-white p-2 text-center bt-4-red">
                                   <h5 class="text-300">렌트시작</h5>
                                   <p class="bold">05월 15일 22시55분</p>
                                   <h5 class="text-300">렌트보증금</h5>
                                   <p class="bold">15,000</p>
                              </div>
                         </div>
                    </div>
               </div>
               <div class="text-center py-3">
                    <ul>
                         <li class="small mb-1">FX마진거래 손익분배 계약 보증금은 차손발생 시 귀속되는 계약입니다.</li>
                         <li class="small mb-1">FX마진거래 렌트 계약을 취득하기 전에 ${URL_HOST_OP}에서</li>
                         <li class="small mb-1">반드시 이용약관 및 설명서를 읽어보시고 계약하시기 바랍니다.</li>
                    </ul>
                    <!-- <div class="flex align-center justify-center">
                         <div class="w-40 flex align-center justify-center"><img src="/images/fx_assets/logo.png" width="100px" class="" alt=""></div>
                         <div class="bl-2-dark-grey w-60">
                         	<div class="flex align-center justify-between px-2">
                         		<p class=" bold">입출금관련전화</p>
	                         	<h4> 02-557-1999</h4>
                         	</div>
                         	<div class="flex align-center justify-between px-2">
                         		<p class="bold">출금업무시간</p><h4>10:00~22:00</h4>
                         	</div>
	                         
                        </div>
                    </div> -->
                    <div class="row py-2">
                    	<div class="col-12 mb-3">
                    		<div class="flex h-100 w-100 align-center justify-center">
                    			<img src="/images/fx_assets/logo/${SITE_NAME_L}.png" width="180px">
                    		</div>
                    	</div>
                    	<div class="col-6 br-1-black">
                   			<p class=" ">입출금관련전화</p>
                         	<h4> 02-557-1999</h4>
                         </div>
                         <div class="col-6 bl-1-black">
                         	<p class="">출금업무시간</p>
                         	<h4>10:00~22:00</h4>
                    		
                    	</div>
                    </div>
               </div>
               <div class="contract-action bg-red px-1 no-print">
                    <div class=" flex flex-wrap text-center align-center py-1">
                         <small class="bold">남은 시간</small>
                         <h3 class="text-300 mx-2">00:00:14</h3>
                         <button type="button" class=" btn b-2-white bg-transparent ml-auto" name="button">매수수익계약
                         <i data-feather="chevrons-right" class="icon"></i>
                         </button>
                         <a type="button" onclick="window.print()" class=" print text-red" name="button">
                              <i data-feather="printer" class=""></i>
                         </a>
                    </div>
               </div>
               <div class="container">
                    <div class="alert warning">
                         <i data-feather="alert-circle" class="mr-1"></i>
                        <span> 본 상품은 고객님께서 <strong> 계약하신 상품의 금액</strong>만 해당합니다</span>
                    </div>
                    <table class="table striped">
                         <thead>
                              <tr>
                                   <th>상품구분</th>
                                   <th>당사보유(MOU) 금융투자(FX 마진거래 GBP/AUD)</th>
                              </tr>
                         </thead>
                         <tbody>
                              <tr>
                                   <td class="px-1">
                                        <span class="text-red small">1랏의 10%(매수)</span>
                                        <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                                   </td>
                                   <td class="px-1">
                                        <p class="text-left my-1 small">렌트보증금 <span class="bold">$5(5,000)</span>으로 렌트시작 시각</p>
                                        <p class="text-left my-1 small"><span class="bold">(손익분배비율:14%)</span> 단위 <span class="bold">↓50</span> 실격</p>
                                        <p class="text-left my-1 small"><span class="bold text-blue">₩5,000(차손)</span> 소멸종료 단위 <span class="bold">↑50</span> 실현 <span class="bold text-red">₩4,300(차익)</span> 지급종료</p>
                                   </td>
                              </tr>
                              <tr>
                                   <td class="px-1">
                                        <span class="text-red small">2랏의 10%(매수)</span>
                                        <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                                   </td>
                                   <td class="px-1">
                                        <p class="text-left my-1 small">렌트보증금 <span class="bold">$5(10,000)</span>으로 렌트시작 시각</p>
                                        <p class="text-left my-1 small"><span class="bold">(손익분배비율:14%)</span> 단위 <span class="bold">↓50</span> 실격</p>
                                        <p class="text-left my-1 small"><span class="bold text-blue">₩5,000(차손)</span> 소멸종료 단위 <span class="bold">↑50</span> 실현 <span class="bold text-red">₩4,300(차익)</span> 지급종료</p>
                                   </td>
                              </tr>
                              <tr>
                                   <td class="px-1">
                                        <span class="text-red small">1랏의 10%(매수)</span>
                                        <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                                   </td>
                                   <td class="px-1">
                                        <p class="text-left my-1 small">렌트보증금 <span class="bold">$5(5,000)</span>으로 렌트시작 시각</p>
                                        <p class="text-left my-1 small"><span class="bold">(손익분배비율:14%)</span> 단위 <span class="bold">↓50</span> 실격</p>
                                        <p class="text-left my-1 small"><span class="bold text-blue">₩5,000(차손)</span> 소멸종료 단위 <span class="bold">↑50</span> 실현 <span class="bold text-red">₩4,300(차익)</span> 지급종료</p>
                                   </td>
                              </tr>
                              <tr>
                                   <td class="px-1">
                                        <span class="text-red small">2랏의 10%(매수)</span>
                                        <p class="small">포지션 상품에서 발생될 ±손익에 대하여</p>
                                   </td>
                                   <td class="px-1">
                                        <p class="text-left my-1 small">렌트보증금 <span class="bold">$5(10,000)</span>으로 렌트시작 시각</p>
                                        <p class="text-left my-1 small"><span class="bold">(손익분배비율:14%)</span> 단위 <span class="bold">↓50</span> 실격</p>
                                        <p class="text-left my-1 small"><span class="bold text-blue">₩5,000(차손)</span> 소멸종료 단위 <span class="bold">↑50</span> 실현 <span class="bold text-red">₩4,300(차익)</span> 지급종료</p>
                                   </td>
                              </tr>


                         </tbody>
                    </table>
               </div>






          </div>
          
<script>
feather.replace()
</script>