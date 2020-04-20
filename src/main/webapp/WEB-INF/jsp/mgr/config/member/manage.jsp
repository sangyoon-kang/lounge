<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>
<style>
	.txt_black{
	    color: #333;
	    font-size: 14px;
    }
    .table-top{
    	border-top: 2px solid #333333 !important;
    }
    .table-top td textarea.style_textarea {
    height: 60px;
	}
	
	.table-top td textarea {
	    width: 100%;
	    height: 250px;
	    resize: none;
	    font-size: 13px;
	    color: #444;
	    padding: 10px 6px 10px 10px;
	    border: 1px solid #c1c1c1;
	}
	.btn-h{
	    height: 36px;
	}
	.disablecls{
	    pointer-events: none;
    	opacity: 0.5;
	}
</style>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>회원관리홈 </h2>
			<p>홈 &gt; 환경설정 &gt; 회원관리</p>
		</div>
		
		<div class="scon">
			
			<div class="check_conbox mt15 mb15">
				<h4 class="check_tit">체크사항 
					<span class="txt_red">(생성코드 삽입만으로 회원관련 모든 페이지를 완성할 수 있습니다. )</span>
				</h4>
				<ul class="ml10">
					<li>- 스킨위치 : /admin/member/skin.</li>
					<li>- 회원가입항목은 기본항목선택, 임의추가도 가능합니다.</li>
					<li>- 아이디/비번찾기 : 아이디, 비밀번호 찾기가 한페이지에 보여집니다.</li>
					<li>- 아이디찾기 : 아이디찾기만 페이지에 보여집니다. / 비밀번호찾기 : 비밀번호찾기만 페이지에 보여집니다.  </li>
				</ul>
			</div>
			<form id="form1" action="./member_conf_proc" method="post">
				<input type="hidden" name="juminFlag" value="${vo.juminFlag }" />
				<input type="hidden" name="addrFlag" value="${vo.addrFlag }" />
				<input type="hidden" name="phoneFlag"  value="${vo.phoneFlag }" />
				<input type="hidden" name="mobileTelFlag"  value="${vo.mobileTelFlag }" />
				<input type="hidden" name="comPhoneFlag"  value="${vo.comPhoneFlag }" />
				<input type="hidden" name="faxFlag"  value="${vo.faxFlag }" />
				<input type="hidden" name="recommendFlag"  value="${vo.recommendFlag }" />
				<input type="hidden" name="emailReceiveFlag"  value="${vo.emailReceiveFlag }" />
				<input type="hidden" name="sMSReceiveFlag"  value="${vo.sMSReceiveFlag }" />
				<input type="hidden" name="nickNameFlag"  value="${vo.nickNameFlag }" />
				<input type="hidden" name="iconFlag"  value="${vo.iconFlag }" />
				<input type="hidden" name="photoFlag"  value="${vo.photoFlag }" />
				<input type="hidden" name="homepageFlag"  value="${vo.homepageFlag }" />
				<input type="hidden" name="birthdayFlag"  value="${vo.birthdayFlag }" />
				<input type="hidden" name="jobFlag"  value="${vo.jobFlag }" />
				<input type="hidden" name="interestFlag"  value="${vo.interestFlag }" />
				<input type="hidden" name="hobbyFlag"  value="${vo.hobbyFlag }" />
				<input type="hidden" name="educationFlag"  value="${vo.educationFlag }" />
				<input type="hidden" name="selfIntroFlag"  value="${vo.selfIntroFlag }" />
				<input type="hidden" name="marriageFlag"  value="${vo.marriageFlag }" />
				<input type="hidden" name="marriageDateFlag"  value="${vo.marriageDateFlag }" />
				<input type="hidden" name="incomeFlag"  value="${vo.incomeFlag }" />
				<input type="hidden" name="carFlag"  value="${vo.carFlag }" />
				<input type="hidden" name="etc1Flag"  value="${vo.etc1Flag }" />
				<input type="hidden" name="etc2Flag"  value="${vo.etc2Flag }" />
				<input type="hidden" name="etc3Flag"  value="${vo.etc3Flag }" />
				<input type="hidden" name="etc4Flag"  value="${vo.etc4Flag }" />
				<input type="hidden" name="etc5Flag"  value="${vo.etc5Flag }" />
				<input type="hidden" name="officeNameFlag"  value="${vo.officeNameFlag }" />
				<input type="hidden" name="officeNumFlag"  value="${vo.officeNumFlag }" />
				<input type="hidden" name="officeOwnerNameFlag"  value="${vo.officeOwnerNameFlag }" />
				<input type="hidden" name="officeOwnerTelFlag"  value="${vo.officeOwnerTelFlag }" />
				<input type="hidden" name="officeStaffNameFlag"  value="${vo.officeStaffNameFlag }" />
				<input type="hidden" name="officeStaffTelFlag"  value="${vo.officeStaffTelFlag }" />
				<input type="hidden" name="officeObNumFlag"  value="${vo.officeObNumFlag }" />
				<input type="hidden" name="officeBTypeFlag"  value="${vo.officeBTypeFlag }" />
				<input type="hidden" name="officeBcTypeFlag"  value="${vo.officeBcTypeFlag }" />
				<input type="hidden" name="officeTaxMailFlag"  value="${vo.officeTaxMailFlag }" />
				<h3 class="scon_tit2">페이지 <span class="scon_stit txt_black">- 페이지URL</span></h3>
				<table id="tblLicense" class="board_write table-top table-top">
	                <colgroup>
	                    <col width="20%" />
	                    <col width="*" />
	                    <col width="15%" />
	                </colgroup>
	                <tbody>
	                    <tr id="trLicense">
	                        <th class="center">회원가입</th>
	                        <td class="left">
		                        <span class="txt_red" id="joinCode"  class="html">
									&lt;jsp:include page="/module/join" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#joinCode');" class="btn btn_round bg_gray">생성코드복사</a>
	                        </td>
	                    </tr>
	                    <tr>
	                		<th class="center">로그인페이지</th>
	                    	<td class="left">
		                    	<span class="txt_red" id="loginCode"  class="html">
									&lt;jsp:include page="/module/login" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#loginCode');" class="btn btn_round bg_gray">생성코드복사</a>
	                   		</td>
	                    </tr>
	                    <tr>
							<th class="center">아이디/비번 찾기</th>
							<td class="left">
								<span class="txt_red" id="findpwCode"  class="html">
									&lt;jsp:include page="/module/findidpw" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#findpwCode');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
						<tr>
							<th class="center">아이디찾기</th>
							<td class="left">
								<span class="txt_red" id="findidCode"  class="html">
									&lt;jsp:include page="/module/findid" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#findidCode');" class="btn btn_round bg_gray">생성코드복사</a>
						 	</td>
						</tr>
						<tr>
							<th class="center">비밀번호찾기</th>
							<td class="left">
								<span class="txt_red" id="findpassCode"  class="html">
									&lt;jsp:include page="/module/findpw" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#findpassCode');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
						<tr>
							<th class="center">회원정보수정</th>
							<td class="left">
								<span class="txt_red" id="memEditCode"  class="html">
									&lt;jsp:include page="/module/member_edit" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#memEditCode');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
						<tr>
							<th class="center">회원탈퇴</th>
							<td class="left">
								<span class="txt_red" id="withdrawalCode"  class="html">
									&lt;jsp:include page="/module/withdrawal" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#withdrawalCode');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
						<tr>
							<th class="center">로그인박스</th>
							<td class="left">
								<span class="txt_red" id="loginboxCode"  class="html">
									&lt;jsp:include page="/module/loginbox" flush="true" /&gt;
		                        </span> 
		                       <!--  <a href="" class="bt_copy">생성코드복사</a> -->
		                        <a onclick="javascript:copyClipboard('#loginboxCode');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
					</tbody>
				</table>
				<br class="clear mb5" />
				<br class="clear mb5" />
				<table class="board_write table-top table-top">
					<caption>페이지</caption>
					<colgroup>
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">회원가입 페이지</th>
							<td class="left">${HOST}<input name="memRegUrl" class="table_input1" value="${vo.memRegUrl }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">회원정보 페이지</th>
							<td class="left">${HOST}<input name="memInfoUrl" class="table_input1" value="${vo.memInfoUrl }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">로그인 페이지</th>
							<td class="left">${HOST}<input name="memLoginUrl" class="table_input1" value="${vo.memLoginUrl }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">아이디/비번 페이지</th>
							<td class="left">${HOST}<input name="memFindUrl" class="table_input1" value="${vo.memFindUrl }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">로그아웃 후 이동페이지</th>
							<td class="left">${HOST}<input name="memLogoutUrl" class="table_input1" value="${vo.memLogoutUrl }" maxlength="" type="text" style="width:400px;"><br>
								<span class="table_stxt txt_red">인트로페이지를 사용하는 경우 로그아웃하면 다시 인트로로 가는것을 막기위해 이동페이지 주소를 설정합니다.</span>
							</td>
						</tr>
						
					</tbody>
				</table>
				
				<br class="clear mb5" />
				
				<h3 class="scon_tit2">탑메뉴 <span class="scon_stit txt_black">- 이미지설정 (이미지를 설정하지 않으면 텍스트로 보여집니다.)</span></h3>
				<table class="board_write table-top">
					<caption>탑메뉴</caption>
					<colgroup>
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">로그인/로그아웃</th>
							<td class="left">
								<span class="txt_red" id="toplogin"  class="html">
									&lt;jsp:include page="/module/toplogin" flush="true" /&gt;
		                        </span> 
							 	<a onclick="javascript:copyClipboard('#toplogin');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
						<tr>
							<th class="center">회원가입/마이페이지</th>
							<td class="left">
								<span class="txt_red" id="topjoin"  class="html">
									&lt;jsp:include page="/module/topjoin" flush="true" /&gt;
		                        </span> 
							 	<a onclick="javascript:copyClipboard('#topjoin');" class="btn btn_round bg_gray">생성코드복사</a>
							</td>
						</tr>
					</tbody>
				</table>
				
				<br class="clear mb5" />
				<br class="clear mb5" />
				<table class="board_write table-top">
					<caption>이미지설정 </caption>
					<colgroup>
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">로그인 이미지</th>
							<td class="left">${HOST}<input name="memLoginImg" class="table_input1" value="${vo.memLoginImg }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">로그아웃 이미지</th>
							<td class="left">${HOST}<input name="memLogoutImg" class="table_input1" value="${vo.memLogoutImg }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">회원가입 이미지</th>
							<td class="left">${HOST}<input name="memRegImg" class="table_input1" value="${vo.memRegImg }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						<tr>
							<th class="center">마이페이지 이미지</th>
							<td class="left">${HOST}<input name="memMyPageImg" class="table_input1" value="${vo.memMyPageImg }" maxlength="" type="text" style="width:400px;"> </td>
						</tr>
						
					</tbody>
				</table>
				
				<br class="clear mb5" />
				
				<h3 class="scon_tit2">아이디/패스워드 찾기 <span class="scon_stit txt_black">- 입력정보 선택</span></h3>
				<table class="board_write table-top">
					<caption>아이디/패스워드 찾기</caption>
					<colgroup>
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">확인방법</th>
							<td class="left">
								<label><input ${vo.memMailYn eq 'Y' ? 'checked' : ''} type="radio" name="memMailYn" class="input_type_radio01" value="${vo.memMailYn}"> 이메일 발송</label>
								<script>
								$('input[name="memMailYn"]').on('change', function(a){(a.target.checked)? a.target.value = 'Y' : a.target.value = 'N'});
							</script>
							</td>
						</tr>
						<tr>
							<th class="center">스킨</th>
							<td class="left">
								<select name="memSkin">
									<option value="memberBasic">memberBasic</option>
								</select> 스킨위치 : /admin/member/skin 
							</td>
						</tr>
					</tbody>
				</table>
				
				<br class="clear mb5" />
				<br class="clear mb5" />
				
				<table class="board_write table-top">
					<caption></caption>
					<colgroup>
						<col width="20%">
						<col width="">
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">아이디</th>
							<td class="left"><input type="hidden" name="iDFlag" value="1">사용함</td>
							<th class="center">비밀번호</th>
							<td class="left"><input type="hidden" name="passwordFlag" value="1">사용함</td>
						</tr>
						<tr>
							<th class="center">이름</th>
							<td class="left"><input type="hidden" name="nameFlag" value="1">사용함</td>
							<th class="center">이메일</th>
							<td class="left"><input type="hidden" name="emailFlag" value="1">사용함</td>
						</tr>
						<tr>
							<th class="center">주민번호</th>
							<td class="left">
								<label><input type="checkbox" id="juminFlag" value="1" class="input_type_check"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="juminFlag" value="2"> 필수항목</label>
								
								
							</td>
							<th class="center">주소</th>
							<td class="left">
								<label><input type="checkbox" id="addrFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="addrFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">전화번호</th>
							<td class="left">
								<label><input type="checkbox" id="phoneFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="phoneFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">휴대폰</th>
							<td class="left">
								<label><input type="checkbox" id="mobileTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="mobileTelFlag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">회사전화</th>
							<td class="left">
								<label><input type="checkbox" class="input_type_check" id="comPhoneFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="comPhoneFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">추천인</th>
							<td class="left">
								<label><input type="checkbox" id="recommendFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="recommendFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">메일수신여부</th>
							<td class="left">
								<label><input type="checkbox" id="emailReceiveFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="emailReceiveFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">SMS 수신여부</th>
							<td class="left">
								<label><input type="checkbox" id="sMSReceiveFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="sMSReceiveFlag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">대리점코드</th>
							<td class="left">
								<label><input type="checkbox" class="input_type_check" id="nickNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="nickNameFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">회원아이콘</th>
							<td class="left">
								<label><input type="checkbox" id="iconFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="iconFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">스팸글체크</th>
							<td class="left">
								<label><input type="checkbox" id="faxFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="faxFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">회원사진</th>
							<td class="left">
								<label><input type="checkbox" id="photoFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="photoFlag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">홈페이지</th>
							<td class="left">
								<label><input type="checkbox" id="homepageFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="homepageFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">생년월일</th>
							<td class="left">
								<label><input type="checkbox" id="birthdayFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="birthdayFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">직업</th>
							<td class="left">
								<label><input type="checkbox" id="jobFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="jobFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">관심분야</th>
							<td class="left">
								<label><input type="checkbox" id="interestFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="interestFlag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">취미</th>
							<td class="left">
								<label><input type="checkbox" id="hobbyFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="hobbyFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">학력</th>
							<td class="left">
								<label><input type="checkbox" id="educationFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="educationFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">자기소개</th>
							<td class="left">
								<label><input type="checkbox" id="selfIntroFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="selfIntroFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">결혼여부</th>
							<td class="left">
								<label><input type="checkbox" id="marriageFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="marriageFlag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">결혼기념일</th>
							<td class="left">
								<label><input type="checkbox" id="marriageDateFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="marriageDateFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">월평균소득</th>
							<td class="left">
								<label><input type="checkbox" id="incomeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="incomeFlag" value="2"> 필수항목</label>
							</td>
						</tr>
						<tr>
							<th class="center">자동차소유</th>
							<td class="left">
								<label><input type="checkbox" id="carFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="carFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">추가항목01</th>
							<td class="left">
								<label><input type="checkbox" id="etc1Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="etc1Flag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">추가항목02</th>
							<td class="left">
								<label><input type="checkbox" id="etc2Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="etc2Flag" value="2"> 필수항목</label>
							</td>
							<th class="center">추가항목03</th>
							<td class="left">
								<label><input type="checkbox" id="etc3Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="etc3Flag" value="2"> 필수항목</label>
							</td>
						</tr>
	
						<tr>
							<th class="center">추가항목04</th>
							<td class="left">
								<label><input type="checkbox" id="etc4Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="etc4Flag" value="2"> 필수항목</label>
							</td>
							<th class="center">추가항목05</th>
							<td class="left">
								<label><input type="checkbox" id="etc5Flag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="etc5Flag" value="2"> 필수항목</label>
							</td>
