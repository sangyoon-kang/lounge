<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>
<div id="wrap_scon">

	<div class="scon">

		<form id="form1" action="./member_proc.do" method="post" enctype="multipart/form-data">
			<table class="board_write" id="write_member">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
				<tr id="idchk">
					<th>아이디 <span class="red bold">*</span></th>
					<td>
						<input type="text" name="userId"  value="${vo.userId }" readonly class="w30" maxlength="24" />
						<input type="hidden" name="checkedMem" />
					</td>
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
				<%--					<c:if test="${setting.phoneFlag > 0 }"> --%>
				<tr>
					<th>전화번호  ${setting.phoneFlag == 2 ? '<span class=\"red bold\">*</span>' : ''}</th>
					<td colspan="3">
						<c:set var="wphone" value="${fn:split(vo.phone, '-')}"/>
						<input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneA"  class="w10 inputPhone onlyNumber" value="${wphone[0]}"/>  -  <input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneB" class="w10 inputPhone onlyNumber" value="${wphone[1]}" />  -  <input ${setting.phoneFlag == 2 ? 'required' : ''} type="text" name="phoneC"  class="w10 inputPhone onlyNumber" value="${wphone[2]}" />
					</td>
				</tr>
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

