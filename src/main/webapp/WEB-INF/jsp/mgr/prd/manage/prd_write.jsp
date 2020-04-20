<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품관리 - 상품추가 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>상품 관리</h2>
			<p>홈 &gt; 상품 관리 &gt; 상품 추가</p>
		</div>
		<div class="scon">
			<form id="formPrd" action="./prd_proc.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="prdseq" value="${empty vo.prdSeq ? 0 : vo.prdSeq  }">
				<h3 class="scon_tit2">상품 추가</h3>				
				<table class="board_write mb20">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>상품분류</strong></th>
							<td>
								<div class="mb5">
									<tt:select list="${prdCateList }" name="category1" id="category1" listKey="cateIdx" listValue="cateName" indexKey="" indexValue="= 카테고리1 =" selected="${vo.category1 }"/>									
								</div>
							</td>
						</tr>
						
						<tr>
							<th><strong>상품명</strong></th>
							<td>
								<input  class="w50 mR10" name="prdName" value="${vo.prdName }" type="text" />
								<label  class="mR10" ><input type="checkbox" id="mainCheck" value="Y" />매인 노출 상품</label>
								<input type="hidden" name="mainYn" value="${vo.mainYn }" />
								<label><input type="checkbox" id="recommendCheck" value="Y" />추천 상품</label>
								<input type="hidden" name="recommendYn" value="${vo.recommendYn }" />
							</td>
						</tr>
						<tr>
							<th><strong>상품코드</strong></th>
							<td>
								<input  class="w25" name="productCode" value="${vo.productCode }" type="text" />
							</td>
						</tr>
						<tr>
							<th><strong>상품가격</strong></th>
							<td>		
								<input class="w25" name="price" value="${vo.price }" type="text"/>
							</td>
						</tr>
						<tr>
							<th><strong>상품정보</strong></th>
							<td>
								<div id="prdInfo">
<c:forEach items="${vo.prdSubVO }" var="psL" varStatus="i">
									<span>
										<input type="hidden" name="prdSubSeqList" value="${psL.prdSubSeq }">
										<input type="text" class="w25" name="headerList" value="${psL.header }" > 
										<input type="text" class="w25" name="contentList" value="${psL.content }" >
	<c:if test="${i.count eq 1 }">										
										<a href="javascript:doAddInfo();" class="btn btn_round bg_darkgray mR5">추가</a>
	</c:if>
	<c:if test="${i.count ne 1 }">										
										<a onclick="javascript:subDelete(this);" class="btn btn_round bg_darkgray mR5">제거</a>
	</c:if>										
									</span>
</c:forEach>

<c:if test="${empty vo.prdSubVO }">
									<span>
										<input type="hidden" name="prdSubSeqList" value="0">
										<input class="w25" name="headerList" value="" type="text"> 
										<input class="w25" name="contentList" value="" type="text"> 
										<a href="javascript:doAddInfo();" class="btn btn_round bg_darkgray">추가</a>
									</span>
</c:if>
								</div>						
								ex) 원산지    한국 , 가격  10000	
							</td>
						</tr>
						<tr>
							<th><strong>상품사진</strong></th>
							<td>
								<div>상품 이미지 사이즈</div>
								<table class="w80 mT10 borderT">
									<colgroup>
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />
										<col width="12.5%" />						
									</colgroup>
									<tbody>
										<tr>
											<th><strong>목록</strong></th>
											<td>
												<input type="text" class="w80" name="sizeList" value="${empty vo.sizeList ? 150 : vo.sizeList }"/>
											</td>
											<th><strong>축소</strong></th>
											<td>
												<input type="text" class="w80" name="sizeSmall" value="${empty vo.sizeSmall ? 50 : vo.sizeSmall }"/>
											</td>
											<th><strong>상세</strong></th>
											<td>
												<input type="text" class="w80" name="sizeDetail" value="${empty vo.sizeDetail ? 350 : vo.sizeDetail }"/>
											</td>
											<th><strong>확대</strong></th>
											<td>
												<input type="text" class="w80" name="sizeLarge" value="${empty vo.sizeLarge ? 650 : vo.sizeLarge }"/>
											</td>
										</tr>					
									</tbody>
								</table>
								<p>
									신규 등록시에만 원본 이미지를 등록하면 나머지 이미지가 자동 생성 됩니다. (지정된 파일 제외) [GIF, JPG, PNG]
								</p>
								<p>	
									<a href="javascript:doImgAdd();" class="btn btn_round bg_darkgray">이미지 추가</a>
<c:if test="${vo.prdSeq != null and vo.prdSeq > 0 }">
									<a href="javascript:doImgDel();" class="btn btn_round bg_darkgray">이미지 삭제</a>									
									<!-- <a href="javascript:doChangeImgSize();" class="btn btn_round bg_darkgray">이미지 사이즈 설정</a> -->
</c:if>
								</p>
								
								<table id="prdImgAdd" class="w80 mT10 borderT">									
