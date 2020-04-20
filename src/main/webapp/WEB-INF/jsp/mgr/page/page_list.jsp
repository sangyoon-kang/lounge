<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>페이지관리</h2>
		<p>홈 &gt; 페이지관리 &gt;</p>
	</div>
	<div class="scon">
		<form id="form1" action="./page_proc.do" method="post">
			<input type="hidden" name="pseq" />
			<input type="hidden" name="status" />
			
			<h3 class="scon_tit2">페이지관리</h3>
			<div>
				<span class="fl">
					<span>총 페이지 수 : ${search.totalCount }</span>
				</span>
				<span class="fr mb10">
<%-- <c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}"> --%>				
					<a onclick="javascript:doWrite(0);" class="btn btn_round bg_purple">페이지등록</a>
<%-- </c:if>			 --%>		
				</span>
			</div>
			
<c:set var="port" />						
<c:if test="${pageContext.request.serverPort != 80 && pageContext.request.serverPort != 443 }">
	<c:set var="port" value=":${pageContext.request.serverPort }"/>
</c:if>				
			<table class="board_st1">
				<caption>페이지관리</caption>
				<colgroup>
					<col width="10%" />
					<!-- <col width="20%" /> -->
					<col width="15%" />
					<col width="35%" />
					<col width="20%" />
				</colgroup>
				
				<thead>
				<tr>
					<th>번호</th>
					<!-- <th>코드</th> -->
					<th>페이지목록</th>
					<th>주소</th>
					<th>기능</th>
				</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.pageSeq }</td>
						<%-- <td>${m.pageCode }</td> --%>
						<td><c:if test="${empty m.groupName }">그룹없음</c:if>${m.groupName} > ${m.pageName }</td>
						<td>http://${pageContext.request.serverName }${port}${m.pageUrl }</td>
						<td>
							<a onclick="javascript:doWrite(${m.pageSeq})" class="btn btn_round bg_pink">수정</a> 
							<a onclick="javascript:doDelete(${m.pageSeq});" class="btn btn_round bg_darkgray">삭제</a>
						</td>
					</tr>
</c:forEach>	
<c:if test="${empty list}">
					<tr>
						<td colspan="4"><s:message code="common.noData" /></td>
					</tr>
</c:if>			
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doWrite(pageSeq) {
		
		$.Nav('go', './page_write/' + pageSeq + ".do");
	}
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		
		$('input[name=pseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
