<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	PC web front LNB
		- 회원
--%>
	<div id="left">	
<c:if test="${empty search.id }">
		<div class="left_tit">
			<p class="stxt">MEMBER</p>
			<p class="sb">타고멤버</p>
		</div>
		<ul class="left_mu">	
			<li><a href="/member_login.jsp" suffix="/member_login">로그인</a></li>
			<li><a href="/member_join.jsp" suffix="/agree,/member_join">회원가입</a></li>
			<li><a href="/member_find.jsp" suffix="/member_find">아이디/패스워드 찾기</a></li>
			<li><a href="/join/term.jsp" suffix="/term">이용약관</a></li>
			<li><a href="/join/privacy_info.jsp" suffix="/privacy_info">개인정보취급방침</a></li>
		</ul>	
</c:if>

<c:if test="${!empty search.id }">	
		<div class="left_tit">
			<p class="stxt">MyPage</p>
			<p class="sb">마이페이지</p>
		</div>
		<ul class="left_mu">
			<li><a href="/member_info.jsp?id=${search.id }" suffix="/member_info">회원 정보 수정</a></li>
			<li><a href="/mypage/solution_buy_list.do?id=${search.id }" suffix="/solution_buy_list">솔루션 구매 내역</a></li>
			<li><a href="/mypage/consulting_list.do?id=${search.id }" suffix="/consulting_list">1:1상담 내역</a></li>
			<li><a href="/mypage/pwd_change.do?id=${search.id }" suffix="/pwd_change">비밀번호 수정</a></li>
			<li><a href="/mypage/withdrawal.do?id=${search.id }" suffix="/withdrawal">회원 탈퇴</a></li>
			<li><a href="/mypage/mem_point.do?id=${search.id }" suffix="/mem_point">적립금 리스트</a></li>
		</ul>	
</c:if>			
		
		<div id="left_ban">
			<jsp:include page="/module/banner" flush="true"><jsp:param name="bseq" value="22" /></jsp:include>
		</div>
	</div>
<script type="text/javascript">
var sURL = '${pageContext.request.requestURL}';
$('.left_mu a').each(function () {
	var suffix = $(this).attr('suffix').split(',');
	for(var i in suffix) {
		if (sURL.indexOf(suffix[i]) > -1){
			$(this).attr('class', 'on');
		}
	}
});
</script>		
	