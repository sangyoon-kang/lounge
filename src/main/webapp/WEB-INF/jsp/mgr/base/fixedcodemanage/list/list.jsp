<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>fixed code</h2>
		<p>홈 &gt; 기본설정 &gt; 지역설정 &gt; 리스트</p>
	</div>
	<div class="scon">

		<form id="form1" action="./region_proc" method="post" enctype="multipart/form-data">
			<input type="hidden" name="status" /> 
			<input type="hidden" name="regionSeq" />

			<div class="scon_search">
				<span class="table_aside">전체 지역 : <fmt:formatNumber
						value="${search.count }" pattern="#,###" /></span> <span
					class="fr mb10"> 
					<a href="javascript:$.Nav('go', './writelist', {codeId:0});"
					class="btn btn_round bg_purple">add code</a>
				</span>
			</div>

			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="8%" />
					<col width="10%" />
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="5%" />
					<col width="10%" />
					<col width="10%" />
					
					
				</colgroup>
				<thead>
					<tr>
						
						<th>code type</th>
						<th>code id</th>
						<th>code name</th>
						<th>code info</th>
						<th>sort num</th>
						<th>use flag</th>
						<th>reg user</th>
						<th>reg date</th>
						
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list}">
						<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td>${m.codeType}</td>
								<td>${m.codeId}</td>
								<td>${m.codeName }</td>
								<td>${m.codeInfo }</td>
								<td>${m.sortNum }</td>
								<td>${m.useFlag }</td>
								<td>${m.regUser }</td>
								<td><fmt:formatDate pattern = "yyyy-MM-dd HH:mm"     value = "${m.regDate }" /></td>
								
								
								<td>
								
									<a onclick="javascript:$.Nav('go', './writelist', {codeId: '${m.codeId }'});"
									class="btn btn_round bg_blue btnh_22">수정</a> 
								
									</td>
							</tr>
						</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="9"><s:message code="common.noData" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>

		</form>
		<br class="clear mb5" />
		
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		<br class="clear mb5" />

		<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
		
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->

	<script type="text/javascript">
		
	function doDelete(seq) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		
		
		$('input[name=codeId]').val(seq);
		
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	</script>

	</div>

</div>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>