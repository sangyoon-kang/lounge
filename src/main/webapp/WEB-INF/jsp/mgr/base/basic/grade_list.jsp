<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>회원등급 관리</h2>
		<p>홈 &gt; 회원 관리 &gt; 회원등급 관리</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./grade_proc.do" method="post">
			<input type="hidden" name="glevel" />
			<input type="hidden" name="status" />
		<ul class="fr">
			<li><a onclick="javascript:$.Nav('go', './grade_write.do', {glevel:''});" class="bt_boardmake">등급 추가</a></li>
		</ul>
		<br class="clear" />
		
		<table class="board_st1 mt10">
			<colgroup>
				<col width="7%" />
				<col width="10%" />
				<col width="*" />
				<col width="15%" />
				<col width="15%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>등급 레벨</th>
					<th>등급</th>
					<th>회원 보기</th>
					<th>기능</th>
				</tr>
			</thead>
			<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
				<tr>
					<td>${s.index + 1 }</td>
					<td>${m.gradeLevel }</td>
					<td>${m.gradeName }</td>
					<td>
						<a onclick="javascript:$.Nav('go', '${URL_ADMIN_ROOT }/base/basic/admin_list.do', {glevel: '${m.gradeLevel}'}, null, true);" class="bt_copy">관리자 보기</a>
					</td>
					<td>				
						<a onclick="javascript:$.Nav('go', './grade_write.do', {glevel: '${m.gradeLevel}'});" class="bt_modify">수정</a>
						<a onclick="javacript:doDelete('${m.gradeLevel}');" class="bt_delete">삭제</a>
					</td>
				</tr>
</c:forEach>
<c:if test="${empty list}">
				<tr>
					<td colspan="5"><s:message code="common.noData" /></td>
				</tr>
</c:if>
			</tbody>
		</table>
		<br class="clear mb5" />

		<!-- <ul class="summmit_btn">
			<li><a class="btn2 bg_navy">확인</a></li>
		</ul> -->
		
		</form>
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
	});
	
	function doDelete(glevel) {
		if(!confirm('삭제하시겠습니까?'))
			 return;

		$('input[name=glevel]').val(glevel);
		$('input[name=status]').val('d');
		$('#form1').submit();	
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>