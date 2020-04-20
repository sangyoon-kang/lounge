<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 기본설정 - 기본설정
--%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>기본 설정</h2>
			<p>홈  &gt; 환경설정  &gt; 기본설정</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">최종 업데이트 일시 :
<c:if test="${empty tagoplusSolution1_session_site.modDate }">
				<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_TIME_FORMAT }"/>
</c:if>
<c:if test="${!empty tagoplusSolution1_session_site.modDate }">
				<fmt:formatDate value="${tagoplusSolution1_session_site.modDate }" pattern="${DATE_TIME_FORMAT }"/>
</c:if>
			</h3>
			<br class="clear mb5" />
			
			<h3 class="scon_tit2">라이선스</h3>
			<table id="tblLicense" class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                    <col width="15%" />
                </colgroup>
                <tbody>
                    <tr id="trLicense">
                        <th>라이선스 키</th>
<c:if test="${!tagoplusSolution1_session_site.certified }">                        
                        <td>
                        	<input type="text" name="certKey" class="w100" />
                        </td>
                        <td class="center">
                        	<a onclick="javascript:doCert();" class="btn btn_round bg_purple">라이선스 인증</a>
                        </td>
</c:if>
<c:if test="${tagoplusSolution1_session_site.certified }">
						<td colspan="2">
							인증되었습니다.
						</td>
</c:if>
                    </tr>
				</tbody>
			</table>
			<div>- 라이선스를 등록하지 않을 경우, 14일 이후부터 관리자 기능을 사용할 수 없습니다.</div>
			<div>- 도메인이 변경될 경우 라이선스 키를 다시 발급받아야 합니다.</div>
			<div>- 라이선스 구매 안내 : <s:eval expression="@globals['admin.keynumber']" /></div>
			<br class="clear mb5" />
			
			<form id="form1" action="./sys_config_proc" method="post">
			<h3 class="scon_tit2">사이트 기본정보</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <!-- 
                        <th>관리자 로고</th>
                        <td>
                        	<input type="file" name="filename1" class="test w40 mr20" /> 
                        	<span>파일명 </span>
                        </td> 
                        -->
                        <th>관리자 로고</th>
                        <td>
                        	<input type="text" name="adminTitleUrl" class="w40 mr20" value="${tagoplusSolution1_session_site.adminTitleUrl }" /> 
                        </td>
                    </tr>
                    <tr>
                    	<th>관리자 푸터</th>
                        <td><input type="text" name="adminCopyright" class="w40" value="${tagoplusSolution1_session_site.adminCopyright }" /></td>
                    </tr>
                    
				</tbody>
			</table>
			<br class="clear mb5" />

<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser' }">			
			<h3 class="scon_tit2">슈퍼유저 계정</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr id="trSu">
                        <th>아이디</th>
                        <td>
                        	<input type="text" name="suId" oid="${tagoplusSolution1_session_site.suId }" class="w100p mr10" value="${tagoplusSolution1_session_site.suId }"/><a onclick="javascript:doCheck('su');" class="btn btn_round bg_darkgray">중복검사</a>
                        	<input type="hidden" name="checkedSu" />
                        </td>
                    </tr>
                    <tr>
                    	<th>비밀번호</th>
                        <td><input type="password" name="suPwd" class="w100p"  /></td>
                    </tr>                    
				</tbody>
			</table>
			<br class="clear mb5" />
</c:if>
<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser' || tagoplusSolution1_session_admin.userType eq 'designer'}">			
			<h3 class="scon_tit2">디자이너 계정</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr id="trDs">
                        <th>아이디</th>
                        <td>
                        	<input type="text" name="dsId" oid="${tagoplusSolution1_session_site.dsId }" class="w100p mr10" value="${tagoplusSolution1_session_site.dsId }"/><a onclick="javascript:doCheck('ds');" class="btn btn_round bg_darkgray">중복검사</a>
                        	<input type="hidden" name="checkedDs" />
                        </td>
                    </tr>
                    <tr>
                    	<th>비밀번호</th>
                        <td><input type="password" name="dsPwd" class="w100p"  /></td>
                    </tr>                    
				</tbody>
			</table>
			<div>- 슈퍼유저, 디자이너 계정만 환경설정 메뉴가 나타납니다.</div>
			<br class="clear mb5" />
