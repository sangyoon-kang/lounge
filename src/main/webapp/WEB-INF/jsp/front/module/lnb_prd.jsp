<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		레프트 메뉴 모듈
 --%>

<c:set var="classOnOnce" value="" />
<c:if test="${category eq list[0].category1 }">
	<c:set var="classOnOnce" value="on once" />
</c:if>
<ul class="left_mu">
	<li><a
		href="javascript:$.Nav('self', {mode: 'list', category1 : '${list[0].category1 }'}, null, true);"
		class="${classOnOnce }">${categoryName }</a> <c:if
			test="${!empty list }">
			<dl>

				<c:forEach items="${list }" var="l">
					<c:set var="classOn" value="" />
					<c:if test="${search.prdseq eq l.prdSeq }">
						<c:set var="classOn" value="on" />
					</c:if>
					<dd>
						<a
							href="javascript:$.Nav('self', {mode: 'view', prdseq : '${l.prdSeq }'}, null, true);"
							class="${classOn }">${l.prdName }</a>
					</dd>
				</c:forEach>
			</dl>
		</c:if></li>
</ul>