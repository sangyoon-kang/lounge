<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>사이트 정보</h2>
			<p>홈  &gt; 기본설정  &gt; 사이트 정보</p>
		</div>
		
		<div class="scon">
			
			<form id="form1" action="./site_info_proc" method="post">
			<h3 class="scon_tit2">기본정보</h3>
			<table class="board_write">
                <colgroup>
                    <col width="15%" />
                    <col width="*" />
                </colgroup>
                <tbody>
                	<tr>
                    	<th>사이트 이름</th>
                        <td><input type="text" name="siteName" class="w40" value="${tagoplusSolution1_session_site.siteName }" /></td>
                    </tr>
                    <tr>
                    	<th>관리자 이메일</th>
                        <td>
                        	<input type="text" name="email" class="w40" value="${tagoplusSolution1_session_site.email }" />
                        </td>
                    </tr>
					<tr>
                    	<th>대표전화</th>
                        <td>
                        	<input type="text" name="keyNumber" class="w40" value="${tagoplusSolution1_session_site.keyNumber }" />
                        </td>
                    </tr>
                    <tr>
                    	<th>관리자 전화번호</th>
                        <td>
                        	<input type="text" name="adminPhone" class="w40 onlyRealNumber" value="${tagoplusSolution1_session_site.adminPhone }" />
                        </td>
                    </tr>                    
                </tbody>
            </table>
            <br class="clear mb5" />
            
			<h3 class="scon_tit2">FTP정보</h3>
			<table class="board_write">
				<caption>FTP정보</caption>
				<colgroup>
					<col width="15%"/>
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th>접속주소 (ip, 도메인)</th>
						<td>
							<input type="text" name="ftpAddr" class="w40" value="${tagoplusSolution1_session_site.ftpAddr }" /> 
						</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" name="ftpId" class="w40" value="${tagoplusSolution1_session_site.ftpId }" /> 
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="text" name="ftpPwd" class="w40" value="${tagoplusSolution1_session_site.ftpPwd }" /> 
						</td>
					</tr>
				</tbody>
			</table>
			<br class="clear mb5" />

				<h3 class="scon_tit2">운영설정</h3>
				<table class="board_write">
					<caption>운영설정</caption>
					<colgroup>
						<col width="15%"/>
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th>고객센터번호</th>
							<td>
								<input type="text" name="customerCenter" class="w40" value="${tagoplusSolution1_session_site.customerCenter }" />
							</td>
						</tr>
						<tr>
							<th>입출금관련전화</th>
							<td>
								<input type="text" name="depositWithdrawalTelephone" class="w40" value="${tagoplusSolution1_session_site.depositWithdrawalTelephone }" />
							</td>
						</tr>
						<tr>
							<th>업무시간</th>
							<td>
								<input type="text" name="businessHours" class="w40" value="${tagoplusSolution1_session_site.businessHours }" />
							</td>
						</tr>
						<tr>
							<th>입금시간</th>
							<td>
								<input type="text" name="depositTime" class="w40" value="${tagoplusSolution1_session_site.depositTime }" />
							</td>
						</tr>
						<tr>
							<th>출금시간</th>
							<td>
								<input type="text" name="withdrawalTime" class="w40" value="${tagoplusSolution1_session_site.withdrawalTime }" />
							</td>
						</tr>
					</tbody>
				</table>
				<br class="clear mb5" />
			
			<h3 class="scon_tit2">사업자 정보</h3>
			<table class="board_write">
				<colgroup>
					<col width="15%"/>
					<col width="35%" />
					<col width="15%"/>
					<col width="35%" />
				</colgroup>
				<tbody>
					<tr>
						<th>사업자등록번호</th>
						<td colspan="3">
							<input type="text" name="footBusinessNumber" class="w50" value="${tagoplusSolution1_session_site.footBusinessNumber }" /> 
						</td>
						<!-- <th></th>
						<td>
							<input type="file" name="filename1" class="w100" />
							<img src="/images/mgr/com_seal.jpg" /> 
						</td>-->
					</tr>
					<tr>
						<th>상호</th>
						<td>
							<input type="text" name="footBusinessName" class="w100" value="${tagoplusSolution1_session_site.footBusinessName }" /> 
						</td>
						<th>대표자명</th>
						<td>
							<input type="text" name="footRepName" class="w100" value="${tagoplusSolution1_session_site.footRepName }" />
						</td>
					</tr>
					<tr>
						<th>우편번호</th>
						<td colspan="3">
							<input type="text" name="footZipcode" class="w80p daumAddr" readonly value="${tagoplusSolution1_session_site.footZipcode }" /> 
							<a class="btn btn_round bg_gray btnh_28 daumAddr">우편번호</a> 
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="3">
							<input type="text" name="footAddr1" class="w50 mb5 daumAddr" readonly value="${tagoplusSolution1_session_site.footAddr1 }" /><br/>
							<input type="text" name="footAddr2" class="w50" value="${tagoplusSolution1_session_site.footAddr2 }" />
						</td>
					</tr>
					<tr>
						<th>개인정보처리담당자</th>
						<td colspan="3">
							<input type="text" name="personalInformationOfficer" class="w50" value="${tagoplusSolution1_session_site.personalInformationOfficer }" />
						</td>
					</tr>
					<tr>
						<th>통신판매번호</th>
						<td colspan="3">
							<input type="text" name="orderMail" class="w50" value="${tagoplusSolution1_session_site.orderMail }" />
						</td>
					</tr>
					<tr>
						<th>업태</th>
						<td>
							<input type="text" name="footCondition" class="w100" value="${tagoplusSolution1_session_site.footCondition }" /> 
						</td>
						<th>종목</th>
						<td>
							<input type="text" name="footItem" class="w100" value="${tagoplusSolution1_session_site.footItem }" />
						</td>
					</tr>
					<tr>
						<th>전화</th>
						<td>
							<input type="text" name="footPhone" class="w100" value="${tagoplusSolution1_session_site.footPhone }" /> 
						</td>
						<th>팩스</th>
						<td>
							<input type="text" name="footFax" class="w100" value="${tagoplusSolution1_session_site.footFax }" />
						</td>
					</tr>
				</tbody>
			</table>
			<br class="clear mb5" />
			
			<div class="check_conbox">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- FTP정보, 사업자 정보는 사이트 운영에 영향을 미치지 않습니다. 메모용입니다.</li>
				</ul>
			</div>
			</form>
			
			<ul class="summmit_btn">
				<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">확인</a></li>
			</ul>

		</div>
	</div>
	<!--wrap_scon E-->
	<script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">
		$(function() {
			$('.daumAddr').click(function() {
				openSearchAddress('footZipcode', 'footAddr1', 'footAddr2');
			});
		});
		
		function doSubmit() {
			if (!confirm('저장하시겠습니까?'))
				return;
			
			$('#form1').submit();
		}
	</script>

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>