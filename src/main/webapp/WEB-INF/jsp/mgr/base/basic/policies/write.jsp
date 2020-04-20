<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>
<style type="text/css">
select.selectversion{float: right; }
</style>
<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>운영정책설정</h2>
		<p>홈 &gt; 기본설정   &gt; 운영정책설정 &gt; ${vo==null ? ' 등록 ' : '수정'} </p>
	</div>

	<div class="scon">
	<form id="form1" name="form1" action="./policies_proc" method="post">
		<div class="mb5">
			<c:if test="${empty vo}">
				<%-- <tt:select list="${caseList }" name="contentsType" listKey="value" listValue="value" selected="${vo.contentsType }" ></tt:select> --%>
				<select name="contentsType">
					<c:forEach items="${caseList}" var="item">
						<option ${vo.contentsType==item.value ? 'selected' : ''} value="${item.key}">${item.value}</option>   
					</c:forEach>							   
				</select>
			</c:if>
			<c:if test="${!empty vo}">
				<c:set var="contentName" />
				<c:forEach items="${caseList}" var="it">
					<c:if test="${it.key eq vo.contentsType}">
						<c:set var="contentName" value="${it.value}" />
					</c:if>
				</c:forEach>
				<input type="text" readonly value="${contentName}" /> 
				<input type="hidden" name="contentsType" value="${vo.contentsType}" /> 
			</c:if>
		</div>
		<input type="hidden" name="iDx" value="${vo.iDx }" />
		<table class="board_write">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>제목</th>
					<td>
					<c:if test="${empty vo}">
						<input type="text" class="w100" name="title" id="policytitle"  maxlength="2000" value="${vo.title }" />
					</c:if>
					<c:if test="${!empty vo}">
					<label>${vo.title }</label>
						<input type="hidden" name="title" id="policytitle" value="${vo.title }" />
						<tt:select class="selectversion" list="${sameName }" name="version" listKey="version" listValue="version" selected="${vo.version }" />
						<%-- <select class="selectversion" name="version">
							<c:forEach items="${sameName}" var="item">
								<option ${vo.version==item.version ? 'selected' : ''} value="${item.version}">버전 ${item.version}.0</option>   
							</c:forEach>							   
						</select> --%>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea id="body" name="contents"  class="w100 editor" height="100px" style="height:200px">${vo.contents }</textarea>
						<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
						<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
						<script type="text/javascript">
							$(function() {
								CKEDITOR.replace('body', {
									width : '100%'
									, height : '300px'
									, startupFocus : false
								});
							});
						</script>
					</td>
				</tr>
			</tbody>
		</table>
	
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './list',{iDx:'', version:'',title:'', contentsType: ''});" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	</form>

	</div>
</div>


<script type="text/javascript">	
	
	function doSubmit() {	
		if(isNull($('#policytitle').val()) || $('#policytitle').val() === ''){
			alert('그룹명을 선택해야 합니다.');
			return;
		}
		if (!confirm('저장하시겠습니까?'))
			return;
		
		form1.submit();
	}
	$(document).on('change', '.selectversion', function(e){
		$.Nav('go', './write',{version: e.target.value ,contentsType:'${vo.contentsType}',iDx:""});
	});
	
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>