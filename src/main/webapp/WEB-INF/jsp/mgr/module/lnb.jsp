<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<!--lnb S-->
<div id="wrap_lnb">
	<!-- THIS IS ADMIN MENUS -->
	<c:if test="${!empty listMenus}">
	<h2 class="lnb_title">
		<span class="title1">${listMenus[0].menuName}</span>
	</h2>
	<ul class="lnb mb30">
	<c:forEach var="m" items="${listMenus }" varStatus="s">
		<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">
			<c:set var="prefpath" value="" />
			<c:set var="prefpath" value="${fn:split(m.folderPath, '/')}" />
			<c:set var="length" value="${fn:length(prefpath) }"/>
			<c:if test="${m.menuLevel eq 2}">
				<c:set var="prefixPath" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
				<li class="lnb_depth1" id="${m.menuIdx }"><a href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${prefixPath }">${m.menuName }</a></li>
			</c:if> 
			<c:if test="${m.menuLevel eq 3}">
				<c:set var="prefixPath2" value="${m.folderPath }"/>				
				<c:if test="${length>3 }">
					<c:set var="prefixPath2" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
				</c:if>			
				<c:if test="${length<4 }">
					<c:set var="splitPage" value="${fn:split(prefpath[length -1], '_')}" />
					<c:if test="${!empty splitPage[1]}">
						<c:set var="prefixPath2" value="${fn:replace(m.folderPath, splitPage[1], '') }"/>
					</c:if>					
				</c:if>
				<c:if test="${not empty pageMenuPath }">
					<c:set var="prefixPath3" value="${pageMenuPath}"/>
				</c:if>
				
				<li class="lnb_depth2" data-id="${m.parentIdx }"><a href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${m.folderPath }" >${m.menuName }</a></li>
			</c:if>
		</c:if>
		<c:if test="${tagoplusSolution1_session_admin.userType eq 'admin'}">
			<c:forEach var="ms" items="${tagoplusSolution1_session_admin.adminAuth}" varStatus="g">
				<c:if test="${ms.menuId eq m.menuIdx and !empty ms.authoList}">
					<c:if test="${m.menuLevel eq 2}">
						<c:set var="prefpath" value="" />
						<c:set var="prefpath" value="${fn:split(m.folderPath, '/')}" />
						<c:set var="length" value="${fn:length(prefpath) }"/>
						<c:set var="prefixPath" value="${fn:replace(m.folderPath, prefpath[length -1], '') }"/>
						<li class="lnb_depth1" id="${m.menuIdx }"><a href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${prefixPath}">${m.menuName }</a></li>
					</c:if> 
					<c:if test="${m.menuLevel eq 3}">
						<li class="lnb_depth2" data-id="${m.parentIdx }"><a href="${URL_ADMIN_ROOT}${m.folderPath }" prefix="${URL_ADMIN_ROOT}${m.folderPath }" >${m.menuName }</a></li>
					</c:if>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
	<c:choose>
		<%-- 환경설정 --%>
		<c:when test="${fn:contains(reqURI, '/config/') }">
			<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/">메뉴권한관리</a></li>
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/list">메뉴관리 </a></li>
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/menu/grouprole/list" prefix="${URL_ADMIN_ROOT}/config/menu/grouprole">권한관리</a></li>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/board/manage/') || fn:contains(reqURI, '/board/list/') || fn:contains(reqURI, '/board/write/') || fn:contains(reqURI, '/board/quick')}">
			<c:set var="subPath" value="/board/list/" />
			<c:if test="${fn:contains(reqURI, '/board/write/') }">
				<c:set var="subPath" value="/board/write/" />
			</c:if> 
			<%-- <li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}${subPath}">게시판 목록</a></li> --%>
			<c:forEach items="${listGroup }" var="m" varStatus="s">
								<li class="lnb_board_group">${m.groupName }</li>
				<c:forEach items="${listBoardMaster }" var="n" varStatus="ss">
					<c:if test="${m.groupSeq eq n.groupSeq }">
								<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/list/${n.boardCode}" prefix="${subPath}${n.boardCode}">${n.boardName }</a></li>
					</c:if>
				</c:forEach>					
			</c:forEach>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/page/') }">
			<li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}/page/page_write">페이지 목록</a></li>
			<c:forEach items="${listGroup }" var="m" varStatus="s">
					<li class="lnb_board_group">${m.groupName }</li>
				<c:forEach items="${listPage }" var="n" varStatus="ss">
					<c:if test="${m.groupSeq eq n.pageGroupSeq }">
								<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/page/page_write/${n.pageSeq}" prefix="/page/page_write/${n.pageSeq}">${n.pageName }</a></li>
					</c:if>
				</c:forEach>					
			</c:forEach> 
		</c:when>
		<c:when test="${fn:contains(reqURI, '/formmail/') }">
			<%-- <c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">					
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/formmail/manage/formmail_list" prefix="${URL_ADMIN_ROOT}/formmail/manage/formmail_">폼메일생성</a></li>
			</c:if>		 --%>			
				<%-- <li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}/formmail/list/">폼메일 목록</a></li> --%>
			<c:forEach items="${listForm}" var="m">
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/formmail/list/${m.formSeq }" prefix="${subPath}${m.formSeq }">${m.formName}</a></li>
			</c:forEach>
		</c:when>
		<c:when test="${fn:contains(reqURI, '/banner/') }">
			<c:set var="subPath" value="/banner/list/" />
			<c:if test="${fn:contains(reqURI, '/banner/write') }">
				<c:set var="subPath" value="/banner/write/" />
			</c:if>
			<%-- <li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}${subPath}">배너 목록</a></li>	 --%>
				<c:forEach items="${listBannerMaster }" var="m" varStatus="s">
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/banner/list/${m.bmSeq}" prefix="${URL_ADMIN_ROOT}${subPath}${m.bmSeq}">${m.masterName }</a></li>
				</c:forEach>		
		</c:when>
	</c:choose>
	</ul>
	</c:if>
	<!-- THIS IS ADMIN MENUS -->
	<%-- <c:choose>
	
		환경설정
		<c:when test="${fn:contains(reqURI, '/config/') }">
			<h2 class="lnb_title">
				<span class="title1">환경설정</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/basic/sys_config" prefix="${URL_ADMIN_ROOT}/config/basic/">기본설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/sys_config" prefix="${URL_ADMIN_ROOT}/config/basic/sys_">기본설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/log" prefix="${URL_ADMIN_ROOT}/config/basic/log">로그분석</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/popup" prefix="${URL_ADMIN_ROOT}/config/basic/popup">팝업관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/form" prefix="${URL_ADMIN_ROOT}/config/basic/form">폼메일</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/sms" prefix="${URL_ADMIN_ROOT}/config/basic/sms">SMS발송</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/banner" prefix="${URL_ADMIN_ROOT}/config/basic/banner">배너관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/page" prefix="${URL_ADMIN_ROOT}/config/basic/page">페이지관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/basic/auth_page" prefix="${URL_ADMIN_ROOT}/config/basic/auth_page">페이지 접근권한</a></li>
				
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/board/manage" prefix="${URL_ADMIN_ROOT}/config/board/">게시판</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/board/manage" prefix="${URL_ADMIN_ROOT}/config/board/manage">게시판</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/board/main_manage" prefix="${URL_ADMIN_ROOT}/config/board/main_">메인게시물</a></li>
				
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/prd/manage" prefix="${URL_ADMIN_ROOT}/config/prd/">상품 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/prd/manage" prefix="${URL_ADMIN_ROOT}/config/prd/manage">상품 리스트</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/prd/main_manage" prefix="${URL_ADMIN_ROOT}/config/prd/main_">메인 & 추천 상품</a></li>	
				

				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/member/manage" prefix="${URL_ADMIN_ROOT}/config/member/">회원관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/member/manage" prefix="${URL_ADMIN_ROOT}/config/member/manage" >회원가입설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/member/sns" prefix="${URL_ADMIN_ROOT}/config/member/sns">SNS설정</a></li>
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/siteapi/api" prefix="${URL_ADMIN_ROOT}/config/siteapi/api">API관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/siteapi/api" prefix="${URL_ADMIN_ROOT}/config/siteapi/api">API관리</a></li>	
			<c:if test="${tagoplusSolution1_session_site.pointYn eq 'Y'}">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/point/manage" prefix="${URL_ADMIN_ROOT}/config/point/">포인트관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/point/manage" prefix="${URL_ADMIN_ROOT}/config/point/manage">포인트관리</a></li>
			</c:if>
			<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/">메뉴권한관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/menu/list" prefix="${URL_ADMIN_ROOT}/config/menu/list">메뉴관리 </a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/menu/grouprole/list" prefix="${URL_ADMIN_ROOT}/config/menu/grouprole">권한관리</a></li>
			<!-- MGL added -->
			 <li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/config/sitemeta/list" prefix="${URL_ADMIN_ROOT}/config/sitemeta">SEO관리 </a></li>
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/sitemeta/list" prefix="${URL_ADMIN_ROOT}/config/sitemeta/list">SEO관리 </a></li>	
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/config/commgroup/list" prefix="${URL_ADMIN_ROOT}/config/commgroup/list">그룹관리</a></li>		
				
							
				
			</ul>
		</c:when> --%>
		<%-- 기본설정 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/base/') }">
			<h2 class="lnb_title">
				<span class="title1">기본설정</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/base/basic/site_info" prefix="${URL_ADMIN_ROOT}/base/basic/">기본설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/basic/site_info" prefix="${URL_ADMIN_ROOT}/base/basic/site_">사이트 정보</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/basic/admin_list" prefix="${URL_ADMIN_ROOT}/base/basic/admin_">관리자 설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/basic/grade_list" prefix="${URL_ADMIN_ROOT}/base/basic/grade_">관리자권한 그룹</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/basic/popup_list" prefix="${URL_ADMIN_ROOT}/base/basic/popup_">팝업 관리</a></li>
					<!-- <li class="lnb_depth2"><a href="./member/member02.html">SMS 관리</a></li> -->
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/basic/policies/list" prefix="${URL_ADMIN_ROOT}/base/basic/policies/list">가입약관 및 개인정보 보호정책</a></li>
					<!-- MGL added -->
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/base/company/company_info" prefix="${URL_ADMIN_ROOT}/base/company/company_info">사이트정보설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/company/company_info" prefix="${URL_ADMIN_ROOT}/base/company/company_info">상점정보설정</a></li>
					
					
				
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/base/region/list" prefix="${URL_ADMIN_ROOT}/base/region/">지역 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/region/list" prefix="${URL_ADMIN_ROOT}/base/region/list">지역 설정</a></li>
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/base/carmanage/list" prefix="${URL_ADMIN_ROOT}/base/carmanage/">차종 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/carmanage/type" prefix="${URL_ADMIN_ROOT}/base/carmanage/type">차종설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/carmanage/list" prefix="${URL_ADMIN_ROOT}/base/carmanage/list">차명설정</a></li>
				
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/base/insurance/list" prefix="${URL_ADMIN_ROOT}/base/insurance">운영정보설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/insurance/list" prefix="${URL_ADMIN_ROOT}/base/insurance/list">보험설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/base/option/list" prefix="${URL_ADMIN_ROOT}/base/option/list">옵션설정</a></li>
			</ul>
		</c:when> --%>
		
		
		<%-- 게시판 관리 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/board/manage/') || fn:contains(reqURI, '/board/list/') || fn:contains(reqURI, '/board/write/')}">
			게시판별 게시물 목록 action url에 따른 prefix 변경
			<c:set var="subPath" value="/board/list/" />
			<c:if test="${fn:contains(reqURI, '/board/write/') }">
				<c:set var="subPath" value="/board/write/" />
			</c:if> 		
			<h2 class="lnb_title">
				<span class="title1">게시판 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/board/manage/list" prefix="${URL_ADMIN_ROOT}/board/manage/">게시판 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/manage/board_list" prefix="${URL_ADMIN_ROOT}/board/manage/board_">게시판 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/manage/article_list" prefix="${URL_ADMIN_ROOT}/board/manage/article">게시물 통합관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/manage/comment_list" prefix="${URL_ADMIN_ROOT}/board/manage/comment">코멘트 통합관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/manage/statistics_board" prefix="${URL_ADMIN_ROOT}/board/manage/statistics">게시판 통계</a></li>
					
				<li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}${subPath}">게시판 목록</a></li>
