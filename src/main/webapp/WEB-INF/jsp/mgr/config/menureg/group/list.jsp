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
		<h2>권한관리(좌)</h2>
		<p>홈 &gt; 환경설정 &gt; 권한관리 </p>
	</div>
	<div class="scon">
		<form id="form1" action="./menu_proc" method="post" enctype="multipart/form-data">
		
			<div class="scon_search">
				<span class="table_aside">총 메뉴  : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" /></span>
				<span class="fr"> 
					<a onclick="javascript:$.Nav('go', './write', {xD:''});" class="btn bg_darkgray">그룹등록  </a>
				</span>
			</div>
			
			<table class="board_st1">
				<colgroup>
					<col width="20%" />
					<col width="*" />
					<col width="20%" />
					<col width="10%" />
				</colgroup>
				<thead>
					<tr>
						<th>그룹명</th>
						<th>설명</th>
						<th>소속 관리자</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
						<tr>
							<td>${m.authoTitle }</td>
							<td>${m.authoContents }</td>
							<td>
								<c:forEach items="${m.userList }" var="adminId" varStatus="l">
									 <c:if test="${l.index eq 0}">${adminId }</c:if>
									 <c:if test="${l.index ne 0}">, ${adminId }</c:if>
								</c:forEach>
							</td>
							<td>
								<a onclick="javascript:$.Nav('go', './write', {xD: '${m.idX}'});" class="btn btn_round bg_blue btnh_22">수정</a>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list}">
						<tr>
							<td colspan="6"><s:message code="common.noData" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
		<br class="clear mb5" />
		
		<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
	</div>
</div>
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
$(function (){
	
})
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>