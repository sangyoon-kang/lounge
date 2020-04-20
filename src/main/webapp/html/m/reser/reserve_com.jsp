<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<article>
    <div class="container">
        <h2>실시간 예약</h2>
        <div class="contents">
			<div class="reser_com">
            	<div class="reser_com_top">예약이 완료 되었습니다.</div>
                <div class="re_time">
                    <ul class="">
                        <li><p class="sb">인       수</p>
                            <p class="ex bold f_red">2018년 08월 01일(수) 09시</p></li>
                        <li><p class="sb">반 납</p>
                            <p class="ex bold f_red">2018년 08월 01일(수) 09시</p></li>
                        <li><p class="sb">인수/반납</p>
                            <p class="ex bold">서울시 금천구 가산동 327-32번지</p></li>
                    </ul><!-- re_time -->
                </div>
            </div><!-- reser_com-->
            <div class="btn_wrp"><a href="" class="btn_b_black">확인</a></div>
            <div class="driver_info">
            	<div class="info_top">더욱 편리한 운전자 정보 사전등록 서비스</div>
                <div class="mT15 bold">
                	<input type="checkbox" name="ap" id="ap"><label for="ap"><span class="ico"></span>운전자 정보 사전등록 신청</label>
                </div>
                <div class="mT5">
                	<textarea style="width:100%; height:100px;">운전자 정보 사전등록에 관한 개인정보제공 동의
제2 운전자 면허정보 제공에 대한 책임도 표시되어 있어야 함.
등록된 운전자는 대여 당일 운전면허증을 확인 후 대여가 가능합니다.</textarea>
                </div>
            </div><!-- driver_info -->
            <script>
					function tabchk(num) {
						  if(num == "01"){
						  tab01.style.display="";tab02.style.display="none";
						  }
						
						  if(num == "02"){
						  tab01.style.display="none";tab02.style.display="";
						  }
					 }
			 </script>
			<div id="tab01" class="mT15" style="display:block;">
                <ul class="nor_tab">
                    <li class="on" style="width:50%;"><a href="javascript:tabchk(01)">제1 운전자 면허정보</a></li>
                    <li style="width:50%;"><a href="javascript:tabchk(02)">제2 운전자면허정보</a></li>
          		</ul>
                <ul class="driver_frm mT10">
                    <li><p class="sb">면허구분</p>
                        <p class="ex"><span><input type="radio" name="nat" id="nat1" checked=""><label for="nat1"><span class="ico"></span>국내</label></span>
               				<span class="mL20"><input type="radio" name="nat" id="nat2"><label for="nat2"><span class="ico"></span>국제</label></span></p></li>
                     <li><p class="sb">면허종류</p>
                        <p class="ex"><select><option>1종보통</option></select></p></li>
                     <li><p class="sb">면허증번호</p>
                        <p class="ex"><span class="fleft col-2 pdR5"><input type="text"></span>
                        		<span class="fleft col-2 pdR5"><input type="text"></span>
                            	<span class="fleft col-4"><input type="text"></span>
                           		<span class="fleft col-2 pdL5"><input type="text"></span></p></li>
                     <li><p class="sb">면허발급일</p>
                        <p class="ex"><input type="text"  placeholder="예)20170120"></p></li>
                     <li><p class="sb">법정생년월일</p>
                        <p class="ex"><input type="text"  placeholder="예)1980120 "></p></li>
                    <li><p class="sb">운전면허증</p>
                        <p class="ex"><input type="text" class="col-7"><span  class="col-3 pdL5"><span data_file="" class="input_file"><input data_file="" type="file">파일찾기</span></span></p>
                        </p>
             	</ul>
            </div><!-- tab01 -->
            <div id="tab02" class="mT5" style="display:none;">
                <ul class="nor_tab">
                    <li style="width:50%;"><a href="javascript:tabchk(01)">제1 운전자 면허정보</a></li>
                    <li class="on" style="width:50%;"><a href="javascript:tabchk(02)">제2 운전자면허정보</a></li>
          		</ul>
                <ul class="driver_frm mT5">
                    <li><p class="sb">면허구분</p>
                        <p class="ex"><span><input type="radio" name="nat" id="nat1" checked=""><label for="nat1"><span class="ico"></span>국내</label></span>
               				<span class="mL20"><input type="radio" name="nat" id="nat2"><label for="nat2"><span class="ico"></span>국제</label></span></p></li>
                     <li><p class="sb">면허종류</p>
                        <p class="ex"><select><option>1종보통</option></select></p></li>
                     <li><p class="sb">면허증번호</p>
                        <p class="ex"><span class="fleft col-2 pdR5"><input type="text"></span>
                        		<span class="fleft col-2 pdR5"><input type="text"></span>
                            	<span class="fleft col-4"><input type="text"></span>
                           		<span class="fleft col-2 pdL5"><input type="text"></span></p></li>
                     <li><p class="sb">면허발급일</p>
                        <p class="ex"><input type="text"  placeholder="예)20170120"></p></li>
                     <li><p class="sb">법정생년월일</p>
                        <p class="ex"><input type="text"  placeholder="예)1980120 "></p></li>
                    <li><p class="sb">운전면허증</p>
                        <p class="ex"><input type="text" class="col-7"><span  class="col-3 pdL5"><span data_file="" class="input_file"><input data_file="" type="file">파일찾기</span></span></p>
                        </p>
             	</ul>
            </div><!-- tab01 -->
            <div class="btn_wrp">
            	<a href="" class="btn_b_black">운전자 정보 저장</a>
            </div>
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