<c:forEach items="${listGroup }" var="m" varStatus="s">
					<li class="lnb_board_group">${m.groupName }</li>
	<c:forEach items="${listBoardMaster }" var="n" varStatus="ss">
		<c:if test="${m.groupSeq eq n.groupSeq }">
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/board/list/${n.boardCode}" prefix="${subPath}${n.boardCode}">${n.boardName }</a></li>
		</c:if>
	</c:forEach>					
</c:forEach>
			</ul>
		</c:when> --%>
		
		
		<%-- 회원 관리 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/member/manage/') }">
			<h2 class="lnb_title">
				<span class="title1">회원 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/member/manage/member_list" prefix="${URL_ADMIN_ROOT}/member/manage/">회원 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/member_list" prefix="${URL_ADMIN_ROOT}/member/manage/member_">회원 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/grade_list" prefix="${URL_ADMIN_ROOT}/member/manage/grade_">회원등급 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/withdrawal_list" prefix="${URL_ADMIN_ROOT}/member/manage/withdrawal_">탈퇴 회원</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/mail_list" prefix="${URL_ADMIN_ROOT}/member/manage/mail_">이메일 설정</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/terms" prefix="${URL_ADMIN_ROOT}/member/manage/terms">가입약관 및 개인정보 보호정책</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/member/manage/mailer_test" prefix="${URL_ADMIN_ROOT}/member/manage/mailer_test">단체 메일 발송</a></li>
			</ul>
		</c:when> --%>
		
		<%-- 페이지 관리 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/page/') }">
			<h2 class="lnb_title">
				<span class="title1">페이지 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/page/list_pages" prefix="${URL_ADMIN_ROOT}/page/page_lists">페이지 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/page/list_pages" prefix="${URL_ADMIN_ROOT}/page/page_lists">페이지관리</a></li>
				<li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}/page/page_write">페이지 목록</a></li>
