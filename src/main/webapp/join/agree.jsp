<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입 - 이용약관 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>회원가입</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 회원가입</div>
			</div><!--  end title -->
			<div id="content">
				<div class="agree_top">
				<p class="mT7"><img src="/images/member_top_txt1.png" title="타고플러스에 오신것을 환영합니다."></p>
				<p class="sub_top_ex">회원가입을 위해서는 이용약관, 개인정보취급방침에 동의하셔야 합니다.<br>
					(주)타고플러스 웹사이트의 회원으로 가입하시면, 각종 정보를 보다 쉽게 만나실 수 있습니다.</p>
				</div>
				<div class="stit mT30">타고플러스 회원 이용약관</div>
				<div class="inner2">
					<textarea id="term" class="textarea2" readonly style="width:854px; height:200px;">
					
					
					</textarea>
				</div>
				<div class="acen mT20"><label><input name="agree" type="checkbox" value="Y"> 이용약관에 동의합니다.</label></div>
				<div class="stit mT40">개인정보 취급방침</div>
				<div class="inner2">
					<textarea id="privacyInfo" class="textarea2" readonly style="width:854px; height:200px;">
					
					
					</textarea>
				</div>
				<div class="acen mT20"><label><input name="agree" type="checkbox" value="Y"> 이용약관에 동의합니다.</label></div>
				<div class="btn_area"><a href="javascript:doCheckAgree();" class="btn_m_nor">확인</a><a href="" class="btn_m_gy mL5">취소</a></div>
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->

<script type="text/javascript">
$(function () {
	$.ajax({
		type : 'post',
		url : '/ajax/term.do',
		dataType : 'json',
		success : function(data) {
			$('#term').val(( data[0].contentsType=='terms')?data[0].contents : data[1].contents );
			$('#privacyInfo').val(( data[0].contentsType=='privacy')?data[0].contents : data[1].contents );
		}
	});
});

function doCheckAgree() {
	var iAgreeLength= $('input[name=agree]').length;
	for(var i = 0; i < iAgreeLength; i++) {
		if (!$('input[name=agree]').eq(i).attr('checked')) {
			alert('이용약관에 동의 하지 않으면 회원가입을 할 수 없습니다.');
			return;
		}
	}

	$.Nav('go', '/mypage/member_write.do');
}
</script>


	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>