</c:if>			
			
			
			<%-- <h3 class="scon_tit2">메뉴 사용 여부</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th>메뉴</th>
                        <td>
주의 : 기본 페이지 url 하드코딩 필요
							<tt:checkboxes name="useMenu" class="ml20" list="${useMenus }" listKey="menuIdx" listValue="menuName" checked="${tagoplusSolution1_session_site.useMenus }"/>
							<tt:checkboxes name="useMenu" class="ml20" list="${useMenus }" listKey="codeCode" listValue="codeName" checked="${tagoplusSolution1_session_site.useMenus }"/>
                        </td>
                    </tr>
				</tbody>
			</table> --%>
			<br class="clear mb5" />
			
			<h3 class="scon_tit2">포인트 사용 여부</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                    <tr>
                        <th>포인트 사용</th>
                        <td>
                        	<tt:radios name="pointYn" list="${pointYns }" class="ml20" listKey="value" listValue="text" checked="${tagoplusSolution1_session_site.pointYn }"/> 
                        </td>
                    </tr>
				</tbody>
			</table>
			<br class="clear mb5" />
			
			<div class="hide">
				1. ${pageContext.request.requestURI }<br/>
				2. ${pageContext.request.servletPath }<br/>
				3. ${pageContext.request.remoteAddr }<br/>
				4. ${pageContext.request.contextPath }<br/>
				5. ${pageContext.request.requestURL }<br/>
				
				6. ${pageContext.request.characterEncoding }<br/>
				7. ${pageContext.request.servletContext.contextPath }<br/>
				
				8. ${requestScope.name }<br/>
				9. ${applicationScope.name }<br/>
			</div>
			<ul class="summmit_btn">
				<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">확인</a></li>
			</ul>
		</form>	
		</div>
	</div>
	<!--wrap_scon E-->
	
	<script type="text/javascript">
		$(function() {
		});
		
		function doCert() {
			oLoader('#tblLicense'
				, '${URL_ADMIN_ROOT}/ajax/license/certify'
				, 'post'
				, {
					key: $('input[name=certKey]').val()
				}
				, false
				, function(data) {
					if (data.result) {
						alert('인증되었습니다.');
						var $th = $('<th>라이선스 키</th>');
						var $td = $('<td colspan="2">인증되었습니다.</td>');
						$('#trLicense').empty().append($th).append($td);
					}
					else {
						alert('인증되지 않았습니다.\n올바른 라이선스 키를 입력해 주세요.');
					}
				}
			);
		}
		
		function doCheck(idType) {
			if (idType == 'su')
				checkUserId('#trSu', 'input[name=checkedSu]', idType, $('input[name=suId]').val().trim());
			else if (idType == 'ds')
				checkUserId('#trDs', 'input[name=checkedDs]', idType, $('input[name=dsId]').val().trim());
		}
		
		function doSubmit() {
			var $suId = $('input[name=suId]');
			var $dsId = $('input[name=dsId]');
			
			if ($suId.val() != $suId.attr('oid') && $('input[name=checkedSu]').val() != 'Y') {
				alert('슈퍼유저 아이디 중복검사를 해야 합니다.');
				return;
			}
			
			if ($dsId.val() != $dsId.attr('oid') && $('input[name=checkedDs]').val() != 'Y') {
				alert('디자이너 아이디 중복검사를 해야 합니다.');
				return;
			}
			
			
			//Removed By Mongolian Team 18-11-28
			/* if ($('input[name=useMenu]:checked').length == 0) {
				alert('사용할 메뉴를 한 개 이상 선택해야 합니다.');
				return;
			} */
			
			
			if (!confirm('저장하시겠습니까?'))
				return;
			
			$('#form1').submit();
		}
	</script>

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>