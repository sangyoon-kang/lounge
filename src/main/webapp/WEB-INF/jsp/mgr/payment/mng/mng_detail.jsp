<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 상품 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style type="text/css">
	.grid{
		display:-ms-grid;
		 display: inline-grid;
		 grid-template-columns: 1fr 1fr 1fr;
		 -ms-grid-columns:1fr 1fr 1fr;
		 align-items:center;
	}
	.grid1{-ms-grid-column:1}
	.grid2{-ms-grid-column:2}
	.grid3{-ms-grid-column:3}
</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<div id="wrap_scon">
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	<div class="scon_title">
		<h2>상품관리</h2>
		<p>홈 &gt; 상품 /정산관리  &gt; 상품관리 &gt; Time당 투자내역 </p>
	</div>
	<div class="scon">
	<div class="check_conbox mb10">
		<ul>
			<li>Time별 투자내역을 조회합니다.</li>
		</ul>
	</div>
	<form id="form1" action="./mng_detail.do" method="get">
	<input type="hidden" name="goodsDate" value="${search.goodsDate }" />
	<input type="hidden" name="goodsTime" value="${search.goodsTime }" />
	<input type="hidden" name="bsType" value="${search.bsType }" />
	<input type="hidden" name="runTime" value="${search.runTime }" />
	<div class="scon_search grid">
		<h3 class="grid1">${detailDate} &nbsp; ${detailTime}분
			<c:choose>
				<c:when test = "${search.bsType eq 'B'}">
					매수
				</c:when>
				<c:when test = "${search.bsType eq 'S'}">
					매도
				</c:when>
				<c:otherwise>
					전체
				</c:otherwise>
			</c:choose> 내역 </h3>
		<ul class="grid2 txt_center">
			<li>
				<a onclick="javascript:doSearch('');" class="btn btn_round bg_gray">전체</a>
				<a onclick="javascript:doSearch('B');" class="btn btn_round bg_gray">매수</a>
				<a onclick="javascript:doSearch('S');" class="btn btn_round bg_gray">매도</a>
			</li>
		</ul>
		<h3 class="grid3 txt_right">결과 : 
		  <span class="red">
		  <c:choose>
	         <c:when test = "${upDown.goodsResult eq 'U'}">
				 상승
	         </c:when>
	         <c:when test = "${upDown.goodsResult eq 'D'}">
				 하락
	         </c:when>
	         <c:otherwise>
	         	---
	         </c:otherwise>
	      </c:choose>
	      </span>
		</h3>
	</div>
	<table class="board_st1">
		<colgroup>
			<col width="15%" />
			<col width="15%" />
			<col width="15%" />
			<col width="10%" />
			<col width="10%" />
			<col width="10%" />
			<col width="15%" />
		</colgroup>
		<thead>
			<tr>
				<th class="sortable">등급</th>
				<th class="sortable">이름</th>
				<th class="sortable">아이디</th>
				<th class="sortable">수량</th>
				<th class="sortable">보증금</th>
				<th class="sortable">수수료</th>
				<th class="sortable">수익</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="m" varStatus="s">
				<tr>
					<td>${m.gradeName}</td>
					<td>${m.userName}</td>
					<td>${m.userId}</td>
					<td><fmt:formatNumber pattern="#,##0.#" value="${m.lot}"/></td>
					<td><fmt:formatNumber pattern="#,##0" value="${m.lotPrice}"/></td>
					<td><fmt:formatNumber pattern="#,##0" value="${m.profitPrice}"/></td>
					<td><fmt:formatNumber pattern="#,##0" value="${m.profit}"/></td>
				</tr>
			</c:forEach>
			<c:if test="${empty list}">
				<tr>
					<td colspan="10"><s:message code="common.noData" /></td>
				</tr>
			</c:if>
		</tbody>
	</table>
	</form>
	<ul class="summmit_btn mb20">
		<li><a onclick="$.Nav('go', './list.do', {goodsDate: '${search.goodsDate}', goodsTime: '${search.goodsTime}'});" class="btn2 bg_gray">돌아가기</a></li>
	</ul>
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(document).ready(function(){
		$('a[href="/mgr/payment/mng/list"]').addClass('depth2_on');
	});
	function doSearch(type){
		$('input[name="bsType"]').val(type);
		$('#form1').submit();
	}
</script>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>