<c:forEach items="${listGroup }" var="m" varStatus="s">
					<li class="lnb_board_group">${m.groupName }</li>
	<c:forEach items="${listPage }" var="n" varStatus="ss">
		<c:if test="${m.groupSeq eq n.pageGroupSeq }">
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/page/page_write/${n.pageSeq}" prefix="/page/page_write/${n.pageSeq}">${n.pageName }</a></li>
		</c:if>
	</c:forEach>					
</c:forEach> 
			</ul>
		</c:when> --%>
		<%-- 폼메일 관리 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/formmail/') }">
		<c:set var="subPath" value="/formmail/list/" />
			<c:if test="${fn:contains(reqURI, '/formmail/write/') }">
				<c:set var="subPath" value="/formmail/write/" />
			</c:if> 
			<h2 class="lnb_title">
				<span class="title1">폼메일 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/formmail/manage/list" prefix="${URL_ADMIN_ROOT}/formmail/manage/">폼메일 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/formmail/manage/list" prefix="${URL_ADMIN_ROOT}/formmail/manage/list">폼메일관리</a></li>
<c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}">					
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/formmail/manage/formmail_list" prefix="${URL_ADMIN_ROOT}/formmail/manage/formmail_">폼메일생성</a></li>
</c:if>					
				<li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}/formmail/list/">폼메일 목록</a></li>
