<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
<div class="mem_ser">
	<div class="ex">
		<p>비밀번호를 잊으셨나요?</p>
		<p>아이디, 이름, 이메일을 입력해주시면 이메일로 비밀번호가 전송됩니다.</p>
	</div>
	<div class="inner2 mT20">
		<div class="fleft">
			<form id="formPwdFind" method="post" action="module/findid_proc.do">
				<input type="hidden" name="status" value="pass" />
				<p>
					<input type="text" class="input_txt" name="aid" placeholder="아이디">
				</p>
				<p class="mT3">
					<input type="text" class="input_txt" name="userName" placeholder="이름">									
				</p>
				<p class="mT3">
					<input type="email" class="input_txt" name="userEmail" placeholder="이메일">
				</p>
			</form>
		</div>
		<div class="fright">
			<a href="javascript:searchPwd();" class="btn_ser2">비밀번호 찾기</a>
		</div>
	</div>
</div>
<script type="text/javascript">
function searchPwd(){
	oFormObject = document.forms['formPwdFind'];
	aid = oFormObject.elements["aid"];
	userName = oFormObject.elements["userName"];
	userEmail = oFormObject.elements["userEmail"];
	if (aid.value.trim().length == 0) {
		alert('Please input User ID.');
		return;
	}
	if (userName.value.trim().length == 0) {
		alert('Please input User Name.');
		return;
	}
	if (userEmail.value.trim().length == 0) {
		alert('Please input Email.');
		return;
	}
	if (!confirm('저장하시겠습니까?'))
		return; 
	
	oFormObject.submit();
}
</script>
