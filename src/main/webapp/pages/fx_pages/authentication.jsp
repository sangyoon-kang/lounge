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
     <div class="text-center">
          <h2>회원가입을 위해서 휴대폰 본인확인이 필요합니다.</h2>
          <button type="button" class="btn btn-lg primary mt-4" name="button">휴대폰 본인확인</button>
     </div>
</div>

<script>
     feather.replace();

</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>