<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	기본 설정> 관리자 설정 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>관리자 설정</h2>
		<p>홈 &gt; 기본 설정 &gt; 관리자 설정</p>
	</div>

	<div class="scon">
		<form id="form1" action="./admin_proc" method="post">
		<input type="hidden" name="status" value="d" />
		<input type="hidden" name="aid"  />
		<div class="scon_search">
			<ul class="table_aside02">
				<li><a onclick="javascript:doWrite('');" class="btn btn_round bg_purple">관리자 등록</a></li>
			</ul>
		</div>
		<table class="board_st1 mb20">
			<colgroup>
				<col width="10%" />
				<col width="20%" />
				<col width="20%" />
				<col width="25%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>아이디</th>
					<th>성명</th>
					<th>등록일</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${!empty list}">
<c:forEach var="m" items="${list }" varStatus="s">			
				<tr>
					<td>${search.paging.virtualNumber - s.index }</td>
					<td>${m.adminId }</td>
					<td>${m.adminName }</td>
					<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
					<td>
						<a href="javascript:doWrite('${m.adminId }')" class="btn btn_round bg_blue btnh_22">보기</a>
						<a href="javascript:doDelete('${m.adminId }');" class="btn btn_round bg_red btnh_22">삭제</a>
					</td>
				</tr>
</c:forEach>
</c:if>
<c:if test="${empty list}">
				<tr>
					<td colspan="5"><s:message code="common.noData" /></td>
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
	$(function() {
	
	});
	
	function doWrite(aid) {
		$.Nav('go', './admin_write', {aid:aid});
	}
	
	function doDelete(aid) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		$('input[name=aid]').val(aid);
		
		$('#form1').submit();
	}

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>