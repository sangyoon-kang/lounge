<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 폼메일생성
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	
	<div class="scon_title">
		<h2>폼메일 관리</h2>
		<p>홈 &gt; 폼메일 관리 &gt; 폼메일 생성</p>
	</div>
	<div class="scon">
		<form id="form1" action='./form_proc.do' method="post" >
			<input type="hidden" name="fseq" />
			<input type="hidden" name="status" />
			<h3 class="scon_tit2">폼메일생성</h3>
			<div>
				<span class="fl">
					<span>총 폼메일 수 : ${search.totalCount }</span>
				</span>
				<span class="fr mb10">
					<a href="javascript:doWrite(0);" class="btn btn_round bg_purple">폼메일생성</a>
				</span>
			</div>
			<table class="board_st1">
				<caption>폼메일관리</caption>
				<colgroup>
					<col width="10%" />
					<col width="*" />
					<col width="20%" />
				</colgroup>
				
				<thead>
					<tr>
						<th>번호</th>
						<th>폼메일명</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
<c:forEach var="m" items="${list }" varStatus="s">
					<tr>
						<td>${m.formSeq }</td>
						<td><a class="hover" href="javascript:doWrite(${m.formSeq })">${m.formName }</a></td>
						<td>
							<a href="javascript:doWrite(${m.formSeq });" class="btn btn_round bg_pink">수정</a> 
							<a href="javascript:doDelete(${m.formSeq });" class="btn btn_round bg_darkgray">삭제</a>
						</td>
					</tr>
</c:forEach>				
				</tbody>
			</table>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	function doWrite(seq) {
		$.Nav('go', './formmail_write.do', {fseq:seq});
	}
	
	function doDelete(seq) {
		var sMsg = '${delete}';
		
		
		if (!confirm(sMsg))
			return;
		
		$('input[name=fseq]').val(seq);
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
