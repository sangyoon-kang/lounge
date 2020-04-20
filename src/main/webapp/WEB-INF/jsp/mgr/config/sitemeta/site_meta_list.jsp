<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- --------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>SEO관리 </h2>
		<p>홈 &gt; 사이트관리   &gt; SEO관리 &gt; SEO 리스트 </p>
	</div>
	<div class="scon">

		<form id="form1" action="./proc.do" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="useFlag" />
			<input type="hidden" name="regUser" />
			<input type="hidden" name="status" />
			 <input type="hidden"
				name="seoIdx" />
			
			<div class="scon_search">
			<h3>타이틀관리</h3>
			<tt:select name="groupIdx" list="${commgrouplist }"
								listKey="commGroupIdx" listValue="title" indexKey="0"
								indexValue="전체그룹"  selected="${vo.groupIdx }" />
			<input type="text" name="searchWord"
							value="${search.searchWord }" maxlength="200" />
			<a href="javascript:findbysearch();"
					class="btn btn_round bg_purple ">검색</a>				
				<span class="fr mb10"> <a
					href="javascript:$.Nav('go', './seo_write', {seoIdx:0});"
					class="btn btn_round bg_orange">타이틀 등록</a>
				</span>
			</div>

			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />
					<col width="15%" />					
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<!-- <th>그룹명</th> -->
						<th>제목</th>
						<th>페이지주소</th>						
						<th>페이지 title</th>
						<th>사용여부</th>
						<th>등록일</th>
						<th>수정/삭제</th>						
					</tr>
				</thead>
				<tbody>
				
					<c:if test="${!empty list}">
						<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td>${search.paging.virtualNumber - s.index }</td>
								<%-- <td>
									${m.commGroupVO.title}
								</td> --%>
								<td>${m.metaTitle }</td>
								<td>${m.pageLink }</td>
								<td>${m.pageName }</td>
								<td><c:if test="${m.useFlag=='U'}">사용</c:if><c:if test="${m.useFlag=='S'}">사용하지</c:if></td>
								<td><fmt:formatDate pattern = "yyyy-MM-dd a hh:mm"     value = "${m.regDate }" /></td>
								<td><a
									onclick="javascript:$.Nav('go', './seo_write', {seoIdx: '${m.seoIdx }',useFlag:'${m.useFlag}'} );"
									class="btn btn_round bg_blue btnh_22">수정</a>
									<a href="javascript:doDelete(${m.seoIdx });" class="btn btn_round bg_darkgray">삭제</a></td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="8"><s:message code="common.noData" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
		<br class="clear mb5" />

		
		<br class="clear mb5" />

		<c:set var="delete">
			<s:message code="common.delete.msg" />
		</c:set>
<!-------------------------------------------------------------------- -->

		<script type="text/javascript">
			function doDelete(MetaIdx) {
				var sMsg = '${delete}';
				if (!confirm(sMsg))
					return;					

				$('input[name=seoIdx]').val(MetaIdx);				
				$('input[name=useFlag]').val('d');
				$('#form1').submit();
			}
			function findbysearch(){
				
				$.Nav('go', './seo_list', {id: $('select[name=groupIdx]').val(), status:'s',searchWord: $('input[name=searchWord]').val()});
			
			}
		</script>
	</div>
</div>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>