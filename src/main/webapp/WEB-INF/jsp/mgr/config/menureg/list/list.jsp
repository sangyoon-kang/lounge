<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>메뉴관리</h2>
		<p>홈  &gt; 환경설정 &gt; 메뉴관리 </p>
	</div>
	<div class="scon">
		<div class="check_conbox pl10 mt15 mb15">
			<ul>
				<li>메뉴 수정/변경시 재로그인해야 변경 사항이 보입니다.</li>
			</ul>
		</div>
		<div class="scon_search">
			<span class="table_aside">총 메뉴  : <fmt:formatNumber
					value="${search.count }" pattern="#,###" />개</span> <span
				class="fr mb10"> <a
				id="createbtnclick"
				class="btn btn_round bg_purple">메뉴등록 </a>
			</span>
		</div>
		<table class="board_st1">
			<colgroup>
				<col width="5%" />
				<col width="20%" />
				<col width="25%" />
				<col width="5%" />
				<col width="5%" />
			</colgroup>
			<thead>
				<tr>
					<th>레벨</th>
					<th>메뉴명</th>
					<th>설명</th>
					<th>상태</th>
					<th>순서</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty list}">
					<c:forEach items="${list }" var="m" varStatus="s">
						<tr>
							<td>${m.menuLevel}</td>
							<td>
								<c:set var="parentName" />
								<c:set var="parentMain" />
								<c:set var="parentIdx" />
								<c:forEach items="${parentlist}" var="item">
						       			<c:if test = "${item.menuIdx eq m.parentIdx}">
						       				<c:set var="parentName" >${item.menuName}</c:set>
						       				<c:set var="parentIdx" >${item.parentIdx}</c:set>
				       					</c:if>
				       					<c:if test="${item.menuLevel == 3}">
				       						<c:forEach items="${parentlist}" var="item1">
				       							<c:if test = "${item1.menuIdx eq parentIdx}">
				       								<c:set var="parentMain" >${item1.menuName}</c:set>
				       							</c:if>
				       						</c:forEach>
				       					</c:if>
		       					</c:forEach>
								<div class="txt-left">
									<div class="
										<c:if test = "${m.menuLevel == 1}">main-hide</c:if>
										<c:if test = "${m.menuLevel == 2}">main-parent</c:if>
										<c:if test = "${m.menuLevel == 3}">main-parent main-child</c:if>">
									</div>
									<p>
									<a onclick="javacript:edit('${m.menuIdx }','${m.menuName }', '${m.folderPath }' ,'${m.menuTable }','${m.useFlag }','${parentName}', '${m.menuLevel}', '${parentMain }', '${m.prefixPath}');">${m.menuName }</a>
									</p>
								</div>
							</td>
							<td class="left">${m.menuTable }</td>
							<td><c:if test = "${m.useFlag == 'U'}">사용</c:if><c:if test = "${m.useFlag=='S'}">미사용</c:if></td>
							<td>						
								<a onclick="javascript:doOrderingUpdate('${m.menuIdx}', '${m.sortNum }', 'up', '${m.menuLevel }', '${m.parentIdx }');" class="red">▲</a>	
								<a onclick="javascript:doOrderingUpdate('${m.menuIdx}', '${m.sortNum }', 'down', '${m.menuLevel }', '${m.parentIdx }');" class="blue">▼</a>					
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
			<form id="form2" action="./menu_proc" method="post" enctype="multipart/form-data">
				<input type="hidden" name="menuIdx" value="" />
				<input type="hidden" name="parentIdx" value="" />
				<input type="hidden" name="menuLevel" value="1" />
				<table class="board_write">
					<colgroup>
						<col width="15%" />
						<col width="85%" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>상위메뉴</strong></th>
							<td>
								<div id="newCase" hidden>
									<select class="selectMenu" id="firstLevel">
								       <option value="">선택하세요.</option>
								       <c:forEach items="${mainmenu}" var="item">
								       		<c:if test="${item.menuLevel==1}">
									        	<option value="${item.menuIdx}">${item.menuName}</option>   
									        </c:if> 
							           </c:forEach>							   
								    </select>
								    <select class="selectMenu" id="secondLevel" hidden>   
								    </select>
							    </div>
							    <div id="oldCase" hidden>
							    	<input  name="parentMain" readonly value="" maxlength="50" type="text" hidden />
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
							<th>메뉴명</th>
							<td >
								<input name="menuName" class="w100" value="" maxlength="50" type="text" /> 
							</td>
						</tr>
						<tr>
							<th>Prefix Path</th>
							<td>
								<input name="prefixPath" class="w100" value="" maxlength="100" type="text" /> 
							</td>
						</tr>
						<tr>
							<th>메뉴경로</th>
							<td >
								<input name="folderPath" class="w100" value="" maxlength="50" type="text" /> 
							</td>
						</tr>
						<tr>
							<th>설명</th>
							<td >
								<textarea name="menuTable" class="w100" style="height:150px" value="" maxlength="30" type="text"></textarea>
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
</div>
<script type="text/javascript">
const newCase = $('#newCase'); 
const oldCase = $('#oldCase');
const filterMenu =${childList};
$(function (){
	$("#createbtnclick").on('click', function(){
		$("#createpopup").dialog({
			title:"메뉴 등록",
			width:900,
			modal:true
		});
		$('#form2')[0].reset();
		newCase.prop('hidden', false);
		oldCase.prop('hidden', true);
		$("#secondLevel").prop('hidden', true);
		$("input[name='menuIdx']").val('');
	});
});
$(document).on('change', '.selectMenu', function(e){
	const parentIdx = $('input[name="parentIdx"]');
	const menuLevel = $('input[name="menuLevel"]');
	switch(e.target.id){
		case 'firstLevel':
			getAllChild(e.target.value, 'secondLevel');
			parentIdx.val(e.target.value);
			menuLevel.val((e.target.value) ? 2 : 1);
	        break;
		case 'secondLevel':
			parentIdx.val((e.target.value) ? e.target.value : $('#firstLevel').find(':selected').val());
			menuLevel.val((e.target.value) ? 3 : 2);
	        break;
	    default:
	    	break;
	}
});
const getAllChild = function(value, level) {
 	$("#"+level+"").find('option').remove().end().append('<option value="">선택하세요.</option>').prop('hidden', (value !== "") ? false : true);
	filterMenu.map(function(a) {
		if(a.parentIdx == value){
			$("#"+level+"").append("<option value="+ a.menuIdx +">"+ a.menuName +"</option>");
		}
	});
}
function createSubmit() {
	if($('input[name=menuName]').val()==""){
		alert("메뉴 이름을 입력하세요 !!!");
	}
	else{
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form2').submit();	
		
	}
	
}
function edit(seq,name, path, detail, use, parent, level, mparent, prefix) {
	$("#createpopup").dialog({
		title:"메뉴 수정",
		width:900,
		modal:true
	});
	
	oFormObject = document.forms['form2'];
	useFlag = oFormObject.elements["useFlag"];
	menuIdx = oFormObject.elements["menuIdx"];
	menuName = oFormObject.elements["menuName"];
	menuPath = oFormObject.elements["folderPath"];
	menuDetail = oFormObject.elements["menuTable"];
	parentPid = oFormObject.elements["parentPid"];
	parentMain = oFormObject.elements["parentMain"];
	menuLevel = oFormObject.elements["menuLevel"];
	prefixPath = oFormObject.elements["prefixPath"];
	
	menuIdx.value = seq;
	menuName.value=name;
	menuPath.value=path;
	menuDetail.value=detail;
	newCase.prop('hidden', true);
	oldCase.prop('hidden', false);
	parentPid.hidden = false;
	parentMain.hidden = true;
	menuLevel.value = level;
	prefixPath.value = prefix;
	if(level === '1')
		parentPid.hidden = true;
	if(level === '2')
		parentPid.value = parent;
	if(level === '3'){
		parentMain.hidden = false;
		parentPid.value = parent;
		parentMain.value = mparent;
	}
	var ww=useFlag.querySelectorAll('option');
	 for(var i=0;i<ww.length;i++){
		ww[i].selected=(ww[i].value === use) ? true:false;
	}
	
}
function doOrderingUpdate(menuSeq, sort, type, level, parent) {
	$.Nav('go', './menu_ordering_update.do', {menuIdx: menuSeq, sortNum : sort, type : type, menuLevel: level, parentIdx: parent});	
}
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>