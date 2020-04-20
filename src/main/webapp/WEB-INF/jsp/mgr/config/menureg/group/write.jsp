<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	환경설정 - 게시판 - 메인게시물 - 등록/수정 
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>권한 그룹별 메뉴권한 설정</h2>
		<p>홈 &gt; 환경설정  &gt; 권한관리 </p>
	</div>

	<div class="scon">

	<form id="form1" name="form1" action="./group_proc.do" method="post">	
		<input type="hidden" name="xD" value="${search.xD }" />
		<input type="hidden" name="idX" value="${vo.idX }" />
		<div id="menuAuthList">
			<%-- <c:forEach items="${vo.menuAuthList }" var="v" varStatus="status">
				<input type="hidden" name="menuAuthList[${status.index}].menuAuthoGroupIdx" value="${v.menuId }">
				<input type="hidden" name="menuAuthList[${status.index}].siteSeq" value="${v.siteSeq }"> 
				<input type="hidden" name="menuAuthList[${status.index}].groupId" value="${v.groupId }"> 
				<input type="hidden" name="menuAuthList[${status.index}].menuId" value="${v.menuId }"> 
				<input type="hidden" name="menuAuthList[${status.index}].authoList" value="${v.authoList }"> 
				<input type="hidden" name="menuAuthList[${status.index}].authoView" value="${v.authoView }"> 
				<input type="hidden" name="menuAuthList[${status.index}].authoWrite" value="${v.authoWrite }"> 
				<input type="hidden" name="menuAuthList[${status.index}].authoModify" value="${v.authoModify }"> 
				<input type="hidden" name="menuAuthList[${status.index}].authoDelete" value="${v.authoDelete }"> 
			</c:forEach> --%>
		</div>
		<table class="board_write">
			<colgroup>
				<col width="15%" />
				<col width="*" />
			</colgroup>
			<tbody>
				<tr>
					<th>권한그룹명</th>
					<td>
						<input type="text" id="authoTitle" name="authoTitle" class="w100" maxlength="200" value="${vo.authoTitle }" />
						<%-- <tt:select list="${grade }" id="authoTitle" name="authoTitle" listKey="gradeLevel" listValue="gradeName"  indexKey="0" indexValue="= 선택  ="  selected="${vo.authoTitle }"/> --%>
					</td>
				</tr>
				<tr>
					<th>설명</th>
					<td>
						<textarea name="authoContents" rows="3" cols="" class="w100">${vo.authoContents }</textarea>
					</td>
				</tr>
			</tbody>
		</table>
		<br class="clear mb5" />
		<table class="board_st1">
			<colgroup>
				<col width="5%" />
				<col width="*" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
				<col width="10%" />
			</colgroup>
			<thead>
				<tr>
					<th>레벨</th>
					<th>메뉴명 </th>
					<th><label><input type="checkbox" id="checkAll" style="background:#E0F3FD" />전체</label></th>
					<th><label><input type="checkbox" id="chekcL" style="background:#E0F3FD"/>조회</label></th>
					<th><label><input type="checkbox" id="checkE" style="background:#E0F3FD" />등록</label></th>
					<th><label><input type="checkbox" id="checkED" style="background:#E0F3FD" />수정/삭제</label></th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${!empty menuList}">
					<c:forEach items="${menuList }" var="m" varStatus="s">
						<tr class="menuAuthor" id="${m.menuIdx }" >
							<td>${m.menuLevel}</td>
							<td>
								<div class="txt-left">
									<div class="
										<c:if test = "${m.menuLevel == 1}">main-hide</c:if>
										<c:if test = "${m.menuLevel == 2}">main-parent</c:if>
										<c:if test = "${m.menuLevel == 3}">main-parent main-child</c:if>">
									</div>
									<p>
									${m.menuName }
									</p>
								</div>
							</td>
							<c:set var="lvrole" />
							<c:set var="wrole" />
							<c:set var="mdrole" />
							<c:set var="aId" />
							<c:forEach items="${vo.menuAuthList }" var="v" varStatus="status">
								<c:if test="${v.menuId == m.menuIdx}">
									<c:set var="aId" >${v.menuAuthoGroupIdx}</c:set>
								</c:if>
								<c:if test="${v.menuId eq m.menuIdx && (v.authoList eq m.authList || v.authoView eq m.authView)}"> 
									<c:set var="lvrole">checked</c:set>	
								</c:if>	
								<c:if test="${v.menuId eq m.menuIdx && v.authoWrite eq m.authWrite}"> 
									<c:set var="wrole">checked</c:set>	
								</c:if>		
								<c:if test="${v.menuId eq m.menuIdx && v.authoModify eq m.authModify && v.authoDelete eq m.authDelete}"> 
									<c:set var="mdrole">checked</c:set>	
								</c:if>			
							</c:forEach>
							<td><input type="checkbox" name="checkAll" id="${aId}" /></td>
							<td><input type="checkbox" name="chekcL" ${lvrole } menu-id="${m.menuIdx}" parent-id="${m.parentIdx}" auth-list="${m.authList }" auth-view="${m.authView }" /></td>
							<td><input type="checkbox" name="checkE" ${wrole} auth-write="${m.authWrite }" /></td>
							<td><input type="checkbox" name="checkED"${mdrole} auth-modify="${m.authModify }" auth-delete=${m.authDelete } /></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty menuList}">
					<tr>
						<td colspan="6"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
			</tbody>
		</table>
		<ul class="summmit_btn">
			<li><a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a></li>
			<li><a onclick="javascript:$.Nav('go', './list', null, null, true );" class="btn2 bg_darkgray">취소</a></li>
		</ul>
	</form>

	</div>
