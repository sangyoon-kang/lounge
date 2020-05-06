<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<footer>
		<div class="f_menu">
			<ul>
				<li><a href="/pages/fx_pages/about_us.jsp">회사소개</a></li>
                <li><a href="/pages/fx_pages/terms_setting.jsp">이용약관</a></li>
                <li><a href="/pages/fx_pages/privacy_policy.jsp">개인정보처리방침</a></li>
			</ul>
		</div>
		<div class="f_add">
			<ul>
				<li>${tagoplusSolution1_session_site.footBusinessName }</li>
				<li>대표:${tagoplusSolution1_session_site.footRepName }</li>        
				<li>사업자등록번호:${tagoplusSolution1_session_site.footBusinessNumber }</li>         
				<li>통신판매업 신고번호: ${tagoplusSolution1_session_site.orderMail }</li>
				<%--<li>대표전화 : ${tagoplusSolution1_session_site.footPhone }</li>   --%>
				<li>${tagoplusSolution1_session_site.footAddr1 } ${tagoplusSolution1_session_site.footAddr2 }</li>        
				<li>개인정보처리담당자:${tagoplusSolution1_session_site.personalInformationOfficer }</li>
				<li>${tagoplusSolution1_session_site.adminCopyright }</li></li>
			</ul>
			
		</div>
	</footer>
<script  type="text/javascript">
	var title = $('.board_title').text();
	console.log(title);
	$('#title').html(title);
</script>
<script type="text/javascript" src="/common/js/fx_js/common.js"></script>
</body>
