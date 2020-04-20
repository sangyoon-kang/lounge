<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	.pagination{justify-content: center; }
</style>
<c:if test="${search.paging.totalCount > 0}">
	<div class="${empty search.paging.pagerClassName ? 'page_nv_type02' : search.paging.pagerClassName}">
	<ul>
	
	
	<c:choose>
		<c:when test="${search.paging.pageIndex gt 1 }">
			<li><a class="page-link" href="javascript:goPage(1);"><img src="/images/contents/nv_type01_prev2.png" alt=""></a></li>
			
		</c:when>
		<c:otherwise>
			<li><a class="page-link"  href="javascript:;"><img src="/images/contents/nv_type01_prev2.png" alt=""></a></li>
			
		</c:otherwise>
	</c:choose>
				
	<c:choose>
		<c:when test="${search.paging.currentBlockIndex gt 1}">
			<li><a class="page-link" href="javascript:goPage(${search.paging.blockCount * (search.paging.currentBlockIndex - 1) });"><img src="/images/contents/nv_type01_prev1.png" alt=""></a></li>
		</c:when>
		<c:otherwise>
			<li><a class="page-link" href="javascript:;"><img src="/images/contents/nv_type01_prev1.png" alt=""></a></li>
		</c:otherwise>
	</c:choose>
			
	<c:forEach begin="${search.paging.startPage}" end="${search.paging.endPage}" var="page" varStatus="s">
		<c:choose>
			<c:when test="${page eq search.paging.pageIndex }">
					<li><a  class="page-link active">${page }</a></li>
			</c:when>
			<c:otherwise>
					<li><a  class="page-link" href="javascript:goPage(${page });">${page }</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
		
	<c:choose>
		<c:when test="${search.paging.totalPageCount gt search.paging.endPage }">
			<li><a class="page-link" href="javascript:goPage(${search.paging.endPage + 1});"><img src="/images/contents/nv_type01_next1.png" alt=""></a></li>
		</c:when>
		<c:otherwise>
			<li><a class="page-link" href="javascript:;"><img src="/images/contents/nv_type01_next1.png" alt=""></a></li>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${search.paging.pageIndex lt search.paging.totalPageCount }">
			<li><a class="page-link" href="javascript:goPage(${search.paging.totalPageCount });"><img src="/images/contents/nv_type01_next2.png" alt=""></a></li>
		</c:when>
		<c:otherwise>
				<li><a class="page-link" href="javascript:;"><img src="/images/contents/nv_type01_next2.png" alt=""></a></li>
		</c:otherwise>
	</c:choose>
	</ul>
	</div>
	<script type="text/javascript">
		function goPage(index) {
			$.Nav('go', location.pathname, {'cpage': index});
		}
	</script>
</c:if>