<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%--
	프론트용 페이저

	server attribute에 search 객체를 추가해야 함.
	하단 goPage() 메서드 있음 : jquery.locator.js 필요
	test : <div>startPage : ${search.paging.startPage }, endPage : ${search.paging.endPage }, totalCount : ${search.paging.totalCount }</div>
	
	
	<div class="pagenum">	
		<span>
			<a href="" class="btn_prev2"></a>
			<a href="" class="btn_prev1"></a>
		</span>
		<span class="mL3">
			<a href="" class="on">1</a>
			<a href="">2</a>
			...
		</span>
		<span class="mL3">
			<a href="" class="btn_next1"></a>
			<a href="" class="btn_next2"></a>
		</span>
	</div>
		
--%>
<c:if test="${search.paging.totalCount > 0}">
	<div class="${empty search.paging.pagerClassName ? 'pagenum' : search.paging.pagerClassName}">
		<span>
		
	<c:choose>
		<c:when test="${search.paging.pageIndex gt 1 }">
				<a href="javascript:goPage(1);" class="btn_prev2"></a>
		</c:when>
		<c:otherwise>
				<a href="javascript:;" class="btn_prev2"></a>
		</c:otherwise>
	</c:choose>
				
	<c:choose>
		<c:when test="${search.paging.currentBlockIndex gt 1}">
				<a href="javascript:goPage(${search.paging.blockCount * (search.paging.currentBlockIndex - 1) });" class="btn_prev1"></a>
		</c:when>
		<c:otherwise>
				<a href="javascript:;" class="btn_prev1"></a>
		</c:otherwise>
	</c:choose>
		
		</span>
		<span class="mL3">
		
	<c:forEach begin="${search.paging.startPage}" end="${search.paging.endPage}" var="page" varStatus="s">
			<c:choose>
				<c:when test="${page eq search.paging.pageIndex }">
						<a class="on">${page }</a>
				</c:when>
				<c:otherwise>
						<a href="javascript:goPage(${page });">${page }</a>
				</c:otherwise>
			</c:choose>
	</c:forEach>
		
		</span>
		<span class="mL3">
		
	<c:choose>
		<c:when test="${search.paging.totalPageCount gt search.paging.endPage }">
				<a href="javascript:goPage(${search.paging.endPage + 1});" class="btn_next1"></a>
		</c:when>
		<c:otherwise>
				<a href="javascript:;" class="btn_next1"></a>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${search.paging.pageIndex lt search.paging.totalPageCount }">
				<a href="javascript:goPage(${search.paging.totalPageCount });" class="btn_next2"></a>
		</c:when>
		<c:otherwise>
				<a href="javascript:;" class="btn_next2"></a>
		</c:otherwise>
	</c:choose>	

		</span>
	</div>
	<script type="text/javascript">
		function goPage(index) {
			$.Nav('go', location.pathname, {'cpage': index});
		}
	</script>
</c:if>