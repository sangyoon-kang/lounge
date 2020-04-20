<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	페이지관리 - 글쓰기
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	
	<div class="scon_title">
		<h2>페이지관리</h2>
		<p>홈 &gt; 페이지관리</p>
	</div>
	<div class="scon">
		<form id="form1" action="../page_proc.do" method="post">
		<input type="hidden" name="pseq" value="${search.pseq}" />
			<h3 class="scon_tit2">페이지등록</h3>
			<!-- <div class="check_conbox mb10">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>- 페이지URL은 <b>/URL주소</b> 형식대로 입력 해주세요.</li>
					</ul>
			</div> -->
			<table  class="board_write">
				<caption>페이지등록</caption>
				<colgroup>
					<col width="20%" />
					<col width="*" />
					<col width="15%" />
					<col width="25%" />
				</colgroup>
				
				<tbody>
<%-- 			<tr>
						<th ><strong>페이지코드 <span class="txt_red">*</span></strong></th>
						<td><input name="pageCode" class="input" value="${vo.pageCode }" maxlength="" type="text" /></td>
					</tr>
 --%>
					<tr>
						<th>
							<strong>메뉴 <span class="txt_red">*</span></strong>
						</th>
						<td>
							<tt:select list="${listGroup }" name="pageGroupSeq" listKey="groupSeq" listValue="groupName" indexKey="0" indexValue="= 페이지 그룹 =" selected="${vo.pageGroupSeq }" />
							<a onclick="javascript:openPop('', 'pageGroup');" class="btn btn_round bg_darkgray ml5">그룹관리</a> 
							<span class="ml5">우선순위</span>
							<select name="priority" class="ml5">
<c:set var="prioritySeleceted" value="" />							
<c:forEach var="i" begin="1" end="10" varStatus="s">
	<c:set var="prioritySeleceted" value="" />
	<c:if test="${vo.priority eq i }">
		<c:set var="prioritySeleceted" value=" selected" />
	</c:if>
								<option value="${i }"${prioritySeleceted }>${i }</option>
</c:forEach>
							</select>
							<span class="red ml5">※페이지 관리 편의를 위한 그룹 (그룹내에서 페이지 우선 순위, 작을수록 순위가 높음)</span>
						</td>
					</tr>
					<tr>
						<th><strong>페이지명 <span class="txt_red">*</span></strong></th>
						<td><input name="pageName" class="input" value="${vo.pageName }" maxlength="" type="text"/></td>
					</tr>
					<tr>
						<th><strong>페이지URL</strong></th>
						<td>
<c:set var="port" />						
<c:if test="${pageContext.request.serverPort != 80 && pageContext.request.serverPort != 443 }">
	<c:set var="port" value=":${pageContext.request.serverPort }"/>
</c:if>					
							<span class="bold f13">http://${pageContext.request.serverName }${port }</span>
							<input name="pageUrl" class="input ml5 w50" value="${vo.pageUrl }" type="text"/>
							<div class="red">※페이지URL은 <b>/URL주소</b> 형식대로 입력해 주세요.</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea name="pageBody" id="pageBody" class="w100" style="height:450px;"  class="editor">${vo.pageBody }</textarea>
							<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
							<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
							<script type="text/javascript">
								CKEDITOR.replace('pageBody', {
									width : '100%'
									, height : '420px'
									, startupFocus : false
								});
							</script>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="summmit_btn">
				<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a>
				<a onclick="javascirpt:$.Nav('go', '../list_pages.do');" class="btn2 bg_gray">목록</a>
			</div>
		</form>
	</div>
</div>
<!--wrap_scon E-->
<script id="groupTmpl" type="text/x-jquery-tmpl">
		<option value="0">= 페이지 그룹 =</option>
{{each group}}
		<option value="\${groupSeq}">\${groupName}</option>
{{/each}}
</script>

<script type="text/javascript">
	function updateGroup() {
		$.ajax({
			url: '../ajax/update_group.do'
			, type: 'post'
			, dataType: 'json'
			, data: { 
			}
			, success: function (data) {
				//console.log(data);
				if (data.result != null) {
					var selectedValue = $('select[name=pageGroupSeq]').val();
					//console.log('>>>>>>>> selectedValue : ' + selectedValue)
					$('select[name=pageGroupSeq]').empty();
					$('#groupTmpl').tmpl({group: data.result}).appendTo('select[name=pageGroupSeq]');
					
					$('select[name=pageGroupSeq]').val(selectedValue);
				}
			}
			, error: function (data) {
				alert('Request Exception (' + data.status + ')\n' + data.statusText);
			}
		});
	}
	
	function doSubmit() {
		if (isNull($('input[name=pageName]').val())) {
			alert('페이지명을 입력 해주세요.');
			$('input[name=pageName]').focus();
			return;
		}
		
		
		var sBody = CKEDITOR.instances.pageBody.getData();
		$('textarea[name=pageBody]').val(sBody);
		
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>