</div>


<script type="text/javascript">	
	$('input[type="checkbox"]').on('change', function(e){
		switch(e.target.id) {  
			case 'checkAll':
		        $('input[type="checkbox"]').prop('checked', e.target.checked);
		        break;
		    case 'chekcL':
		    	$('input[name="chekcL"]').prop('checked', e.target.checked);
		        break;
		    case 'checkE':
		    	$('input[name="checkE"]').prop('checked', e.target.checked);
		    	$('input[name="checkE"]').parent().prev().children().prop('checked', e.target.checked);
		        break;
		    case 'checkED':
		    	$('input[name="checkED"]').prop('checked', e.target.checked);
		    	$('input[name="checkED"]').parent().prev().prev().children().prop('checked', e.target.checked);
		        break;
		    default:
		    	break;
		}
		
		switch(e.target.name) {  
		case 'checkAll':
			$(this).parent().siblings().find('input[type="checkbox"]').prop('checked', e.target.checked);
	        break;
		case 'checkE':
			$(this).parent().prev().children().prop('checked', e.target.checked);
	        break;
		case 'checkED':
			$(this).parent().prev().prev().children().prop('checked', e.target.checked);
	        break;
		case 'chekcL':
			findParents($(this).attr('parent-id'), e.target.checked);
	        break;
	    default:
	    	break;
		}
	});
	function doSubmit() {	
		if(isNull($('#authoTitle').val()) || $('#authoTitle').val() === '0'){
			alert('그룹명을 선택해야 합니다.');
			return;
		}
		if (!confirm('저장하시겠습니까?'))
			return;
		
		const menus = document.querySelectorAll('.menuAuthor');
		const form = document.form1;
		const menuAuthList = form.querySelector('#menuAuthList');
		menuAuthList.innerHTML = '';
		let j = 0;
		$.each(menus, function(i, a){
			if(!isNull(a.childNodes[5].firstChild.id) || a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked){
				const menuAuthoGroupIdx = document.createElement("input");
				menuAuthoGroupIdx.name = 'menuAuthList['+ j +'].menuAuthoGroupIdx';
				menuAuthoGroupIdx.value = a.childNodes[5].firstChild.id;
				menuAuthoGroupIdx.hidden = true;
				const menuId = document.createElement("input");
				menuId.name = 'menuAuthList['+ j +'].menuId';
				menuId.value = a.id;
				menuId.hidden = true;
				const authoList = document.createElement("input");
				authoList.name = 'menuAuthList['+ j +'].authoList';
				authoList.value = a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked ? a.childNodes[7].firstChild.getAttribute('auth-list') : '';
				authoList.hidden = true;
				const authoView = document.createElement("input");
				authoView.name = 'menuAuthList['+ j +'].authoView';
				authoView.value = a.childNodes[7].firstChild.checked || a.childNodes[9].firstChild.checked || a.childNodes[11].firstChild.checked ? a.childNodes[7].firstChild.getAttribute('auth-view') : '';
				authoView.hidden = true;
				const authoWrite = document.createElement("input");
				authoWrite.name = 'menuAuthList['+ j +'].authoWrite';
				authoWrite.value = a.childNodes[9].firstChild.checked ? a.childNodes[9].firstChild.getAttribute('auth-write') : '';
				authoWrite.hidden = true;
				const authoModify = document.createElement("input");
				authoModify.name = 'menuAuthList['+ j +'].authoModify';
				authoModify.value = a.childNodes[11].firstChild.checked ? a.childNodes[11].firstChild.getAttribute('auth-modify') : '';
				authoModify.hidden = true;
				const authoDelete = document.createElement("input");
				authoDelete.name = 'menuAuthList['+ j +'].authoDelete';
				authoDelete.value = a.childNodes[11].firstChild.checked ? a.childNodes[11].firstChild.getAttribute('auth-delete') : '';
				authoDelete.hidden = true;
				form.querySelector('#menuAuthList').appendChild(menuAuthoGroupIdx);
				form.querySelector('#menuAuthList').appendChild(menuId);
				form.querySelector('#menuAuthList').appendChild(authoList);
				form.querySelector('#menuAuthList').appendChild(authoView);
				form.querySelector('#menuAuthList').appendChild(authoWrite);
				form.querySelector('#menuAuthList').appendChild(authoModify);
				form.querySelector('#menuAuthList').appendChild(authoDelete);
				j++;
			}
		});
		form.submit();
	}
	
	function findParents(parentId, check){
		let bigParent = '';
		const midP = $('[menu-id='+ parentId +']');
		midP.prop('checked', check);
		bigParent = midP.attr('parent-id');
		$('[menu-id='+ bigParent +']').prop('checked',  check);
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>