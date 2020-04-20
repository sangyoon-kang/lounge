<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 이메일 설정
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>이메일 설정</h2>
		<p>홈 &gt; 회원 관리 &gt; 이메일 설정</p>
	</div>

	<div class="scon">
		<form id="form1" action="./mail_proc.do" method="post">
		<input type="hidden" name="status" value="d" />
		<input type="hidden" name="emseq"  />
		<div class="scon_search">
			<ul class="table_aside02">
				<li><a onclick="javascript:doWrite(0);" class="btn btn_round bg_purple">메일 등록</a></li>
			</ul>
		</div>
		<table class="board_st1 mb20">
			<colgroup>
				<col width="10%" />
				<col width="*" />
				<col width="20%" />
				<col width="25%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>분류명</th>
					<th>발송여부</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
<c:if test="${!empty list}">
<c:forEach var="m" items="${list }" varStatus="s">			
				<tr>
					<td>${m.mailSeq }</td>
					<td>${m.mailName }</td>
					<td>${m.sendName }</td>
					<td>
						<a href="javascript:doWrite(${m.mailSeq })" class="btn btn_round bg_pink">수정</a>
<c:if test="${m.mailSeq > 3}">
						<a href="javascript:doDelete(${m.mailSeq });" class="btn btn_round bg_darkgray">삭제</a>
</c:if>
					</td>
				</tr>
</c:forEach>
</c:if>
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
	$(function() {
	
	});
	
	function doWrite(seq) {
		$.Nav('go', './mail_write.do', {emseq:seq});
	}
	
	function doDelete(seq) {
		var sMsg = '${delete}';
		
		if (!confirm(sMsg))
			return;
		$('input[name=emseq]').val(seq);
		
		$('#form1').submit();
	}

</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>