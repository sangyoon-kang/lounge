<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 폼메일관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>폼메일관리</h2>
			<p>홈  &gt; 환경설정  &gt; 폼메일관리</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">폼메일관리 생성코드</h3>
<pre class="custom"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/form" flush="true"&gt;
	&lt;jsp:param name="fseq" value="[폼메일번호]" /&gt;
&lt;/jsp:include&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn_round bg_gray vc_bottom">생성코드복사</a>
			
			<div class="check_conbox pl10 mt15 mb15">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 폼메일을 형태에 구애없이 자유롭게 생성할 수 있는 편리한 기능을 제공합니다.</li>
					<li>- 스킨위치 : /</li>
					<li>- 폼메일관리 <b>[폼메일번호]</b>명은 아래 폼메일 목록의 순번으로 변경합니다.</li>
					<li>- 작성된 폼메일내용은 관리자 > 폼메일관리 메뉴에서 확인 가능합니다.</li>
				</ul>
			</div>
			
			<div>
				<span class="fl">
					<span>총 폼메일 수 : ${search.totalCount }</span>
				</span>
			</div>
			<table class="board_st1">
				<caption>폼메일관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>폼메일명</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.formSeq}</td>
						<td>${m.formName }</td>
						<td>
							<span id="spanCode_${m.formSeq }" class="hide">
&lt;jsp:include page="/module/form" flush="true"&gt;
	&lt;jsp:param name="fseq" value="${m.formSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>					
							<a href="javascript:copyClipboard('#spanCode_${m.formSeq }');" class="btn btn_round bg_gray">생성코드복사</a>
						</td>
					</tr>
</c:forEach>				
				</tbody>
			</table>

		</div>
	</div>
	<!--wrap_scon E-->

	<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>