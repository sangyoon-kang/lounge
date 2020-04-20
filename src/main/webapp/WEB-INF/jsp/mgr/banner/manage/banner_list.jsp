<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너그룹관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	
	<div class="scon_title">
		<h2>배너 관리</h2>
		<p>홈 &gt; 배너 관리</p>
	</div>
	<div class="scon">
		<form id="form1" action='./banner_proc' method="post" >
			<input type="hidden" name="bseq" />
			<input type="hidden" name="status" />
			<h3 class="scon_tit2">배너그룹관리</h3>
			<div>
				<span class="fl">
					<span>총 배너그룹수 : ${search.totalCount }</span>
				</span>
				<span class="fr mb10">
<%-- <c:if test="${tagoplusSolution1_session_admin.userType eq 'superuser'}"> --%>
					<a href="javascript:$.Nav('go', './banner_write', {bseq:0});" class="btn btn_round bg_purple">배너그룹생성</a>
<%-- </c:if>			 --%>	
				</span>
			</div>
			<table class="board_st1">
				<caption>배너관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="15%" />
					<col width="10%" />
					<col width="10%" />
					<col width="*" />
					<col width="15%" />
					<col width="10%" />
					<col width="25%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>그룹명</th>
						<th>코드</th>
						<th>이미지</th>
						<th>형태</th>
						<th>줄바꿈 배너 수</th>
						<th>사용여부</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.bmSeq }</td>
						<td><a onclick="javascript:$.Nav('go','./banner_write', {bseq:${m.bmSeq}});">${m.masterName }</a></td>
						<td><a onclick="javascript:$.Nav('go','./banner_write', {bseq:${m.bmSeq}});">${m.masterCode }</a></td>
						<td>${m.imgCount }</td>
						<td>${m.directionName }</td>
						<td>${m.lfCount }</td>
						<td>${m.useYnName }</td>
						<td>
							<a href="javascript:$.Nav('go', '../list/${m.bmSeq }');" class="btn btn_round bg_gray">배너관리</a> 
							<a href="javascript:$.Nav('go', './banner_write', {bseq:${m.bmSeq }});" class="btn btn_round bg_pink">수정</a> 
							<a href="javascript:doDelete(${m.bmSeq });" class="btn btn_round bg_darkgray">삭제</a>
						</td>
					</tr>
</c:forEach>				
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doDelete(seq) {
		var sMsg = '${delete}';
		
		
		if (!confirm(sMsg))
			return;
		
		$('input[name=bseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
