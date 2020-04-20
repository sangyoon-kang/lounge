<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일 UI
 --%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
.formInfo {border-top: 1px solid #000; line-height: 1.4; width:100%;}
.formInfo th {padding-left: 30px; font-weight: normal; text-align: left; background: #f5f5f5; border-right: 1px solid #E0E0E0; border-bottom: 1px solid #E0E0E0;}
.formInfo td {padding: 10px; height: 40px; border-bottom: 1px solid #E0E0E0; color: #777; text-align: left; line-height: 24px;}
.formInfo p {margin-bottom:5px;}
.btn_addr {border-radius: 6px; display: inline-block; height: 20px; line-height: 20px; padding: 0 12px; font-weight: 400; background: #555; border: 1px solid #444; color: #fff;}
.btn_save {display: inline-block; padding: 0 20px; height: 35px; color: #fff; line-height: 35px; background: #5E6574; border-radius: 3px;}
.btn_area {margin-top: 30px; text-align: center;}
#termsBody {padding: 10px 15px;border: 3px solid #D2DAEB; overflow: hidden; margin-bottom:20px;}
#termsBody span{line-height: 20px; color: #7c7c7c; font-weight: bold; font-size: 13px;}
.ml10 {margin-left:10px;}
.ml5 {margin-left:5px;}
 
</style>

<form id="form1" action="${URL_ADMIN_ROOT }/formmail/valueProc" method="post" enctype="multipart/form-data">
	<input type="hidden" name="fseq" value="${search.fseq }" />
	<div id="hidden"></div>
	
<c:if test="${vo.termsYn == 'Y' }">
	<div id="termsBody">
		<span>${vo.termsBody }</span>
	</div>
</c:if>
<table class="formInfo">
	<colgroup>
		<col width="20%" />
		<col width="*" />
	</colgroup>
<c:forEach var="m" items="${list}" varStatus="s">				
		<tr>
<c:if test="${fn:contains(m.saveFile, 'image/')}">
			<th style="padding-left:0px"><img src=${UPLOAD_ROOT }${m.saveFile} class="img" style="width:100%;" /></th>
</c:if>
<c:if test="${empty m.saveFile}">
<c:set var="required" />						
<c:if test="${m.requiredYn == 'Y' }">
	<c:set var="required"><span class="red">*</span></c:set>
</c:if>	
			<th>${m.formInfoName } ${required }</th>
</c:if>
			<td class="td1">
<c:choose>
	<c:when test="${m.property == 'select' }">
		<select class="sel${s.index }" name="selectValue">
			<option value="">--</option>
<c:forEach var="n" items="${m.detailNameArray }">
			<option value="${n }">${n }</option>
</c:forEach>
		</select>
	</c:when>
	<c:when test="${m.property == 'name' }">
		<input type="text"  name="nameValue" class="name${s.index }" size="${m.size }" />
	</c:when>
	<c:when test="${m.property == 'phone' }">
		<input type="text" name="phoneValueA${s.index }" class="inputPhone onlyNumber" size="${m.size }"/> - <input type="text" name="phoneValueB${s.index }" class="inputPhone onlyNumber" size="${m.size }"/> - <input type="text" name="phoneValueC${s.index }" class="inputPhone onlyNumber" size="${m.size }"/>
	</c:when>
	<c:when test="${m.property == 'email' }">
		<input type="text" name="emailValueA${s.index }" size="${m.size }"/> @ <input type="text" name="emailValueB${s.index }" size="${m.size }"/>
	</c:when>
	<c:when test="${m.property == 'address' }">
		<p><input type="text" style="width:30%" name="zipCode${s.index }" readonly onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');"/><a onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');" class="btn_addr ml5">주소찾기</a></p>
		<p><input type="text" style="width:70%" name="addrA${s.index }" readonly onclick="javascript:openSearchAddress('zipCode${s.index }', 'addrA${s.index }', 'addrB${s.index }');" /></p>
		<p><input type="text" style="width:70%" name="addrB${s.index }" /></p>
	</c:when>
</c:choose>						
	<c:forEach var="n" items="${m.detailNameArray }"  varStatus="ss">
<c:set var="ml" />
<c:if test="${!ss.first }">
	<c:set var="ml">ml10</c:set>
</c:if>
		<c:choose>
			<c:when test="${m.property == 'text' }">
				<input type="text" class="text${s.index }" name="textValue" size="${m.size }"/><span>${n}</span><br/>
			</c:when>
			<c:when test="${m.property == 'radio' }">
				<label><input type="radio" class="rdo ${ml }" name="radioValue${s.index }" size="${m.size }" value="${n }" /> ${n }</label>
			</c:when>
			<c:when test="${m.property == 'checkbox' }">
				<label><input type="checkbox" class="chk${s.index } ${ml }" name="checkboxValue" size="${m.size }" value="${n }" /><span>${n }</span></label>
			</c:when>
			<c:when test="${m.property == 'textarea' }">
				<textarea cols="${m.size }" class="area${s.index }" name="textareaValue" ></textarea><span>${n }</span><br/>
			</c:when>
			<c:when test="${m.property == 'file' }">
				<input type="file" class="file${s.index }" name="fileValue" /><%-- <span>${n }</span> --%>
			</c:when>
			<c:when test="${m.property == 'pdate' }">
				<input type="text" class="datepicker date${s.index }" size="${m.size }" name="dateValue" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a><br/>
			</c:when>
		</c:choose>
	</c:forEach>						
			</td>
		</tr>
</c:forEach>
</table>
<div class="btn_area">
	<a onclick="javascirpt:doSubmit();" class="btn_save">저장</a>
</div>
</form>
<script type="text/javascript">
	function doSubmit() {
		var flag = false;

		$('tr th').each(function(idx) {
			if ($(this).text().indexOf('*') > 0) {
				var $txt = $(this).text().replace('*', '');
				//console.log($txt);
				if ($('.sel' + idx).length > 0) {
					if (!$('.sel' + idx + ' > option:selected').val()) {
						alert($txt + '선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.name' + idx).length > 0) {
					if (isNull($('.name' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueA' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueA' + idx + ']').val())) {
						alert('첫번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueB' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueB' + idx + ']').val())) {
						alert('두번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=phoneValueC' + idx + ']').length > 0) {
					if (isNull($('input[name=phoneValueC' + idx + ']').val())) {
						alert('세번째 ' + $txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=emailValueA' + idx + ']').length > 0) {
					if (isNull($('input[name=emailValueA' + idx + ']').val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=emailValueB' + idx + ']').length > 0) {
					if (isNull($('input[name=emailValueB' + idx + ']').val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=zipCode' + idx + ']').length > 0) {
					if (isNull($('input[name=zipCode' + idx + ']').val())) {
						alert('주소찾기를 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=addrB' + idx + ']').length > 0) {
					if (isNull($('input[name=addrB' + idx + ']').val())) {
						alert('나머지 주소를 입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('input[name=radioValue' + idx + ']').length > 0) {
					if (!$('input[name=radioValue' + idx + ']:checked').val()) {
						alert($txt + '선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.chk' + idx).length > 0) {
					if (!$('.chk' + idx + ':checked').val()) {
						alert($txt + '한 개 이상 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.text' + idx).length > 0) {
					if (isNull($('.text' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
					
				}
				if ($('.area' + idx).length > 0) {
					if (isNull($('.area' + idx).val())) {
						alert($txt + '입력 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.date' + idx).length > 0) {
					if (isNull($('.date' + idx).val())) {
						alert('날짜를 선택 해주세요.');
						flag = true;
						return false;
					}
				}
				if ($('.file' + idx).length > 0) {
					if (isNull($('.file' + idx).val())) {
						alert('파일을 선택 해주세요.');
						flag = true;
						return false;
					}
				}
			}
		});
		
		
		$('.td1').each(function(idx) {
			var $chk = $('.chk' + idx + ':checked').length;
			if (!flag && $chk != 0) 
				$('#hidden').append('<input type="hidden" name="chkCount" value="' + $chk + '" />');
			if (!flag && !isNull($('input[name=phoneValueA' + idx + ']').val())) {
				var $phoneValue = $('input[name=phoneValueA' + idx + ']').val() + '-' + $('input[name=phoneValueB' + idx + ']').val() + '-' + $('input[name=phoneValueC' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="phoneValue" value="' + $phoneValue +'" />');
			}
			if (!flag && !isNull($('input[name=emailValueA' + idx + ']').val())) {
				var $emailValue = $('input[name=emailValueA' + idx + ']').val() + '@' + $('input[name=emailValueB' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="emailValue" value="' + $emailValue +'" />');
			}
			if (!flag && !isNull($('input[name=zipCode' + idx + ']').val())) {
				var $addressValue = $('input[name=zipCode' + idx + ']').val() + ' ' + $('input[name=addrA' + idx + ']').val() + ' ' + $('input[name=addrB' + idx + ']').val();
				$('#hidden').append('<input type="hidden" name="addressValue" value="' + $addressValue +'" />');
			}
		});
		
		$('.rdo').each(function() {
			if ($(this).prop('checked')) {
				if (!flag)
					$('#hidden').append('<input type="hidden" name="radioValue" value="' + $(this).val() + '" />');
			}
			
		});
		
		if (flag)
			return;
		
		if (confirm('저장하시겠습니까?')) {
			$('#form1').submit();
		} else {
			$('#hidden').empty();
			return;
		}
	} 
</script>