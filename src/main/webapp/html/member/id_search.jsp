<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/html/include/top.jsp" %>
<%@ include file="/html/include/header.jsp" %>

<div class="pre_path">
	<div>
    	<ul class="path">
        	<li class="home"><a href="#" class="ico home"></a></li>
            <li><span class="ico rjrs"></span><a href="#">아이디 찾기</a></li>
        </ul>
    </div>
</div><!--pre_path -->
<div id="container">
	<h2><span class="rg_line"></span>
    	<span>아이디 찾기</span>
        <span class="rg_line"></span></h2>
    <div class="tit_txt">전국 어디서나 쉽고 빠른 타고 렌트카!</div>
    <div class="content">
        <div class="mem_search">
            <div class="ico ser_img"></div>
            <div class="ser_right">
				<ul class="box_info">
					<li><span class="ic_jm"></span>아이디가 기억나지 않으세요?.</li>
                    <li><span class="ic_jm"></span>이름과 핸드폰 번호를 입력하시면 아이디를 확인하실 수 있습니다.</li>
                </ul><!-- box_info -->
               	<ul class="id_ser mT30">
                    <li><p class="sb">이 름</p>
                        <p class="frm"><input style="width:100%" placeholder="이름를 입력하세요." type="text"></p></li>
                    <li><p class="sb">핸드폰번호</p>
                        <p class="frm"><input style="width:100%" placeholder="핸드폰번호를 입력하세요." type="text"></p></li>
                </ul>
           </div><!-- ser_right -->

        </div><!-- mem_search -->
		<div class="btn_wrp">
           	<a href="#" class="btn_b_cor">아이디 찾기</a>
        </div><!-- btn_wrp -->
    </div><!--content -->        
</div><!-- container -->

<%@ include file="/html/include/footer.jsp" %>