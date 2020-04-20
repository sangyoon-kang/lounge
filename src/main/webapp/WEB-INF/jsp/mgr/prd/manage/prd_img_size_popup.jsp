<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
	폼메일관리 - 항목추가 - 팝업
 --%>
 
<%@ include file="/WEB-INF/include/admin_start_html_popup.jsp"%>

<div class="pop_scon">
	
	<form id="formImgSize" action="./prd_img_size_proc.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="prdseq" value="${search.prdseq }">
		<input type="hidden" name="prdName" value="${vo.prdName }">
		<input type="hidden" name="regUser" value="${vo.regUser }">
		<div class="scon_title">
			<h2>상품 이미지 사이즈</h2>
		</div>
			<table class="board_write">
				<colgroup>
					<col width="30%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr>
						<th><strong>상품목록</strong></th>
						<td>
							<input type="text" class="w25" name="sizeList" value="${vo.sizeList}"/>
						</td>
					</tr>
					<tr>
						<th><strong>축소 이미지</strong></th>
						<td>
							<input type="text" class="w25" name="sizeSmall" value="${vo.sizeSmall }"/>
						</td>
					</tr>
					<tr>
						<th><strong>제품상세 이미지</strong></th>
						<td>
							<input type="text" class="w25" name="sizeDetail" value="${vo.sizeDetail }"/>
						</td>
					</tr>
					<tr>
						<th><strong>확대 이미지</strong></th>
						<td>
							<input type="text" class="w25" name="sizeLarge" value="${vo.sizeLarge }"/>
						</td>
					</tr>					
				</tbody>
			</table>
	</form>
		<ul class="summmit_btn mb20">
			<li><a onclick="javascirpt:doImgSizeSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:self.close();" class="btn2 bg_gray">닫기</a></li>
		</ul>
</div>
<!--wrap_scon E-->
<script type="text/javascript">
	function doImgSizeSubmit() {
		if(!confirm('저장하시겠습니까?')) {
			return;
		}
		
		$("#sizeList", opener.document).val($('input[name=sizeList]').val());
		$("#sizeSmall", opener.document).val($('input[name=sizeSmall]').val());
		$("#sizeDetail", opener.document).val($('input[name=sizeDetail]').val());
		$("#sizeLarge", opener.document).val($('input[name=sizeLarge]').val());
		
		//$('#formImgSize').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>