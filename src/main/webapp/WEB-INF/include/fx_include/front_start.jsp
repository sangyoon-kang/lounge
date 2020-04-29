<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
  PC web front 공통 html <head> 선언부
	메시지(message-common_ko_KR.properties) 사용 예 : <s:message code="title.front" /> : 전체 공통 사이트 명. globals.properties 참조
  ${pageTitle } : controller에서 부제 추가 항목. globals.properties 참조
--%>
<!DOCTYPE html>
<html lang="kr">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi"/>
<meta name="format-detection" content="telephone=no" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<jsp:include page="/module/siteMeta" flush="true"/>
	
	<title>${tagoplusSolution1_session_site.siteName }${!empty pageTitle ? ' - ' : ''}${pageTitle }</title>
		
	
	<!-- <link href="/common/css/fx_css/style.css" rel="stylesheet" type="text/css" /> -->
	<link href="/common/css/fx_css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/fx_css/datepicker/datepicker.min.css" rel="stylesheet" type="text/css" /> 
	<link href="/common/css/global.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/layout.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/content.css?version=1.2" rel="stylesheet" type="text/css" />
	<link href="/common/css/fonts.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/popup.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/board.css" rel="stylesheet" type="text/css" />
	<link rel='shortcut icon' type='image/png' href='/images/fx_assets/logo/favicon.png' />
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
	
	
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.11.0.min.js"></script>
  	<script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/common/js/jquery/jquery.locator.js" charset="utf-8"></script>
    <script type="text/javascript" src="/common/js/common.jquery.util.js" charset="utf-8"></script>
    <script type="text/javascript" src="/common/js/jquery/jquery.oLoader.min.js"></script>
    <script type="text/javascript" src="/common/js/jquery/jquery.tmpl.min.js"></script>
    <script type="text/javascript" src="/common/js/lib.js"></script> 
    <script type="text/javascript" src="/common/js/common.js"></script>
	<script type="text/javascript" src="/common/js/fx_js/datepicker/datepicker.min.js"></script>
	<script type="text/javascript" src="/common/js/fx_js/datepicker/i18n/datepicker.kr.js"></script>
	<script type="text/javascript" src="/common/js/moment/moment.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <jsp:include page="/module/connect" flush="true" />

</head>
<body>
