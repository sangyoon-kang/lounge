<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">마이페이지</a></li>
            <li><span class="ico rjrs"></span><a href="#">예약확인</a></li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>마이페이지</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
		<div class="in">
        	<ul class="sub_mu">
                <li style="width:33.333%;"><a href="/html/mypage/modify.jsp">회원수정</a></li>
               	<li style="width:33.333%;" class="on"><a href="/html/mypage/reserve_list.jsp">에약내역</a></li>
                <li style="width:33.333%;"><a href="/html/mypage/out.jsp">회원탈퇴</a></li>
            </ul>
        </div>
        <div class="in mT60">
      		<table class="nor_list">
            	<colgroup>
                	<col width="20%">
                    <col width="18%">
                    <col width="15%">
               		<col width="15%">
                    <col width="15%">
                    <col width="17%">
                 </colgroup>
                 <thead>
                 	<tr>
                    	<th>기간</th>
                        <th>업체</th>
                        <th>지역</th>
                        <th>차종</th>
                        <th>차명</th>
                        <th>총금액</th>
                    </tr>
                 </thead>
                 <tbody>
                 	<tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                    <tr>
                    	<td>18.01.01~18.1.05</td>
                        <td>타고렌트카</td>
                        <td>김포공항</td>
                        <td>대형차</td>
                        <td>오피러스</td>
                        <td>153,000원</td>
                    </tr>
                 </tbody>
            </table>
          </div><!-- list -->
          <div class="paging">
          	<a href="#"><i class="ico btn_prev2">맨앞으로</i></a>
           	<a href="#"><i class="ico btn_prev1">앞으로</i></a>
		       <span class="page_num">
		           <a href="#" class="active">1</a>
		           <a href="#" class="on">2</a>
		           <a href="#">3</a>
		           <a href="#">4</a>
		           <a href="#">5</a>
		       </span>
		       <a href="#"><i class="ico btn_next1">뒤로</i></a>
           	<a href="#"><i class="ico btn_next2">맨뒤로</i></a>
		</div>
    </div><!--content -->        

</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
