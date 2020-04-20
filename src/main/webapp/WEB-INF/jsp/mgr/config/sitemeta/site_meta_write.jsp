<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<!-- config >  policy list - write -->

<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>


<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2> SEO 등록</h2>
		<p>홈 &gt; 사이트관리   &gt; SEO관리 &gt;${vo==null ? ' 등록 ' : '수정'} </p>
	</div>

	<div class="scon">
		<form id="form1" action="./proc.do" method="POST">
			<input type="hidden" name="useFlag" value="u" />
			<c:choose>
				<c:when test="${not empty vo.seoIdx}">
					<input type="hidden" name="seoIdx" value="${vo.seoIdx }" />
				</c:when>
			</c:choose>
			
			<table class="board_write">
				<colgroup>
					<col width="30%" />
					<col width="70%" />
				</colgroup>
				<tbody>
					<%-- <tr>
						<th>그룹</th>
						<td><tt:select name="groupIdx" list="${listGroup }"
								listKey="commGroupIdx" listValue="title" indexKey="0"
								indexValue="== 그룹 =="  selected="${vo.groupIdx}" /></td>
					</tr> --%>
					<tr>
						<th>페이지명</th>
						<td><input type="text" name="pageName" class="w100 "
							value="${vo.pageName }" maxlength="200" /></td>
					</tr>
					<tr>
						<th>페이지 주소</th>
						<td><input type="text" class="w100 " name="pageLink"
							value="${vo.pageLink }" maxlength="500" /></td>
					</tr>
					<tr>
						<th>페이지 Title</th>
						<td><input type="text" name="metaTitle" class="w100 "
							value="${vo.metaTitle }" maxlength="1000" /></td>
					</tr>
					<tr>
						<th>페이지 Keywords</th>
						<td><input type="text" name="metaKeywords"
							class=" w100" value="${vo.metaKeywords }" maxlength="1000" /></td>
					</tr>
					<tr>
						<th>페이지 Subject</th>
						<td><input type="text" name="metaSubject"
							class="w100 " value="${vo.metaSubject }" maxlength="1000" /></td>
					</tr>
					<tr>
						<th> 페이지 Description</th>
						<td><input type="text" name="metaDescription"
							class="w100 " value="${vo.metaDescription }"
							maxlength="1000" /></td>
					</tr>
				</tbody>
			</table>
		</form>

		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './seo_list');"
				class="btn2 bg_darkgray">취소</a></li>

		</ul>


	</div>

</div>
<!-- wrap_scon E -->


<!-- =================================================== JavaScript ================================================= -->


<script type="text/javascript">
	
	//checking empty
	function isEmpty(val) {
		if(val.trim() == ''){
			return true;
		}		
		return false;
	}

	
	function doSubmit(){
		
		//do Valitation
		
		if(isEmpty($('input[name=pageName]').val()) && checkNumber($('input[name=pageName]').val())){
			alert("Days field must be filled");
			return;
		}
		if(isEmpty($('input[name=pageLink]').val()) && checkNumber($('input[name=pageLink]').val())){
			alert("Cost 1 field must be filled");
			return;
		}
		$('#form1').submit();		
	}
	
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
