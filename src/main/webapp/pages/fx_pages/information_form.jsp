<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<<style>
<!--

#register_form {
    background: #fff;
    padding: 40px;
    margin-bottom: 20px;
}
li{
margin-top:20px;
}
ul{
    padding: 20px;
    border: 1px solid #d5d5d5;
    margin-bottom: 30px;
}
input {
    background: #f8f8f8;
}
h4{
padding-top:20px;
}
.frm_input {
    border: 1px solid #ccc;
    height: 34px;
}
.frm_label {
    display: inline-block;
    width: 130px;
}
.half_input {
    width: 49.5%;
}
.frm_info {
    display: block;
    color: #d92121;
    font-size: 0.92em;
    margin-bottom:20px;
}
button.btn_frmline {                                              
    padding: 0 5px;
    height: 34px;
    background: #1b1b1b;
    color: #fff;
    text-decoration: none;
    vertical-align: top;
}
#msg_certify {
    margin: 5px 0 0;
    padding: 5px;
    border: 1px solid #dbecff;
    background: #eaf4ff;
    text-align: center;
}
.bank{
padding: 5px 0;
}
.brick{
padding-top:50px;}
#captcha_img {
    height: 40px;
    border: 1px solid #898989;
    vertical-align: top;
}
#captcha_key {
    margin: 0 0 0 3px;
    padding: 0 5px;
    width: 90px;
    height: 40px;
    border: 1px solid #ccc;
    background: #fff;
    font-size: 1.333em;
    font-weight: bold;
    text-align: center;
    border-radius: 3px;
    vertical-align: top;
}
#captcha_mp3 {
    width: 40px;
    height: 40px;
    border-radius: 3px;
}
.btn_confirm{
    text-align: center;
    padding:40px;
}
-->
</style>
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
                    <h2 class="table-title">회원 정보 수정</h2>
               </div>
          </div>
          </div>
          <div id="register_form">
          <h4 >사이트 이용정보 입력</h4>  
               <ul class="table">
                <li>
                    <input type="text" name="mb_id" value="" id="reg_mb_id" class="frm_input half_input" minlength="5" maxlength="20" placeholder="아이디">
                    <span id="msg_mb_id"></span><br>
                    <span class="frm_info">영문자, 숫자, _ 만 입력 가능. 최소 5자이상 입력하세요.</span>
                </li>
                <li>
                    <input type="password" name="mb_password" id="reg_mb_password" class="frm_input half_input
                    " minlength="8" maxlength="20" placeholder="비밀번호">
                    <label for="reg_mb_password_re" class="sound_only"></label>
                    <input type="password" name="mb_password_re" id="reg_mb_password_re" class="frm_input half_input right_input
                    " minlength="8" maxlength="20" placeholder="비밀번호 확인"><br>
                    <span class="frm_info primary">최소 8자이상 입력하세요.</span>
                </li>
                </ul>
                
          <h4>개인정보 입력</h4>  
    
               <ul class="table">
                <li>
                   <input type="text" id="reg_mb_name" name="mb_name" value="이연아" class="frm_input half_input
                   " size="10" placeholder="이름">
                   <button type="button" id="win_hp_cert" class="btn_frmline">휴대폰 본인확인</button>
                   <noscript>본인확인을 위해서는 자바스크립트 사용이 가능해야합니다.</noscript>
                    <div id="msg_certify">
                      <strong>휴대폰 본인확인</strong>및          
                      <strong>성인인증</strong>완료
                    </div>
                   <span class="frm_info">아이핀 본인확인 후에는 이름이 자동 입력되고 휴대폰 본인확인 후에는 이름과 휴대폰번호가 자동 입력되어 수동으로 입력할수 없게 됩니다.</span>
                </li>
                <li>
                    <input type="hidden" name="mb_nick_default" value="이연아">
                    <input type="text" name="mb_nick" value="이연아" id="reg_mb_nick" required="" class="frm_input required nospace  half_input" 
                    size="10" maxlength="20" placeholder="닉네임">
                    <span id="msg_mb_nick"></span>
                    <span class="frm_info">
                                      공백없이 한글,영문,숫자만 입력 가능 (한글2자, 영문4자 이상) 닉네임을 바꾸시면 앞으로 60일 이내에는 변경 할 수 없습니다.
                    </span>
                </li>
                <li>
                    <select name="mb_2" class="bank" >
                        <option value="카카오뱅크">카카오뱅크</option>                    
                    </select>
                    <input type="text" id="req_mb_3" name="mb_3" value="3333043354061" class="frm_input half_input
                    " size="10" placeholder="계좌번호">
                 </li>
                 <li>
                    <input type="text" name="mb_email" value="shalom1533@naver.com" id="reg_mb_email" required="" class="frm_input email full_input required" 
                    size="70" maxlength="100" placeholder="E-mail" style="width:99%">
                 </li>
                 <li>
                    <input type="text" name="mb_tel" value="010-4823-8923" id="reg_mb_tel" class="frm_input half_input
                    " maxlength="20" placeholder="전화번호">
                    <input type="text" name="mb_hp" value="010-4823-8923" id="reg_mb_hp" required="" class="frm_input right_input
                    half_input required" maxlength="20" placeholder="휴대폰번호">
                 </li>
                 <li>
                    <input type="text" name="mb_zip" value="" id="reg_mb_zip" class="frm_input
                    " size="5" maxlength="6" placeholder="우편번호">
                    <button type="button" class="btn_frmline" >주소 검색</button>
                 </li>
                 <li>
                    <input type="text" name="mb_addr1" value="" id="reg_mb_addr1" class="frm_input frm_address full_input" size="50" placeholder="기본주소" 
                    style="width:99%">
                 </li>
                 <li>
                    <input type="text" name="mb_addr2" value="" id="reg_mb_addr2" class="frm_input frm_address full_input" size="50" placeholder="상세주소" 
                    style="width:99%">
                 </li>
                 <li>
                <input type="text" name="mb_addr3" value="" id="reg_mb_addr3" class="frm_input frm_address full_input" size="50" placeholder="참고항목" 
                 style="width:99%">
                </li>
                </ul>
                 <h4>추천인 정보 입력</h4>  
               <ul class="table">
                <li>
                    <input type="text" name="shop_name" id="reg_shop_name" class="frm_input" placeholder="추천인" value="강남점">
                </li>
                </ul>
               <h4><span class="brick" ></span>기타 설정</h4>  
                 <ul class="table">
                 <li>
                    <label for="reg_mb_icon" class="frm_label">회원아이콘</label>
                    <input type="file" name="mb_icon" id="reg_mb_icon">
                    <span class="frm_info">
                                          이미지 크기는 가로
                        22픽셀, 세로
                        22픽셀 이하로 해주세요.<br>
                        gif, jpg, png파일만 가능하며 용량
                        5,000바이트 이하만 등록됩니다.
                    </span>  
                </li>
                <li class="reg_mb_img_file">
                    <label for="reg_mb_img" class="frm_label">회원이미지</label>
                    <input type="file" name="mb_img" id="reg_mb_img">
                    <span class="frm_info">
                                          이미지 크기는 가로
                        60픽셀, 세로
                        60픽셀 이하로 해주세요.<br>
                        gif, jpg, png파일만 가능하며 용량
                        50,000바이트 이하만 등록됩니다.
                    </span>
                </li>   
                <li>
                	<label for="personal_information">메일링서비스
                         <input type="checkbox" id="personal_information">
                         <span>정보 메일을 받겠습니다.</span>
                    </label>
                </li>   
                <li>
                <label for="personal_information">SMS 수신여부
                       <input type="checkbox" id="personal_information">
                       <span> 휴대폰 문자메세지를 받겠습니다.</span>
                 </label>
                </li> 
                <li>
                    <label for="personal_information">정보공개
                       <input type="checkbox" id="personal_information">
                       <span> 다른분들이 나의 정보를 볼 수 있도록 합니다.</span>
                 </label>
                </li>
                <span class="frm_info">
                                    정보공개를 바꾸시면 앞으로
                        0일 이내에는 변경이 안됩니다.
                    </span>
                 <li class="is_captcha_use">
                                   자동등록방지
               <fieldset id="captcha" class="captcha">
              <input type="text" name="captcha_key" id="captcha_key" required="" class="captcha_box required" size="6" maxlength="6">
              <button type="button" id="captcha_mp3"><i class="fas fa-volume-up"></i></button>
              <button type="button" id="captcha_mp3"><i class="fas fa-sync-alt"></i></button><br>
              <span id="captcha_info">자동등록방지 숫자를 순서대로 입력하세요.</span>
                </fieldset>           
            </ul>
                   </div>
    <div class="btn_confirm" >
        <a class="btn gray btn-lg" type="submit" value="취소" id="btn_cancel" style="background: #969696; color:white">취소</a>
        <a class="btn blue btn-lg" type="submit" value="정보수정" id="btn_submit" style="background: #06235a;">정보수정</a>
          
    </div>
</div>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
