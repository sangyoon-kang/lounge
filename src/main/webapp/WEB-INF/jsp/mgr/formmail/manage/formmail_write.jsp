<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	폼메일관리 - 폼메일생성 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>폼메일 관리</h2>
			<p>홈 &gt; 폼메일 관리 &gt; 폼메일 생성</p>
		</div>
		<div class="scon">
			<form id="form1" action="./form_proc.do" method="post">
			<input type="hidden" name="fseq" value="${search.fseq }" />
				<h3 class="scon_tit2">폼메일생성</h3>
				
				<table class="board_write mb20">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>폼메일명 <span class="txt_red">*</span></strong></th>
							<td colspan="4"><input  class="w25" name="formName" value="${vo.formName }" type="text" /></td>
						</tr>
						
						<tr>
							<th><strong>스킨</strong></th>
							<td colspan="4">
								<select name="cssPrefix">
									<option value="1">1</option>
									<option value="2">2</option>
								</select>
							</td>
<!-- 							<th><strong>스팸글체크</strong></th>
							<td>
								<span>항목추가 시 항목속성을 "스팸글체크" 를 선택하면 사용할 수 있습니다.</span>
							</td> -->
						</tr>
						<tr>
							<th><strong>발신설정</strong></th>
							<td colspan="4">${tagoplusSolution1_session_site.siteName } > 기본설정 > 사이트정보 > "사이트명"과 "관리자 이메일"에 입력된 값으로 발송됩니다.</td>
						</tr>
						<tr>
							<th><strong>약관설정</strong></th>
							<td colspan="4">
								
									<label><input type="checkbox" name="terms" value="Y">사용함</label><br/>
									<input name="termsYn" type="hidden" value="" />
									<script>
										$(function() {
											checkCheckbox('terms', 'termsYn', '${vo.termsYn}', 'N');
										});
									</script>
									<textarea id="terms" name="termsBody" rows="10" class="w100">${vo.termsBody }</textarea>
								
							</td>
						</tr>
						<tr>
							<th><strong>수신설정</strong></th>
							<td colspan="4">
								<label><input type="checkbox" name="boardReceive"  value="Y" checked disabled />게시판수신</label><span class="txt_red ml5">게시판 수신은 필수입니다.</span><br/>
								<label><input type="checkbox" name="emailRe" value="Y" />email 수신</label><input type="text" class="ml5" name="emailReceive" value="${vo.emailReceive }" /><br/>			
								<%-- <label><input type="checkbox" name="smsRe"  value="Y"/>SMS 수신 </label><input type="text" class="ml10" name="smsReceive" value="${vo.smsReceive }" /> --%>
								<input name="boardReceiveYn" type="hidden" value="" />
								<input name="emailReceiveYn" type="hidden" value="" />
								<!-- <input name="smsReceiveYn" type="hidden" value="" /> -->
								<script>
									$(function() {
										checkCheckbox('boardReceive', 'boardReceiveYn', '${vo.boardReceiveYn}', 'Y');
										checkCheckbox('emailRe', 'emailReceiveYn', '${vo.emailReceiveYn}', 'N');
										
										//checkCheckbox('smsRe', 'smsReceiveYn', '${vo.smsReceiveYn}', 'N');
									});
								</script>
							</td>
						</tr>
					</tbody>
				</table>
				<div class="check_conbox mb10">
					<h4 class="check_tit">체크사항</h4>
					<ul>
						<li>- 이메일 은 여러명이 동시에 수신할 수 있습니다. 수신할 이메일을 콤마(,)로 구분하여 입력합니다.</li>
						<li>예) test@test.com,tago@tago.com / 010-1234-5678,010-2512-5232</li>
					</ul>
				</div>
				<div class="summmit_btn mb40">
					<a onclick="javascirpt:doSubmit();" class="btn2 bg_navy">저장</a>
					<a onclick="javascirpt:$.Nav('go', './formmail_list.do');" class="btn2 bg_gray">목록</a>
				</div>
			</form>
			<span class="fr mb10">
					<a href="javascript:doAddDetail(${search.fseq}, 0);" class="btn btn_round bg_darkgray">항목추가</a>
					<a href="javascript:updateFormInfo();" class="btn btn_round bg_darkgray">새로고침</a>
			</span>
			<table class="board_st1">
				<colgroup>
						<col width="20%" />
						<col width="*" />
						<col width="10%" />
						<col width="10%" />
						<col width="20%" />
					</colgroup>
					<thead>
					<tr>
						<th>항목명</th>
						<th>미리보기</th>
						<th>필수여부</th>
						<th>순서</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody id="info">
				</tbody>
			</table>
		</div>
	</div>
	<!--wrap_scon E-->