<!-- -------------------------------------------------------------------- -->	
						<tr>
							<th class="center">업점업체명</th>
							<td class="left">
								<label><input type="checkbox" id="officeNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeNameFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">사업자번호 </th>
							<td class="left">
								<label><input type="checkbox" id="officeNumFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeNumFlag" value="2"> 필수항목</label>
							</td>
												
						</tr>
						<tr>
							<th class="center">대표자명</th>
							<td class="left">
								<label><input type="checkbox" id="officeOwnerNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeOwnerNameFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">대표자연락처</th>
							<td class="left">
								<label><input type="checkbox" id="officeOwnerTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeOwnerTelFlag" value="2"> 필수항목</label>
							</td>
												
						</tr>
						<tr>
							<th class="center">담당자 이름</th>
							<td class="left">
								<label><input type="checkbox" id="officeStaffNameFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeStaffNameFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">담당자 연락처</th>
							<td class="left">
								<label><input type="checkbox" id="officeStaffTelFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeStaffTelFlag" value="2"> 필수항목</label>
							</td>
												
						</tr>
						<tr>
							<th class="center">통신판매번호</th>
							<td class="left">
								<label><input type="checkbox" id="officeObNumFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeObNumFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">업태</th>
							<td class="left">
								<label><input type="checkbox" id="officeBTypeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeBTypeFlag" value="2"> 필수항목</label>
							</td>
												
						</tr>
						<tr>
							<th class="center">업종</th>
							<td class="left">
								<label><input type="checkbox" id="officeBcTypeFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeBcTypeFlag" value="2"> 필수항목</label>
							</td>
							<th class="center">계산서 이메일 </th>
							<td class="left">
								<label><input type="checkbox" id="officeTaxMailFlag" value="1"> 사용함&nbsp;&nbsp;&nbsp;&nbsp;</label>
								<label><input type="checkbox" id="officeTaxMailFlag" value="2"> 필수항목</label>
							</td>
												
						</tr>
					</tbody>
				</table>
				
				<br class="clear mb5" />
				
				<input name="etc1Desc" value="${vo.etc1Desc}" type="hidden">
				<input name="etc2Desc" value="${vo.etc2Desc}" type="hidden">
				<input name="etc3Desc" value="${vo.etc3Desc}" type="hidden">
				<input name="etc4Desc" value="${vo.etc4Desc}" type="hidden">
				<input name="etc5Desc" value="${vo.etc5Desc}" type="hidden">
				<h3 class="scon_tit2"><span class="scon_stit txt_black">- 추가항목명</span></h3>
				<table class="board_write table-top">
					<caption>게시판리스트</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="15%">
						<col width="15%">
						<col width="15">
						<col width="*">
					</colgroup>
					<thead>
					<tr>
						<th>&nbsp;</th>
						<th>항목명</th>
						<th>항목속성</th>
						<th>항목사이즈</th>
						<th>세부항목개수</th>
						<th>세부항목</th>
					</tr>
					</thead>
					<tbody>
	
						<tr>
							<td class="first first_back">추가항목01</td>
							<td><input name="etc1Name" class="table_input1" value="${vo.etc1Name }" maxlength="" type="text" style="width:200px;" /></td>
							<td>
								<select name="etc1Type" class="etcType">
								<c:forEach var="type" items="${addItems}" varStatus="s">
								   <option value="${type.key}" ${type.key eq vo.etc1Type ? 'selected' : ''}>${type.value}</option>
								</c:forEach>
								</select>
							</td>
							<td><input name="etc1Size" class="table_input1 ${(vo.etc1Type eq 'text' or vo.etc1Type eq 'textarea') ? '' : 'disablecls'}" value="${vo.etc1Size }" type="number" style="width:200px;" /></td>
							<td>
								<select name="etc1Count" class="etcCount mr10 ${(vo.etc1Type eq 'checkbox' or vo.etc1Type eq 'radio' or vo.etc1Type eq 'select') ? '' : 'disablecls'}">
									<c:forEach var="i" begin="1" end="20" varStatus="s">
										<option value="${i }" ${vo.etc1Count == i ? 'selected' : ''}>${i }</option>
									</c:forEach>							
								</select>
							</td>
							
							<td id="etcDesc1">
								<c:forTokens items="${vo.etc1Desc }" delims="," var="desc" varStatus="s" begin = "0">
							   		<input type="text" class="w20 table_input1" value="${fn:trim(desc)}" />
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td class="first first_back">추가항목02</td>
							<td><input name="etc2Name" class="table_input1" value="${vo.etc2Name }" maxlength="" type="text" style="width:200px;"></td>
							<td>
								<select name="etc2Type" class="etcType">
									<c:forEach var="type" items="${addItems}">
									   <option value="${type.key}" ${type.key eq vo.etc2Type ? 'selected' : ''}>${type.value}</option>
									</c:forEach>
								</select>
							</td>
							<td><input name="etc2Size" class="table_input1 ${(vo.etc2Type eq 'text' or vo.etc2Type eq 'textarea') ? '' : 'disablecls'}" value="${vo.etc2Size }" maxlength="" type="number" style="width:200px;" /></td>
							<td>
								<select name="etc2Count" class="etcCount mr10 ${(vo.etc2Type eq 'checkbox' or vo.etc2Type eq 'radio' or vo.etc2Type eq 'select') ? '' : 'disablecls'}">
									<c:forEach var="i" begin="1" end="20" varStatus="s">
										<option value="${i }" ${vo.etc2Count == i ? 'selected' : ''}>${i }</option>
									</c:forEach>							
								</select>
							</td>
							<td id="etcDesc2">
								<c:forTokens items="${vo.etc2Desc }" delims="," var="desc" varStatus="s" begin = "0">
							   		<input type="text" class="w20 table_input1" value="${fn:trim(desc)}" />
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td class="first first_back">추가항목03</td>
							<td><input name="etc3Name" class="table_input1" value="${vo.etc3Name }" maxlength="" type="text" style="width:200px;"></td>
							<td>
								<select name="etc3Type" class="etcType">
									<c:forEach var="type" items="${addItems}">
									   <option value="${type.key}" ${type.key eq vo.etc3Type ? 'selected' : ''}>${type.value}</option>
									</c:forEach>
								</select>
							</td>
							<td><input name="etc3Size" class="table_input1 ${(vo.etc3Type eq 'text' or vo.etc3Type eq 'textarea') ? '' : 'disablecls'}" value="${vo.etc3Size }" maxlength="" type="number" style="width:200px;"></td>
							<td>
								<select name="etc3Count" class="etcCount mr10 ${(vo.etc3Type eq 'checkbox' or vo.etc3Type eq 'radio' or vo.etc3Type eq 'select') ? '' : 'disablecls'}">
									<c:forEach var="i" begin="1" end="20" varStatus="s">
										<option value="${i }" ${vo.etc3Count == i ? 'selected' : ''}>${i }</option>
									</c:forEach>							
								</select>
							</td>
							<td id="etcDesc3">
								<c:forTokens items="${vo.etc3Desc }" delims="," var="desc" varStatus="s" begin = "0">
							   		<input type="text" class="w20 table_input1" value="${fn:trim(desc)}" />
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td class="first first_back">추가항목04</td>
							<td><input name="etc4Name" class="table_input1" value="${vo.etc4Name }" maxlength="" type="text" style="width:200px;"></td>
							<td>
								<select name="etc4Type" class="etcType">
									<c:forEach var="type" items="${addItems}">
									   <option value="${type.key}" ${type.key eq vo.etc4Type ? 'selected' : ''}>${type.value}</option>
									</c:forEach>
								</select>
							</td>
							<td><input name="etc4Size" class="table_input1 ${(vo.etc4Type eq 'text' or vo.etc4Type eq 'textarea') ? '' : 'disablecls'}" value="${vo.etc4Size }" maxlength="" type="number" style="width:200px;"></td>
							<td>
								<select name="etc4Count" class="etcCount mr10 ${(vo.etc4Type eq 'checkbox' or vo.etc4Type eq 'radio' or vo.etc4Type eq 'select') ? '' : 'disablecls'}">
									<c:forEach var="i" begin="1" end="20" varStatus="s">
									<option value="${i }" ${vo.etc4Count == i ? 'selected' : ''}>${i }</option>
									</c:forEach>							
								</select>
							</td>
							<td id="etcDesc4">
								<c:forTokens items="${vo.etc4Desc }" delims="," var="desc" varStatus="s" begin = "0">
							   		<input type="text" class="w20 table_input1" value="${fn:trim(desc)}" />
								</c:forTokens>
							</td>
						</tr>
						<tr>
							<td class="first first_back">추가항목05</td>
							<td><input name="etc5Name" class="table_input1" value="${vo.etc5Name }" maxlength="" type="text" style="width:200px;"></td>
							<td>
								<select name="etc5Type" class="etcType">
									<c:forEach var="type" items="${addItems}">
									   <option value="${type.key}" ${type.key eq vo.etc5Type ? 'selected' : ''}>${type.value}</option>
									</c:forEach>
								</select>
							</td>
							<td><input name="etc5Size" class="table_input1 ${(vo.etc5Type eq 'text' or vo.etc5Type eq 'textarea') ? '' : 'disablecls'}" value="${vo.etc5Size }" maxlength="" type="number" style="width:200px;"></td>
							<td>
								<select name="etc5Count" class="etcCount mr10 ${(vo.etc5Type eq 'checkbox' or vo.etc5Type eq 'radio' or vo.etc5Type eq 'select') ? '' : 'disablecls'}">
									<c:forEach var="i" begin="1" end="20" varStatus="s">
										<option value="${i }" ${vo.etc5Count == i ? 'selected' : ''}>${i }</option>
									</c:forEach>							
								</select>
							</td>
							<td id="etcDesc5">
								<c:forTokens items="${vo.etc5Desc }" delims="," var="desc" varStatus="s" begin = "0">
							   		<input type="text" class="w20 table_input1" value="${fn:trim(desc)}" />
								</c:forTokens>
							</td>
						</tr>
			
					</tbody>
				</table>
				
				<br class="clear mb5" />
				
				<h3 class="scon_tit2"><span class="scon_stit txt_black">- 기타</span></h3>
				<table class="board_write table-top">
					<caption>기타</caption>
					<colgroup>
						<col width="20%">
						<col width="">
					</colgroup>
					
					<tbody>
						<tr>
							<th class="center">직업</th>
							<td class="left"><textarea rows="" cols="" class="style_textarea" name="jobType">${vo.jobType }</textarea></td>
						</tr>
						<tr>
							<th class="center">학력</th>
							<td class="left"><textarea rows="" cols="" class="style_textarea" name="educationType">${vo.educationType }</textarea></td>
						</tr>
						<tr>
							<th class="center">월평균소득</th>
							<td class="left"><textarea rows="5" cols="" class="style_textarea" name="incomeType">${vo.incomeType }</textarea></td>
						</tr>
						<tr>
							<th class="center">관심분야</th>
							<td class="left"><textarea rows="" cols="" class="style_textarea" name="interestType">${vo.interestType }</textarea></td>
						</tr>
					</tbody>
				</table>
				
				<div class="page_bbt">
					<input type="button" onclick="javascript:doSubmit();" value="확인" class="bt_bsubmit btn-h"> 
					<input type="button" onclick="javascript:$.Nav('self', null, null, true);" value="취소" class="bt_bcancle btn-h">
				</div>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->
	<script type="text/javascript">
		function doSubmit() {
			if (!confirm('저장하시겠습니까?'))
				return;
			
			var desc = '';
			for(let i =1; i<= 5;i++){
				desc = '';
				$('#etcDesc'+ i +'').children().each(function(){
					desc += $(this).val() + ",";
				});
				if(desc.lastIndexOf(',') > -1)
					desc = desc.substring(0, desc.length-1);
				$('input[name=etc'+i+'Desc]').val(desc);
			}
			
			$('#form1').submit();
		}
		$(document).ready(function(){
			$('input[type="checkbox"]').each(function(){
				$(this).prop('checked', ($("input[name="+$(this).prop('id')+"]").val() === $(this).val()) ? true : false);
				if($("input[name="+$(this).prop('id')+"]").val() === '2')
					$(this).prop('checked', true);
			});
		});
		$('input[type="checkbox"]').on('change', function(e){ 
			//$(this).siblings().prop('checked', false);
			$('input[name='+ e.target.id +']').val((e.target.checked) ? e.target.value : 0);
			if($(this).parent().siblings().children(':checked').length == 1 && e.target.checked){
				$('input[name='+ e.target.id +']').val(2);
			}else if($(this).parent().siblings().children(':checked').length == 1 && !e.target.checked){
				$('input[name='+ e.target.id +']').val($(this).parent().siblings().children(':checked').val());
			}
		});
		
		$('.etcType').on('change', function(e){ 
			if($(this).val().indexOf('text') == -1 && $(this).val().indexOf('textarea') == -1)
				$(this).parent().next().children().val(0);
			
			$(this).parent().next().children().toggleClass('disablecls', (($(this).val().indexOf('text') > -1  || $(this).val().indexOf('textarea') > -1 ? false : true)));
			if($(this).val().indexOf('checkbox') == -1 && $(this).val().indexOf('select') == -1  && $(this).val().indexOf('radio') == -1){
				$(this).parent().next().next().children().val(1);
			}
				
			
			$(this).parent().next().next().children().toggleClass('disablecls', (($(this).val().indexOf('checkbox') > -1  || $(this).val().indexOf('select') > -1  || $(this).val().indexOf('radio') > -1) ? false : true));
			$(this).parent().next().next().next().children().toggleClass('disablecls', (($(this).val().indexOf('checkbox') > -1  || $(this).val().indexOf('select') > -1  || $(this).val().indexOf('radio') > -1) ? false : true));
		});
		
		$('.etcCount').on('change', function(){
			let count = $(this).val();
			$(this).parent().next().html('');
			for(let i = 0; i < count; i++){
				$('<input/>').attr({ type: 'text', id: 'desc', name: 'test', class: 'etcDesc table_input1 w20'}).appendTo($(this).parent().next());
			}
		})
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>