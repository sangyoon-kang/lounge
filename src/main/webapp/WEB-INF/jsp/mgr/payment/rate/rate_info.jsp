<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">

		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>수수료관리</h2>
			<p>홈  &gt; 상품 /정산관리  &gt; 수수료설정 </p>
		</div>

		<div class="scon">
			<div class="check_conbox mb10">
				<ul>
					<li>대리점 등급별 수수료를 설정합니다.</li>
					<li>수수료의 설정은 설정한 이후의 집계에 대한 수수료에만 적용됩니다.</li>
				</ul>
			</div>
			<br class="clear mb5" />
				<form id="form" name="form" action="./rate_proc.do" method="post">
					<table class="board_st1">
						<colgroup>
							<col width="15%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="14%" />
							<col width="15%" />
						</colgroup>
						<tbody>
							<tr>
								<th>운영시간</th>
								<th>본사</th>
								<th>총판</th>
								<th>지사</th>
								<th>지점</th>
								<th>직원</th>
								<th>합계</th>
							</tr>
							 <%-- size of liveEvents --%>

							<c:forEach var="v" items="${gb}" varStatus="s">

									<tr class="col">
										<td><b>${v.runTime} 분</b> 수수료</td>
										<input type="hidden" name="prr[${s.index }].runTime" value="${v.runTime}">
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRate1" value="${!empty v.lineRate1 ? v.lineRate1 : 0}" class="useVal input_type1 w60" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" />%</td>
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRate2" value="${!empty v.lineRate2 ? v.lineRate2 : 0}" class="useVal input_type1 w60" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" />%</td>
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRate3" value="${!empty v.lineRate3 ? v.lineRate3 : 0}" class="useVal input_type1 w60" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" />%</td>
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRate4" value="${!empty v.lineRate4 ? v.lineRate4 : 0}" class="useVal input_type1 w60" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" />%</td>
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRate5" value="${!empty v.lineRate5 ? v.lineRate5 : 0}" class="useVal input_type1 w60" onkeyup="this.value=this.value.replace(/[^0-9]/g,'')" onfocus="if(this.value == 0) this.value='';" onblur="if(this.value=='') this.value = 0;" />%</td>
										<td><input type="text" maxlength="2" name="prr[${s.index }].lineRateT" value="${!empty v.lineRateT ? v.lineRateT : 0}" class="sum input_type1 w60" readonly />%</td>
									</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
			<ul class="summmit_btn">
				<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy" style="margin-bottom: 15px">수수료저장</a></li>
			</ul>
				<br>
		</div>
	</div>
	<!--wrap_scon E-->
	<script src="//dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script type="text/javascript">

		$(document).on('blur input', 'input', function(e){
			$this = $(this)
			$row = $this.parents('.col');
			var ttl = 0;
			$row.find('.useVal').each(function(idx,input){
				ttl += parseInt( $(input).val() );
			});
			$row.find('.sum').val(ttl);
		});

		var seen = {};
		$('.col').each(function() {
			var txt = $(this).text();
			if (seen[txt])
				$(this).remove();
			else
				seen[txt] = true;
		});

		function doSubmit() {

			if($('td.totalLot').filter(function(){return parseInt($(this).text()) > 100}).length > 0 || $('td.totalPrice').filter(function(){return parseInt($(this).text()) > 10000000}).length > 0){
				alert('총합계 수량이 200 Lot 초과하거나 합계금액이 10,000,000원 초과하였습니다.');
				return;
			}
			if (!confirm('저장하시겠습니까?'))
				return;
			$('#form').submit();
		};

	</script>

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>