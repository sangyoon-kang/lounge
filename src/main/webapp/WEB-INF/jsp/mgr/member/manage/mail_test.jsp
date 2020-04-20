<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 이메일 설정
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<style>
	.table_style1 {
	    float: left;
	    margin: 16px 0 0 0;
	    width: 100%;
	    border-top: 2px solid #333333;
	}
	.table_style1 th:first-child {
	    border-left: 1px solid #d5d9df;
	}
	.table_style1 th {
	    background: #e0f3fd;
	    border-right: 1px solid #d5d9df;
	    border-bottom: 1px solid #d5d9df;
	    padding: 6px 6px 8px 6px;
	    line-height: 22px;
	    color: #333;
	    font-size: 14px;
	    height: 30px;
	}
	.table_style1 td {
	    border-right: 1px solid #d5d9df;
	    border-bottom: 1px solid #d5d9df;
	    padding: 6px 6px 8px 6px;
	    line-height: 22px;
	    color: #555;
	    text-align: center;
	    font-size: 14px;
	    height: 30px;
	}
	body {
	    font-family: '맑은 고딕', Malgun Gothic, dotum, sans-serif;
	    font-size: 14px;
	    overflow-y: scroll;
	}
	.bt_bsubmit{
		height: 36px;
		border-radius: 0;
	}
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>메일 발송 테스트</h2>
		<p>홈  &gt; 회원 관리   &gt; 메일 발송 테스트</p>
	</div>

	<div class="scon">
		<h3 class="scon_tit2">메일 발송 테스트</h3>
		<div class="check_conbox">
			<h4 class="check_tit">체크사항</h4>
			<ul>
				<li>- 사이트에서 메일을 발송했음에도 불구하고 메일을 수신 하지 못하는경우 프로그램상의 문제이기 보다는 대부분 서버 또는 발송이메일의 문제입니다.<br><strong>사용하고 계신 프로그램은 많은 사이트 개발에 이용된 프로그램으로 메일발송 프로그램에는 문제가 없습니다.</strong></li>
				<li>- 각 포털과 여러메일로 메일을 발송해서 아무곳도 수신이 안되는지 일부만 되는지 체크해보시기 바랍니다.<br>아래내용과 같이 수신됩니다.<br>-------------------------------------------------------------------------------<br>[메일테스트]<br>이 내용이 제대로 보이면 이메일이 수신된것 입니다.<br>2009-10-01 12:12:12<br> -------------------------------------------------------------------------------</li>
				<li>- <strong>메일수신이 안되는경우</strong> <br>프로그램상에서 처리해드릴 수 있는 부분이 없습니다. 호스팅회사나 서버관리자에게 메일발송테스트 한 결과를 설명하고 해결요청을 하시기 바랍니다.</li>
				<li>- <strong>호스팅회사나 서버관리자가 화이트도메인 등록이 필요하다고 요청한경우</strong><br>한국정보보호진흥원 KISA(http://www.kisarbl.or.kr) 사이트에서 등록합니다. 등록후 SPF Record 레코드값을 호스팅 화사나 서버관리자에게 전달하고 적용을 요청합니다.</li>
			</ul>
		</div>
		<form id="form1" action="./mailer_proc.do" method="post">
			<input type="hidden" name="subject" value="메일테스트" />
			<input type="hidden" name="body" value="이 내용이 제대로 보이면 이메일이 수신된것 입니다."  />
			<table class="table_style1">
				<caption></caption>
				<colgroup>
					<col width="20%">
					<col width="">
				</colgroup>
				
				<tbody>
					<tr>
						<th>받을 메일 주소</th>
						<td class="left">
							<input name="emails" class="w80 mr5" value="" maxlength="" type="text" style="width:500px;"><!-- <br>메일을 ,로 구분해서 여러개 입력 (aaa@hanmail.net,bbb@naver.com) -->
							<%-- <input type="text" name="boardAdmin" class="w80 mr5" value="${vo.boardAdmin }" /> --%>
							<script>
								$(function() {
									$('input[name=emails]').selectize({
										persist: false
										, create: false
										, allowEmptyOption: false
										, valueField: 'userID'
										, labelField: 'userName'
										, searchField: 'userName'
										, options : JSON.parse('${listMember}') || JSON.parse('[]')
									});
								});
							</script>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="page_bbt">
				<input type="button" value="이메일발송" class="bt_bsubmit" onclick="javascript:doSubmit()">
			</div>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>		
<script type="text/javascript">
	function doSubmit() {
		if (isNull($('input[name=emails]').val())) {
			alert('전자 메일을 입력해야합니다!');
			return;
		}
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>