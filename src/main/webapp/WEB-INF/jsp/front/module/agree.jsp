<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%-- Member privacy and terms --%>
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

	$.Nav('self', {isAgreed: true}, null, true);
}
</script>