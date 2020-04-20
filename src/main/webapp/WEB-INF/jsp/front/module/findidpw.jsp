<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		배너생성 - 임시	
 --%>
 
 <%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>
		<div id="container">
		
			<div id="title">
				<div class="fleft">
					<h2><strong>아이디/비밀번호 찾기</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 아이디/비밀번호 찾기</div>
			</div><!--  end title -->
			
			<div id="content">
				<div id="tab01" style="display: block;" class="mem_ser">
					<ul>
						<li>
							<a href="javascript:tabCheck(1);" class="on">아이디/비밀번호 찾기</a>
						</li>
						<li>
							<a href="javascript:tabCheck(2);" class="">패스워드 찾기</a>
						</li>
					</ul>
					<div class="ex">
						<p>아이디를 잊으셨나요?</p>
						<p>회원가입할 때 입력한 이름과 이메일을 입력해주시면 이메일로 아이디가 전송됩니다.</p>
					</div>
					<div class="inner2 mT20">
						<div class="fleft">
							<form id="formIdFind" method="post" action="/module/findid_proc.do">
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
				
				<div id="tab02" style="display:none;" class="mem_ser">
					<ul>
						<li>
							<a href="javascript:tabCheck(1);" class="">아이디 찾기</a>
						</li>
						<li>
							<a href="javascript:tabCheck(2);" class="on">패스워드 찾기</a>
						</li>
					</ul>
					<div class="ex">
						<p>비밀번호를 잊으셨나요?</p>
						<p>아이디, 이름, 이메일을 입력해주시면 이메일로 비밀번호가 전송됩니다.</p>
					</div>
					<div class="inner2 mT20">
						<div class="fleft">
							<form id="formPwdFind" method="post" action="/module/findid_proc.do">
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
				function tabCheck(check) {
					if (check == 1) {
						$('#tab01').css('display', 'block');
						$('#tab02').css('display', 'none');
					} else {
						$('#tab02').css('display', 'block');
						$('#tab01').css('display', 'none');
					}
						
				}
				
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
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
</div><!-- all_wrp -->	
	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>