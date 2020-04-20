<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">고객센터</a> </li>
             <li><span class="ico rjrs"></span><a href="#">고객상담</a> </li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>고객센터</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
		<div class="in">
        	<ul class="sub_mu">
                <li style="width:33.333%;"><a href="/html/customer/notice.jsp">공지사항</a></li>
               	<li style="width:33.333%;" class="on"><a href="/html/customer/qna.jsp">고객상담</a></li>
                <li style="width:33.333%;"><a href="/html/customer/faq.jsp">자주하는 질문</a></li>
            </ul>
        </div>
        <div class="in mT40">
        	<div class="ser_box">
				<select><option>전체</option></select><input style="width:250px;" class="mL5" type="text" placeholder="검색어를 입력해 주세요".><a href="#" class="ico btn_ser">검색</a>
			</div>
       		<table class="board_list mT20">
				<colgroup>
					<col width="8%">
					<col width="54%">
					<col width="15%">
					<col width="15%">
					<col width="8%">
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>등록일</th>
						<th>글쓴이</th>
						<th>조회수</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>10</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>9</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>8</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>7</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>6</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>5</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>4</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>3</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>2</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
					<tr>
						<td>1</td>
						<td class="ag_left"><a href="/html/customer/view.jsp">제목입니다.</a></td>
						<td>2017-12-20</td>
						<td>홍길동</td>
						<td>5</td>
					</tr>
				</tbody>
			</table>
        </div>
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