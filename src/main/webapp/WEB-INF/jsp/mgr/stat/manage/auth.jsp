<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	접속통계 - 접속자 분석
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<div id="ga-login-box" class="hide">
			<p>Please login on your google account to access Google Analytics.</p>
			<button id="ga-btnLogin" onclick="googleAnalytics.handleAuthClick()" class="btn2 btnh_30 bg_gray mt10">Login</button>
</div>


		
<!-- ============= JavaScript ============== -->
<!-- Google Analytic Libararies -->
<script src="/common/js/google-analytics.js"></script>
<script data-name="analytics" async defer src="https://apis.google.com/js/api.js" 
      onload="this.onload=function(){};googleAnalytics.handleClientLoad()" 
      onreadystatechange="if (this.readyState === 'complete') this.onload()" token="${set.googleAccessToken}"
      view_id="${set.googlelogValue }" client_id="${set.googlelogId}" start_date="<fmt:formatDate value="${tagoplusSolution1_session_site.installDate }" pattern="${DATE_FORMAT}"/>">
</script>

<!-- <script src="https://apis.google.com/js/api.js"></script> 

<script type="text/javascript"> 
  function doLoad() { 
     //alert( "The load event is executing" ); 
     googleAnalytics.handleClientLoad();
  } 
  if ( window.addEventListener ) {  
     window.addEventListener( "load", doLoad, false ); 
  } 
  else  
     if ( window.attachEvent ) {  
        window.attachEvent( "onload", doLoad ); 
  } else  
        if ( window.onLoad ) { 
           window.onload = doLoad; 
  } 
  </script> -->
  
<!-- <script src="https://apis.google.com/js/api.js"></script>
<script type="text/javascript">
	window.onload = function() {
		gapi.load('auth2', function() {
			document.getElementById('auth_button').onclick = authorizeClicked;
		});
	}

	function authorizeClicked() {
		gapi.auth2.authorize(
			{
				client_id: '543421548837-qvqn1d39nggpgguqk13h0csf6a4cgrm1.apps.googleusercontent.com',
				scope: 'https://www.googleapis.com/auth/calendar.readonly',
				prompt: 'consent',
				response_type: 'code'
			},
			function(resp) {
				console.log(JSON.stringify(resp));
			}
		);
	}
</script> -->





<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>