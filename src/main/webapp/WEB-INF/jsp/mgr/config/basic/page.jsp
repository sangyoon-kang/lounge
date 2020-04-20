<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 페이지관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>페이지관리</h2>
			<p>홈  &gt; 환경설정  &gt; 페이지관리</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">페이지관리 생성코드</h3>
<pre class="custom mb10"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/page" flush="true" &gt;<br/>
	&lt;jsp:param name="pseq" value="[페이지번호]" /&gt;<br/>
&lt;/jsp:include&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn_round bg_gray mb10 vc_bottom">생성코드복사</a>
			
			<div class="check_conbox mb10 pl10">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 홈페이지 내용을 관리자에서 수정할 수 있는 기능을 제공합니다.</li>
					<li>- 제작 완료 후에 관리자에서 직접 페이지 수정을 원할경우 페이지관리 기능을 이용합니다.</li>
					<li>- 페이지관리 메뉴에서 페이지를 추가/수정/삭제가 가능합니다.</li>
					<li>- 페이지관리 <b>[페이지번호]</b>명은 아래 페이지 목록의 순번으로 변경합니다.</li>
				</ul>
			</div>
			<span class="fl mb10" >총 페이지수 : ${search.totalCount }</span>
			<table class="board_st1">
				<caption>페이지관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="25%" />
					<col width="20%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>페이지</th>
						<th>페이지URL</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.pageSeq }</td>
						<td><c:if test="${empty m.groupName }">그룹없음</c:if>${m.groupName} > ${m.pageName }</td>
						<td>${m.pageUrl }</td>
						<td>
							<span id="spanCode_${m.pageSeq }" class="hide">
&lt;jsp:include page="/module/page" flush="true"&gt;
	&lt;jsp:param name="pseq" value="${m.pageSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>
						<a href="javascript:copyClipboard('#spanCode_${m.pageSeq }');" class="btn btn_round bg_gray">생성코드복사</a> 

					</tr>
</c:forEach>				
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</div>
	</div>
	<!--wrap_scon E-->

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>