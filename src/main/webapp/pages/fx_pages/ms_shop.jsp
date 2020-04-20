<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-12">
			<h4>당일 실시간</h4>
			<table class="table">
				<thead>
					<tr>
						<th>날짜</th>
						<th>거래금액</th>
						<th>정산금액</th>
						<th>가맹점수수료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2019-05-24	</td>
						<td>1,760,000원</td>
						<td>52,500원</td>
						<td>50,768원</td>
					</tr>
				</tbody>
			</table>
			<h2>기간별검색</h2>
			
			
		</div>
		<div class="col-sm-12 ">
			<div class="p-2 bg-light-grey row">
				<form class="col-sm-4">
					<div class="input-group">
					
						<input type="text" name="startDate" class="form-control" value="${search.startDate }" />~ 
					    <input type="text" name="endDate" class="form-control" value="${search.endDate }" />
					<button type="submit" class="btn" style="margin-left:10px">검색</button>
					</div>	
				</form>
			</div>
			<p class="mt-2">당일 조회시, 실시간 데이터가 노출되며, 여러일 조회시, 당일 실시간 데이터는 제외됩니다. </p>
			<p>가맹점 정산관리 (일일정산) 수수료는 (소득세 3.3% 제외)한 금액입니다.</p>
			<table class="table striped">
				<thead class="primary">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>잔액</th>
						<th>휴대폰</th>
						<th>정산금액</th>
						<th>가맹점수수료</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
					<tr>
						<td>lkl3055</td>
						<td><a onclick="window.open('/pages/fx_pages/ms_member_popup.jsp', 
                               'login_popup.do', 'width=1000,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">이경락</a></td>
						<td>1,600원</td>
						<td>010-9446-0178</td>
						<td>0원</td>
						<td>0원</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
<script>
	$('#dateRange').datepicker()
</script>