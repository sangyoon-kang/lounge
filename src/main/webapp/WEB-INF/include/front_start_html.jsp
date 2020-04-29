<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
  PC web front 공통 html <head> 선언부
	메시지(message-common_ko_KR.properties) 사용 예 : <s:message code="title.front" /> : 전체 공통 사이트 명. globals.properties 참조
  ${pageTitle } : controller에서 부제 추가 항목. globals.properties 참조
--%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<jsp:include page="/module/siteMeta" flush="true"/>
	
	<title>${tagoplusSolution1_session_site.siteName }${!empty pageTitle ? ' - ' : ''}${pageTitle }</title>
	
	<link href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/redmond/jquery-ui.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/js/jquery/bxslider/jquery.bxslider.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/bootstrap/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/fakeLoader/fakeLoader.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/jquery/colorbox_2/colorbox.css" rel="stylesheet" type="text/css" />
	<link href="/common/css/bootstrap/bootstrap.min.css" rel="stylesheet" type="text/css" />
	
	<link href="/common/css/optional/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery-migrate-1.4.1.min.js"></script>
	<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript" src="/common/js/bootstrap/bootstrap.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.locator.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmpl.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.tmplPlus.js"></script>
	<script type="text/javascript" src="/common/js/jquery/colorbox/jquery.colorbox-min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.blockUI.js"></script>
	<script type="text/javascript" src="/common/js/jquery/bxslider/jquery.bxslider.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.oLoader.min.js"></script>
	<script type="text/javascript" src="/common/js/jquery/jquery.ui.datepicker.custom.js"></script>
	<script type="text/javascript" src="/common/js/jquery/fakeLoader.js"></script>
	<script type="text/javascript" src="/common/js/lib.js"></script> 
    <script type="text/javascript" src="/common/js/common.jquery.util.js"></script>
    <script type="text/javascript" src="/common/js/common.js"></script>
    
    <!-- Global site tag (gtag.js) - Google Analytics -->
    <jsp:include page="/module/connect" flush="true" />

</head>
<body>
<div class="container-fluid">