<script id="infoTmpl" type="text/x-jquery-tmpl">
{{each info}}
	<tr>
{{if saveFile != null}}
		<td><img src=${UPLOAD_ROOT }\${saveFile} class="img" style="width:100%;" /></td>
{{else}}
		<td>
			\${formInfoName }
		{{if requiredYn == "Y"}}
			<span class="red">*</span>
		{{/if}}
		</td>
{{/if}}

		<td style="text-align:left; overflow: hidden; max-width: 200px;">
		{{if property == "select" }}
			<select>
					<option>--</option>
				{{each detailNameArray}}
					<option>\${$value}</option>
				{{/each}}
			</select>
		{{else property == "name" }}
			<input type="text" size="\${size }"/>
		{{else property == "phone" }}
			<input type="text" size="\${size }"/> - <input type="text" size="\${size }"/> - <input type="text" size="\${size }"/>
		{{else property == "email" }}
			<input type="text" size="\${size }"/> @ <input type="text" size="\${size }"/>
		{{else property == "address" }}
			<input type="text" class="w30" name="zipCode" readonly onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');"/><a onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');" class="btn btn_round bg_darkgray ml5">주소찾기</a>
			<input type="text" class="w70" name="addr1" readonly onclick="javascript:openSearchAddress('zipCode', 'addr1', 'addr2');" />
			<input type="text" class="w70" name="addr2" />
		{{/if}}
			{{each detailNameArray}}
				{{if property == "text"}}
					<input type="text" size="\${size }"/><span>\${$value}</span>
				{{else property == "radio"}}
					<input type="radio" name="radio" size="\${size }"/><span>\${$value}</span>
				{{else property == "checkbox"}}
					<input type="checkbox" size="\${size }"/><span>\${$value}</span>
				{{else property == "textarea"}}
					<textarea cols="\${size }" ></textarea><span>\${$value}</span>
				{{else property == "file"}}
					<input type="file" />
				{{else property == "pdate"}}
					<input type="text" class="datepicker" size="\${size}" /><span>\${$value}</span>
				{{/if}}
			{{/each}}
		</td>

		<td>\${requiredYn}</td>
		<td>
				<input type="hidden" class="order" value="\${formInfoSeq}" />
				<span class="fl ml15">
					<a href="javascript:changeState(\${$index}, 'up');" class="hover"><span class="arrowUp"></span></a>
				</span>
				<span class="fr mr15">
					<a href="javascript:changeState(\${$index}, 'down');" class="hover"><span class="arrowDown"></span></a>
				</span>
		</td>
		<td>
			<a onclick="javascript:doAddDetail(\${formSeq}, \${formInfoSeq });" class="btn btn_round bg_pink">수정</a> 
			<a onclick="javascript:changeState('', '', \${formInfoSeq }, 'd')" class="btn btn_round bg_darkgray">삭제</a>
		</td>
	</tr>
{{/each}}
</script>

<script id="emptyTmpl" type="text/x-jquery-tmpl">
	<tr>
		<td colspan="5"><s:message code="common.noData" /></td>
	</tr>
</script>

<c:set var="delete"><s:message code="common.delete.msg" /></c:set>			
<script type="text/javascript">
	$(function() {
		updateFormInfo();
		$('#terms').val($('#terms').val().replace(/<br>/gi, '\n'));
		
	});
	
	function doAddDetail(fseq, fiseq) {
		if (fseq <= 0) {
			alert('폼메일생성을 먼저 해주세요.');
			return;
		}
		openPop('?fseq=' + fseq + '&fiseq=' +fiseq , 'formmailInfo');
	}
	
	function updateFormInfo() {
		$fseq = $('input[name=fseq]').val();
		
		oLoader(
			$('#info'),
			'./getFormInfo.do',
			 'post',
			{fseq:$fseq},
			 false,
			 function(data) {
				//console.log(data.info);
				if (data.info.length == 0) {
					$('#emptyTmpl').tmpl({info:data.info}).appendTo($('#info'));
				} else {
				//console.log(data.info);
					$('#info').empty();
					$('#infoTmpl').tmpl({info:data.info}).appendTo($('#info'));
					$('.datepicker').datepicker();
			}
		});
		
		/* $.ajax({
			url: './getFormInfo',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				fseq:$fseq
			}, 
			success: function (data) {
				//console.log(data.info);
				$('#info').empty();
				$('#infoTmpl').tmpl({info:data.info}).appendTo($('#info'));
				$('.datepicker').datepicker();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		}); */
	}
	
	function changeState(index, type, seq, status) {
		var preSeq = 0;
		var nextSeq = 0;
		
		if (status == 'd') {
			var sMsg = '${delete}';
			if (!confirm(sMsg))
				return;
		} else {
			$('.order').each(function(idx, el){
				if (index == idx)
					preSeq = $(this).val();
				
				if (type == 'up') {
					if ((index - 1) == idx)
						nextSeq = $(this).val();
				} else if (type == 'down') {
					if ((index + 1) == idx) 
						nextSeq = $(this).val(); 
				}
			});
		}
		$.ajax({
			url: './changeState.do',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				preSeq:preSeq,
				nextSeq:nextSeq,
				fiseq:seq,
				status:status
			}, 
			success: function (data) {
				//console.log(data);
				alert(data.result + '되었습니다.');
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	}
	
	function doSubmit() {
		if (isNull($('input[name=formName]').val())) {
			alert('폼메일명을 입력 해주세요.');
			$('input[name=formName]').focus();
			return;
		} 
	
		if (!confirm('저장하시겠습니까?'))
			return;
		$('#form1').submit();
	}
	
	
/* 	
	function updateOrdering(index, type) {
		//console.log(type);
		var preSeq = 0;
		var nextSeq = 0;
		
		$('.order').each(function(idx, el){
			if (index == idx)
				preSeq = $(this).val();
			
			if (type == 'up') {
				if ((index - 1) == idx)
					nextSeq = $(this).val();
			} else if (type == 'down') {
				if ((index + 1) == idx) 
					nextSeq = $(this).val(); 
			}
		});
		//console.log('1 : ' + preSeq);
		//console.log('2 : ' + nextSeq);
		$.ajax({
			url: './UpdateOrdering',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				preSeq:preSeq,
				nextSeq:nextSeq
			}, 
			success: function (data) {
				//console.log(data);
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	}
	
	function doDelete(seq) {
		var sMsg = '${delete}';
		if (!confirm(sMsg))
			return;
		
		$.ajax({
			url: './deleteFormInfo',
			//async: false,
			type: 'post',
			dataType: 'json',
			data: {
				fiseq:seq
			}, 
			success: function (data) {
				//console.log(data);
				updateFormInfo();
			}, 
			error: function (data) {
				alert("error ajax :\n" + data.responseText);
			}
		});
	} */
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
