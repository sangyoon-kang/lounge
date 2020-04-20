<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<style>
#captcha_img {
    height: 40px;
    border: 1px solid #898989;
    vertical-align: top;
}
</style>
          <section class="bg-black-140 container py-2 small" >
		           <h4>회원정보 찾기</h4>
          </section>
 <div class="container">
           <div class="row">
          <div class="col-sm-12">
               <h6 class="table-title">회원가입 시 등록하신 이메일 주소를 입력해 주세요.<br>
                            해당 이메일로 아이디와 비밀번호 정보를 보내드립니다.
               </h6>
               <div class="form-group input-required">
                         <input type="email" class="form-control email" placeholder="E-mail 주소" required name="userEmail" value="">
               </div>
           </div>
             </div>
               <div class="row ">
                         
                         <div class="col-sm-3">
                              <input type="email" class="form-control email" placeholder="" required name="userEmail" value="">
                         </div> 
                         <div class="col-sm-1">
                              <button type="button" class="btn outline btn-lg" name="icon"  style="border-style:none;"><i class="fas fa-volume-up"></i></button>
                         </div>
                         <div class="col-sm-1">
                              <button type="button" class="btn outline btn-lg" name="icon"  style="border-style:none;"><i class="fas fa-sync-alt"></i></button>
                         </div>
                         <div class="col-sm-3" style="margin-left:80px;">
                              <button type="button" class="btn blue btn-lg" name="button" >확인</button>
                         </div>
                    </div>              
                         자동등록방지숫자를 순서대로 입력하세요.            
</div>
<script>
     feather.replace();
     $('#selectAll').click(function(){
           $('input:checkbox').not(this).prop('checked', this.checked);
     })
</script>
