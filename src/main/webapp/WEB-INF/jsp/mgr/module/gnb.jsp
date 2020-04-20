<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	GNB : TS_SITE.USE_MENU 필드에 저장된 페이지 값 사용
		- 슈퍼유저도 영향을 받음
 --%>
	<!--header S-->
	<div id="wrap_header">
    	<h2 class="mg_logo">
    		<a href="${URL_ADMIN_MAIN }" class="main_totle">${tagoplusSolution1_session_site.adminTitleUrl }</a><br/>
    		<a href="${URL_FRONT_MAIN }" class="bt_gohome" target="_blank">내홈페이지바로가기→</a>
   		</h2>
    	<!-- <h2 class="mg_logo">사이트관리자<br/><a href="" >내홈페이지바로가기→</a></h2> -->
    	<ul class="gnb" id="gnb_link">
<%-- <c:if test="${tagoplusSolution1_session_admin.userType eq 'designer' || tagoplusSolution1_session_admin.userType eq 'superuser'}">
			<li gnbMenuIdx="0"><a class="white" href="${URL_ADMIN_ROOT}/config/basic/sys_configuration" >환경설정</a></li>
</c:if> --%>

<c:forEach var="m" items="${menus}" varStatus="s">
	<c:if test="${!empty tagoplusSolution1_session_admin.adminAuth}">
		<c:forEach var="ms" items="${tagoplusSolution1_session_admin.adminAuth}" varStatus="g">
			<c:if test="${ms.menuId eq m.menuIdx and !empty ms.authoList}">
				<li gnbMenuIdx="${s.index + 1 }"><a class="white" href="${URL_ADMIN_ROOT}${m.folderPath }">${m.menuName }</a></li>
			</c:if>
		</c:forEach>
	</c:if>
	<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">
		<li gnbMenuIdx="${s.index + 1 }"><a class="white" href="${URL_ADMIN_ROOT}${m.folderPath }">${m.menuName }</a></li>
	</c:if>
</c:forEach>		
			<%-- <li gnbMenuIdx="10"><a class="white" href="${URL_ADMIN_ROOT}/dealer/list">업체/차량관리</a></li>	 --%>
		</ul>
		<p id="LogoutBtn">로그아웃</p>
	</div>
	<script type="text/javascript">
		$(function() {
			$('#LogoutBtn').click(function() {
				location.href = '/mgr/login/logout';
			});
		});
	</script>
	<!--header E-->