<c:forEach items="${vo.prdImageVO }" var="piL" varStatus="s">
									<tr>
										<th>
											<input type="checkbox" class="checkAll" name="checkImg" id="chkAll" value="${piL.prdImageSeq }">
										</th>
										<td>
											<div class="w95 fleft p10">
												<p>
													<label>
														<input type="checkbox" class="prdImageTypeList" value="Y">리사이즈 이미지 자동으로 만들기
													</label>
													(원본 파일 기준으로 생성되며 기존 파일은 삭제 됩니다.)	
													<input type="hidden" name="prdImageTypeList" value="N">
												</p>
												<p class="borderB mT5">
													<input type="hidden" name="prdImageSeqList" value="${piL.prdImageSeq }">									
													<span class="w20">원본 이미지</span>
													<input type="file" name="originalFileList">
													<span class="mL30">
														<a href="javascript:viewFile('${UPLOAD_ROOT}${piL.saveFilename }');">${piL.originalFilename }</a>
													</span>
												</p>
	<c:if test="${s.count eq 1 }">												
												<p class="mT5 borderB">
													<span class="w20">상품 목록</span>
													<input type="file" name="listFileList">
		<c:set var="fileName" value="${fn:split(piL.listFilename, '/')}" />
													<a href="javascript:viewFile('${UPLOAD_ROOT}${piL.listFilename }');">${fileName[fn:length(fileName)-1] }</a>
												</p>
	</c:if>												
												<p class="mT5 borderB">
													<span class="w20">축소</span>									
													<input type="file" name="smallFileList">
	<c:set var="fileName" value="${fn:split(piL.smallFilename, '/')}" />										
													<a href="javascript:viewFile('${UPLOAD_ROOT}${piL.smallFilename }');">${fileName[fn:length(fileName)-1] }</a>
												</p>
												<p class="mT5 borderB">
													<span class="w20">제품 상세</span>
													<input type="file" name="detailFileList">
	<c:set var="fileName" value="${fn:split(piL.detailFilename, '/')}" />										
													<a href="javascript:viewFile('${UPLOAD_ROOT}${piL.detailFilename }');">${fileName[fn:length(fileName)-1] }</a>
												</p>
												<p class="mT5 borderB">
													<span class="w20">확대 보기</span>
													<input type="file" name="largeFileList">
	<c:set var="fileName" value="${fn:split(piL.largeFilename, '/')}" />									
													<a href="javascript:viewFile('${UPLOAD_ROOT}${piL.largeFilename }');">${fileName[fn:length(fileName)-1] }</a>
												</p>									
											</div>
										</td>
									</tr>	
</c:forEach>

<c:if test="${empty vo.prdImageVO }">
									<tr>
										<th>
											<input type="checkbox"  class="checkAll" name="checkImg" id="chkAll" value="0">
										</th>
										<td>										
											<div class="w95 fleft p10">
												<p>
													처음 추가 하는 이미지는 자동 리사이즈 저장 됩니다. (수정시 지정가능)
													<input type="hidden" name="prdImageTypeList" value="Y">
												</p>
												<p class="borderB">
													<input type="hidden" name="prdImageSeqList" value="0">
													<span class="w20">원본 이미지</span>
													<input type="file" name="originalFileList">												
													<input type="file" name="listFileList" style="display:none;">												
													<input type="file" name="smallFileList" style="display:none;">												
													<input type="file" name="detailFileList" style="display:none;">												
													<input type="file" name="largeFileList" style="display:none;">
												</p>
											</div>
										</td>
									</tr>		
</c:if>
								</table>
							</td>
						</tr>
						<tr>
							<th><strong>첨부파일</strong></th>
							<td>
								<input type="file" name="fileList" multiple="multiple">
								<p>
<c:forEach items="${fileList }" var="fL" varStatus="s">
									<a href="javascript:viewFile('${UPLOAD_ROOT}${fL.saveFilename }');">${fL.originalFilename }</a> 
									<a href="javascript:doFileDel('${fL.fileSeq }', '${fL.saveFilename }');" class="mR5 red">x</a>					
</c:forEach>
								</p>
							</td>
						</tr>
						<tr>
							<th><strong>관련상품</strong></th>
							<td>	
								<p>
									<a href="javascript:doRefAdd();" class="btn btn_round bg_darkgray">등록</a>
									<a href="javascript:doRefDel();" class="btn btn_round bg_darkgray">삭제</a>
								</p>
								추후 처리	
							</td>
						</tr>
						<tr>
							<th><strong>상품간단설명</strong></th>
							<td>
								<textarea name="summary" rows="5" class="w100">${vo.summary }</textarea>
							</td>
						</tr>
						<tr>
							<th><strong>상품상세정보</strong></th>
							<td>
								<textarea name="body" id="body" class="w100" style="height:300px;" class="editor">${vo.body }</textarea>
								<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
								<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
								<script type="text/javascript">
									CKEDITOR.replace('body', {
										width : '100%'
										, height : '270px'
										, startupFocus : false
									});
								</script>
							</td>
						</tr>						
					</tbody>
				</table>
				
				<div class="summmit_btn mb40">
					<a onclick="javascirpt:doPrdSubmit();" class="btn2 bg_navy">저장</a>
					<a onclick="javascirpt:$.Nav('go', './prd_list.do');" class="btn2 bg_gray">목록</a>
				</div>
			</form>
		</div>
	</div>
	<!--wrap_scon E-->

