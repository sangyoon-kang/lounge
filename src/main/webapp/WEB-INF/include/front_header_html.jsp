<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front 공통 html GNB
--%>	
	<div id="header">
		<div id="header_top">
			<div class="row">
				<div class="col-md-4 logo">
					<h1><a href="/"><img src="/images/logo.png" title="타고플러스"/></a></h1>
				</div>
				<div class="col-md-4 pt25">
					<div class="top_ser">
						<!-- 검색어를 입력해 주세요. -->
						<input type="text" class="input_txt" placeholder="" disabled value=""/>
						<input type="image" src="/images/btn_topser.gif" style="height: 34px; position: relative; right: 3px;" alt="검색" disabled />
					</div>
				</div>
				<div class="col-md-4">
					<div class="utmu">
						<dl>
							<dd><a href="/pages/company/intro.jsp" class="btn_com">회사소개</a></dd>
<%-- <c:if test="${empty tagoplusSolution1_session_user }">							
							<dd><a href="javascript:$.Nav('go', '/member_login.jsp');" class="btn_login">로그인</a></dd>
							<dd><a href="/member_join.jsp">회원가입</a></dd>
</c:if>
<c:if test="${!empty tagoplusSolution1_session_user }">							
							<dd><a href="javascript:$.Nav('go', '/member_info.jsp', {id: '${tagoplusSolution1_session_user.userId}'});" class="btn_login">마이 페이지</a></dd>
							<dd><a href="javascript:doLogout();">로그아웃</a></dd>
</c:if>	 --%>
						<jsp:include page="/module/toplogin" flush="true" />
						<jsp:include page="/module/topjoin" flush="true" />
						</dl>
					</div>
				</div>
			</div>
		</div><!-- end header_top -->
		
		
		<div id="navi">
			<div class="inner">
				<ul class="gnb">
					<li>
						<a href="/pages/board/board.jsp" class="once">Board</a>
					</li>
					<li>
						<a href="/pages/prd_list.jsp?category1=10" class="once">타고 솔루션</a>
						<dl class="sm">
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=10">문자 솔루션</a>
							</dd>
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=20">BizWIz 그룹웨어</a>
							</dd>
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=30">중고차 솔루션</a>
							</dd>
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=40">부동산 솔루션</a>
							</dd>
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=50">콜센터 솔루션</a>
							</dd>
							<dd class="frt">
								<a href="/pages/prd_list.jsp?category1=60">쇼핑몰 솔루션</a>
							</dd>							
						</dl>
					</li>
					<li>
						<a href="/pages/consulting.jsp" class="once">웹사이트개발</a>
						<dl class="sm">
							<dd class="frt"><a href="/pages/consulting.jsp">견적안내</a></dd>
							<dd><a href="/pages/customer/estimate.jsp">온라인 견적문의</a></dd>
						</dl>
					</li>
					<li>
						<a href="/pages/app/app1.jsp" class="once">Mobile 웹/앱 제작</a>
						<dl class="sm">
							<dd class="frt"><a href="/pages/app/app1.jsp">Mobile 웹/앱 제작</a></dd>
							<dd><a href="/pages/app/app2.jsp">맞춤 앱 개발</a></dd>
						</dl>
					</li>
					<li>
						<a href="/pages/portfolio/website.jsp" class="once">포트폴리오</a>
						<dl class="sm">
							<dd class="frt"><a href="/pages/portfolio/website.jsp">웹사이트</a></dd>
							<dd><a href="/pages/portfolio/mobile.jsp">모바일 및 앱</a></dd>
						</dl>
					</li>
					<li>
						<a href="/pages/addition/sms_service.jsp" class="once">부가서비스</a>
						<dl class="sm">
							<dd class="frt"><a href="/pages/addition/sms_service.jsp">SMS서비스</a></dd>
							<dd><a href="/pages/addition/maintenance.jsp">유지관리</a></dd>
							<dd><a href="/pages/addition/web_hosting.jsp">웹호스팅</a></dd>
							<dd><a href="/pages/addition/online_ad.jsp">온라인 검색광고</a></dd>
						</dl>
					</li>
					<li>
						<a href="/pages/customer/notice.jsp" class="once">고객센터</a>
						<dl class="sm" style="border-right:1px solid #CCC;">
							<dd class="frt"><a href="/pages/customer/notice.jsp">공지사항</a></dd>
							<dd><a href="/pages/customer/consulting.jsp">1:1상담</a></dd>
							<dd><a href="/pages/customer/estimate.jsp">견적 상담 문의</a></dd>
							<dd><a href="/pages/customer/faq.jsp">FAQ</a></dd>
						</dl>
					</li>
				</ul>
			</div>
			<div id="sub_box"></div>
		</div>
		
	</div><!-- end header -->
	<script>
		$(function() {
			$('ul.gnb').hover(function() {
				$('#sub_box').slideDown(100);
				$(this).find('dl').slideDown(100);
			}, function() {
				$('#sub_box').slideUp(100);
				$(this).find('dl').slideUp(100);
			});
		});
	</script>