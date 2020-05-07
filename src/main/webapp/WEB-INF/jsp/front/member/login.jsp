<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp" %>
<nav id="wrap_lnb">
    <div>
        <a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home"/></a>
        <div class="lnb_select">
            <h3 class="lnb_select_tit first">로그인</h3>
            <%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp" %>
        </div>
    </div>
</nav>
<style>
    #naver_id_login img {
        display: none
    }
</style>
<div class="container main">
    <input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }"/>
    <input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }"/>

    <section class="wrap_scon">
        <div class="scon">
            <div class="section_login">
                <ul class="login_p01">
                    <li><input name="userId" type="text" placeholder="아이디"
                               onkeypress="if(event.keyCode==13)javascript:doLogin(event);"/></li>
                    <li><input type="password" id="user_pass" name="userPwd" placeholder="비밀번호"
                               onkeypress="if(event.keyCode==13)javascript:doLogin(event);" required/></li>
                    <li><a href="#" onClick="javascript:doLogin(event);">로그인</a></li>
                </ul>
                <ul class="login_p01_aside">
                    <li><a onclick="window.open('/mypage/id_search',
                               'login_popup.do', 'width=640,height=400,top=50, left=600,location=no,status=no,scrollbars=yes');">아이디
                        찾기</a></li>
                    <li><a onclick="window.open('/mypage/id_search',
                               'login_popup.do', 'width=640,height=400,top=50, left=600,location=no,status=no,scrollbars=yes');">비밀번호
                        찾기</a></li>
                    <li><a onClick="javascript:$.Nav('go', '/join');">회원가입</a></li>
                </ul>

                <ul class="login_p02">
                    <c:if test="${set.naverAPI eq '1'}">
                        <li id="naver_id_login">
                            <!-- <a href="#">네이버 아이디로 로그인</a> -->
                        </li>
                    </c:if>
                    <c:if test="${set.kakaoAPI eq '1'}">
                        <li onclick="loginKakaoApi()">
                            <!-- <a href="#">카카오 아이디로 로그인</a> -->
                        </li>
                    </c:if>
                    <c:if test="${set.googleAPI eq '1'}">
                        <!-- <li id="customBtn" onclick="javascript:void(0)"><a href="#">구글 아이디로 로그인</a></li> -->
                    </c:if>
                </ul>
            </div>
            <div>
    </section>

    <form id="secureForm" action="/request_secure_login.do" method="post" style="display:none;">
        <input type="hidden" name="secureId" id="secureId"/>
        <input type="hidden" name="securePwd" id="securePwd"/>
        <input type="hidden" name="redirectURL" value="${search.redirectURL}"/>
        <input type="hidden" name="stay" value="0"/>
    </form>
    <script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
    <script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
    <script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
    <script type="text/javascript" src="/common/js/rsa/rng.js"></script>
    <script>

        function doLogin(event) {
            event.preventDefault();


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
            } catch (err) {
                alert(err);
            }

            $('#secureForm').submit();
        }
    </script>
    <c:if test="${set.googleAPI eq '1'}">
    <!-- GOOGLE LOGIN API IMPLEMENT START -->
    <script src="https://apis.google.com/js/api:client.js"></script>
    <!-- <script type="text/javascript">
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
               $.Nav('go', '/request_sns_login/google', {access_token : id_token, returnUrl : $('input[name="returnUrl"]').val(), stay : $('input[name=stay]').val() });
              }, function(error) {
                console.log(JSON.stringify(error, undefined, 2));
              });
        }
        </script> -->
    <!-- GOOGLE LOGIN API IMPLEMENT END -->
    </c:if>
    <c:if test="${set.kakaoAPI eq '1'}">
    <!-- KAKAO LOGIN API IMPLEMENT START -->
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <!-- <script type='text/javascript'>
        //<![CDATA[
          // Set JavaScript Key of current app.
          Kakao.init('${set.kakaoKey}');
          function loginKakaoApi(){
            Kakao.Auth.login({
              success: function(authObj) {
                // If login succeeds, call API.
                $.Nav('go', '/request_sns_login/kakao', {access_token : authObj.access_token, returnUrl : $('input[name="returnUrl"]').val(), stay : $('input[name=stay]').val() });
              },
              fail: function(err) {
            	  alert(err.error_description);
                  //console.log(JSON.stringify(err));
              }
            })
          }
        </script> -->
    <!-- KAKAO LOGIN API IMPLEMENT END -->
    </c:if>
    <c:if test="${set.naverAPI eq '1'}">
    <!-- NAVER LOGIN API IMPLEMENT START -->
    <script type="text/javascript"
            src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js"
            charset="utf-8"></script>
    <!-- <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script> -->
    <!-- <script type="text/javascript">
          var naver_id_login = new naver_id_login("${set.naverKey}", document.location.origin + "/login");
          var state = naver_id_login.getUniqState();
          naver_id_login.setButton("green", 0,60);
          naver_id_login.setState(state);
          naver_id_login.init_naver_id_login();
        </script>
  <script type="text/javascript">
        if(naver_id_login.oauthParams.access_token){
            naver_id_login.get_naver_userprofile("naverSignInCallback()");
        }
        // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
        function naverSignInCallback() {
          $.Nav('go', '/request_sns_login/naver', {access_token: naver_id_login.oauthParams.access_token, returnUrl : $('input[name="returnUrl"]').val(), stay : $('input[name=stay]').val()});
        }
        $('#naver_id_login a').text('네이버 아이디로 로그인')
        </script> -->
    </c:if>
    <%@ include file="/WEB-INF/include/fx_include/front_footer.jsp" %>
