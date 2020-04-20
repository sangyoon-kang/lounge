<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">고객센터</a></li>
            <li><span class="ico rjrs"></span><a href="#">공지사항</a></li>
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
                <li style="width:33.333%;" class="on"><a href="/html/customer/notice.jsp">공지사항</a></li>
               	<li style="width:33.333%;"><a href="/html/customer/qna.jsp">고객상담</a></li>
                <li style="width:33.333%;"><a href="/html/customer/faq.jsp">자주하는 질문</a></li>
            </ul>
        </div>
        <div class="in mT40">
       		<ul class="board_det_top">
            	<li><p class="sb">공지사항 제목입니다.</p>
                	<p class="date">2018-05-05</p></li>
                <li class="aright"><span>작성자 : 타고렌트카</span><span class="mL30">조회수 : 5</span></li>
            </ul>
        </div>
		<div class="board_det_con">
        	공지사항 내용입니다.<br/>
            공지사항 내용입니다.<br/>
            공지사항 내용입니다.<br/>
            공지사항 내용입니다.<br/>
            공지사항 내용입니다.<br/>
            공지사항 내용입니다.<br/>
        </div>
        <div class="board_det_pn">
        	<ul>
            	<li><p class="sb">이전글<span class="ico arr_prv"></span></p>
                	<p><a href="#">이전글 입니다.</a></p></li>
                <li><p class="sb">다음글<span class="ico arr_next"></span></p>
                	<p><a href="#">다음글 입니다.</a></p></li>
            </ul>
        </div>
        <div class="btn_wrp">
          	<a href="/html/customer/notice.jsp" class="btn_b_cor">목록보기</a>
        </div>
    </div><!--content -->        
</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>
