<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<article>
    <div class="container">
        <h2>회원가입</h2>
        <div class="contents">
           <div class="join_step">
                <div class="bg_line"></div>
                <div class="step_wrp">
                    <div class="step"><p class="num">01</p>
                        <p class="step_sb">본인인증</p></div>
                    <div class="step on"><p class="num"><span class="ico check"></span></p>
                        <p class="step_sb">정보입력</p></div>
                    <div class="step"><p class="num">03</p>
                        <p class="step_sb">가입완료</p></div>
                </ul>
            </div><!-- join_step -->
			<div class="mT20 join_frm">
               <ul>
               		<li><input type="text" placeholder="아이디를 입력하세요."></li>
                    <li><input type="text" placeholder="비밀번호를 입력하세요.">
                    	<p class="mT5 f13">8~16자리 영문, 숫자, 특수문자 조합</p></li>
                    <li class="mT10"><input type="text" style="width:100%" placeholder="비밀번호를 다시 입력하세요."></li>
                    <li><input type="text" placeholder="이름을 입력하세요."></li>
                    <li><input type="text" placeholder="연락처 예) 01022223333"></li>
                    <li><input type="text" placeholder="이메일을 입력하세요."></li>
               </ul>
               <div class="mT20">
                 	<input type="checkbox" name="agree1" id="agree1"><label for="agree1"><span class="ico"></span>회원가입 약관 전체 동의</label> <span class="f_red">(필수)</span>
               </div>
            </div><!-- join_from -->
            <div class="btn_wrp">
            	<span class="col-5 fleft"><a href="/m/member/join_com.asp" class="btn_b_cor">회원가입</a></span>
                <span class="col-5 fleft pdL2"><a href="" class="btn_b_black">취소</a></span>
            </div><!-- btn_wrp -->
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

