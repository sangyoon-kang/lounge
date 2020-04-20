<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<div id="fakeloader" style="opacity: 0.7;"></div>
<script type="text/javascript">
	$('#fakeloader').fakeLoader({
		timeToHide : 500
		, spinner : 'spinner3'
		, zIndex : '9999'
		, bgColor : '#fff'
	});
</script>