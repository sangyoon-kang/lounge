<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	기본설정 > 관리자 설정 - 등록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>관리자 설정</h2>
		<p>홈 &gt; 기본설정 &gt; 관리자 설정</p>
	</div>

	<div class="scon">

		<form id="form1" action="./admin_proc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="phone" value="" />
			<input type="hidden" name="mobile" value="" />
			<input type="hidden" name="aid" value="${search.aid }" />
			
			<table class="board_write">
				<colgroup>
					<col width="15%" />
					<col width="35%" />
					<col width="15%" />
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr id="idchk">
					<th><span class="red">*</span> 아이디</th>
						<td>
						<c:set var="ck" />
						<c:if test="${!empty search.aid}"> 
						<c:set var="ck">readonly</c:set>	
						</c:if>						
							<input type="text" name="adminId"  value="${vo.adminId }" ${ck } class="w50" />
							<input type="hidden" name="checkedAd" />
						<c:if test="${empty search.aid}"> 
							<a onclick="javascript:doCheck('user');" class="btn btn_round bg_darkgray ml5">중복 체크</a>
						</c:if>	
						</td>
						<th><span class="red">*</span> 비밀번호</th>
						<td><input type="password" name="adminPwd" class="w50" /></td>
					</tr>
					<tr>
						<th><span class="red">*</span> 이름</th>
						<td><input type="text" name="adminName" class="w50" value="${vo.adminName }" /></td>
						<th><span class="red">*</span> 이메일</th>
						<td><input type="text" name="email" class="w50" value="${vo.email }" /></td>
					</tr>
					<tr>
						<th>관리자아이콘</th>
						<td>
							<input type="file" name="iconfile" />
								<c:choose>
									<c:when test="${fn:contains(vo.icon, 'image/')}">
															<a href="${UPLOAD_ROOT }${vo.icon}">파일</a>
									</c:when>
									<c:otherwise>
															
									</c:otherwise>
								</c:choose>
						</td>
						<th>권한관리(좌)</th>
						<td><tt:select list="${grade }" name="authGroupIdx" listKey="idX" listValue="authoTitle" indexKey="0" indexValue="= 메뉴 ="  selected="${vo.authGroupIdx }"/></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="3">
							<input type="text" name="phoneA"  class="w10 inputPhone onlyNumber" value="${vo.phoneNo.no1 }"/>  -  <input type="text" name="phoneB" class="w10 inputPhone onlyNumber" value="${vo.phoneNo.no2 }" />  -  <input type="text" name="phoneC"  class="w10 inputPhone onlyNumber" value="${vo.phoneNo.no3 }" />
						</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td colspan="3">
							<input type="text" name="mobileA" class="w10 inputPhone onlyNumber" value="${vo.mobileNo.no1 }"/>  -  <input type="text" name="mobileB" class="w10 inputPhone onlyNumber" value="${vo.mobileNo.no2 }"/>  -  <input type="text" name="mobileC" class="w10 inputPhone onlyNumber" value="${vo.mobileNo.no3 }" />
						</td>
					</tr>
					<tr>
						<th>메모</th>
						<td colspan="3">
							<textarea name="memo" class="w100" rows="5">${vo.memo }</textarea>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		<br class="clear mb5" />

		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './admin_list');" class="btn2 bg_darkgray">목록</a></li>
		</ul>

	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		
	});
	
	function doCheck(type) {
		checkUserId('#idchk', 'input[name=checkedAd]', type, $('input[name=adminId]').val().trim());
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
		
		if (isNull($('input[name=aid]').val())) {
			if ($('input[name=checkedAd]').val() != 'Y') {
				alert('아이디 중복검사를 해야 합니다.');
				return;
			}
		}
		
		if (isNull($('input[name=adminId]').val())) {
			alert('아이디를 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=aid]').val()) && isNull($('input[name=adminPwd]').val())) {
			alert('비밀번호를 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=adminName]').val())) {
			alert('이름을 확인 해주세요.');
			return;
		}
		if (isNull($('input[name=email]').val())) {
			alert('이메일을 확인 해주세요.');
			return;
		}
		
		
		if (!confirm('저장하시겠습니까?')) 
			return;
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>