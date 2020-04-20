<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<div id="wrapper">
		<div id="container">
			<div class="content">
				
				<p style="margin-top:250px; margin-bottom:15px; font-size:30px;  text-align:center; font-weight:600;">
				관리자 기능을 사용할 수 없습니다.<br/>
				라이선스 인증을 받아야 합니다.
				</p>
				
				<table id="tblLicense" class="board_view w70 center ma">
	                <colgroup>
	                    <col width="15%" />
	                    <col width="*" />
	                    <col width="15%" />
	                </colgroup>
	                <tbody>
	                    <tr id="trLicense">
	                        <th>라이선스 키</th>
<c:choose>
	<c:when test="${empty site || !site.certified }">
							<td>
	                        	<input type="text" name="certKey" class="w100" />
	                        </td>
	                        <td class="center">
	                        	<a onclick="javascript:doCert();" class="btn btn_round bg_purple">라이선스 인증</a>
	                        </td>
						</tr>
	</c:when>
						
	<c:otherwise>
							<td colspan="2">인증되었습니다.</td>
						</tr>
						<tr>
							<td colspan="3" class="center"><a href="javascript:doLogin();" class="btn2 bg_navy">관리자 로그인</a></td>
						</tr>
	</c:otherwise>
</c:choose>
	                        

	                    
					</tbody>
				</table>
				
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function() {
			$(document.body).css('background', 'none');
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
						$('#tblLicense > tbody').append('<tr><td colspan="3" class="center"><a href="javascript:doLogin();" class="btn2 bg_navy">관리자 로그인</a></td></tr>');
					}
					else {
						alert('인증되지 않았습니다.\n올바른 라이선스 키를 입력해 주세요.');
					}
				}
			);
		}
		
		function doLogin() {
			location.href = '${URL_ADMIN_LOGIN }';
		}
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>