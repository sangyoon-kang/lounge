<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
<div class="agree_top">
	<p class="mT7"><img src="/images/mypage_top_txt.png" title="회원정보를 변경해 주세요"></p>
	<p class="sub_top_ex">탈퇴를 하시면 회원님의 모든 정보가 삭제 됩니다.<br/> 
		(단, 결제정보는 법률상의 의거하여 5년간 보존합니다.)<br/>
		회원탈퇴 후 재가입 시에는 신규가입으로 처리되며, 탈퇴하신 아이디는 다시 사용하실 수 없습니다.</p>
</div>

<div class="stit mT30">탈퇴를 진행하시려면 비밀번호와 탈퇴사유를 입력해주세요.</div>
<form id="formWithdrawal" action="./withdrawal_proc.do" method="post">
	<input type="hidden" name="mseq" value="${tagoplusSolution1_session_user.memberSeq}">
	<input type="hidden" name="id" value="${search.id }">
	<table class="board_write">
		<colgroup>
			<col width="170px"/>
			<col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<th>비밀번호<span class="red bold">*</span></th>
				<td>
					<input type="password" name="userPwd" class="input" style="width: 200px;" maxlength="20" placeholder="비밀번호를 입력하세요.">
				</td>
			</tr>
			<tr>
				<th>탈퇴사유<span class="red bold">*</span>	</th>
				<td>
					<textarea rows="10" cols="72" name="withdrawalReason" placeholder="탈퇴사유를 입력해주세요"></textarea>
				</td>
			</tr>						
		</tbody>
	</table>
</form>
<div class="btn_area">
	<a href="javascript:doSubmit();" class="btn_m_nor">확인</a>
	<a href="" class="btn_m_gy mL5">취소</a>
</div>
<script type="text/javascript">
function doSubmit() {
	
	if ($('input[name=userPwd]').val() == '') {
		alert('비밀번호를 입력해야 합니다.');		
		return;
	}
	
	if ($('textarea[name=withdrawalReason]').val() == '') {
		alert('탈퇴사유를 입력해야 합니다.');
		return;
	}
	
	if(!confirm('탈퇴하시겠습니까?')) {
		return;
	}
		
	$('#formWithdrawal').submit();
}
</script>