<c:forEach items="${listForm}" var="m">
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/formmail/list/${m.formSeq }" prefix="${subPath}${m.formSeq }">${m.formName}</a></li>
</c:forEach>

			</ul>
		
		</c:when> --%>
		
		<%-- 배너 관리 --%>
		<%-- <c:when test="${fn:contains(reqURI, '/banner/manage/') || fn:contains(reqURI, '/banner/list/') || fn:contains(reqURI, '/banner/write/') }"> --%>
		<%-- <c:when test="${fn:contains(reqURI, '/banner/') }">
			<c:set var="subPath" value="/banner/list/" />
			<c:if test="${fn:contains(reqURI, '/banner/write') }">
				<c:set var="subPath" value="/banner/write/" />
			</c:if> 	
			<h2 class="lnb_title">
				<span class="title1">배너 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/banner/manage/banner_list" prefix="${URL_ADMIN_ROOT}/banner/manage/">배너 관리</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/banner/manage/banner_list" prefix="${URL_ADMIN_ROOT}/banner/manage/banner_list">배너 관리</a></li>
				<li class="lnb_depth1"><a href="#" prefix="${URL_ADMIN_ROOT}${subPath}">배너 목록</a></li>	
<c:forEach items="${listBannerMaster }" var="m" varStatus="s">
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/banner/list/${m.bmSeq}" prefix="${URL_ADMIN_ROOT}${subPath}${m.bmSeq}">${m.masterName }</a></li>
</c:forEach>					
			</ul>
		</c:when> --%>
		
		
		
		<%-- <c:when test="${fn:contains(reqURI, '/stat/') }">
			<h2 class="lnb_title">
				<span class="title1">통계 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/stat/manage/stat_list" prefix="${URL_ADMIN_ROOT}/stat/manage/">접속통계</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/stat/manage/stat_user" prefix="${URL_ADMIN_ROOT}/stat/manage/stat_user">접속자 분석</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/stat/manage/stat_path" prefix="${URL_ADMIN_ROOT}/stat/manage/stat_path">접속경로 분석</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/stat/manage/stat_keyword" prefix="${URL_ADMIN_ROOT}/stat/manage/stat_keyword">검색 키워드 분석</a></li>
					<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/stat/manage/stat_operator" prefix="${URL_ADMIN_ROOT}/stat/manage/stat_operator">OS/브라우저</a></li>
			</ul>
		</c:when> --%>
		
		<%-- <c:when test="${fn:contains(reqURI, '/prd/') }">
			<h2 class="lnb_title">
				<span class="title1">상품 관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/prd/manage/prd_list" prefix="${URL_ADMIN_ROOT}/prd/manage/">상품 관리</a></li>
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/prd/manage/prd_list" prefix="${URL_ADMIN_ROOT}/prd/manage/prd_list">상품 관리</a></li>
				<li class="lnb_depth2"><a href="${URL_ADMIN_ROOT}/prd/manage/category_list" prefix="${URL_ADMIN_ROOT}/prd/manage/category_list">카테고리 관리</a></li>
			</ul>
		</c:when> --%>
		
		<%-- <c:when test="${fn:contains(reqURI, '/dealer/') }">
			<h2 class="lnb_title">
				<span class="title1">업체/차량관리</span>
			</h2>
			<ul class="lnb mb30">
				<li class="lnb_depth1"><a href="${URL_ADMIN_ROOT}/dealer/list" prefix="${URL_ADMIN_ROOT}/dealer/">옵셜설정</a></li>
			</ul>
		</c:when> --%>
		
		<%-- <c:otherwise>
			<h2 class="lnb_title">
				<span class="title1">메인</span>
			</h2>
		</c:otherwise> --%>
	<%-- </c:choose> --%>

