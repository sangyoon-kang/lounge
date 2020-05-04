<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<script type="text/javascript" src="/common/js/clipboard.min.js"></script>
<script type="text/javascript">

    var clipboard = new ClipboardJS('.btn');

    clipboard.on('success', function(e) {
        e.clearSelection();

        alert('추천지점 링크가 복사 되었습니다.');
    });

    clipboard.on('error', function(e) {
		alert('링크 복사에 실패 하였습니다.');
    });

</script>
<nav id="wrap_lnb">
		<div>
			<a href="/" class="lnb_home"><img src="/images/common/lnb_home.png" alt="home" /></a>
			<div class="lnb_select">
				<h3 class="lnb_select_tit first">대리점관리</h3>
				<%@ include file="/WEB-INF/include/fx_include/front_breadcrumb.jsp"%>
			</div>
		</div>
	</nav>

<section class="wrap_scon">
		<div class="scon">
			<h2 class="con_tit03">당일 실시간</h2>
			<a data-clipboard-text="http://www.fxlounge.co.kr/join?isAgreed=true&recomm_code=${trimUserId}" class="inout_apply_bt btn" style="cursor: pointer;">추천지점 링크생성</a>
			<div class="wrap_tsty02">
				<table>
					<colgroup>
						<col></col>
						<col></col>
						<col></col>
						<col></col>
					</colgroup>
					<thead>
						<tr>
							<th>날짜</th>
							<th>거래금액</th>
							<th>가맹점수수료</th>
							<th>정산금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<td>${vo.dateToday }</td>
						<td><fmt:formatNumber pattern="#,##0" value="${vo.transTotal }"/> 원</td>
						<td><fmt:formatNumber pattern="#,##0" value="${vo.settleTotal }"/> 원</td>
						<td><fmt:formatNumber pattern="#,##0" value="${vo.feeFor }"/> 원</td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="shop_con_bg">
			<div class="scon">
				<h2 class="con_tit03">기간별검색</h2>

				<div class="shop_search">
				<form id="form"class="col-sm-6" action="./ms_shop" method=GET >
				<input type="hidden" name="sellUserId" value="${search.sellUserId}" />

						<input type="text" name="startDate" class="form-control" id="startDate" value="${search.startDate }" />
						~
					    <input type="text" name="endDate" class="form-control" id="endDate"value="${search.endDate }" />
						<a  onclick="javascript:doSearch('${search.sellUserId}');" >검색</a>

				</form>
				<div class="col-sm-6">
					<c:if test="${!empty search.sellUserId and search.sellUserId ne search.userId}"><a onclick="javascript:doSearch('');"class="btn float-right">돌아가기</a></c:if>
				</div>
				</div>



				<div class="wrap_tsty03">
					<table>
						<colgroup>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
							<col></col>
						</colgroup>
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>대리점명</th>
								<th>잔액</th>
								<th>가맹점수수료</th>
								<th>정산금액</th>
							</tr>
						</thead>
						<tbody>
							<fmt:formatNumber var="totalCommission" pattern="#,##0" value="0" />
					<fmt:formatNumber var="totalTaxCommission" pattern="#,##0" value="0" />
					<c:forEach items="${list }" var="l" varStatus="u">
					<tr>
						<td>
							<c:if test="${!empty l.nickName and l.userId ne search.userId and (!empty search.sellUserId and l.userId ne search.sellUserId)}"><a onclick="doSearch('${l.userId}')">${ l.userId}</a></c:if>
							<c:if test="${empty l.nickName or l.userId eq search.userId or l.userId eq search.sellUserId}">
								<a onclick="window.open('/mypage/ms_shop_popup?sellUserId=${l.userId}&startDate=${search.startDate }&endDate=${search.endDate }',
                               'login_popup.do', 'width=1200,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank">${l.userId }</a>
							</c:if>
						</td>
						<td>
							<c:if test="${!empty l.nickName and l.userId ne search.userId and (!empty search.sellUserId and l.userId ne search.sellUserId)}"><a class="btn" onclick="doSearch('${l.userId}')">${ l.userName}</a></c:if>
							<c:if test="${empty l.nickName or l.userId eq search.userId or l.userId eq search.sellUserId}">
								<a onclick="window.open('/mypage/ms_shop_popup?sellUserId=${l.userId}&startDate=${search.startDate }&endDate=${search.endDate }',
		                         'login_popup.do', 'width=1200,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank" class="btn">${l.userName }</a>
							</c:if>
						</td>
						<td>
							<c:if test="${!empty l.nickName and l.userId ne search.userId and (!empty search.sellUserId and l.userId ne search.sellUserId)}"><a onclick="doSearch('${l.userId}')">${ l.nickName}</a></c:if>
							<c:if test="${empty l.nickName or l.userId eq search.userId or l.userId eq search.sellUserId}">
								<a onclick="window.open('/mypage/ms_shop_popup?sellUserId=${l.userId}&startDate=${search.startDate }&endDate=${search.endDate }',
		                         'login_popup.do', 'width=1200,height=840,top=50, left=600,location=no,status=no,scrollbars=yes');" target="_blank">${l.nickName }</a>
							</c:if>
						</td>
						<td><fmt:formatNumber pattern="#,##0" value="${l.cash }"/> 원</td>
						<%-- <td>${l.phone }</td> --%>
						<td><fmt:formatNumber pattern="#,##0" value="${l.commission }"/> 원</td>
						<td><fmt:formatNumber pattern="#,##0" value="${l.taxCommission }"/> 원</td>
						<fmt:formatNumber var="totalCommission" pattern="#.##" value="${totalCommission +  l.commission}" />
						<fmt:formatNumber var="totalTaxCommission" pattern="#.##" value="${totalTaxCommission +  l.taxCommission}" />
					</tr>
					</c:forEach>
						</tbody>
						<tfoot class="bg-red-80">
							<tr>
								<td colspan="4">정산금액</td>
								<td><fmt:formatNumber pattern="#,##0" value="${totalCommission}" /></td>
								<td><fmt:formatNumber pattern="#,##0" value="${totalTaxCommission}" /></td>
							</tr>
						</tfoot>
					</table>
				</div>
				<p class="shop_stxt">당일 조회시, 실시간 데이터가 노출되며, 여러일 조회시, 당일 실시간 데이터는 제외됩니다.<br/>가맹점 정산관리 (일일정산) 수수료는 (소득세 3.3% 제외)한 금액입니다.</p>
			</div>
		</div>
	</section>
<script type="text/javascript">

$('#startDate, #endDate').datepicker(
	{
		language: 'kr',
		switchOnClick: true,
		autoClose:true
	});

function doSearch(gseq){
	$('input[name="sellUserId"]').val(gseq);
	$('#form').submit();
}
</script>
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>