<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>
<%--
		Login Page
 --%>
<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/common/js/rsa/rng.js"></script>
<style type="text/css">
	.sns-gl{
		margin-top: 10px;
		text-align:center;
		float: none !important;
	}
</style>

<%-- 프론트 로그인 페이지  --%>
<div id="all_wrp">
		
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>
		
		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2><strong>로그인</strong></h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location"><img src="/images/ic_home.png" /> > 로그인</div>
			</div><!--  end title -->
			
			<div id="content">
				<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
				<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
				<div class="login_top">Member Login</div>
					<div class="login_box">
						<div class="check">
							<ul>
								<li>
									<p class="sb">아이디</p>
									<p>
										<input type="text" name="userId" class="input_txt" placeholder="아이디" value="">
									</p> 
								</li>
								<li class="mT10">
									<p class="sb">비밀번호</p>
									<p>
										<input type="password" name="userPwd" class="input_txt" placeholder="비밀번호" value="">
									</p>
								</li>
							</ul>
							<p class="btn">
								<a href="javascript:doLogin();">로그인</a>
							</p>						
						</div>
						<div class="save">
							<input type="checkbox" name="id_save" value="Y">아이디 저장
						</div>
						<div class="share-icon sns-gl">
							<c:if test="${set.facebookAPI eq '1'}"><img onclick="authFbLogin();" src="/images/share_login_facebook.png" class="" name="facebookKey" alt="facebook" ></c:if>
							<c:if test="${set.googleAPI eq '1'}"><img id="customBtn" onclick="javascript:void(0)" src="/images/login_google.png" class="" name="googleKey" alt="google"></c:if>
							<c:if test="${set.kakaoAPI eq '1'}"><img onclick="loginKakaoApi()" src="/images/login_kakao.png" class="" name="kakaoKey" alt="kakao"></c:if>
							<%-- <img onclick="authorizeNaver()" src="/images/share_naver.png" class="${set.naverAPI eq '1' ? '' : 'notuseshare'}" name="naverKey" alt="naver" > --%>
							<%-- <c:if test="${set.naverAPI eq '1'}"><span id="naverIdLogin"></span></c:if> --%>
							<c:if test="${set.naverAPI eq '1'}"><span id="naver_id_login"></span></c:if>
						</div>
					</div>
				<ul class="other_login">
					<li>
						<p class="id_ser bold">아이디/비밀번호 찾기</p>
						<p class="mT10">아이디, 혹은 비밀번호를 잊으셨습니까?</p>
						<p class="mT15">
							<a href="/member_find.jsp" class="btn_s_nor" style="background:#fff;">
								<span>아이디/비밀번호 찾기</span>
							</a>
						</p>
					</li>
					<li>
						<p class="mem bold">회원가입</p>
						<p class="mT10">아직 타고플러스의 회원이 아니십니까?</p>
						<p class="mT15">
							<a href="/member_join.jsp" class="btn_s_nor" style="background:#fff;">
								<span>회원가입 하기</span>
							</a>
						</p>
					</li>
				</ul>
				<form id="secureForm" action="/request_secure_login.do" method="post" style="display:none;">
					<input type="hidden" name="secureId" id="secureId" />
				    <input type="hidden" name="securePwd" id="securePwd" />
				</form>
				<script type="text/javascript">
				function doLogin() {
					console.log($('input[name=userId]').val());
					console.log(trim($('input[name=userId]').val()));
					if (trim($('input[name=userId]').val()).length == 0) {
						alert('아이디를 입력해 주세요.');
						return;
					}
					
					if (trim($('input[name=userPwd]').val()).length == 0) {
						alert('비밀번호를 입력해 주세요.');
						return;
					}
					
					try {
						var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
						var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
						var rsa = new RSAKey();
						rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
						var securedUsername = rsa.encrypt($('input[name=userId]').val());
						var securedPassword = rsa.encrypt($('input[name=userPwd]').val());
						$('#secureId').val(securedUsername);
				        $('#securePwd').val(securedPassword);
				    } 
				    catch(err) {
				        alert(err);
				    }
					
					$('#secureForm').submit();	
				}
				</script>
				<c:if test="${set.facebookAPI eq '1'}">
				<!-- FACEBOOK LOGIN API IMPLEMENT START -->
				<script>
				  // This is called with the results from from FB.getLoginStatus().
				  function statusChangeCallback(response) {
				    console.log('statusChangeCallback');
				    console.log(response);
				    // The response object is returned with a status field that lets the
				    // app know the current login status of the person.
				    // Full docs on the response object can be found in the documentation
				    // for FB.getLoginStatus().
				    if (response.status === 'connected') {
				      // Logged into your app and Facebook.
				    	//$.Nav('go', './request_sns_login', {access_token : response.authResponse.accessToken });
				    } else {
				      // The person is not logged into your app or we are unable to tell.
				      /* document.getElementById('status').innerHTML = 'Please log ' +
				        'into this app.'; */
				    }
				  }
				
				  // This function is called when someone finishes with the Login
				  // Button.  See the onlogin handler attached to it in the sample
				  // code below.
				  function checkLoginState() {
				    FB.getLoginStatus(function(response) {
				      statusChangeCallback(response);
				    });
				  }
				
				  window.fbAsyncInit = function() {
				    FB.init({
				      appId      : '${set.facebookKey}',
				      cookie     : true,  // enable cookies to allow the server to access 
				                          // the session
				      xfbml      : true,  // parse social plugins on this page
				      version    : 'v2.8' // use graph api version 2.8
				    });
				
				    // Now that we've initialized the JavaScript SDK, we call 
				    // FB.getLoginStatus().  This function gets the state of the
				    // person visiting this page and can return one of three states to
				    // the callback you provide.  They can be:
				    //
				    // 1. Logged into your app ('connected')
				    // 2. Logged into Facebook, but not your app ('not_authorized')
				    // 3. Not logged into Facebook and can't tell if they are logged into
				    //    your app or not.
				    //
				    // These three cases are handled in the callback function.
				
				    /* FB.getLoginStatus(function(response) {
				      statusChangeCallback(response);
				    }); */
				
				  };
				  
				  function authFbLogin() {
					  FB.login(function(response) {
					  	   if (response.status === 'connected') {
					  		 $.Nav('go', './fb/request_sns_login', {access_token : response.authResponse.accessToken });
						   } else {
						     console.log('User cancelled login or did not fully authorize.');
						   }
					  });
				  }
				
				  // Load the SDK asynchronously
				  (function(d, s, id) {
				    var js, fjs = d.getElementsByTagName(s)[0];
				    if (d.getElementById(id)) return;
				    js = d.createElement(s); js.id = id;
				    js.src = "https://connect.facebook.net/en_US/sdk.js";
				    fjs.parentNode.insertBefore(js, fjs);
				  }(document, 'script', 'facebook-jssdk'));
				</script>
				<!-- FACEBOOK LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.googleAPI eq '1'}">
				<!-- GOOGLE LOGIN API IMPLEMENT START -->
				<script src="https://apis.google.com/js/api:client.js"
				></script>
				<script type="text/javascript" >
				const googleUser = {};
				$( document ).ready(function() {
					gapi.load('auth2', function(){
					    // Retrieve the singleton for the GoogleAuth library and set up the client.
					    auth2 = gapi.auth2.init({
					      client_id: '${set.googleKey}',
					      cookiepolicy: 'single_host_origin',
					      // Request scopes in addition to 'profile' and 'email'
					      //scope: 'additional_scope'
					    });
					    attachSignin(document.getElementById('customBtn'));
					  });
				});
				  
				
				function attachSignin(element) {
				  auth2.attachClickHandler(element, {},
				      function(googleUser) {
				        	
					  	const id_token = googleUser.getAuthResponse().id_token;
					  	 $.Nav('go', './google/request_sns_login', {access_token : id_token });
				      }, function(error) {
				        console.log(JSON.stringify(error, undefined, 2));
				      });
				}
				</script>
				<!-- GOOGLE LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.kakaoAPI eq '1'}">
				<!-- KAKAO LOGIN API IMPLEMENT START -->
				<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
				<script type='text/javascript'>
				//<![CDATA[
				  // Set JavaScript Key of current app.
				  Kakao.init('${set.kakaoKey}');
				  function loginKakaoApi(){
					  Kakao.Auth.login({
					  	success: function(authObj) {
					      // If login succeeds, call API.
					      $.Nav('go', './kakao/request_sns_login', {access_token : authObj.access_token });
					      /* Kakao.API.request({
					        url: '/v2/user/me',
					        success: function(res) {
					        	 $.Nav('go', './kakao/request_sns_login', {user_id : res.id, user_name : res.properties.nickname });
					        },
					        fail: function(error) {
					       	  console.log(JSON.stringify(error));
					        }
					      }); */
					    },
					    fail: function(err) {
					      	console.log(JSON.stringify(err));
					    }
					  })
				  }
				</script>
				<!-- KAKAO LOGIN API IMPLEMENT END -->
				</c:if>
				<c:if test="${set.naverAPI eq '1'}">
				<!-- NAVER LOGIN API IMPLEMENT START -->
				<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
				<!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->
				<script type="text/javascript">
					var naver_id_login = new naver_id_login("${set.naverKey}", document.location.origin + "/login");
					var state = naver_id_login.getUniqState();
					naver_id_login.setButton("green", 1,20);
					naver_id_login.setState(state);
					naver_id_login.init_naver_id_login();
				</script>
				<script type="text/javascript">
				if(naver_id_login.oauthParams.access_token){
				  	naver_id_login.get_naver_userprofile("naverSignInCallback()");
				}
				// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
				function naverSignInCallback() {
				 	$.Nav('go', './naver/request_sns_login', {access_token: naver_id_login.oauthParams.access_token});
				}
				</script>
				<!-- NAVER LOGIN API IMPLEMENT END -->
				</c:if>
			</div><!-- content -->
		</div><!-- container -->
	</div><!-- wrapper -->
	
</div><!-- all_wrp -->	

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>