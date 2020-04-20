<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
<%@ include file="/WEB-INF/include/front_header_html.jsp"%>

<%-- 회원가입페이지 --%>

<div id="all_wrp">
	<div id="wrapper">
		<%@ include file="/WEB-INF/include/lnb/join.jsp"%>

		<div id="container">
			<div id="title">
				<div class="fleft">
					<h2>
						<strong>회원가입</strong>
					</h2>
					<div class="tit_ex">솔루션의 선두주자! 타고플러스</div>
				</div>
				<div class="fright location">
					<img src="/images/ic_home.png" /> > 마이페이지 > 회원가입
				</div>
			</div>
			<!--  end title -->

			<div id="content">
				<c:if test="${search.isAgreed eq false }">
					<jsp:include page="/module/agree" flush="true" />
				</c:if>
			 	<c:if test="${search.isAgreed eq true }">
				<div class="agree_top">
					<p class="mT7">
						<img src="/images/member_top_txt1.png" title="타고플러스에 오신것을 환영합니다.">
					</p>
					<p class="sub_top_ex">
						회원가입을 위해서는 이용약관, 개인정보취급방침에 동의하셔야 합니다.<br> (주)타고플러스 웹사이트의 회원으로
						가입하시면, 각종 정보를 보다 쉽게 만나실 수 있습니다.
					</p>
				</div>
				
				<form id="formJoin" action="/mypage/member_proc.do" method="post" enctype="multipart/form-data">
					<input type="hidden" name="mseq"
						value="${empty vo.memberSeq ? 0 : vo.memberSeq }">
					<div class="stit mT30">회원가입 정보</div>
					<table class="board_write">
						<colgroup>
							<col width="170px">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>개인/회사 <span class="red bold">*</span></th>
								<td><span><label><input type="radio"
											name="radPCType" value="P" onclick="doPCTypeCheck(this);"
											checked> 개인</label></span> <span class="mL20"><label><input
											type="radio" name="radPCType" value="C"
											onclick="doPCTypeCheck(this);"> 회사</label></span></td>
							</tr>
				<!------------------------>
							<tr>
								<th>아이디 <span class="red bold">*</span></th>
								<td><c:if test="${empty  vo.memberSeq}">
										<input type="text" class="input"
											style="width: 200px; ime-mode: inactive;" name="userId"
											maxlength="20" id="userId"
											onkeyup="this.value=this.value.replace(/[^0-9|a-zA-z]/g,'')">
										<span class="mL10" id="userIdCheck">사용할 아이디를 입력하세요.</span>
									</c:if> <c:if test="${!empty vo.memberSeq }">
										${vo.userId }
									</c:if></td>
							</tr>
							<c:if test="${empty  vo.memberSeq}">
								<tr>
									<th>비밀번호 <span class="red bold">*</span></th>
									<td><input type="password" class="input"
										style="width: 200px;" name="userPwd" maxlength="20"> <span
										class="mL10" id="userPwdCheck"> 비밀번호는 8~20자 이내의 영문 및
											숫자만 입력가능힙니다.</span></td>
								</tr>
								<tr>
									<th>비밀번호 확인 <span class="red bold">*</span></th>
									<td><input type="password" class="input"
										style="width: 200px;" name="userPwd2" maxlength="20">
										<span class="mL10" id="userPwdCheck2"> 비밀번호를 다시 입력하세요.</span>
									</td>
								</tr>
							</c:if>
							<tr>
								<th>이 름 <span class="red bold">*</span></th>
								<td><input type="text" class="input"
									style="width: 200px; ime-mode: active;" name="userName"
									maxlength="100" value="${vo.userName }" required>
								</td>
							</tr>
							<c:if test="${configVO.phoneFlag > 0 }"> 
							<tr>
							<c:set var="wphone" value="${fn:split(vo.phone, '-')}"/>
								<th>연락처${configVO.phoneFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
								<td><input type="text"  ${configVO.phoneFlag == 2 ? 'required' : ''}  class="inputPhone input onlyNumber "
									style="width: 40px;" name="phone1" maxlength="3" value="${wphone[0]} "> - <input
									type="text" class="inputPhone input onlyNumber" style="width: 50px;"
									name="phone2" maxlength="4" value="${wphone[1]}" > - <input type="text"
									class="inputPhone input onlyNumber" style="width: 50px;" name="phone3"
									maxlength="4"  value="${wphone[2]}" > <input type="hidden" name="phone">
								</td>
							</tr>
							</c:if>
							<c:if test="${configVO.mobileTelFlag > 0 }"> 
							<tr>
							
							<c:set var="wmobile" value="${fn:split(vo.mobile, '-')}"/>
								<th>휴대전화 ${configVO.mobileTelFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
								<td><input  ${configVO.mobileTelFlag == 2 ? 'required' : ''}  type="text" class="inputPhone input onlyNumber"
									style="width: 40px;" name="mobile1" maxlength="3"  value="${wmobile[0]}" > - <input
									type="text" class="inputPhone input onlyNumber" style="width: 50px;"
									name="mobile2" maxlength="4"  value="${wmobile[1]}" > - <input type="text"
									class="inputPhone input onlyNumber" style="width: 50px;" name="mobile3"
									maxlength="4"  value="${wmobile[2]}" > <input type="hidden" name="mobile">
								</td>
							</tr>
							</c:if>
							<c:if test="${configVO.emailFlag > 0 }"> 
							<tr>
								<th>이메일 ${configVO.emailFlag == 1 ? '<span class=\"red bold\">*</span>' : ''}</th>
								<td>
								<c:set var="wemail" value="${fn:split(vo.email, '@')}"/>
								
								<input ${configVO.emailFlag == 1 ? 'required' : ''} maxlength="30" type="text" class="input"
									style="width: 150px;  ime-mode: inactive;" name="email1" value="${wemail[0]} ">
									@ <input type="text" class="input" style="width: 150px;"
									name="email2" value="${wemail[1]}" > <select class="select" name="emailCode"
									id="emailCode" style="min-width: 120px;">
										<option value="" selected>직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="yahoo.co.kr">yahoo.co.kr</option>
										<option value="korea.com">korea.com</option>
										<option value="lycos.co.kr">lycos.co.kr</option>
										<option value="dreamwiz.com">dreamwiz.com</option>
										<option value="hotmail.com">hotmail.com</option>
										<option value="chollian.net">chollian.net</option>
										<option value="empal.com">empal.com</option>
										<option value="freechal.com">freechal.com</option>
										<option value="hanafos.com">hanafos.com</option>
										<option value="kebi.com">kebi.com</option>
										<option value="netian.com">netian.com</option>
										<option value="paran.com">paran.com</option>
										<option value="unitel.co.kr">unitel.co.kr</option>
								</select> <input type="hidden" name="email">
								</td>
							</tr>
							</c:if>
							
						
							<!--  wwwwwwwwwwwwwwwwwwwww-->
					<c:if test="${configVO.comPhoneFlag > 0 }"> 
					<tr>
						<th>회사전화 ${configVO.comPhoneFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="compPhone" maxlength="24" class="input" style="width: 200px;"  value="${vo.compPhone }" ${configVO.comPhoneFlag == 2 ? 'required' : ''} /></td>
					</tr>
					<tr>
						<th>닉네임 ${configVO.nickNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="nickname" maxlength="24" class="input" style="width: 200px;"  value="${vo.nickname }" ${configVO.nickNameFlag == 2 ? 'required' : ''} /></td>
					</tr>
					</c:if>
					
					<c:if test="${configVO.iconFlag > 0 }"> 
					<tr>
						<th>아이콘 ${configVO.iconFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="file" name="iconfile" ${configVO.iconFlag == 2  && !fn:contains(vo.icon, 'image/') ? 'required' : ''} />
							<c:if test="${fn:contains(vo.icon, 'image/')}">
								<a href="${UPLOAD_ROOT }${vo.icon}">파일</a>
							</c:if>
						</td>
					</tr>
					</c:if>
					<c:if test="${configVO.photoFlag > 0 }"> 
					<tr>
						<th>사진 ${configVO.photoFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="file" name="photofile" ${configVO.photoFlag == 2 && !fn:contains(vo.photo, 'image/') ? 'required' : ''} />
							<c:if test="${fn:contains(vo.photo, 'image/')}">
								<a href="${UPLOAD_ROOT }${vo.photo}">파일</a>
							</c:if>
						</td>
					</tr>
					</c:if>
					
					<c:if test="${configVO.juminFlag > 0 }"> 
					<tr>
						<th>주민번호 ${configVO.juminFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="virtualNumber" maxlength="13" class="input" style="width: 200px;"  value="${vo.virtualNumber }" ${configVO.juminFlag == 2 ? 'required' : ''} /></td>
					</tr>
					</c:if>
						<!-- wwwwwwwwwwwwwwwwwwwww -->
							<c:if test="${configVO.addrFlag > 0 }"> 
							<tr>
								<th>주 소 ${configVO.addrFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
								<td>
									<p>
										<input name="zipcode" type="text" class="input"
											style="width: 60px;" readonly onclick="getPostcode('P');"
											value="${vo.zipcode }"> <span class="mL5"><a
											href="javascript:getPostcode('P');" class="btn_s_nor">우편번호
												찾기</a></span>
									</p>
									<p class="mT5">
										<input  ${configVO.addrFlag == 2 ? 'required' : ''} name="addr1" id="Addr1" type="text" class="input" 
											style="width: 500px;" readonly onclick="getPostcode('P');"
											value="${vo.addr1 }">
									</p>
									<p class="mT5">
										<input name="addr2"  maxlength="1000" id="Addr2" type="text" class="input"
											style="width: 500px; ime-mode: active;" value="${vo.addr2 }">
									</p>
								</td>
							</tr>
							</c:if>
							<%-- <c:if test="${configVO.emailReceiveFlag > 0 }">
							<tr>
								<th>이메일 수신여부</th>
								<td><span> <label><input  ${configVO.emailReceiveFlag == 2 ? 'required' : ''} type="radio"
											name="emailYn" value="Y" checked> 수신</label>
								</span> <span class="mL20"> <label><input type="radio"
											name="emailYn" value="N"> 수신안함</label>
								</span></td>
							</tr>
							</c:if> --%>
							<c:if test="${configVO.sMSReceiveFlag > 0 }"> 
							<tr>
								<th>SMS 수신여부</th>
								<td><span> <label><input  ${configVO.sMSReceiveFlag == 2 ? 'required' : ''} type="radio"
											name="smsYn" value="Y" checked> 수신</label>
								</span> <span class="mL20"> <label><input type="radio"
											name="smsYn" value="N"> 수신안함</label>
								</span></td>
							</tr>
							</c:if>
							<c:if test="${configVO.etc1Flag > 0 }"> 
									<tr>
									<c:set var="required" />						
									<c:if test="${configVO.etc1Flag == 2}">
										<c:set var="required"><span class="red">*</span></c:set>
									</c:if>	
										<th>${configVO.etc1Name} ${required}</th>
										<td colspan="3">
										<input type="hidden" name="etc1Type" value="${configVO.etc1Type }" />
										<input type="hidden" name="etc1Flag" value="${configVO.etc1Flag }" />
											<c:choose>
												<c:when test="${configVO.etc1Type eq 'text'}">
													<input  ${configVO.etc1Flag == 2 ? 'required' : ''} type="text" class="w70 input" maxlength="${configVO.etc1Size }" name="additionalItem1" placeholder="${configVO.etc1Name }" value="${vo.additionalItem1 }" />
												</c:when>
												<c:when test="${configVO.etc1Type eq 'textarea'}">
													<textarea  ${configVO.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" maxlength="${configVO.etc1Size }" placeholder="${configVO.etc1Name }" class="w70 input" style="height: 40px;">${vo.additionalItem1 }</textarea>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'select'}">
													<select ${configVO.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" >
														<c:forTokens items="${configVO.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc1Count-1}">
														   <option ${fn:trim(desc) eq vo.additionalItem1 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
														</c:forTokens>
													</select>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'radio'}">
														<c:forTokens items="${configVO.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc1Count-1}">
														   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem1" ${desc eq vo.additionalItem1 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
														   ${desc}</label>
														</c:forTokens>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'checkbox'}">
														<c:forTokens items="${configVO.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc1Count-1}">
														   <label><input class="ml10" type="checkbox" name="additionalItem1" ${fn:trim(desc) eq vo.additionalItem1 ? 'checked' : ''} value="${fn:trim(desc)}" />
														   ${desc}</label>
														</c:forTokens>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'file'}">
													<input type="file" ${configVO.etc1Flag == 2 && !fn:contains(vo.additionalItem1, 'image/') ? 'required' : ''} name="etc1File" />
													<c:if test="${fn:contains(vo.additionalItem1, 'image/')}">
														<a href="${UPLOAD_ROOT }${vo.additionalItem1}">파일</a>
													</c:if>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'datepicker'}">
													<input type="text" ${configVO.etc1Flag == 2 ? 'required' : ''} class="datepicker input" name="additionalItem1" value="${vo.additionalItem1}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'dtimepick'}">
													<input type="text" ${configVO.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" class="datepicker time" value="${vo.additionalItem1}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'birthdate'}">
													<input type="text" ${configVO.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" class="datepicker" value="${vo.additionalItem1}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'mobileno'}">
													<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
													<c:set var="mobileno" value="${fn:split(vo.additionalItem1, '-')}"/>
													<input type="text" name="phoneValueA1" class="inputPhone input onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB1" class="inputPhone input onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC1" class="inputPhone input onlyNumber" value="${mobileno[2]}"/>
												</c:when>
												<c:when test="${configVO.etc1Type eq 'address'}">
												<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
													<c:set var="addressno" value="${fn:split(vo.additionalItem1, '~')}"/>
													<input type="text" class="w30 mb5 input" name="zipCode1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" class="mL5 btn_s_nor">주소찾기</a>
													<p class="mT5">
													<input type="text" class="w70 mb5 input" name="addrA1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[1] }" />
													<p class="mT5">
													<input type="text" class="w70 input" name="addrB1" value="${addressno[2] }" />
												</c:when>
												<c:when test="${configVO.etc1Type eq 'email' }">
													<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
													<c:set var="semail" value="${fn:split(vo.additionalItem1, '@')}"/>
													<input type="text" name="emailValueA1" value="${semail[0] }" /> @ <input type="text" name="emailValueB1" value="${semail[1] }" />
												</c:when>
											</c:choose>
										</td>
									</tr>
									</c:if>
									<c:if test="${configVO.etc2Flag > 0 }"> 
										<tr>
										<c:set var="required" />						
										<c:if test="${configVO.etc2Flag == 2}">
											<c:set var="required"><span class="red">*</span></c:set>
										</c:if>	
											<th>${configVO.etc2Name} ${required}</th>
											<td colspan="3">
											<input type="hidden" name="etc2Type" value="${configVO.etc2Type }" />
											<input type="hidden" name="etc2Flag" value="${configVO.etc2Flag }" />
												<c:choose>
													<c:when test="${configVO.etc2Type eq 'text'}">
														<input  ${configVO.etc2Flag == 2 ? 'required' : ''} type="text" class="w70 input" maxlength="${configVO.etc2Size }" name="additionalItem2" placeholder="${configVO.etc2Name }" value="${vo.additionalItem2 }" />
													</c:when>
													<c:when test="${configVO.etc2Type eq 'textarea'}">
														<textarea  ${configVO.etc2Flag == 2 ? 'required' : ''} style="height: 40px;" name="additionalItem2" maxlength="${configVO.etc2Size }" placeholder="${configVO.etc2Name }" class="w70 input">${vo.additionalItem2 }</textarea>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'select'}">
														<select ${configVO.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" >
															<c:forTokens items="${configVO.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc2Count-1}">
															   <option ${fn:trim(desc) eq vo.additionalItem2 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
															</c:forTokens>
														</select>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'radio'}">
															<c:forTokens items="${configVO.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc2Count-1}">
															   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem2" ${desc eq vo.additionalItem2 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'checkbox'}">
															<c:forTokens items="${configVO.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc2Count-1}">
															   <label><input class="ml10" type="checkbox" name="additionalItem2" ${fn:trim(desc) eq vo.additionalItem2 ? 'checked' : ''} value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'file'}">
														<input type="file" ${configVO.etc2Flag == 2 && !fn:contains(vo.additionalItem2, 'image/') ? 'required' : ''} name="etc2File" />
														<c:if test="${fn:contains(vo.additionalItem2, 'image/')}">
															<a href="${UPLOAD_ROOT }${vo.additionalItem2}">파일</a>
														</c:if>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'datepicker'}">
														<input type="text" ${configVO.etc2Flag == 2 ? 'required' : ''} class="datepicker input" name="additionalItem2" value="${vo.additionalItem2}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'dtimepick'}">
														<input type="text" ${configVO.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" class="datepicker time" value="${vo.additionalItem2}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'birthdate'}">
														<input type="text" ${configVO.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" class="datepicker" value="${vo.additionalItem2}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'mobileno'}">
														<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
														<c:set var="mobileno" value="${fn:split(vo.additionalItem2, '-')}"/>
														<input type="text" name="phoneValueA2" class="inputPhone input onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB1" class="inputPhone input onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC1" class="inputPhone input onlyNumber" value="${mobileno[2]}"/>
													</c:when>
													<c:when test="${configVO.etc2Type eq 'address'}">
													<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
														<c:set var="addressno" value="${fn:split(vo.additionalItem2, '~')}"/>
														<input type="text" class="w30 mb5 input" name="zipCode2" readonly onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" class="mL5 btn_s_nor">주소찾기</a>
														<p class="mT5">
														<input type="text" class="w70 mb5 input" name="addrA2" readonly onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" value="${addressno[1] }" />
														<p class="mT5">
														<input type="text" class="w70 input" name="addrB2" value="${addressno[2] }" />
													</c:when>
													<c:when test="${configVO.etc2Type eq 'email' }">
														<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
														<c:set var="semail" value="${fn:split(vo.additionalItem2, '@')}"/>
														<input type="text" name="emailValueA2" value="${semail[0] }" /> @ <input type="text" name="emailValueB1" value="${semail[1] }" />
													</c:when>
												</c:choose>
											</td>
										</tr>
									</c:if>
									<c:if test="${configVO.etc3Flag > 0 }"> 
										<tr>
										<c:set var="required" />						
										<c:if test="${configVO.etc3Flag == 2}">
											<c:set var="required"><span class="red">*</span></c:set>
										</c:if>	
											<th>${configVO.etc3Name} ${required}</th>
											<td colspan="3">
											<input type="hidden" name="etc3Type" value="${configVO.etc3Type }" />
											<input type="hidden" name="etc3Flag" value="${configVO.etc3Flag }" />
												<c:choose>
													<c:when test="${configVO.etc3Type eq 'text'}">
														<input  ${configVO.etc3Flag == 2 ? 'required' : ''} type="text" class="w70 input" maxlength="${configVO.etc3Size }" name="additionalItem3" placeholder="${configVO.etc3Name }" value="${vo.additionalItem3 }" />
													</c:when>
													<c:when test="${configVO.etc3Type eq 'textarea'}">
														<textarea  ${configVO.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" maxlength="${configVO.etc3Size }" placeholder="${configVO.etc3Name }" class="w70 input" style="height: 40px;">${vo.additionalItem3 }</textarea>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'select'}">
														<select ${configVO.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" >
															<c:forTokens items="${configVO.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc3Count-1}">
															   <option ${fn:trim(desc) eq vo.additionalItem3 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
															</c:forTokens>
														</select>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'radio'}">
															<c:forTokens items="${configVO.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc3Count-1}">
															   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem3" ${desc eq vo.additionalItem3 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'checkbox'}">
															<c:forTokens items="${configVO.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc3Count-1}">
															   <label><input class="ml10" type="checkbox" name="additionalItem3" ${fn:trim(desc) eq vo.additionalItem3 ? 'checked' : ''} value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'file'}">
														<input type="file" ${configVO.etc3Flag == 2 && !fn:contains(vo.additionalItem3, 'image/') ? 'required' : ''} name="etc3File" />
														<c:if test="${fn:contains(vo.additionalItem3, 'image/')}">
															<a href="${UPLOAD_ROOT }${vo.additionalItem3}">파일</a>
														</c:if>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'datepicker'}">
														<input type="text" ${configVO.etc3Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem3" value="${vo.additionalItem3}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'dtimepick'}">
														<input type="text" ${configVO.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" class="datepicker time" value="${vo.additionalItem3}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'birthdate'}">
														<input type="text" ${configVO.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" class="datepicker" value="${vo.additionalItem3}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'mobileno'}">
														<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
														<c:set var="mobileno" value="${fn:split(vo.additionalItem3, '-')}"/>
														<input type="text" name="phoneValueA3" class="inputPhone input onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB3" class="inputPhone input onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC3" class="inputPhone input onlyNumber" value="${mobileno[2]}"/>
													</c:when>
													<c:when test="${configVO.etc3Type eq 'address'}">
													<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
														<c:set var="addressno" value="${fn:split(vo.additionalItem3, '~')}"/>
														<input type="text" class="w30 mb5 input" name="zipCode3" readonly onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" class="mL5 btn_s_nor">주소찾기</a>
														<p class="mT5">
														<input type="text" class="w70 mb5 input" name="addrA3" readonly onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" value="${addressno[1] }" />
														<p class="mT5">
														<input type="text" class="w70 input" name="addrB3" value="${addressno[2] }" />
													</c:when>
													<c:when test="${configVO.etc3Type eq 'email' }">
														<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
														<c:set var="semail" value="${fn:split(vo.additionalItem3, '@')}"/>
														<input type="text" name="emailValueA3" value="${semail[0] }" /> @ <input type="text" name="emailValueB3" value="${semail[1] }" />
													</c:when>
												</c:choose>
											</td>
										</tr>
									</c:if>
									<c:if test="${configVO.etc4Flag > 0 }"> 
										<tr>
										<c:set var="required" />						
										<c:if test="${configVO.etc4Flag == 2}">
											<c:set var="required"><span class="red">*</span></c:set>
										</c:if>	
											<th>${configVO.etc4Name} ${required}</th>
											<td colspan="3">
											<input type="hidden" name="etc4Type" value="${configVO.etc4Type }" />
											<input type="hidden" name="etc4Flag" value="${configVO.etc4Flag }" />
												<c:choose>
													<c:when test="${configVO.etc4Type eq 'text'}">
														<input  ${configVO.etc4Flag == 2 ? 'required' : ''} type="text" class="w70 input" maxlength="${configVO.etc4Size }" name="additionalItem4" placeholder="${configVO.etc4Name }" value="${vo.additionalItem4 }" />
													</c:when>
													<c:when test="${configVO.etc4Type eq 'textarea'}">
														<textarea  ${configVO.etc4Flag == 2 ? 'required' : ''} style="height: 40px;" name="additionalItem4" maxlength="${configVO.etc4Size }" placeholder="${configVO.etc4Name }" class="w70 input">${vo.additionalItem4 }</textarea>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'select'}">
														<select ${configVO.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" >
															<c:forTokens items="${configVO.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc4Count-1}">
															   <option ${fn:trim(desc) eq vo.additionalItem4 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
															</c:forTokens>
														</select>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'radio'}">
															<c:forTokens items="${configVO.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc4Count-1}">
															   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem4" ${desc eq vo.additionalItem4 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'checkbox'}">
															<c:forTokens items="${configVO.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc4Count-1}">
															   <label><input class="ml10" type="checkbox" name="additionalItem4" ${fn:trim(desc) eq vo.additionalItem4 ? 'checked' : ''} value="${fn:trim(desc)}" />
															   ${desc}</label>
															</c:forTokens>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'file'}">
														<input type="file" ${configVO.etc4Flag == 2 && !fn:contains(vo.additionalItem4, 'image/') ? 'required' : ''} name="etc4File" />
														<c:if test="${fn:contains(vo.additionalItem4, 'image/')}">
															<a href="${UPLOAD_ROOT }${vo.additionalItem4}">파일</a>
														</c:if>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'datepicker'}">
														<input type="text" ${configVO.etc4Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem4" value="${vo.additionalItem4}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'dtimepick'}">
														<input type="text" ${configVO.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" class="datepicker time" value="${vo.additionalItem4}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'birthdate'}">
														<input type="text" ${configVO.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" class="datepicker" value="${vo.additionalItem4}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'mobileno'}">
														<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
														<c:set var="mobileno" value="${fn:split(vo.additionalItem4, '-')}"/>
														<input type="text" name="phoneValueA4" class="inputPhone input onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB4" class="inputPhone input onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC4" class="inputPhone input onlyNumber" value="${mobileno[2]}"/>
													</c:when>
													<c:when test="${configVO.etc4Type eq 'address'}">
													<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
														<c:set var="addressno" value="${fn:split(vo.additionalItem4, '~')}"/>
														<input type="text" class="w30 mb5 input" name="zipCode4" readonly onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" class="mL5 btn_s_nor">주소찾기</a>
														<p class="mT5">
														<input type="text" class="w70 mb5 input" name="addrA4" readonly onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" value="${addressno[1] }" />
														<p class="mT5">
														<input type="text" class="w70 input" name="addrB4" value="${addressno[2] }" />
													</c:when>
													<c:when test="${configVO.etc4Type eq 'email' }">
														<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
														<c:set var="semail" value="${fn:split(vo.additionalItem4, '@')}"/>
														<input type="text" name="emailValueA4" value="${semail[0] }" /> @ <input type="text" name="emailValueB4" value="${semail[1] }" />
													</c:when>
												</c:choose>
											</td>
										</tr>
									</c:if>
									<c:if test="${configVO.etc5Flag > 0 }"> 
									<tr>
									<c:set var="required" />						
									<c:if test="${configVO.etc5Flag == 2}">
										<c:set var="required"><span class="red">*</span></c:set>
									</c:if>	
										<th>${configVO.etc5Name} ${required}</th>
										<td colspan="3">
										<input type="hidden" name="etc5Type" value="${configVO.etc5Type }" />
										<input type="hidden" name="etc5Flag" value="${configVO.etc5Flag }" />
											<c:choose>
												<c:when test="${configVO.etc5Type eq 'text'}">
													<input  ${configVO.etc5Flag == 2 ? 'required' : ''} type="text" class="w70 input" maxlength="${configVO.etc5Size }" name="additionalItem5" placeholder="${configVO.etc5Name }" value="${vo.additionalItem5 }" />
												</c:when>
												<c:when test="${configVO.etc5Type eq 'textarea'}">
													<textarea  ${configVO.etc5Flag == 2 ? 'required' : ''} style="height: 40px;" name="additionalItem5" maxlength="${configVO.etc5Size }" placeholder="${configVO.etc5Name }" class="w70 input">${vo.additionalItem5 }</textarea>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'select'}">
													<select ${configVO.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" >
														<c:forTokens items="${configVO.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc5Count-1}">
														   <option ${fn:trim(desc) eq vo.additionalItem5 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
														</c:forTokens>
													</select>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'radio'}">
														<c:forTokens items="${configVO.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc5Count-1}">
														   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem5" ${desc eq vo.additionalItem5 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
														   ${desc}</label>
														</c:forTokens>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'checkbox'}">
														<c:forTokens items="${configVO.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${configVO.etc5Count-1}">
														   <label><input class="ml10" type="checkbox" name="additionalItem5" ${fn:trim(desc) eq vo.additionalItem5 ? 'checked' : ''} value="${fn:trim(desc)}" />
														   ${desc}</label>
														</c:forTokens>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'file'}">
													<input type="file" ${configVO.etc5Flag == 2 && !fn:contains(vo.additionalItem5, 'image/') ? 'required' : ''} name="etc5File" />
													<c:if test="${fn:contains(vo.additionalItem5, 'image/')}">
														<a href="${UPLOAD_ROOT }${vo.additionalItem5}">파일</a>
													</c:if>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'datepicker'}">
													<input type="text" ${configVO.etc5Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem5" value="${vo.additionalItem5}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'dtimepick'}">
													<input type="text" ${configVO.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" class="datepicker time" value="${vo.additionalItem5}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'birthdate'}">
													<input type="text" ${configVO.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" class="datepicker" value="${vo.additionalItem5}" /><a class="datepicker mL5"><img src="/images/ic_calender.png" /></a>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'mobileno'}">
													<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
													<c:set var="mobileno" value="${fn:split(vo.additionalItem5, '-')}"/>
													<input type="text" name="phoneValueA5" class="inputPhone input onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB5" class="inputPhone input onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC5" class="inputPhone input onlyNumber" value="${mobileno[2]}"/>
												</c:when>
												<c:when test="${configVO.etc5Type eq 'address'}">
												<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
													<c:set var="addressno" value="${fn:split(vo.additionalItem5, '~')}"/>
													<input type="text" class="w30 mb5 input" name="zipCode5" readonly onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" class="mL5 btn_s_nor">주소찾기</a>
													<p class="mT5">
													<input type="text" class="w70 mb5 input" name="addrA5" readonly onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" value="${addressno[1] }" />
													<p class="mT5">
													<input type="text" class="w70 input" name="addrB5" value="${addressno[2] }" />
												</c:when>
												<c:when test="${configVO.etc5Type eq 'email' }">
													<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
													<c:set var="semail" value="${fn:split(vo.additionalItem5, '@')}"/>
													<input type="text" name="emailValueA5" value="${semail[0] }" /> @ <input type="text" name="emailValueB5" value="${semail[1] }" />
												</c:when>
											</c:choose>
										</td>
									</tr>
									</c:if>
									<c:if test="${configVO.jobFlag > 0 }">
										<tr>
											<th>직업</th>
											<td colspan="3">
												<select ${configVO.jobFlag == 2 ? 'required' : ''} name="job" >
													<c:forTokens items="${configVO.jobType}" delims="," var="desc" varStatus="s" begin = "0">
													   <option ${fn:trim(desc) eq vo.job ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>	
									</c:if>
									<c:if test="${configVO.educationFlag > 0 }">
										<tr>
											<th>학력</th>
											<td colspan="3">
												<select ${configVO.educationFlag == 2 ? 'required' : ''} name="education" >
													<c:forTokens items="${configVO.educationType}" delims="," var="desc" varStatus="s" begin = "0">
													   <option ${fn:trim(desc) eq vo.education ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>	
									</c:if>	
									<c:if test="${configVO.incomeFlag > 0 }">
										<tr>
											<th>월평균소득</th>
											<td colspan="3">
												<select ${configVO.incomeFlag == 2 ? 'required' : ''} name="monthIncome" >
													<c:forTokens items="${configVO.incomeType}" delims="," var="desc" varStatus="s" begin = "0">
													   <option ${fn:trim(desc) eq vo.monthIncome ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>	
									</c:if>	
									<c:if test="${configVO.interestFlag > 0 }">
										<tr>
											<th>관심분야</th>
											<td colspan="3">
												<select ${configVO.interestFlag == 2 ? 'required' : ''} name="hobby" >
													<c:forTokens items="${configVO.interestType}" delims="," var="desc" varStatus="s" begin = "0">
													   <option ${fn:trim(desc) eq vo.hobby ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
													</c:forTokens>
												</select>
											</td>
										</tr>	
									</c:if>	
						</tbody>
					</table>
				
					<div id="SPCompInfo" style="display: none">
						<div class="inner mT40">
							<p class="stit fleft">사업자 정보입력 </p>
						</div>
						<table class="board_write">
							<colgroup>
								<col width="170px" />
								<col width="*" />
							</colgroup>
							<tbody>
				<%-- 				<tr>
									<th>업점업체명</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="officeName"
										maxlength="200" ></td>
								</tr>
				
								<tr>
									<th>사업자번호</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="officeNum"
										maxlength="20" ></td>
								</tr>
				
								<tr>
									<th>대표자명 <th>대표자명 ${setting.officeOwnerNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th></th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="ownerName"
										maxlength="200"></td>
								</tr>
								<tr>
									<th>대표자연락처</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="ownerTel"
										maxlength="20"></td>
								</tr>
								
								<tr>
									<th>담당자 이름</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="staffName"
										maxlength="200"></td>
								</tr>
				
								<tr>
									<th>담당자 연락처</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="staffTel"
										maxlength="20"></td>
								</tr>
								
								
								
								<tr>
									<th>통신판매번호</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="obNum"
										maxlength="20"></td>
								</tr>
				
								<tr>
									<th>업태</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="bType"
										maxlength="20"></td>
								</tr>
				
								<tr>
									<th>업종</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="bcType"
										maxlength="20"></td>
								</tr>
								<tr>
									<th>계산서 이메일</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="taxEmail"
										maxlength="20"></td>
								</tr>
				
				
								<tr>
									<th>우편번호</th>
									<td>
										<p>
											<input name="czipCode" type="text" class="input"
												style="width: 60px;" readonly onclick="getPostcode('C');">
											<span class="mL5"><a
												href="javascript:getPostcode('C')" class="btn_s_nor">우편번호
													찾기</a></span>
										</p>
										<p class="mT5">
											<input name="caddr1" type="text" class="input"
												style="width: 500px;" readonly onclick="getPostcode('C');">
										</p>
										<p class="mT5">
											<input name="caddr2" type="text" class="input"
												style="width: 500px; ime-mode: active;">
										</p>
									</td>
								</tr> --%>
								
								<!-- ---------------------------------------------------------------------------- -->
								<c:if test="${configVO.officeNameFlag > 0 }"> 
								<tr>
									<th>업점업체명 ${configVO.officeNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="officeName" company
										maxlength="100" value="${voc.officeName }"  ${configVO.officeNameFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								
								<c:if test="${configVO.officeNumFlag > 0 }"> 
								<tr>
									<th>사업자번호 ${configVO.officeNumFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="officeNum" company
										maxlength="20" value="${voc.officeNum }"  ${configVO.officeNumFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeOwnerNameFlag > 0 }"> 
								<tr>
									<th>대표자명 ${configVO.officeOwnerNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="ownerName" company
										maxlength="100" value="${voc.ownerName }" ${configVO.officeOwnerNameFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeOwnerTelFlag > 0 }"> 
								<tr>
									<th>대표자연락처 ${configVO.officeOwnerTelFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="ownerTel" company
										maxlength="20"  value="${voc.ownerTel }" ${configVO.officeOwnerTelFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeStaffNameFlag > 0 }"> 
								
								<tr>
									<th>담당자 이름 ${configVO.officeStaffNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="staffName" company
										maxlength="100"  value="${voc.staffName }" ${configVO.officeStaffNameFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeStaffTelFlag > 0 }"> 				
				
								<tr>
									<th>담당자 연락처 ${configVO.officeStaffTelFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="staffTel" company
										maxlength="20"  value="${voc.staffTel }" ${configVO.officeStaffTelFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeObNumFlag > 0 }"> 
								
								
								<tr>
									<th>통신판매번호 ${configVO.officeObNumFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="obNum" company
										maxlength="20"  value="${voc.obNum }" ${configVO.officeObNumFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeBTypeFlag > 0 }"> 
				
								<tr>
									<th>업태 ${configVO.officeBTypeFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="bType" company
										maxlength="100"  value="${voc.bType }" ${configVO.officeBTypeFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeBcTypeFlag > 0 }"> 
				
								<tr>
									<th>업종 ${configVO.officeBcTypeFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="bcType" company
										maxlength="100" value="${voc.bcType }" ${configVO.officeBcTypeFlag == 2 ? 'required' : ''} ></td>
								</tr>
								</c:if>
								<c:if test="${configVO.officeTaxMailFlag > 0 }"> 
								<tr>
									<th>계산서 이메일 ${configVO.officeTaxMailFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									<td><input type="text" class="input"
										style="width: 200px; ime-mode: active;" name="taxEmail" company
										maxlength="100" value="${voc.taxEmail }" ${configVO.officeTaxMailFlag == 2 ? 'required' : ''} ></td>
								</tr>
				
								</c:if>
								<c:if test="${configVO.officeAddrFlag > 0 }"> 
				
								<tr>
									<th>우편번호 ${configVO.officeAddrFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
									
										<td colspan="3">
											<p><input  class="input" type="text" class="w30 mb5" name="czipCode" value="${voc.czipCode }" readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');"/>
											<span class="mL5"><a onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" class="btn_s_nor">주소찾기</a></span>
											</p>
											<p class="mT5">
											<input  class="input"  type="text" class="w70 mb5" name="caddr1" value="${voc.caddr1 }" style="width: 500px; ime-mode: active;" readonly onclick="javascript:openSearchAddress('czipCode', 'caddr1', 'caddr2');" />
											</p>
											<p class="mT5"> 
											<input   class="input" type="text" class="w70" name="caddr2" value="${voc.caddr2 }" style="width: 500px; ime-mode: active;" company ${configVO.officeAddrFlag == 2 ? 'required' : ''} />
											</p>
										</td>	
									</tr>
									</c:if>
								
							</tbody>
						</table>
					</div>
				
				</form>
				<div class="btn_area">
					<a href="javascript:doSubmit();" class="btn_m_nor">확인</a> <a
						href="javascript:$.Nav('self', {isAgreed: false}, null, true)" class="btn_m_gy mL5">취소</a>
				</div>
				<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
				<script type="text/javascript">
				$(function() {
					//$('#formJoin').validate();
				});
					$(function() {
						//중복아이디체크 
						$('input[name=userId]').change(
								function() {
				
									var sUserId = trim($('input[name=userId]').val());
									$('input[name=userId]').val(
											trim($('input[name=userId]').val()));
				
									if (sUserId != '') {
										if (sUserId.length < 4) {
											$('#userIdCheck').attr('class', 'mL10 red bold');
											$('#userIdCheck').text('아이디는 4~15자로 입력하세요.');
				
										} else {
											$.ajax({
												type : 'post',
												url : '/ajax/checkId.do',
												data : {
													id : sUserId
												},
												dataType : 'json',
												success : function(data) {
													if (data.result == null) {
														$('#userIdCheck').attr('class',
																'mL10 blue bold');
														$('#userIdCheck').text(
																'사용 가능한 아이디 입니다.');
				
													} else {
														$('#userIdCheck').attr('class',
																'mL10 red bold');
														$('#userIdCheck').text(
																'사용 불가능한 아이디 입니다.');
													}
												}
											});
										}
				
									} else {
										$('#userIdCheck').removeClass('blue');
										$('#userIdCheck').text('사용할 아이디를 입력하세요.');
									}
								});
				
						//비밀번호 체크
						$('input[name=userPwd], input[name=userPwd2]')
								.change(
										function() {
											//공백 제거
											var sUserPwd = trim($('input[name=userPwd]').val());
											$('input[name=userPwd]').val(
													trim($('input[name=userPwd]').val()));
											var sUserPwd2 = trim($('input[name=userPwd2]')
													.val());
											$('input[name=userPwd2]').val(
													trim($('input[name=userPwd2]').val()));
				
											if (sUserPwd.length < 8) {
												$('#userPwdCheck').prop('class',
														'mL10 red bold');
												$('#userPwdCheck').text(
														'비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능합니다.');
				
											} else {
												$('#userPwdCheck').prop('class',
														'mL10 blue bold');
												$('#userPwdCheck').text('비밀번호가 입력되었습니다.');
											}
				
											if (sUserPwd != '' && sUserPwd2 != '') {
												if (sUserPwd != sUserPwd2) {
													$('#userPwdCheck2').prop('class',
															'mL10 red bold');
													$('#userPwdCheck2').text('비밀번호가 다릅니다.');
				
												} else {
													$('#userPwdCheck2').prop('class',
															'mL10 blue bold');
													$('#userPwdCheck2').text('비밀번호가 일치 합니다.');
												}
											}
											/* re = /[0-9]/;
										    if(!re.test(sUserPwd)) {
										    	$('#userPwdCheck').prop('class', 'mL10 red bold');
												$('#userPwdCheck').text('오류 : 비밀번호는 하나 이상의 숫자 (0-9)를 포함해야합니다!');
											}
										    re = /[a-z]/;
										    if(!re.test(sUserPwd)) {						        
										        $('#userPwdCheck').prop('class',
												'mL10 red bold');
												$('#userPwdCheck').text(
												'오류 : 비밀번호는 소문자 (a-z)를 하나 이상 포함해야합니다!');
										    }
										    re = /[A-Z]/;
										    if(!re.test(sUserPwd)) {
										        $('#userPwdCheck').prop('class','mL10 red bold');
												$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (A-Z)를 하나 이상 포함해야합니다!');
											}
											re = /[!@#\$%\^&\*]/;
											if(!re.test(sUserPwd)) {
										        $('#userPwdCheck').prop('class','mL10 red bold');
												$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (!@#$%^&\*)를 하나 이상 포함해야합니다!');
											} */
											if(!checkPattern(sUserPwd, 'PASSWORD')){
												$('#userPwdCheck').prop('class','mL10 red bold');
												$('#userPwdCheck').text('오류 : 비밀번호는 대문자 (!@#$%^&\*)를 하나 이상 포함해야합니다!');
											}
										});
				
						$('select[name=emailCode]').change(function() {
							$('input[name=email2]').val($(this).val());
						});
				
						//개인 회사 체크
						doPCTypeCheck('');
				
						var phone = '${vo.phone}';
						phone = phone.split('-');
						for ( var i in phone) {
							var index = parseInt(i) + 1;
							eval('$("input[name=phone' + index + ']")').val(phone[i]);
						}
				
						var mobile = '${vo.mobile}';
						mobile = mobile.split('-');
						for ( var i in mobile) {
							var index = parseInt(i) + 1;
							eval('$("input[name=mobile' + index + ']")').val(mobile[i]);
						}
				
						var email = '${vo.email}';
						email = email.split('@');
						for ( var i in email) {
							var index = parseInt(i) + 1;
							eval('$("input[name=email' + index + ']")').val(email[i]);
						}
				
						var emailYn = '${vo.emailYn}';
						checkRadio('emailYn', emailYn, null);
						var smsYn = '${vo.smsYn}';
						checkRadio('smsYn', smsYn, null);
					});
				
					//개인 C or 회사 P 체크 : P 일시 추가 정보 입력
					function doPCTypeCheck(obj) {
						if ($(obj).val() == 'C') {
							$('#SPCompInfo').css('display', 'inhreit');
						} else {
							$('#SPCompInfo').css('display', 'none');
						}
					}
				
					//check = P개인 , C 회사
					function getPostcode(check) {
						new daum.Postcode({
							oncomplete : function(data) {
								// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
								// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
								var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
								var extraRoadAddr = ''; // 도로명 조합형 주소 변수
				
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
									extraRoadAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== '' && data.apartment === 'Y') {
									extraRoadAddr += (extraRoadAddr !== '' ? ', '
											+ data.buildingName : data.buildingName);
								}
								// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraRoadAddr !== '') {
									extraRoadAddr = ' (' + extraRoadAddr + ')';
								}
								// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
								if (fullRoadAddr !== '') {
									fullRoadAddr += extraRoadAddr;
								}
				
								//개인
								if (check == 'P') {
									$('input[name=zipcode]').val(data.zonecode); //5자리 새우편번호 사용
									$('input[name=addr1]').val(fullRoadAddr);
									//data.jibunAddress;
				
									//회사
								} else {
									$('input[name=czipCode]').val(data.zonecode); //5자리 새우편번호 사용
									$('input[name=caddr1]').val(fullRoadAddr);
				
								}
							}
						}).open();
					}
				
					function doSubmit() {
				
						var sId = '${vo.userId}';
				
						if (sId == '') {
							if ($('#userIdCheck').prop('class').indexOf('blue') < 0) {
								$('#userIdCheck').attr('class',
								'mL10 red bold').val('사용 불가능한 아이디 입니다.');
								//alert('사용 불가능한 아이디 입니다.');
								$('input[name=userId]').focus();
								return;
							}
				
							if ($('#userPwdCheck').prop('class').indexOf('blue') < 0
									|| $('#userPwdCheck2').prop('class').indexOf('blue') < 0) {
								$('#userPwdCheck').attr('class', 'mL10 red bold').val('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
								//alert('비밀번호는 8~20자 이내의 영문 및 숫자만 입력가능힙니다.');
								$('input[name="userPwd"]').focus();
								return;
							}
						}
				
					/* 	if (isNull($('input[name=userName]').val())) {
							//alert('이름을 입력해야 합니다.');
							$('input[name=userName]').next().prop('hidden',false);
							$('input[name=userName]').next().text('이름을 입력해야 합니다.');
							$('input[name=userName]').focus();
							return;
						}else{
							$('input[name=userName]').next().prop('hidden',true);
						} */
						var isRequired = true;
						var $form = document.querySelectorAll("#formJoin")[0];
						var $elements = $form.elements;
						$.each($elements,function(index, input) {
							var elem = document.createElement('span');
							elem.classList.add("mL10");
							elem.classList.add("red");
							elem.classList.add("bold");
							elem.textContent = '필수 항목입니다.';
							if(input.hasAttribute('required') && !isNull(input.parentNode.lastElementChild) && input.parentNode.lastElementChild.tagName === 'SPAN')
								input.parentNode.removeChild(input.parentNode.lastElementChild);	
							if(input.hasAttribute('required') && isNull(input.value)) {
								if(!input.hasAttribute('company')){
									input.parentNode.insertBefore(elem, (input.parentNode.childNodes.length > 1) ? input.parentNode.lastChild : input.nextSibling);
									isRequired = false;
								}else if(input.hasAttribute('company') &&  $('input[name="radPCType"]:checked').val() === 'C'){
									input.parentNode.insertBefore(elem, (input.parentNode.childNodes.length > 1) ? input.parentNode.lastChild : input.nextSibling);
									isRequired = false;
								}
							}
						});
						if(!isRequired)
							return;
						
						/* if (!isNull($('input[name=phone1]').val())) {
						var sPhone = trim($('input[name=phone1]').val()
								+ $('input[name=phone2]').val() + $('input[name=phone3]').val());
						if (sPhone.length < 11) {
							alert('연락처가 잘못 입력되었습니다.');
							return;
						}
						}
						if (!isNull($('input[name=mobile1]').val())) {
						var sMobile = trim($('input[name=mobile1]').val()
								+ $('input[name=mobile2]').val()
								+ $('input[name=mobile3]').val());
						if (sMobile != '' && sMobile.length < 11) {
							alert('휴대전화가 잘못 입력되었습니다.');
							return;
						}
						}
						if (!isNull($('input[name=mobile1]').val())) {
						if ($('input[name=emailId]').val() == ''
								|| $('input[name=emailHost]').val() == '') {
							alert('이메일을 입력해야 합니다.');
							return;
						}
						} */
						if (!confirm('등록 하시겠습니까?')) {
							return;
						}
						if (!isNull($('input[name=phone1]').val())) {
						sPhone = $('input[name=phone1]').val() + '-'
								+ $('input[name=phone2]').val() + '-'
								+ $('input[name=phone3]').val();
						$('input[name=phone]').val(sPhone);
						}
						if (!isNull($('input[name=mobile1]').val())) {
						sMobile = $('input[name=mobile1]').val() + '-'
								+ $('input[name=mobile2]').val() + '-'
								+ $('input[name=mobile3]').val();
						$('input[name=mobile]').val(sMobile);
						}
						sEmail = trim($('input[name=email1]').val()) + '@'
								+ trim($('input[name=email2]').val());
						$('input[name=email]').val(sEmail);
						
						for(var i = 1; i <= 5; i++){
							var flag = $('input[name="etc'+ i +'Type"]').val();
							var req = $('input[name="etc'+ i +'Flag"]').val();
							if (req > 0 && flag === "mobileno" && !isNull($('input[name=phoneValueA'+ i +']').val())) {
								var $phoneValue = $('input[name=phoneValueA'+ i +']').val() + '-' + $('input[name=phoneValueB'+ i +']').val() + '-' + $('input[name=phoneValueC'+ i +']').val();
								$('input[name="additionalItem'+ i +'"]').val($phoneValue);
							} else if (req > 0 && flag === "email" && !isNull($('input[name=emailValueA'+ i +']').val()) && !isNull($('input[name=emailValueB'+ i +']').val())) {
								var $emailValue = $('input[name=emailValueA'+ i +']').val() + '@' + $('input[name=emailValueB'+ i +']').val();
								$('input[name="additionalItem'+ i +'"]').val($emailValue);
							} else if (req > 0 && flag === "address" && !isNull($('input[name=zipCode'+ i +']').val())) {
								var $addressValue = $('input[name=zipCode'+ i +']').val() + '~' + $('input[name=addrA'+ i +'').val() + '~' + $('input[name=addrB'+ i +']').val();
								$('input[name="additionalItem'+ i +'"]').val($addressValue);
							}
						}
				
						$('#formJoin').submit();
					}
			</script>
			</c:if>
			</div>
			<!-- content -->
		</div>
		<!-- container -->
	</div>
	<!-- wrapper -->
</div>
<!-- all_wrp -->

<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
</body>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>