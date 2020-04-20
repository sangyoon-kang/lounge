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
<div class="main container">
     <form action="/pages/fx_pages/authentication.jsp" id="register-agree" class="row my-6" onsubmit="return register-agree(this);" method="post">
          <div class="col-sm-12 ">
               <div class="border-bottom">
                    <h5 class="table-title">회원가입약관</h5>
               </div>
               <div class="border my-4 p-2 flex">
               회원가입약관 밎 개인정보처리방침안내의 내용에 동의하셔야 회원가입 하실 수 있습니다.
               <label for="selectAll" class="ml-auto">
                    <input type="checkbox" id="selectAll" name="" value="">
                    <span>전체선택</span>
               </label>
               </div>
          </div>
          <div class="col-sm-6">
               <h3 class="bl-4-red pl-2">회원가입약관</h3>
               <textarea class="bb-none" name="name" rows="12" readonly>

               </textarea>
               <div class="bg-light-grey border  p-2">
                    <label for="personal_information">
                         <input type="checkbox" id="personal_information">
                         <span>회원가입약관의 내용에 동의합니다.</span>
                    </label>
               </div>
          </div>
          <div class="col-sm-6">
               <h3 class="bl-4-red pl-2">서비스이용약관</h3>
               <textarea name="name" rows="12" class="bb-none" readonly>

               </textarea>
               <div class="bg-light-grey border  p-2">
                    <label for="usage">
                         <input type="checkbox" id="usage" name="" value="">
                         <span>서비스이용약관 내용에 동의합니다.</span>
                    </label>
               </div>
          </div>
          <div class="col-sm-12 mt-4">
               <h3 class="bl-4-red pl-2">개인정보처리방침안내</h3>
               <textarea name="name" class="bb-none" readonly>

               </textarea>
               <div class="bg-light-grey border  p-2">
                    <label for="condition">
                         <input type="checkbox" id="condition" name="" value="">
                         <span>개인정보처리방침안내의 내용에 동의합니다.</span>
                    </label>
               </div>
               <div class="text-center my-5">
                    <button type="submit" class="btn blue  btn-lg" name="button">회원가입</button>
               </div>
          </div>
     </form>





</div>
<script>
     feather.replace();
     $('#selectAll').click(function(){
           $('input:checkbox').not(this).prop('checked', this.checked);
     })
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
