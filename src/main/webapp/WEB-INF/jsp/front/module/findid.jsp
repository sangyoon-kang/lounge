<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
<div class="mem_ser">
	<div class="ex">
		<p>아이디를 잊으셨나요?</p>
		<p>회원가입할 때 입력한 이름과 이메일을 입력해주시면 이메일로 아이디가 전송됩니다.</p>
	</div>
	<div class="inner2 mT20">
		<div class="fleft">
			<form id="formIdFind" method="post" action="module/findid_proc.do">
				<input type="hidden" name="status" value="id" />
				<p>
					<input type="text" class="input_txt" name="userName" placeholder="이름">
				</p>
				<p class="mT5">
					<input type="email" class="input_txt" name="userEmail" placeholder="이메일">
				</p>
			</form>
		</div>
		<div class="fright">
			<a href="javascript:searchId();" class="btn_ser">아이디 찾기</a>
		</div>
	</div>
</div>
<script type="text/javascript">

function searchId(){
	oFormObject = document.forms['formIdFind'];
	userName = oFormObject.elements["userName"];
	userEmail = oFormObject.elements["userEmail"];
	if (userName.value.trim().length == 0) {
		alert('Please input username.');
		return;
	}
	if (userEmail.value.trim().length == 0) {
		alert('Please input email.');
		return;
	}
	if (!confirm('저장하시겠습니까?'))
		return; 
	
	oFormObject.submit();
}
</script>
