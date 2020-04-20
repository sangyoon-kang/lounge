<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front 공통 html <footer> 선언부
--%>
	<div id="bomu_wrp">
		<div id="bomu">
			<ul>
				<li class="frt"><a href="/">홈</a></li>
				<li><a href="/pages/company/intro.jsp">회사소개</a></li>
				<li><a href="/join/term.jsp">이용약관</a></li>
				<li><a href="/join/privacy_info.jsp">개인정보취급방침</a></li>
				<li><a href="/pages/company/location.jsp">찾아오시는 길</a></li>
				<li><a href="/">사이트맵</a></li>
			</ul>
		</div>
	</div>
	<div id="footer">
		<div class="inner">
			<div class="logo"><img src="/images/copy_logo.gif" title="타고플러스"/></div>
			<div class="bo_ban"><img src="/images/bo_ban.gif"/></div>
			<div class="addr">
				<b>${tagoplusSolution1_session_site.footBusinessName }</b><br />
				${tagoplusSolution1_session_site.footAddr1 } ${tagoplusSolution1_session_site.footAddr2 }<span class="mL20">TEL:${tagoplusSolution1_session_site.footPhone }</span><span class="mL20">FAX: ${tagoplusSolution1_session_site.footFax }</span> <br />
				사업자등록번호: ${tagoplusSolution1_session_site.footBusinessNumber }<span class="mL20">통신판매번호: 구로 제 2008-00086호</span><span class="mL20">대표 : ${tagoplusSolution1_session_site.footRepName }</span><span class="mL20">개인정보관리책임자 : 박영진</span> <br />
				${tagoplusSolution1_session_site.adminCopyright }</div>
		</div>
	</div>