<script id="prdInfoTmpl" type="text/x-jquery-tmpl">
	<span id="infoSpan">
		<input type="hidden" name="prdSubSeqList" value="0">
		<input class="w25" name="headerList" value="" type="text">
		<input class="w25" name="contentList" value="" type="text">
		<a onclick="javascript:subDelete(this);" class="btn btn_round bg_darkgray mR5">제거</a>&nbsp;
	</span>
</script>

<script id="prdImgTmpl" type="text/x-jquery-tmpl">
	<tr>
		<th>
			<input type="checkbox" name="checkImg"  id="checkAll" value="0">
		</th>
		<td>
			<div class="w95 fleft p10">
				<p>
					처음 추가 하는 이미지는 자동 리사이즈 저장 됩니다. (수정시 지정가능)					
					<input type="hidden" name="prdImageTypeList" value="Y">
				</p>	
				<p class="borderB mT5">
					<input type="hidden" name="prdImageSeqList" value="0">
					<span class="w20">원본 이미지</span>
					<input type="file" name="originalFileList" value="">
					<input type="file" name="listFileList" value="" style="display:none;">			 
					<input type="file" name="smallFileList" value="" style="display:none;">				
					<input type="file" name="detailFileList" value="" style="display:none;">				
					<input type="file" name="largeFileList" value="" style="display:none;">
				</p>									
			</div>
		</td>
	</tr>	
</script>

<script type="text/javascript">
	$(function() {
		//매인 노출 체크 
		if ($('input[name=mainYn]').val() == 'Y') {
			$('#mainCheck').prop("checked", true);
		}
		$('#mainCheck').change(function() {
			if ($('#mainCheck').is(':checked')) {
				$('input[name=mainYn]').val('Y');
			} else {
				$('input[name=mainYn]').val('N');
			}
		});
		
		//추천 상품 체크
		if ($('input[name=recommendYn]').val() == 'Y') {
			$('#recommendCheck').prop("checked", true);
		}		
		$("#recommendCheck").change(function() {
			if ($("#recommendCheck").is(":checked")) {
				$('input[name=recommendYn]').val('Y');
			} else {
				$('input[name=recommendYn]').val('N');
			}
		});
		
		//리사이즈 선택시
		$('.prdImageTypeList').change(function () {
				$p = $(this).parent().parent();
				if ($(this).is(":checked")) {
					$p.find('input[name=prdImageTypeList]').val('Y');
				} else {
					$p.find('input[name=prdImageTypeList]').val('N');
				}
		});
			
	});
	
	//제거시 prdSubSeq는 두고 내용만 삭제
	function subDelete(obj) {
		$span = $(obj).parent('span');			
		$span.find('input[name=headerList]').val('');
		$span.find('input[name=contentList]').val('');
		$span.hide();
	}
	
	function doAddInfo() {		
		$('#prdInfoTmpl').tmpl().appendTo($('#prdInfo'));
	}
	
	//이미지 사이즈 조절 팝업창
	function doChangeImgSize() {
		openPop('?prdseq=${vo.prdSeq }', 'prdImgSize');
	}
	
	//이미지 추가
	function doImgAdd() {
		$('#prdImgTmpl').tmpl().appendTo($('#prdImgAdd'));
	}
	
	//이미지 삭제
	function doImgDel() {
		if (!$('input[name=checkImg]').is(':checked')) {
			alert('삭제할 이미지를 선택해 주세요');
			return;
		}
		
		if (!confirm('삭제하시겠습니까?')) {
			return;
		}
		var prdImgSeqs = new Array();
		$('input[name=checkImg]').each(function() {
			if ($(this).prop('checked')) {
				prdImgSeqs.push($(this).val());
			}
		});
		
		$.Nav('go', './prd_img_proc.do', {prdImageSeqList : prdImgSeqs });		
	}
	
	function doFileDel(fileSeq, path) {
		if(!confirm('해당 파일을 삭제 하시겠습니까?')) {
			return;
		}
		
		$.Nav('go', './prd_file_proc.do', {fileSeq : fileSeq, saveFilename : path});
	}
	
	function doPrdSubmit() {		
		if ($('input[name=prdName]').val() == '') {
			alert("상품명을 입력하지 않았습니다.");
			return;
		}
		
		if ($('input[name=sizeList]').val() == '') {
			alert("상품 목록 사이즈를 입력하지 않았습니다.");
			return;
		}
		
		if ($('input[name=sizeSmall]').val() == '') {
			alert("상품 축소 사이즈를 입력하지 않았습니다.");
			return;
		}
		if ($('input[name=sizeDetail]').val() == '') {
			alert("상품 상세 사이즈를 입력하지 않았습니다.");
			return;
		}
		if ($('input[name=sizeLarge]').val() == '') {
			alert("상품 확대 사이즈를 입력하지 않았습니다.");
			return;
		}
		
		if(!confirm('저장하시겠습니까?')){
			return;
		}
		
		$('#formPrd').submit();
	}
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
