<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@	taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="tt" uri="http://dev.tagoplus.co.kr/taglib/tt"%>
<%@ taglib prefix="cfn" uri="/WEB-INF/tlds/tagFunctions.tld"%>

<%-- <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> --%>

<s:eval var="DATE_FORMAT" expression="@globals['common.date.type']" />
<s:eval var="TIME_FORMAT" expression="@globals['common.time.type']" />
<s:eval var="DATE_TIME_FORMAT" expression="@globals['common.date.type'] + ' ' + @globals['common.time.type']" />

<s:eval var="UPLOAD_ROOT" expression="@globals['upload.path.virtual']" />

<s:eval var="URL_ADMIN_ROOT" expression="@globals['url.admin.root']" />
<s:eval var="URL_ADMIN_LOGIN" expression="@globals['url.admin.login']" />
<s:eval var="URL_ADMIN_MAIN" expression="@globals['url.admin.main']" />
<s:eval var="URL_FRONT_MAIN" expression="@globals['url.front.main']" />
<s:eval var="URL_FRONT_LOGIN" expression="@globals['url.front.login']" />

<s:eval var="COOKIE_POPUP_PREFIX" expression="@globals['cookie.popup.prefix']" />

<s:eval var="WEB_MODE" expression="@globals['globals.web.mode']" />
<s:eval var="IPIN_CHECK" expression="@globals['ipin.checkplus.url']" />

<fmt:message var="MSG_COMM_SAVE" key="common.save.msg" />
<fmt:message var="MSG_COMM_INS" key="common.insert.msg" />
<fmt:message var="MSG_COMM_UPD" key="common.update.msg" />
<fmt:message var="MSG_COMM_DEL" key="common.delete.msg" />
<fmt:message var="MSG_COMM_CANCEL" key="common.cancel.msg" />

<fmt:message var="MSG_SUCC_SAVE" key="success.save" />
<fmt:message var="MSG_SUCC_INS" key="success.insert" />
<fmt:message var="MSG_SUCC_UPD" key="success.update" />
<fmt:message var="MSG_SUCC_DEL" key="success.delete" />
<fmt:message var="MSG_SUCC_CANCEL" key="success.cancel" />

<s:eval var="LOT_01" expression="@globals['payment.lot01.price']" />
<s:eval var="LOT_02" expression="@globals['payment.lot02.price']" />
<s:eval var="LOT_1" expression="@globals['payment.lot1.price']" />
<s:eval var="LOT_2" expression="@globals['payment.lot2.price']" />
<s:eval var="LOT_4" expression="@globals['payment.lot4.price']" />

<s:eval var="SITE_NAME_U" expression="@globals['site.name.u']" />
<s:eval var="SITE_NAME_L" expression="@globals['site.name.l']" />
<s:eval var="URL_HOST_OP" expression="@globals['url.host.op']" />