<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 게시판
--%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
	<style type="text/css">
		.input_type2{
		    /* float: left; */
		    border: 1px solid #ddd;
		    height: 18px;
		    /* padding: 3px 5px 5px 5px; */
		    font-size: 12px;
		    color: #444;
		    vertical-align: middle;
    	}
    	.btn-h{
		    height: 36px;
		}
	</style>
	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>적립금설정 </h2>
			<p>홈  &gt; 사이트관리 &gt; 적립금설정</p>
		</div>
		
		<div class="scon">
			
			<div class="check_conbox mt15 mb15">
				<ul class="ml10">
					<li>적립금을 설정하는 화면입니다.</li>
				</ul>
			</div>
			<form id="form1" action="./point_proc.do" method="post">
				<input type="hidden" name="policyType" value="${vo.policyType}" />
				<input type="hidden" name="policyValue" value="${vo.policyValue}" />
				<h3 class="scon_tit2">기본 적립금 지급</h3>
				<table id="tblLicense" class="board_write table-top table-top">
	                <colgroup>
	                    <col width="20%" />
	                    <col width="*" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th class="left">회원 가입 적립금</th>
	                        <td class="left">
		                        <span>회원 가입 시 적립금</span> 
		                        <input type="number" class="input_type2 w20" name="joinCMomey" value="${vo.joinCMomey }" />
		                        <span>원 지급</span>
	                        </td>
	                    </tr>
	                    <tr>
	                        <th class="left">이용후기</th>
	                        <td class="left">
		                         <span>이용후기 작성 시 적립금</span> 
		                        <input type="number" class="input_type2 w20" name="commentCMomey" value="${vo.commentCMomey }" />
		                        <span>원 지급</span>
	                        </td>
	                    </tr>
                    </tbody>
                  </table>
                  
                <h3 class="scon_tit2">구매 적립금 지급</h3>
				<table id="tblLicense" class="board_write table-top table-top">
	                <colgroup>
	                    <col width="20%" />
	                    <col width="*" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th class="left">구매 적립금 정책</th>
	                        <td class="left">
		                        <input type="radio" name="policy" value="N" ${vo.policyType == 'N' ? 'checked' : ''} /> <span>적립금 지급 안함</span> <br />
		                        <input type="radio" name="policy" value="R" ${vo.policyType == 'R' ? 'checked' : ''} /> <span>회원등급에 설정된 적립금 지급</span> <br />
		                        <input type="radio" name="policy" value="A" ${vo.policyType == 'A' ? 'checked' : ''} /> <span>결제금의</span> <input ${vo.policyType != 'A' ? 'disabled' : ''}  class="input_type2 w10" type="number" name="policyV" value="${vo.policyType == 'A' ? vo.policyValue : ''}" /> <span>% 지급</span><br />
		                        <input type="radio" name="policy" value="P" ${vo.policyType == 'P' ? 'checked' : ''} /> <span>판매가의 </span> <input ${vo.policyType != 'P' ? 'disabled' : ''} class="input_type2 w10" type="number" name="policyV" value="${vo.policyType == 'P' ? vo.policyValue : ''}" /> <span>% 지급</span><br />
		                        <input type="radio" name="policy" value="E" ${vo.policyType == 'E' ? 'checked' : ''} /> <span>대여 1일당</span> <input ${vo.policyType != 'E' ? 'disabled' : ''} class="input_type2  w10" type="number" name="policyV" value="${vo.policyType == 'E' ? vo.policyValue : ''}" /> <span>원 지급</span>
	                        </td>
	                    </tr>
                    </tbody>
                </table>
                 
                <h3 class="scon_tit2">적립금 사용 설정</h3>
				<table id="tblLicense" class="board_write table-top table-top">
	                <colgroup>
	                    <col width="20%" />
	                    <col width="*" />
	                </colgroup>
	                <tbody>
	                    <tr>
	                        <th class="left">사용 가능 최소 적립금</th>
	                        <td class="left">
		                        <span>적립금 </span> 
		                        <input type="number" class="input_type2 w20" name="useMin" value="${vo.useMin }" />
		                        <span>원 이상 사용</span>
	                        </td>
	                    </tr>
                     	<tr>
	                        <th class="left">사용 가능 최대 적립금</th>
	                        <td class="left">
		                        <span>적립금</span> 
		                        <input type="number" class="input_type2 w20" name="useMax" value="${vo.useMax }" />
		                        <span>원 이하 사용</span>
	                        </td>
	                    </tr>
                    </tbody>
                 </table>
                 
	                <div class="page_bbt">
						<input type="button" onclick="javascript:doSubmit();" value="저장" class="btn bt_bsubmit btn-h"> 
						<input type="button" onclick="javascript:$.Nav('self', null, null, true);" value="취소" class="btn bt_bcancle btn-h">
					</div>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->
	<script type="text/javascript">
		$('input[name="policy"]').on('change', function(e){
			$('input[name="policyV"]').prop('disabled', true);
			$('input[name="policyV"]').val('');
			$(this).next().next().prop('disabled', !e.target.checked);
			const policy = $(this).val();
			if(!isNull(policy))
				$('input[name="policyType"]').val(policy);
		});
		
		$('input[name="policyV"]').on('change', function(e){
			const pv = $(this).val();
			if(!isNull(pv))
				$('input[name="policyValue"]').val(pv);
		});
		function doSubmit() {
			if (!confirm('저장하시겠습니까?'))
				return;

			$('#form1').submit();
		}
	</script>
	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>