</div>
<!--lnb E-->
<script type="text/javascript">
	$(function() {
		var sUrl = location.pathname;
		var sOnClass = "depth2_on";
		var isVisitMenu = 0
		var parent;
		$('ul.lnb > li.lnb_depth2 > a').each(function() {
			$(this).removeClass(sOnClass);
			
			if (sUrl === $(this).attr('href') && !$(this).hasClass(sOnClass)) {
				parent = $(this).parent().data('id');
				$('#'+parent+'').children().addClass('depth1_on');
				$(this).addClass(sOnClass);
				if($('#'+parent+'').length === 0){
					$('li.lnb_depth1').last().children().css('pointer-events', 'none');
					$('li.lnb_depth1').last().children().addClass('depth1_on');
				}
				isVisitMenu = 1;
			}else if (sUrl.indexOf($(this).attr('prefix')) > -1 && $('#'+parent+'').length > 0){
				$(this).addClass(sOnClass);
			}
		});
		
		if (isVisitMenu == 0){
			var pUr = document.referrer.replace(location.origin,'');
			if(pUr.indexOf('?') > -1)
				pUr = pUr.substring(0, pUr.indexOf('?'));
			$("li.lnb_depth2 > a[href='"+pUr+"']").addClass(sOnClass);
			$("li.lnb_depth1 > a[href='"+pUr+"']").addClass('depth1_on');
			if($("li.lnb_depth1 > a[href='"+pUr+"']").length === 0 && !parent){
				$('li.lnb_depth1').last().children().addClass('depth1_on');
			}
		}
		var exist = $('li.lnb_depth1').last().prop('id');
		if($('li[data-id="'+ exist +'"]').length === 0){
			$('li.lnb_depth1').last().children().css('pointer-events', 'none');
		}
	});
</script>