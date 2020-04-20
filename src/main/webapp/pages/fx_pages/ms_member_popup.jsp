<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>


<div class="container">
	<div class="row">
		<div class="col-12">
			<h2>기간별검색</h2>
			<div class="p-2 bg-light-grey row">
				<form class="col-sm-4">
					<div class="input-group">
					
						<input type="text" name="startDate" class="form-control" value="${search.startDate }" />~ 
					    <input type="text" name="endDate" class="form-control" value="${search.endDate }" />
					<button id="btnSearch" onclick="javascript:doSearch();" class="btn" style="margin-left:10px">검색</button>
					</div>
					
				</form>
			</div>
			<p class="mt-2">가맹점 정산관리 (일일정산) 수수료는 (소득세 3.3% 제외)한 금액입니다.</p>
			<div class="scroll-x w-100">
				<table class="table striped">
				<colgroup>
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="10%">
					<col width="5%">
					<col width="10%">
					<col width="15%">
				</colgroup>
				<thead class="primary">
					<tr>
						<th>렌트약정시작시간</th>
						<th>종목</th>
						<th>구분</th>
						<th>수량</th>
						<th>보증금</th>
						<th>종료시간</th>
						<th>수익</th>
						<th>손실</th>
						<th>수수료</th>
						<th>소득세제외</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					<tr>
						<td>2019-05-24 01:10:00	</td>
						<td>GBP/AUD	</td>
						<td>매수</td>
						<td>0.1Lot</td>
						<td>5,000</td>
						<td></td>
						<td>4,300</td>
						<td>0</td>
						<td>300원</td>
						<td>290원</td>
					</tr>
					
				</tbody>
				<tfoot class="bg-red-80">
					<tr>
						<td colspan="6">정산금액</td>
						<td>38,700원</td>
						<td>35,000원</td>
						<td>2,700원</td>
						<td>2,611원(소득세제외)</td>
					</tr>
				</tfoot>
			</table>
			</div>
		</div>
	</div>
</div>
<script>
	$('#dateRange').datepicker()
	
	function doSearch() {
		$('#form1').submit();	
	}
	
</script>