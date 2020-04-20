<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	기본설정 > 관리자 설정 - 등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>은행계좌 설정</h2>
		<p>홈 &gt; 기본설정 &gt; 은행계좌 설정</p>
	</div>
	<div class="scon">
		<form id="form1" name="form1" action="./bank_proc.do" method="post">
			<input type="hidden" name="bankSeq" value="${!empty vo.bankSeq ? vo.bankSeq : 0}" />
			<table class="board_write">
				<colgroup>
					<col width="15%" />
					<col width="*" />
					
				</colgroup>
				<tbody>
					<tr>
						<th>은행<span class="red bold">*</span></th>
						<td><tt:select list="${bankList}" name="bankFixedCode" id="bankFixedCode"
								listKey="codeCode" listValue="codeName" indexKey="0"
								indexValue="= 메뉴 =" selected="${vo.bankFixedCode }" /></td>
					</tr>
					<tr>
						<th>예금주<span class="red bold">*</span></th>
						<td><input type="text" class="w50" name="accountName" id="accountName"
							 maxlength="24" value="${vo.accountName}" /></td>
					</tr>
					<tr>
						<th>계좌번호<span class="red bold">*</span></th>
						<td><input type="text" class="w50" name="accountNo" id="accountNo"
							 maxlength="24" value="${vo.accountNo}" /></td>
					</tr>

				</tbody>
			</table>

			<ul class="summmit_btn">
				<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
				<li><a
					onclick="javascript:$.Nav('go', './list',{});"
					class="btn2 bg_darkgray">취소</a></li>
			</ul>
		</form>

	</div>


</div>
<!--wrap_scon E-->
<script type="text/javascript">
	function doSubmit() {
		if(checkNull($('#bankFixedCode'), '은행을 선택하세요.'))return;
		if(checkNull($('#accountName'), '예금주를 입력하세요.'))return;
		if(checkNull($('#accountNo'), '은행 계좌 번호를 입력하세요.'))return;
		if(!checkPattern($('#accountNo').val(), 'ACCOUNT')){
			alert('은행 계좌 번호를 입력하세요.');
			$('#accountNo').focus();
			return;
		}

		if (!confirm('저장하시겠습니까?'))
			return;

		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>