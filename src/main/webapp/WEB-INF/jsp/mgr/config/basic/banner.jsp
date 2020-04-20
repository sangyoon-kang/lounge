<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 > 배너관리
 --%>	
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

	<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

	<!--wrap_scon S-->
	<div id="wrap_scon">
		
		<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

		<div class="scon_title">
			<h2>배너관리</h2>
			<p>홈  &gt; 환경설정  &gt; 배너관리</p>
		</div>
		
		<div class="scon">
			<h3 class="scon_tit2">배너관리 생성코드</h3>
<pre class="custom"><code id="spanCodeSample" class="html">
&lt;jsp:include page="/module/banner" flush="true"&gt;<br/>
	&lt;jsp:param name="bseq" value="[배너번호]" /&gt;<br/>
&lt;/jsp:include&gt;
</code></pre>
			<script>
				hljs.initHighlighting();
			</script>
			<a onclick="javascript:copyClipboard('#spanCodeSample');" class="btn btn_round bg_gray vc_bottom">생성코드복사</a>
			
			<div class="check_conbox pl10 mt15 mb15">
				<h4 class="check_tit">체크사항</h4>
				<ul>
					<li>- 홈페이지의 메인 이미지 또는 배너를 관리자에서 관리할 수 있는 기능을 제공합니다.</li>
					<li>- 사이트의 특정 이미지를 수정/삭제하는 기능이나 이미지 추가를 원할경우 배너관리를 이용합니다</li>
					<li>- 배너관리 메뉴에서 배너를 추가/수정/삭제가 가능합니다.</li>
					<li>- 배너관리 <b>[배너번호]</b>명은 아래 배너 목록의 순번으로 변경합니다.</li>
				</ul>
			</div>
			
			<div>
				<span class="fl">
					<span>배너 수 : ${search.totalCount }</span>
				</span>
				<span class="fr mb10">
					<a href="${URL_ADMIN_ROOT }/banner/manage/banner_list" class="btn btn_round bg_sky">배너관리</a>
				</span>
			</div>
			<table class="board_st1">
				<caption>배너관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="18%" />
					<col width="*" />
					<col width="10%" />
					<col width="10%" />
					<col width="20%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>마스터코드</th>
						<th>그룹명</th>
						<th>배너형태</th>
						<th>사용여부</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.bmSeq }</td>
						<td>${m.masterCode }</td>
						<td>${m.masterName }</td>
						<td>${m.directionName }</td>
						<td>${m.useYnName }</td>
						<td>
							<span id="spanCode_${m.bmSeq }" class="hide">
&lt;jsp:include page="/module/banner" flush="true"&gt;
	&lt;jsp:param name="bseq" value="${m.bmSeq }" /&gt;
&lt;/jsp:include&gt;
							</span>
	<c:if test="${m.useYn eq 'Y' }">							
							<a href="javascript:copyClipboard('#spanCode_${m.bmSeq }');" class="btn btn_round bg_gray">생성코드복사</a>
	</c:if> 
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