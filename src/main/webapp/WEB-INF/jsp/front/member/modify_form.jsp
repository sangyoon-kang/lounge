<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<div class="container main">
	<input type="hidden" id="rsaPublicKeyModulus" value="${publicKeyModulus }" />
	<input type="hidden" id="rsaPublicKeyExponent" value="${publicKeyExponent }" />
     <div class="row">
          <div class="col-sm-12">
               <div class="border-bottom">
                    <h5 class="table-title">비밀번호 확인</h5>
               </div>
          </div>
          <div class="col-sm-5 mx-auto mt-4">
               <div class="border p-4" action="">
                    <h3 class="text-center mb-4">비밀번호 확인</h3>
                     <span>회원님의 정보 보호를 위해 비밀번호를 한번 더 입력해 주세요.</span>
                     <h4 class="text-center mb-4" style="margin-top:50px;">ksoyoung00</h4>

                   <fieldset class="form-group input-required">
                         <input type="password" class="form-control password" id="user_pass" name="userPwd" required placeholder="비밀번호">
                         <span class="show-pass"></span>
                    </fieldset>
                     <button type="submit" class="btn btn-lg primary w-100"  onClick="javascript:doLogin();" name="button">확인</button>
               </div>
          </div>
     </div>
</div>
<form id="secureForm" action="/request_login.do" method="post" style="display:none;">
    <input type="hidden" name="securePwd" id="securePwd" />
</form>
<script type="text/javascript" src="/common/js/rsa/jsbn.js"></script>
<script type="text/javascript" src="/common/js/rsa/rsa.js"></script>
<script type="text/javascript" src="/common/js/rsa/prng4.js"></script>
<script type="text/javascript" src="/common/js/rsa/rng.js"></script>
<script>
     feather.replace();
    function doLogin() {
   		console.log($('input[name=stay]').val());
   		
   		if (trim($('input[name=userPwd]').val()).length == 0) {
   			alert('비밀번호를 입력해 주세요.');
   			return;
   		}
   		
   		try {
   			var rsaPublicKeyModulus = $('#rsaPublicKeyModulus').val();
   			var rsaPublicKeyExponent = $('#rsaPublicKeyExponent').val();
   			var rsa = new RSAKey();
   			rsa.setPublic(rsaPublicKeyModulus, rsaPublicKeyExponent);
   			var securedPassword = rsa.encrypt($('input[name=userPwd]').val());
   	        $('#securePwd').val(securedPassword);
   	    } 
   	    catch(err) {
   	        alert(err);
   	    }
   		
   		$('#secureForm').submit();	
   	}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
