<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		상품 모듈 - 목록
 --%>
   
    <style>
    p.sol_img {
	 width: auto !important;
	 height: auto !important;
	 }

</style>
<c:if test="${empty search.cateIdx }">

	<div id="title">
		<div class="fleft">
			<h2><strong>상품</strong></h2>
			<div class="tit_ex">상품</div>
		</div>
		<div class="fright location"><img src="/images/ic_home.png" /> > 상품</div>
	</div><!--  end title -->
</c:if>

<c:if test="${!empty search.cateIdx }">

	<div id="title">
		<div class="fleft">
			<h2><strong>${list[0].categoryName }</strong></h2>
			<div class="tit_ex">${list[0].categoryName }</div>
		</div>
		<div class="fright location"><img src="/images/ic_home.png" /> > ${list[0].categoryName }</div>
	</div><!--  end title -->
</c:if>

		<div id="content">
			<ul class="m_solution">
<c:forEach items="${list }" var="pL">
				<li>
					<p class="sb">${pL.prdName }</p>
					<p class="sol_img text-center">
						<a href="javascript:$.Nav('go', '/pages/prd_list.jsp', {mode : 'view', prdseq: '${pL.prdSeq}' });" class="thumbnail">
							<img src="${UPLOAD_ROOT}${pL.prdImageVO[0].listFilename }" style="height: 121px;" alt="상품이미지" />
						</a>
					</p>
					<p class="ex">${pL.summary }</p>
					<p class="price">
	<fmt:formatNumber value="${pL.price }"/> 원(VAT별도)
					</p>
				</li>
</c:forEach>
			</ul>
</div>

<c:if test="${search.mainyn ne 'Y' }">
	<%@ include file="/WEB-INF/jsp/common/inc-paging.jsp"%>
</c:if>