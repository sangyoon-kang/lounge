<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<div class="sub-visual">
     <div class="container">
          <div class="row">
               <div class="col-sm-12">
                    <p>국내 FX렌트서비스의 차세대 업체</p>
                    <h1>${SITE_NAME_U}</h1>
               </div>
          </div>
     </div>
</div>
<div class="container main">
     <div class="row">
          <div class="col-sm-12">
               <div class="border-bottom">
                    <h5 class="table-title">로그인</h5>
               </div>
          </div>
          <div class="col-sm-5 mx-auto mt-4">
               <form class="border p-4" action="">
                    <h3 class="text-center mb-4">로그인</h3>
                    <div class="form-group input-required">
                         <input type="text" class="form-control" placeholder="아이디" required name="" value="">
                    </div>

                    <fieldset class="form-group input-required">
                         <input type="password" class="form-control password" id="user_pass" required placeholder="비밀번호">
                         <span class="show-pass"></span>
                    </fieldset>
                    <button type="submit" class="btn btn-lg primary w-100" name="button">로그인</button>
                    <div class="my-2">
                         <label for="auto-login">
                              <input type="checkbox" id="auto-login">
                              <span>자동로그인</span>
                         </label>
                    </div>
                    <div class="row">
                         <div class="col-sm-6">
                              <button type="button" class="btn outline w-100" name="button" onclick="window.open('/front/login/login_popup', 
                               'login_popup.do', 'width=450,height=640,top=50, left=600,location=no,status=no,scrollbars=yes');">아이디 비밀번호 찾기</button>
                         </div>
                         <div class="col-sm-6">
                              <button type="button" class="btn outline w-100" name="button">회원 가입</button>
                         </div>
                    </div>

               </form>
          </div>
     </div>
</div>
<script>
     feather.replace();

</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
