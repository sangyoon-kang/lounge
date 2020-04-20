<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<h2>은행계좌 설정</h2>
		<p>홈 &gt; 기본설정 &gt; 은행계좌 설정 </p>
	</div>

	<div class="scon">
		<form id="form1" action="./admin_proc" method="post">
			<input type="hidden" name="status" value="d" /> <input type="hidden"
				name="aid" />
			<div class="scon_search">
				<ul class="table_aside02">
					<li><a onclick="javascript:$.Nav('go', './write', {bankSeq : 0});"
						class="btn btn_round bg_purple">은행계좌 등록</a></li>
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
						<th>예금주</th>
						<th>은행</th>
						<th>계좌번호</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list}">
						<c:forEach var="m" items="${list }" varStatus="s">
							<tr>
								<td>${s.index+1}</td>
								<td>${m.accountName }</td>
								<td>${m.codeName }</td>
								<td>${m.accountNo }</td>
							    <td>
						         <a onclick="javascript:$.Nav('go', './write', {bankSeq: '${m.bankSeq}'});" class="btn btn_round bg_pink">수정</a> 
						         <a onclick="javascript:doDelete(${m.bankSeq});" class="btn btn_round bg_darkgray">삭제</a>		    
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
<c:set var="delete">
	<s:message code="common.delete.msg" />
</c:set>
<script type="text/javascript">
	function doDelete(bankSeq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		$.Nav('go', './bank_proc.do',{bankSeq:bankSeq, status:'d'});
	}

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>