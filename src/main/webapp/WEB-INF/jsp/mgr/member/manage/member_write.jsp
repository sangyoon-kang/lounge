<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원 관리 - 회원등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>${empty vo ? '회원등록' : '회원수정'}</h2>
		<p>홈 &gt; 회원 관리 &gt; 회원 관리 &gt; ${empty vo ? '등록' : '수정'}</p>
	</div>

	<div class="scon">

		<form id="form1" action="./member_proc.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="phone" value="" />
			<input type="hidden" name="mobile" value="" />
			<input type="hidden" name="mseq" value="${search.mseq }" />
			<input type="hidden" name="recommUserId" value="${vo.recommUserId }"/>
			<input type="hidden" name="recommUlevel"/>		
			<c:if test="${search.mseq > 0  }">
				<input type="hidden" name="gradeLevel" value="${vo.gradeLevel }"/>	
			</c:if>
			
			<table class="board_write" id="write_member">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr id="idchk">
					<c:if test="${setting.iDFlag > 0 }"> 
						<th>아이디 <span class="red bold">*</span></th>
						<td>
				<c:set var="ck" />
				<c:if test="${search.mseq > 0 }"> 
				<c:set var="ck">readonly</c:set>	
				</c:if>						
						<input type="text" name="userId"  value="${vo.userId }" ${ck } class="w30" maxlength="24" />
						<input type="hidden" name="checkedMem" />
					<c:if test="${search.mseq <= 0 }"> 
							<a onclick="javascript:doCheck('user');" class="btn btn_round bg_darkgray ml5">중복 체크</a>
					</c:if>	
						</td>
					</c:if>
					<c:if test="${setting.passwordFlag > 0 }"> 
						<th>비밀번호 <span class="red bold">*</span></th>
						<td><input type="password" name="userPwd" class="w50" maxlength="24" /></td>
					</c:if>
					</tr>
					<c:if test="${setting.nameFlag > 0 and search.mseq > 0 }"> 
					<tr>
						<th>이름 <span class="red bold">*</span></th>
						<td colspan="3"><input type="text" name="userName" maxlength="100" class="w50" value="${vo.userName }" required /></td>
					</tr>
					</c:if>
				<c:if test="${search.mseq eq 0}"> 
					<tr>
						<th>이름 <span class="red bold">*</span></th>
						<td ><input type="text" name="userName" maxlength="100" class="w50" value="${vo.userName }" required /></td>
						
						<th>회원등급 <span class="red bold">*</span></th>
						<td ><tt:select list="${grade }" id="gradeRole" indexKey="0" indexValue="= 선택 =" name="gradeLevel" listKey="gradeLevel" listValue="gradeName"  selected="${vo.gradeLevel }"/></td>
					</tr>
					<c:if test="${setting.recommendFlag > 0 }"> 
					<tr>
						<th>추천인  ${setting.recommendFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="text" name="recommUserIds" maxlength="100" class="w50" value="${vo.recommNickname}"  />
							<span class="ml10 mt10 blue" id="recommCheck"></span>
							<span id="reUlevel"></span>
							<span></span>
						</td>
					</tr>
					</c:if>
					<tr id="nickn"></tr>
				</c:if>
				<c:if test="${search.mseq > 0}"> 
					<c:if test="${setting.recommendFlag > 0 }"> 
						<tr id="recommend">
							<th>추천인  ${setting.recommendFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
							<td colspan="3">
								<c:if test="${vo.gradeLevel eq lowGrade }">
								<input type="text" name="recommUserIds" maxlength="100" class="w50" value="${vo.recommNickname } " />
								<span class="ml10 mt10 blue" id="recommCheck"></span>
								<span id="reUlevel"></span>
								</c:if>
								<c:if test="${vo.gradeLevel lt lowGrade }">
									${vo.recommNickname }
								</c:if>
								<span></span>
								<span id="recommLname">
								<c:forEach items="${grade }" var="s" varStatus="r">
									<c:if test="${s.gradeLevel eq vo.recommUlevel}">
										(${s.gradeMemo }) 
									</c:if>
								</c:forEach>
									<c:if test="${vo.recommUlevel eq 1}">
										(${vo.recommUname}) 
									</c:if>
								</span>
							</td>
						</tr>
					</c:if>
					<tr id="afterthat">
					<c:if test="${!empty vo.recommUserId }">
						<c:forEach items="${grade }" var="g" varStatus="t">
							<c:if test="${g.gradeLevel eq vo.gradeLevel}">
								<th>회원등급 </th>
								<td colspan="3" id="user_level">
									<span id="changeG">${g.gradeName }</span>
									<a id="change_grade_btn"></a>
								</td>	
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${empty vo.recommUserId }">
						<c:forEach items="${grade }" var="g" varStatus="t">
							<c:if test="${g.gradeLevel eq vo.gradeLevel}">
								<th>회원등급 </th>
								<td colspan="3">
									${g.gradeName }
								</td>	
							</c:if>
						</c:forEach>
					</c:if>
					</tr>
					<c:if test="${vo.gradeLevel ne lowGrade and setting.nickNameFlag > 0}">
						<tr id="nick_name">
							<th>대리점코드${setting.nickNameFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
							<td colspan="3">
								<input type="text" name="nickname" maxlength="48" class="w50" value="${vo.nickname }" />
								<span class="ml10 mt10 blue" id="checkAgent"></span>
							</td>
						</tr>
					</c:if>
				</c:if>
					<c:if test="${setting.phoneFlag > 0 }"> 
					<tr>
						<th>전화번호  ${setting.phoneFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<c:set var="wphone" value="${fn:split(vo.phone, '-')}"/>
							<input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneA"  class="w10 inputPhone onlyNumber" value="${wphone[0]}"/>  -  <input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneB" class="w10 inputPhone onlyNumber" value="${wphone[1]}" />  -  <input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneC"  class="w10 inputPhone onlyNumber" value="${wphone[2]}" />
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.mobileTelFlag > 0 }"> 
					<tr>
						<th>휴대폰 ${setting.mobileTelFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<c:set var="wmobile" value="${fn:split(vo.mobile, '-')}"/>
							<input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileA" class="w10 inputPhone onlyNumber" value="${wmobile[0]}"/>  -  <input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileB" class="w10 inputPhone onlyNumber" value="${wmobile[1]}"/>  -  <input ${setting.mobileTelFlag == 2 ? 'required' : ''} type="text" name="mobileC" class="w10 inputPhone onlyNumber" value="${wmobile[2]}" />
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.emailFlag > 0 }"> 
					<tr>
						<th>이메일</th>
						<td colspan="3"><input type="text" name="email" class="w20" maxlength="100" value="${vo.email }" /></td>
					</tr>
					</c:if>
					<tr>
						<th>잔여캐쉬</th>
						<td colspan="3">
							<span id="cash">
                                <fmt:formatNumber pattern="#,##0" value="${vo.cash }" /> 원
                                (
                                캐쉬입금 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashR }" /> 원,
                                꽁머니 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashA }" /> 원,
                                거래수익 : <fmt:formatNumber pattern="#,##0" value="${userMoney.cashC }" /> 원
                                )
                            </span>
                            <br>
							<input type="number" name="cash" class="w20">
							<span>&nbsp;&nbsp;&nbsp;지급사유</span>
							<input type="text" name="memo" class="w30" placeholder="지급 사유를 입력하세요(기본 : 관리자 지급)">
							<button type="button" class="btn btn_round bg_darkgray ml5" onclick="rechargeCash()">CASH추가</button>
							<button type="button" class="btn btn_round bg_darkgray ml5" onclick="showCashLog('${vo.userId }')">지원금내역</button>
						</td>
					</tr>
					<c:if test="${setting.comPhoneFlag > 0 }"> 
					<tr>
						<th>회사전화 ${setting.comPhoneFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="compPhone" class="w20" maxlength="24" value="${vo.compPhone }" ${setting.comPhoneFlag == 2 ? 'required' : ''} /></td>
					</tr>
					</c:if>
					<c:if test="${setting.juminFlag > 0 }"> 
					<tr>
						<th>주민번호 ${setting.juminFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="virtualNumber" maxlength="13" class="w20" value="${vo.virtualNumber }" ${setting.juminFlag == 2 ? 'required' : ''} /></td>
					</tr>
					</c:if>
					<c:if test="${setting.homepageFlag > 0 }"> 
					<tr>
						<th>홈페이지 ${setting.homepageFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3"><input type="text" name="homepage" maxlength="24" class="w20" value="${vo.homepage }" ${setting.homepageFlag == 2 ? 'required' : ''} /></td>
					</tr>
					</c:if>
					<c:if test="${setting.iconFlag > 0 }"> 
					<tr>
						<th>아이콘 ${setting.iconFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="file" name="iconfile" ${setting.iconFlag == 2  && !fn:contains(vo.icon, 'image/') ? 'required' : ''} />
							<c:if test="${fn:contains(vo.icon, 'image/')}">
								<a href="${UPLOAD_ROOT }${vo.icon}">파일</a>
							</c:if>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.photoFlag > 0 }"> 
					<tr>
						<th>사진 ${setting.photoFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="file" name="photofile" ${setting.photoFlag == 2 && !fn:contains(vo.photo, 'image/') ? 'required' : ''} />
							<c:if test="${fn:contains(vo.photo, 'image/')}">
								<a href="${UPLOAD_ROOT }${vo.photo}">파일</a>
							</c:if>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.birthdayFlag > 0 }"> 
					<tr>
						<th>생년월일  ${setting.birthdayFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input type="text" name="birthDt" class="input_type2 datepicker" maxlength="24" value="${vo.birthDt }" ${setting.birthdayFlag == 2 ? 'required' : ''}  /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.emailReceiveFlag > 0 }"> 
					<tr>
						<th>이메일 수신  ${setting.emailReceiveFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<label><input type="radio" name="emailYn" value="Y"/>예</label>
							<label><input type="radio" class="ml10" name="emailYn" value="N"/>아니오</label>
							<script>
								$(function() {
									checkRadio('emailYn', '${vo.emailYn}', 'Y');
								});
							</script>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.sMSReceiveFlag > 0 }"> 
					<tr>
						<th>SMS 수신 ${setting.sMSReceiveFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<label><input type="radio" name="smsYn" value="Y" />예</label>
							<label><input type="radio" class="ml10" name="smsYn" value="N" />아니오</label>
							<script>
								$(function() {
									checkRadio('smsYn', '${vo.smsYn}', 'Y');
								});
							</script>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.addrFlag > 0 }"> 
					<tr>
						<th>주소  ${setting.addrFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="w30 mb5" name="zipcode" value="${vo.zipcode }" readonly onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');"/>
							<a onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
							<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="w70 mb5" name="addr1" value="${vo.addr1 }" readonly onclick="javascript:openSearchAddress('zipcode', 'addr1', 'addr2');" />
							<input  ${setting.addrFlag == 2 ? 'required' : ''} type="text" class="w70" maxlength="1000" name="addr2" value="${vo.addr2 }" />
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.faxFlag > 0 }"> 
					<tr>
						<th>메모  ${setting.faxFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
						<td colspan="3">
							<textarea  ${setting.faxFlag == 2 ? 'required' : ''} name="memo" maxlength="2000" class="w100" rows="5">${vo.memo }</textarea>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.etc1Flag > 0 }"> 
					<tr>
					<c:set var="required" />						
					<c:if test="${setting.etc1Flag == 2}">
						<c:set var="required"><span class="red">*</span></c:set>
					</c:if>	
						<th>${setting.etc1Name} ${required}</th>
						<td colspan="3">
						<input type="hidden" name="etc1Type" value="${setting.etc1Type }" />
						<input type="hidden" name="etc1Flag" value="${setting.etc1Flag }" />
							<c:choose>
								<c:when test="${setting.etc1Type eq 'text'}">
									<input  ${setting.etc1Flag == 2 ? 'required' : ''} type="text" class="w100" maxlength="${setting.etc1Size }" name="additionalItem1" placeholder="${setting.etc1Name }" value="${vo.additionalItem1 }" />
								</c:when>
								<c:when test="${setting.etc1Type eq 'textarea'}">
									<textarea  ${setting.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" maxlength="${setting.etc1Size }" placeholder="${setting.etc1Name }" class="w100">${vo.additionalItem1 }</textarea>
								</c:when>
								<c:when test="${setting.etc1Type eq 'select'}">
									<select ${setting.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" >
										<c:forTokens items="${setting.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc1Count-1}">
										   <option ${fn:trim(desc) eq vo.additionalItem1 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
										</c:forTokens>
									</select>
									소득세를 제하지 않는 대리점인 경우 체크하세요.
								</c:when>
								<c:when test="${setting.etc1Type eq 'radio'}">
										<c:forTokens items="${setting.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc1Count-1}">
										   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem1" ${desc eq vo.additionalItem1 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
										   ${desc}</label>
										</c:forTokens>
								</c:when>
								<c:when test="${setting.etc1Type eq 'checkbox'}">
										<c:forTokens items="${setting.etc1Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc1Count-1}">
											<c:set var="addcheck1" />	
										  	<c:forTokens items="${vo.additionalItem3}" delims="," var="item" varStatus="s">
										   		<c:if test="${item eq desc}">
										   			<c:set var="addcheck1">${item}</c:set>
										   		</c:if>
										   	</c:forTokens>
										   	<label>
									   			<input class="ml10" type="checkbox" name="additionalItem1" ${fn:trim(desc) eq addcheck1 ? 'checked' : ''} value="${fn:trim(desc)}" />
									   			${desc}
								   			</label>
										</c:forTokens>
										소득세를 제하지 않는 대리점인 경우 체크하세요
								</c:when>
								<c:when test="${setting.etc1Type eq 'file'}">
									<input type="file" ${setting.etc1Flag == 2 && !fn:contains(vo.additionalItem1, 'image/') ? 'required' : ''} name="etc1File" />
									<c:if test="${fn:contains(vo.additionalItem1, 'image/')}">
										<a href="${UPLOAD_ROOT }${vo.additionalItem1}">파일</a>
									</c:if>
								</c:when>
								<c:when test="${setting.etc1Type eq 'datepicker'}">
									<input type="text" ${setting.etc1Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem1" value="${vo.additionalItem1}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc1Type eq 'dtimepick'}">
									<input type="text" ${setting.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" class="datetimepicker" value="${vo.additionalItem1}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc1Type eq 'birthdate'}">
									<input type="text" ${setting.etc1Flag == 2 ? 'required' : ''} name="additionalItem1" class="datepicker" value="${vo.additionalItem1}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc1Type eq 'mobileno'}">
									<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
									<c:set var="mobileno" value="${fn:split(vo.additionalItem1, '-')}"/>
									<input type="text" name="phoneValueA1" class="inputPhone onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB1" class="inputPhone onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC1" class="inputPhone onlyNumber" value="${mobileno[2]}"/>
								</c:when>
								<c:when test="${setting.etc1Type eq 'address'}">
								<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
									<c:set var="addressno" value="${fn:split(vo.additionalItem1, '~')}"/>
									<input type="text" class="w30 mb5" name="zipCode1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
									<input type="text" class="w70 mb5" name="addrA1" readonly onclick="javascript:openSearchAddress('zipCode1', 'addrA1', 'addrB1');" value="${addressno[1] }" />
									<input type="text" class="w70" name="addrB1" value="${addressno[2] }" />
								</c:when>
								<c:when test="${setting.etc1Type eq 'email' }">
									<input type="hidden" name="additionalItem1" value="${vo.additionalItem1}" />
									<c:set var="semail" value="${fn:split(vo.additionalItem1, '@')}"/>
									<input type="text" name="emailValueA1" value="${semail[0] }" /> @ <input type="text" name="emailValueB1" value="${semail[1] }" />
								</c:when>
								
							</c:choose>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.etc2Flag > 0 }"> 
						<tr>
						<c:set var="required" />						
						<c:if test="${setting.etc2Flag == 2}">
							<c:set var="required"><span class="red">*</span></c:set>
						</c:if>	
							<th>${setting.etc2Name} ${required}</th>
							<td colspan="3">
							<input type="hidden" name="etc2Type" value="${setting.etc2Type }" />
							<input type="hidden" name="etc2Flag" value="${setting.etc2Flag }" />
								<c:choose>
									<c:when test="${setting.etc2Type eq 'text'}">
										<input  ${setting.etc2Flag == 2 ? 'required' : ''} type="text" class="w100" maxlength="${setting.etc2Size }" name="additionalItem2" placeholder="${setting.etc2Name }" value="${vo.additionalItem2 }" />
									</c:when>
									<c:when test="${setting.etc2Type eq 'textarea'}">
										<textarea  ${setting.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" maxlength="${setting.etc2Size }" placeholder="${setting.etc2Name }" class="w100">${vo.additionalItem2 }</textarea>
									</c:when>
									<c:when test="${setting.etc2Type eq 'select'}">
										<select ${setting.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" >
											<c:forTokens items="${setting.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc2Count-1}">
											   <option ${fn:trim(desc) eq vo.additionalItem2 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>
									</c:when>
									<c:when test="${setting.etc2Type eq 'radio'}">
											<c:forTokens items="${setting.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc2Count-1}">
											   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem2" ${desc eq vo.additionalItem2 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
											   ${desc}</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc2Type eq 'checkbox'}">
											<c:forTokens items="${setting.etc2Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc2Count-1}">
										   		<c:set var="addcheck2" />	
											  	<c:forTokens items="${vo.additionalItem3}" delims="," var="item" varStatus="s">
											   		<c:if test="${item eq desc}">
											   			<c:set var="addcheck2">${item}</c:set>
											   		</c:if>
											   	</c:forTokens>
											   	<label>
										   			<input class="ml10" type="checkbox" name="additionalItem2" ${fn:trim(desc) eq addcheck2 ? 'checked' : ''} value="${fn:trim(desc)}" />
										   			${desc}
									   			</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc2Type eq 'file'}">
										<input type="file" ${setting.etc2Flag == 2 && !fn:contains(vo.additionalItem2, 'image/') ? 'required' : ''} name="etc2File" />
										<c:if test="${fn:contains(vo.additionalItem2, 'image/')}">
											<a href="${UPLOAD_ROOT }${vo.additionalItem2}">파일</a>
										</c:if>
									</c:when>
									<c:when test="${setting.etc2Type eq 'datepicker'}">
										<input type="text" ${setting.etc2Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem2" value="${vo.additionalItem2}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc2Type eq 'dtimepick'}">
										<input type="text" ${setting.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" class="datetimepicker" value="${vo.additionalItem2}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc2Type eq 'birthdate'}">
										<input type="text" ${setting.etc2Flag == 2 ? 'required' : ''} name="additionalItem2" class="datepicker" value="${vo.additionalItem2}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc2Type eq 'mobileno'}">
										<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
										<c:set var="mobileno" value="${fn:split(vo.additionalItem2, '-')}"/>
										<input type="text" name="phoneValueA2" class="inputPhone onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB1" class="inputPhone onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC1" class="inputPhone onlyNumber" value="${mobileno[2]}"/>
									</c:when>
									<c:when test="${setting.etc2Type eq 'address'}">
									<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
										<c:set var="addressno" value="${fn:split(vo.additionalItem2, '~')}"/>
										<input type="text" class="w30 mb5" name="zipCode2" readonly onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
										<input type="text" class="w70 mb5" name="addrA2" readonly onclick="javascript:openSearchAddress('zipCode2', 'addrA2', 'addrB2');" value="${addressno[1] }" />
										<input type="text" class="w70" name="addrB2" value="${addressno[2] }" />
									</c:when>
									<c:when test="${setting.etc2Type eq 'email' }">
										<input type="hidden" name="additionalItem2" value="${vo.additionalItem2}" />
										<c:set var="semail" value="${fn:split(vo.additionalItem2, '@')}"/>
										<input type="text" name="emailValueA2" value="${semail[0] }" /> @ <input type="text" name="emailValueB1" value="${semail[1] }" />
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:if>
					<c:if test="${setting.etc3Flag > 0 }"> 
						<tr>
						<c:set var="required" />						
						<c:if test="${setting.etc3Flag == 2}">
							<c:set var="required"><span class="red">*</span></c:set>
						</c:if>	
							<th>${setting.etc3Name} ${required}</th>
							<td colspan="3">
							<input type="hidden" name="etc3Type" value="${setting.etc3Type }" />
							<input type="hidden" name="etc3Flag" value="${setting.etc3Flag }" />
								<c:choose>
									<c:when test="${setting.etc3Type eq 'text'}">
										<input  ${setting.etc3Flag == 2 ? 'required' : ''} type="text" class="w100" maxlength="${setting.etc3Size }" name="additionalItem3" placeholder="${setting.etc3Name }" value="${vo.additionalItem3 }" />
									</c:when>
									<c:when test="${setting.etc3Type eq 'textarea'}">
										<textarea  ${setting.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" maxlength="${setting.etc3Size }" placeholder="${setting.etc3Name }" class="w100">${vo.additionalItem3 }</textarea>
									</c:when>
									<c:when test="${setting.etc3Type eq 'select'}">
										<select ${setting.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" >
											<c:forTokens items="${setting.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc3Count-1}">
											   <option ${fn:trim(desc) eq vo.additionalItem3 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>
									</c:when>
									<c:when test="${setting.etc3Type eq 'radio'}">
											<c:forTokens items="${setting.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc3Count-1}">
											   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem3" ${desc eq vo.additionalItem3 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
											   ${desc}</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc3Type eq 'checkbox'}">
											<c:forTokens items="${setting.etc3Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc3Count-1}">
											  <c:set var="addcheck3" />	
											  <c:forTokens items="${vo.additionalItem3}" delims="," var="item" varStatus="s">
											   		<c:if test="${item eq desc}">
											   			<c:set var="addcheck3">${item}</c:set>
											   		</c:if>
											   </c:forTokens>
											   <label>
										   			<input class="ml10" type="checkbox" name="additionalItem3" ${fn:trim(desc) eq addcheck3 ? 'checked' : ''} value="${fn:trim(desc)}" />
										   			${desc}
									   			</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc3Type eq 'file'}">
										<input type="file" ${setting.etc3Flag == 2 && fn:contains(vo.additionalItem3, 'image/') ? 'required' : ''} name="etc3File" />
										<c:if test="${fn:contains(vo.additionalItem3, 'image/')}">
											<a href="${UPLOAD_ROOT }${vo.additionalItem3}">파일</a>
										</c:if>
									</c:when>
									<c:when test="${setting.etc3Type eq 'datepicker'}">
										<input type="text" ${setting.etc3Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem3" value="${vo.additionalItem3}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc3Type eq 'dtimepick'}">
										<input type="text" ${setting.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" class="datetimepicker" value="${vo.additionalItem3}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc3Type eq 'birthdate'}">
										<input type="text" ${setting.etc3Flag == 2 ? 'required' : ''} name="additionalItem3" class="datepicker" value="${vo.additionalItem3}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc3Type eq 'mobileno'}">
										<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
										<c:set var="mobileno" value="${fn:split(vo.additionalItem3, '-')}"/>
										<input type="text" name="phoneValueA3" class="inputPhone onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB3" class="inputPhone onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC3" class="inputPhone onlyNumber" value="${mobileno[2]}"/>
									</c:when>
									<c:when test="${setting.etc3Type eq 'address'}">
									<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
										<c:set var="addressno" value="${fn:split(vo.additionalItem3, '~')}"/>
										<input type="text" class="w30 mb5" name="zipCode3" readonly onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
										<input type="text" class="w70 mb5" name="addrA3" readonly onclick="javascript:openSearchAddress('zipCode3', 'addrA3', 'addrB3');" value="${addressno[1] }" />
										<input type="text" class="w70" name="addrB3" value="${addressno[2] }" />
									</c:when>
									<c:when test="${setting.etc3Type eq 'email' }">
										<input type="hidden" name="additionalItem3" value="${vo.additionalItem3}" />
										<c:set var="semail" value="${fn:split(vo.additionalItem3, '@')}"/>
										<input type="text" name="emailValueA3" value="${semail[0] }" /> @ <input type="text" name="emailValueB3" value="${semail[1] }" />
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:if>
					<c:if test="${setting.etc4Flag > 0 }"> 
						<tr>
						<c:set var="required" />						
						<c:if test="${setting.etc4Flag == 2}">
							<c:set var="required"><span class="red">*</span></c:set>
						</c:if>	
							<th>${setting.etc4Name} ${required}</th>
							<td colspan="3">
							<input type="hidden" name="etc4Type" value="${setting.etc4Type }" />
							<input type="hidden" name="etc4Flag" value="${setting.etc4Flag }" />
								<c:choose>
									<c:when test="${setting.etc4Type eq 'text'}">
										<input  ${setting.etc4Flag == 2 ? 'required' : ''} type="text" class="w100" maxlength="${setting.etc4Size }" name="additionalItem4" placeholder="${setting.etc4Name }" value="${vo.additionalItem4 }" />
									</c:when>
									<c:when test="${setting.etc4Type eq 'textarea'}">
										<textarea  ${setting.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" maxlength="${setting.etc4Size }" placeholder="${setting.etc4Name }" class="w100">${vo.additionalItem4 }</textarea>
									</c:when>
									<c:when test="${setting.etc4Type eq 'select'}">
										<select ${setting.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" >
											<c:forTokens items="${setting.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc4Count-1}">
											   <option ${fn:trim(desc) eq vo.additionalItem4 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
											</c:forTokens>
										</select>
									</c:when>
									<c:when test="${setting.etc4Type eq 'radio'}">
											<c:forTokens items="${setting.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc4Count-1}">
											   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem4" ${desc eq vo.additionalItem4 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
											   ${desc}</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc4Type eq 'checkbox'}">
											<c:forTokens items="${setting.etc4Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc4Count-1}">
										   		<c:set var="addcheck4" />	
											  	<c:forTokens items="${vo.additionalItem3}" delims="," var="item" varStatus="s">
											   		<c:if test="${item eq desc}">
											   			<c:set var="addcheck4">${item}</c:set>
											   		</c:if>
											   	</c:forTokens>
											   	<label>
										   			<input class="ml10" type="checkbox" name="additionalItem4" ${fn:trim(desc) eq addcheck4 ? 'checked' : ''} value="${fn:trim(desc)}" />
										   			${desc}
									   			</label>
											</c:forTokens>
									</c:when>
									<c:when test="${setting.etc4Type eq 'file'}">
										<input type="file" ${setting.etc4Flag == 2 && !fn:contains(vo.additionalItem4, 'image/') ? 'required' : ''} name="etc4File" />
										<c:if test="${fn:contains(vo.additionalItem4, 'image/')}">
											<a href="${UPLOAD_ROOT }${vo.additionalItem4}">파일</a>
										</c:if>
									</c:when>
									<c:when test="${setting.etc4Type eq 'datepicker'}">
										<input type="text" ${setting.etc4Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem4" value="${vo.additionalItem4}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc4Type eq 'dtimepick'}">
										<input type="text" ${setting.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" class="datetimepicker" value="${vo.additionalItem4}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc4Type eq 'birthdate'}">
										<input type="text" ${setting.etc4Flag == 2 ? 'required' : ''} name="additionalItem4" class="datepicker" value="${vo.additionalItem4}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									</c:when>
									<c:when test="${setting.etc4Type eq 'mobileno'}">
										<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
										<c:set var="mobileno" value="${fn:split(vo.additionalItem4, '-')}"/>
										<input type="text" name="phoneValueA4" class="inputPhone onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB4" class="inputPhone onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC4" class="inputPhone onlyNumber" value="${mobileno[2]}"/>
									</c:when>
									<c:when test="${setting.etc4Type eq 'address'}">
									<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
										<c:set var="addressno" value="${fn:split(vo.additionalItem4, '~')}"/>
										<input type="text" class="w30 mb5" name="zipCode4" readonly onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
										<input type="text" class="w70 mb5" name="addrA4" readonly onclick="javascript:openSearchAddress('zipCode4', 'addrA4', 'addrB4');" value="${addressno[1] }" />
										<input type="text" class="w70" name="addrB4" value="${addressno[2] }" />
									</c:when>
									<c:when test="${setting.etc4Type eq 'email' }">
										<input type="hidden" name="additionalItem4" value="${vo.additionalItem4}" />
										<c:set var="semail" value="${fn:split(vo.additionalItem4, '@')}"/>
										<input type="text" name="emailValueA4" value="${semail[0] }" /> @ <input type="text" name="emailValueB4" value="${semail[1] }" />
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:if>
					<c:if test="${setting.etc5Flag > 0 }"> 
					<tr>
					<c:set var="required" />						
					<c:if test="${setting.etc5Flag == 2}">
						<c:set var="required"><span class="red">*</span></c:set>
					</c:if>	
						<th>${setting.etc5Name} ${required}</th>
						<td colspan="3">
						<input type="hidden" name="etc5Type" value="${setting.etc5Type }" />
						<input type="hidden" name="etc5Flag" value="${setting.etc5Flag }" />
							<c:choose>
								<c:when test="${setting.etc5Type eq 'text'}">
									<input  ${setting.etc5Flag == 2 ? 'required' : ''} type="text" class="w100" maxlength="${setting.etc5Size }" name="additionalItem5" placeholder="${setting.etc5Name }" value="${vo.additionalItem5 }" />
								</c:when>
								<c:when test="${setting.etc5Type eq 'textarea'}">
									<textarea  ${setting.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" maxlength="${setting.etc5Size }" placeholder="${setting.etc5Name }" class="w100">${vo.additionalItem5 }</textarea>
								</c:when>
								<c:when test="${setting.etc5Type eq 'select'}">
									<select ${setting.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" >
										<c:forTokens items="${setting.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc5Count-1}">
										   <option ${fn:trim(desc) eq vo.additionalItem5 ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
										</c:forTokens>
									</select>
								</c:when>
								<c:when test="${setting.etc5Type eq 'radio'}">
										<c:forTokens items="${setting.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc5Count-1}">
										   <label for="r${s.index }"><input class="ml10" type="radio" name="additionalItem5" ${desc eq vo.additionalItem5 ? 'checked' : ''} id="r${s.index }" value="${fn:trim(desc)}" />
										   ${desc}</label>
										</c:forTokens>
								</c:when>
								<c:when test="${setting.etc5Type eq 'checkbox'}">
										<c:forTokens items="${setting.etc5Desc}" delims="," var="desc" varStatus="s" begin = "0" end = "${setting.etc5Count-1}">
										   	<c:set var="addcheck5" />	
										  	<c:forTokens items="${vo.additionalItem5}" delims="," var="item" varStatus="s">
										   		<c:if test="${item eq desc}">
										   			<c:set var="addcheck5">${item}</c:set>
										   		</c:if>
										   	</c:forTokens>
										   	<label>
									   			<input class="ml10" type="checkbox" name=additionalItem5 ${fn:trim(desc) eq addcheck5 ? 'checked' : ''} value="${fn:trim(desc)}" />
									   			${desc}
							   				</label>
										</c:forTokens>
								</c:when>
								<c:when test="${setting.etc5Type eq 'file'}">
									<input type="file" ${setting.etc5Flag == 2 && !fn:contains(vo.additionalItem5, 'image/') ? 'required' : ''} name="etc5File" />
									<c:if test="${fn:contains(vo.additionalItem5, 'image/')}">
										<a href="${UPLOAD_ROOT }${vo.additionalItem5}">파일</a>
									</c:if>
								</c:when>
								<c:when test="${setting.etc5Type eq 'datepicker'}">
									<input type="text" ${setting.etc5Flag == 2 ? 'required' : ''} class="datepicker" name="additionalItem5" value="${vo.additionalItem5}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc5Type eq 'dtimepick'}">
									<input type="text" ${setting.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" class="datetimepicker" value="${vo.additionalItem5}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc5Type eq 'birthdate'}">
									<input type="text" ${setting.etc5Flag == 2 ? 'required' : ''} name="additionalItem5" class="datepicker" value="${vo.additionalItem5}" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
								</c:when>
								<c:when test="${setting.etc5Type eq 'mobileno'}">
									<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
									<c:set var="mobileno" value="${fn:split(vo.additionalItem5, '-')}"/>
									<input type="text" name="phoneValueA5" class="inputPhone onlyNumber" value="${mobileno[0]}" /> - <input type="text" name="phoneValueB5" class="inputPhone onlyNumber" value="${mobileno[1]}"/> - <input type="text" name="phoneValueC5" class="inputPhone onlyNumber" value="${mobileno[2]}"/>
								</c:when>
								<c:when test="${setting.etc5Type eq 'address'}">
								<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
									<c:set var="addressno" value="${fn:split(vo.additionalItem5, '~')}"/>
									<input type="text" class="w30 mb5" name="zipCode5" readonly onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" value="${addressno[0] }" /><a onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
									<input type="text" class="w70 mb5" name="addrA5" readonly onclick="javascript:openSearchAddress('zipCode5', 'addrA5', 'addrB5');" value="${addressno[1] }" />
									<input type="text" class="w70" name="addrB5" value="${addressno[2] }" />
								</c:when>
								<c:when test="${setting.etc5Type eq 'email' }">
									<input type="hidden" name="additionalItem5" value="${vo.additionalItem5}" />
									<c:set var="semail" value="${fn:split(vo.additionalItem5, '@')}"/>
									<input type="text" name="emailValueA5" value="${semail[0] }" /> @ <input type="text" name="emailValueB5" value="${semail[1] }" />
								</c:when>
							</c:choose>
						</td>
					</tr>
					</c:if>
					<c:if test="${setting.jobFlag > 0 }">
						<tr>
							<th>직업</th>
							<td colspan="3">
								<select ${setting.jobFlag == 2 ? 'required' : ''} name="job" >
									<c:forTokens items="${setting.jobType}" delims="," var="desc" varStatus="s" begin = "0">
									   <option ${fn:trim(desc) eq vo.job ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
									</c:forTokens>
								</select>
							</td>
						</tr>	
					</c:if>
					<c:if test="${setting.educationFlag > 0 }">
						<tr>
							<th>학력</th>
							<td colspan="3">
								<select ${setting.educationFlag == 2 ? 'required' : ''} name="education" >
									<c:forTokens items="${setting.educationType}" delims="," var="desc" varStatus="s" begin = "0">
									   <option ${fn:trim(desc) eq vo.education ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
									</c:forTokens>
								</select>
							</td>
						</tr>	
					</c:if>	
					<c:if test="${setting.incomeFlag > 0 }">
						<tr>
							<th>월평균소득</th>
							<td colspan="3">
								<select ${setting.incomeFlag == 2 ? 'required' : ''} name="monthIncome" >
									<c:forTokens items="${setting.incomeType}" delims="," var="desc" varStatus="s" begin = "0">
									   <option ${fn:trim(desc) eq vo.monthIncome ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
									</c:forTokens>
								</select>
							</td>
						</tr>	
					</c:if>	
					<c:if test="${setting.interestFlag > 0 }">
						<tr>
							<th>관심분야</th>
							<td colspan="3">
								<select ${setting.interestFlag == 2 ? 'required' : ''} name="hobby" >
									<c:forTokens items="${setting.interestType}" delims="," var="desc" varStatus="s" begin = "0">
									   <option ${fn:trim(desc) eq vo.hobby ? 'selected' : ''} value="${fn:trim(desc)}">${desc}</option>
									</c:forTokens>
								</select>
							</td>
						</tr>	
					</c:if>			
					<tr>
						<th>관리자메모</th>
						<td colspan="3">
							<textarea name="memoAdmin" class="w100" rows="5">${vo.memoAdmin }</textarea>
						</td>
					</tr>
					<tr> 
						<th>은행 <span class="red bold">*</span></th>
						<td colspan="3">
							<select class="w50" name="bank" >
								<option value="0">은행</option>
								<c:forEach items="${bankList}" var="m" varStatus="s">
									<option ${vo.bank eq m.codeName ? 'selected' : ''} value="${m.codeName }">${m.codeName }</option>
								</c:forEach>
							</select>
						<%-- <input required type="text" name="bank" class="w50" maxlength="24" value="${vo.bank }"/></td> --%>
					</tr>
					<tr> 
						<th>계좌번호 <span class="red bold">*</span></th>
						<td colspan="3"><input required type="text" name="bankAccount" class="w50 onlyNumber" maxlength="24" value="${vo.bankAccount }"/></td>
					</tr>
					<tr> 
						<th>예금주명 <span class="red bold">*</span></th>
						<td colspan="3"><input required type="text" name="accountOwner" class="w50" maxlength="24" value="${vo.accountOwner }"/></td>
					</tr>
					<tr> 
						<th>메일수신으로</th>
						<td colspan="3">
							<input type="checkbox" name="transEmail" value="Y">
							<input name="transEmailYn" type="hidden" value="거래 확인서를 메일로 받겠습니다." />
							<span>거래 확인서를 메일로 받겠습니다.</span>
						</td>
						<script>
						$(function() {
							checkCheckbox('transEmail', 'transEmailYn', '${vo.transEmailYn}', 'N');
						});
						</script>
					</tr>
				</tbody>
			</table>
		</form>
		<br class="clear mb5" />
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './member_list.do', {glevel:${search.glevel}});" class="btn2 bg_darkgray">목록</a></li>
		</ul>
	</div>	
</div>
<script type="text/javascript">

$(document).ready(function() {
	$('#form1').validate();
});
//List grade JSON
var listg = '${listG}';

//List duplicate grade level JSON
var sameg = '${sameGrade}';
var same_grade = JSON.parse(sameg);
for (var i = 0; i < same_grade.length; i++) {
    var element = same_grade[i];
    var maxs = 0;
    var i;
    for (i = 0; element.gradeLevel > i; i++) {
    	if (element.gradeLevel > maxs) {
    	    maxs = element.gradeLevel;
    	}
    }
}

var recomm = parseInt(${vo.recommUlevel});
var grade = parseInt($('input[name=gradeLevel]').val());
var low_member = '${lowGrade}';
var compare = grade - recomm; 
$(document).ready(function() {
	if(compare > 1 && compare != 2){
		$("<a onclick='javascript:doChangeGrade("+recomm+");' id='change_grade_btn' class='btn btn_round bg_darkgray ml20'>대리점으로 변경</a>").insertAfter($('#changeG'));
	} else if (recomm == maxs-1 && grade == maxs+1 || recomm == maxs && grade == low_member ){
		var empty = '<tr id="nickn"></tr>'
		$('#nickn').replaceWith(empty);
	}else if(compare > 1){
		$("<a onclick='javascript:doChangeGrade("+recomm+");' id='change_grade_btn' class='btn btn_round bg_darkgray ml20'>대리점으로 변경</a>").insertAfter($('#changeG'));
	}
}); 
if($('input[name=mseq]').val() <= 0){
	$('#gradeRole').change(function(){
		var rownickname = $("<tr id='nickn'>");
		var row = '<th>대리점코드<span class="red bold">*</span></th>'
					+'<td  colspan="3" id="checknickname">'
						+'<input type="text" class="w50" name="nickname" maxlength="100" value="${vo.nickname}">'
						+'<span class="ml10 mt10 blue" id="checkAgent"></span>'
					+'</td>';
		var append = rownickname.append(row).closest("tr")
		if($('#gradeRole').val() < low_member && $('#gradeRole').val() != 0){
			$('#nickn').replaceWith(append);
			$('input[name=nickname]').trigger('input');
		}else {
			var empty = '<tr id="nickn"></tr>'
			$('#nickn').replaceWith(empty);
		}
	});
}

function change (){
	var rec = $("<tr>");
	var rec_row = '<th>추천인  ${setting.recommendFlag == 2 ? "<span class=\"red bold\">*</span>" : ""}</th>'
					+'<td  colspan="3" id="checknickname">'
						+'${vo.recommNickname }'
						+'<span id="recommLname">'
						+'<c:forEach items="${grade }" var="s" varStatus="r">'
							+'<c:if test="${s.gradeLevel eq vo.recommUlevel}">'
								+'(${s.gradeMemo }) '
							+'</c:if>'
						+'</c:forEach>'
							+'<c:if test="${vo.recommUlevel eq 1}">'
								+'(${vo.recommUname}) '
							+'</c:if>'
						+'</span>'
					+'</td>';
	rec.append(rec_row);
	$('#recommend').replaceWith(rec).closest("tr");	
}
//Change level
function doChangeGrade (rul){
	var userLevel = '${vo.gradeLevel}';
	var changeLevel = parseInt(rul) + 1;
	
	$.each($.parseJSON(listg), function (key, text) {
		if(key == changeLevel){
			$.ajax({
				type : 'post',
				url : '/ajax/grade.do',
				data : {
					gradeLevel : key
				},
				dataType : 'json',
				success : function(data) {
					if(key == maxs || key == (maxs + 1)){
						var branch = $("<tr>");
						var radio_row = '<th>회원등급</th>'
											+'<td  colspan="3" id="afterthat">'
												+'<span><label><input type="radio" name="line" checked value="4"/>지점</label></span>'
											+'</td>';
						branch.append(radio_row);
						$('#afterthat').replaceWith(branch).closest("tr").append($('input[name=line]').val());
						if(userLevel < low_member)
							change();
					} else{
						$('#user_level').text(data.result.gradeName);
						$('input[name=gradeLevel]').val(key);
						if(userLevel < low_member)
							change();
					}
					if(isNull($('input[name=nickname]').val())){
						var nicknameRow = $("<tr>");
						var row = '<th>대리점코드<span class="red bold">*</span></th>'
									+'<td  colspan="3" id="checknickname">'
										+'<input type="text" class="w50" name="nickname" maxlength="100" value="${vo.nickname}">'
										+'<span class="ml10 mt10 blue" id="checkAgent"></span>'
									+'</td>';
						nicknameRow.append(row);
						nicknameRow.insertAfter($('#afterthat').closest("tr"));
						$('input[name=nickname]').trigger('input');
					}
				}
			});
		}
	});
};
	

//Agent Exist 
var user_mseq = '${search.mseq}';
$(document).on('input change', 'input[name=nickname]' , function(){
	agentCode($('input[name=nickname]').val(), $('#checkAgent'));
});

$('input[name=recommUserIds]').on('input change', function(){
	agentCode($('input[name=recommUserIds]').val(), $('#recommCheck'), $('#reUlevel'));
});
if(user_mseq <= 0){
	$('#gradeRole').on('input change', function(){
		agentCode($('input[name=recommUserIds]').val(), $('#recommCheck'), $('#reUlevel'));
	});
}
if(isNull($('input[name=recommUserIds]'))){
	$('#recommLname').text('');
}
function agentCode(checkNickname, checkMsg, gradeName){
	var nickName = trim(checkNickname);
	if (nickName != '') {
		$.ajax({
			type : 'post',
			url : '/ajax/checkNickname.do',
			data : {
				nickname : nickName
			},
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					if(!isNull(gradeName)){
						if(user_mseq <= 0){
							var userlevel = $('#gradeRole').val();
						}else{
							var userlevel = '${vo.gradeLevel}';
							
						};
						if((data.result.gradeLevel >= userlevel) || (data.result.gradeLevel == maxs && (userlevel == maxs +1 || $('input[name=gradeLevel]').val()== maxs +1)) || data.result.gradeLevel >= $('input[name=gradeLevel]').val()){
							$(gradeName).parent().children('span:last').hide();
							$(gradeName).text('('+data.result.gradeName+')');
							$(checkMsg).attr('class', 'ml10 mt10 red bold');
							$(checkMsg).text( '추천인의 등급이 회원등급 이하 등급 입니다.');
							$('#change_grade_btn').replaceWith($("<a id='change_grade_btn'></a>"));
						}else{
							$(gradeName).parent().children('span:last').hide();
							$(gradeName).text('('+data.result.gradeName+')');
							$(checkMsg).attr('class', 'ml10 mt10 blue bold');
							$(checkMsg).text( '등록된 추천인입니다.');	
							$('input[name=recommUserId]').val(data.result.userID);
							$('input[name=recommUlevel]').val(data.result.gradeLevel);

							if(userlevel - data.result.gradeLevel > 1 && userlevel - data.result.gradeLevel != 2){
								$('#change_grade_btn').replaceWith($("<a onclick='javascript:doChangeGrade("+$('input[name=recommUlevel]').val()+");' id='change_grade_btn' class='btn btn_round bg_darkgray ml20'>대리점으로 변경</a>"));
							} else if (data.result.gradeLevel == maxs-1 && userlevel == maxs + 1 || data.result.gradeLevel == maxs && userlevel == low_member){
								$('#change_grade_btn').replaceWith($("<a id='change_grade_btn'></a>"));
							} else if (userlevel - data.result.gradeLevel > 2){
								$('#change_grade_btn').replaceWith($("<a onclick='javascript:doChangeGrade("+$('input[name=recommUlevel]').val()+");' id='change_grade_btn' class='btn btn_round bg_darkgray ml20'>대리점으로 변경</a>"));
							}
						}
					}else {
						if(data.result.nickname == '${vo.nickname}'){
							$(checkMsg).attr('class', 'ml10 mt10 blue bold');
							$(checkMsg).text( '사용 가능한 대리점코드 입니다.');
						}else{
							$(checkMsg).attr('class', 'ml10 mt10 red bold');
							$(checkMsg).text( '사용 불가능한 대리전코드 입니다.');
						}
					}		
				} else {
					if(!isNull(gradeName)){
						$(checkMsg).attr('class', 'ml10 mt10 red bold');
						$(checkMsg).text( '사용 불가능한 대리전코드 입니다.');
						$(gradeName).empty();
					}else {
						$(checkMsg).attr('class', 'ml10 mt10 blue bold');
						$(checkMsg).text( '사용 가능한 대리점코드 입니다.');
					}
				}
			}
		});
	}else {
		$(checkMsg).empty();
		$('#recommLname').empty();
		if(!isNull(gradeName)){
			$(gradeName).empty();}
	} 
}; 

function doCheck(type) {
	checkUserId('#idchk', 'input[name=checkedMem]', type, $('input[name=userId]').val().trim());
}
function doSubmit() {
	
	
	if (!isNull($('input[name=phoneA]').val())) {
		var $phone = $('input[name=phoneA]').val() + '-' + $('input[name=phoneB]').val() + '-' + $('input[name=phoneC]').val();
		$('input[name=phone]').val($phone);
	}
	if (!isNull($('input[name=mobileA]').val())) {
		var $mobile = $('input[name=mobileA]').val() + '-' + $('input[name=mobileB]').val() + '-' + $('input[name=mobileC]').val();
		$('input[name=mobile]').val($mobile);
	}
	
	if ($('input[name=mseq]').val() <= 0) {
		if ($('input[name=checkedMem]').val() != 'Y') {
			alert('아이디 중복검사를 해야 합니다.');
			return;
		}
		if($('input[name=userPwd]').val() != ''){
			if(!checkPattern($('input[name=userPwd]').val(), 'PASSWORD')){
				alert("오류 : 비밀번호는 대문자 ( !@#$%^&\*)를 하나 이상 포함해야합니다!");
				$('input[name=userPwd]').focus();
				return false;
			}
		}
		if(!isNull($('#gradeRole').val()) && $('#gradeRole').val() === '0'){
			alert('아이디 중복검사를 해야 합니다.');
			$('#gradeRole').focus();
			return;
		}
		if($('#gradeRole').val() > 0 && $('#gradeRole').val() < 6 ){
			if ($('#checkAgent').prop('class').indexOf('blue') < 0) {
				alert('대리점 코드를 확인하고 다시 입력해 주세요.');
				$('input[name=nickname]').focus();
				return;
			}
		}
		
	}
	if (!isNull($('input[name=line]').val())) {
		var value = $("form input[name=line]:checked").val();
		$('input[name=gradeLevel]').val(value);
	}
	if(!isNull($('input[name=recommUserIds]')) && $('input[name=gradeLevel]').val() >= low_member ){
		if ($('#recommCheck').prop('class').indexOf('blue') < 0) {
			alert('추천인을 확인하고 다시 입력해 주세요.');
			$('input[name=recommUserIds]').focus();
			return;
		}
	}
	
	if ($('input[name=mseq]').val() <= 0){
		if(!isNull($('input[name=nickname]').val()) && $('#gradeRole').val() != low_member){
			if ($('#checkAgent').prop('class').indexOf('blue') < 0) {
				alert('대리점 코드를 확인하고 다시 입력해 주세요.');
				$('input[name=nickname]').focus();
				return;
			}
		}else if(isNull($('input[name=nickname]').val()) && $('#gradeRole').val() != low_member){
			$('input[name=nickname]').focus();
			alert('대리점코드를 입력하세요.');
			return;
		}
	} else {
		if(!isNull($('input[name=nickname]').val()) && $('input[name=gradeLevel]').val() != low_member){
			if ($('#checkAgent').prop('class').indexOf('blue') < 0) {
				alert('대리점 코드를 확인하고 다시 입력해 주세요.');
				$('input[name=nickname]').focus();
				return;
			}
		}else if(isNull($('input[name=nickname]').val()) && $('input[name=gradeLevel]').val() != low_member){
			$('input[name=nickname]').focus();
			alert('대리점코드를 입력하세요.');
			return;
		}
	}
	
	if ($('select[name=bank]').val() == 0){
		$('select[name=bank]').focus();
		alert('은행을 선택해주세요.');
		return;
	}
	
	if (isNull($('input[name=bankAccount]').val())){
		$('input[name=bankAccount]').focus();
		alert('계좌번호를 입력하세요.');
		return;
	}
	
	if (isNull($('input[name=accountOwner]').val())){
		$('input[name=accountOwner]').focus();
		alert('예금주명을 입력하세요.');
		return;
	}
	if($('input[name=transEmail]').prop('checked')){
		if(isNull($('input[name=email]').val())){
			$('input[name=email]').focus();
			alert('이메일를 입력하세요.');
			return;
		}
	} 
	
	
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
	
	if (!confirm('저장하시겠습니까?')) 
		return;
	
	$('#form1').submit();
	
}

function rechargeCash(){
	var cash = $('input[name=cash]').val();
	var userid = $('input[name=userId]').val();
	var memo = $('input[name=memo]').val();
	
	if(!cash){
		alert('CASH 입력하세요');
		return false;
	}

	if(!memo){
		memo = "관리자 지급";
	}

	$.ajax({
		type : 'post',
		url : '/mgr/ajax/addCash',
		data : {
			'uid':userid,
			'cash':cash,
			'memo':memo
		},
		dataType : 'json',
		success : function(data) {
			alert('CASH추가 되었습니다.');
			location.reload()
			//$('#cash').html('data')
		}
		});
}

function showCashLog(userId){
	openPop('?userId=' + userId, 'memberSupportCashHistory');
}

</script>


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>