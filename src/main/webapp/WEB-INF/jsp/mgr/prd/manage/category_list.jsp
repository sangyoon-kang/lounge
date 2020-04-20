<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 카테고리 관리
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<link rel="stylesheet" href="/common/js/jquery/jstree/dist/themes/default/style.css" type="text/css" />
<script type="text/javascript" src="/common/js/jquery/jstree/dist/jstree.min.js"></script>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>카테고리 관리</h2>
		<p>홈 &gt; 상품 관리 &gt; 카테고리 관리</p>
	</div>

	<div class="scon">
	<!-- ---------------------------------------------body----------------------------------------------- -->	
 <div class="scon">
		
		<div class="scon_search">
			<span class="table_aside">총 메뉴  : <fmt:formatNumber
					value="${search.count }" pattern="#,###" />개</span> <span
				class="fr mb10"> <a
				id="createbtnclick"
				class="btn btn_round bg_purple">카테고리 등록 </a>
			</span>
		</div>
		<table class="board_st1">
			<colgroup>
				<col width="5%" />
				<col width="20%" />
				<col width="5%" />
				<col width="25%" />
				<col width="5%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr>
					<th>레벨</th>
					<th>카테고리명</th>
					<th>등록된 상품</th>
					<th>설명</th>
					<th>상태</th>
					<th>순서</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
						<tr>
							<td>${m.cateLevel}</td>
							<td>
								<c:set var="parentName" />
								<c:forEach items="${parentlist}" var="item">
						       			<c:if test = "${item.cateIdx eq m.parentIdx}">
						       				<c:set var="parentName" >${item.cateName}</c:set>
				       					</c:if>
		       					</c:forEach>
								<div class="txt-left">
									<div class="
										<c:if test = "${m.cateLevel == 1}">main-hide</c:if>
										<c:if test = "${m.cateLevel == 2}">main-parent</c:if>
										<c:if test = "${m.cateLevel == 3}">main-parent main-child</c:if>">
									</div>
									<p>
									<a onclick="javacript:edit('${m.cateIdx }','${m.cateName }', '${m.prdCount }' ,'${m.cateDescription }','${m.useFlag }','${parentName}');">${m.cateName }</a>
									</p>
								</div>
							</td>
							<td>0개</td>
							<td class="left">${m.cateDescription }</td>
							<td><c:if test = "${m.useFlag == 'U'}">사용</c:if><c:if test = "${m.useFlag=='S'}">미사용</c:if></td>
							<td>						
								<a onclick="javascript:doOrderingUpdate('${m.cateIdx}', '${m.sortNum }', 'up', '${m.cateLevel }', '${m.parentIdx }');" class="red">▲</a>	
								<a onclick="javascript:doOrderingUpdate('${m.cateIdx}', '${m.sortNum }', 'down', '${m.cateLevel }', '${m.parentIdx }');" class="blue">▼</a>					
							</td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<div id="createpopup" hidden>
			<form id="form2" action="./cate_proc" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cateIdx" value="" />
				<input type="hidden" name="parentIdx" value="" />
				<input type="hidden" name="cateLevel" value="1" />
				<table class="board_write">
					<colgroup>
						<col width="15%" />
						<col width="85%" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>상위카테고리</strong></th>
							<td>
								<div id="newCase" hidden>
									<select class="selectMenu" id="firstLevel">
								       <option value="">선택하세요.</option>
								       <c:forEach items="${maincate}" var="item">
								       		<c:if test="${item.cateLevel==1}">
									        	<option value="${item.cateIdx}">${item.cateName}</option>   
									        </c:if> 
							           </c:forEach>							   
								    </select>
								    <select class="selectMenu" id="secondLevel" hidden>   
								    </select>
							    </div>
							    <div id="oldCase" hidden>
							 		<input  name="parentPid" readonly value="" maxlength="50" type="text" />
							 	</div>
							</td>
						</tr>
						<tr>
							<th><strong>사용구분</strong></th>
							<td>
								<select name="useFlag">
								       	<option value="U" />사용</option> 
							       		<option value="S" />미사용 </option> 
							       		<option value="D" />삭제</option> 
							    </select>
							</td>
						</tr>
						<tr>
							<th>카테고리명</th>
							<td >
								<input name="cateName" class="w100" value="" maxlength="50" type="text" /> 
							</td>
						</tr>
						<!-- <tr>
							<th>메뉴경로</th>
							<td >
								<input name="prdCount" class="w100" value="" maxlength="50" type="text" /> 
							</td>
						</tr> -->
						<tr>
							<th>설명</th>
							<td >
								<textarea name="cateDescription" class="w100" style="height:150px" value="" maxlength="1000" type="text"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="summmit_btn">
					<a onclick="javascript:createSubmit();" class="btn2 bg_blue">저장</a>
					<a onclick="javascript:$('#createpopup').dialog('close')" class="btn2 bg_gray">닫기</a>
				</div>
			</form>
		</div>
		<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
	</div>

	<!-- ---------------------------------------------end body----------------------------------------------- -->	
	
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
const newCase = $('#newCase'); 
const oldCase = $('#oldCase');
const filterMenu =${childList};
$(function (){
	$("#createbtnclick").on('click', function(){
		$("#createpopup").dialog({
			title:"카테고리 등록",
			width:900,
			modal:true
		});
		$('#form2')[0].reset();
		newCase.prop('hidden', false);
		oldCase.prop('hidden', true);
		$("#secondLevel").prop('hidden', true);
		$("input[name='cateIdx']").val('');
	});
});
$(document).on('change', '.selectMenu', function(e){
	const parentIdx = $('input[name="parentIdx"]');
	const cateLevel = $('input[name="cateLevel"]');
	switch(e.target.id){
		case 'firstLevel':
			getAllChild(e.target.value, 'secondLevel');
			parentIdx.val(e.target.value);
			cateLevel.val((e.target.value) ? 2 : 1);
	        break;
		case 'secondLevel':
			parentIdx.val((e.target.value) ? e.target.value : $('#firstLevel').find(':selected').val());
			cateLevel.val((e.target.value) ? 3 : 2);
	        break;
	    default:
	    	break;
	}
});
const getAllChild = function(value, level) {
 	$("#"+level+"").find('option').remove().end().append('<option value="">선택하세요.</option>').prop('hidden', (value !== "") ? false : true);
	filterMenu.map(function(a) {
		if(a.parentIdx == value){
			$("#"+level+"").append("<option value="+ a.cateIdx +">"+ a.cateName +"</option>");
		}
	});
}
function createSubmit() {
	if($('input[name=cateName]').val()==""){
		alert("메뉴 이름을 입력하세요 !!!");
	}
	else{
		if (!confirm('저장하시겠습니까?'))
		return;
		$('#form2').submit();	
		
	}
	
}
function edit(seq,name, path, detail, use, parent) {
	$("#createpopup").dialog({
		title:"카테고리 수정",
		width:900,
		modal:true
	});
	
	oFormObject = document.forms['form2'];
	useFlag = oFormObject.elements["useFlag"];
	cateIdx = oFormObject.elements["cateIdx"];
	cateName = oFormObject.elements["cateName"];
	/* menuPath = oFormObject.elements["prdCount"]; */
	menuDetail = oFormObject.elements["cateDescription"];
	parentPid = oFormObject.elements["parentPid"];
	
	cateIdx.value = seq;
	cateName.value=name;
	/* menuPath.value=path; */
	menuDetail.value=detail;
	newCase.prop('hidden', true);
	oldCase.prop('hidden', false);
	parentPid.value = parent;
	ww=useFlag.querySelectorAll('option');
	ww.forEach(function(a){
		if(a.value == use) a.selected = true;
	});
	
}
function doOrderingUpdate(menuSeq, sort, type, level, parent) {
	$.Nav('go', './cate_ordering_update.do', {cateIdx: menuSeq, sortNum : sort, type : type, cateLevel: level, parentIdx: parent});	
}
</script>


<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>