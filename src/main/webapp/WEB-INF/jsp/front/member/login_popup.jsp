<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous">

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<style>
#captcha_img {
	height: 40px;
	border: 1px solid #898989;
	vertical-align: top;
}

.btn_submit {
	background: #06235a;
	color: #fff;
	cursor: pointer;
	height: 40px;
	font-weight: bold;
	font-size: 1.083em;
	float: right;
	padding: 10px;
}

.win_title {
	font-size: 1.25em;
	height: 50px;
	line-height: 30px;
	padding: 10px 20px;
	background: #333;
	color: #fff;
}

.captcha_box {
	margin: 0 0 0 3px;
	padding: 0 5px;
	width: 90px;
	height: 40px;
	border: 1px solid #ccc;
}
</style>
<h1 class="win_title">회원정보 찾기</h1>


<section class="">
	
		
		
			<div class="scon" style="padding-top:0;">
				<form id="formOut" action="./search_proc.do" method="post">
						<input type="hidden" name="mseq" value="2">
						<input type="hidden" name="id" value="">
			            	<div class="section_login">
			            		<h6 class="text-center">회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br> 해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.</h6>
			            		<form id="formIdFind" method="post" action="./search_proc.do">
								<input type="hidden" name="status" value=pass />
			            		
			            		<ul class="login_p01">
			            			<li>
			            				<input  placeholder="이름를 입력하세요." required type="text" name="userName">
			            				<span id="outPassCheck"></span>
			            			</li>
			            			<li>
			            				<input  placeholder="이메일을 입력하세요." required  type="email" name="userEmail">
			            				<span id="outPassCheck"></span>
			            			</li>
			            			<li>
			            			<fieldset id="captcha" class="captcha">
										<a href="javascript:searchId();" type="submit" value="확인">아이디/비밀번호 찾기</a>
									</fieldset>
			            				
			            			</li>
			            		</ul>
			            		</form>
			                </div>
		           	 </form>
                     
			</div>
		
</section>
<script>
	feather.replace();
	$('#selectAll').click(function() {
		$('input:checkbox').not(this).prop('checked', this.checked);
	})
</script>
<script type="text/javascript">
	function searchId() {
		oFormObject = $('form');
		userName =$('input[name=userName]');
		userEmail = $('input[name=userEmail]');
		if (isNull(userName.val())) {
			alert('Please input username.');
			userName.focus();
			return;
		}
		if (isNull(userEmail.val())) {
			alert('Please input email.');
			userEmail.focus();
			return;
		}
		if (!confirm('이메일 발송하겠습니까?'))
			return;

		oFormObject.submit();
	}
</script>
