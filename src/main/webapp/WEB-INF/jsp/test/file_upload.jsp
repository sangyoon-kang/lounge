<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
	<script type="text/javascript">
		$(function() {
			//$('#btnSave').click(function() {
			//	$('#form1').submit();
			//});
			
			$('#btnTest1').click(function() {
				var ss = $('#form1').formSerialize();
				alert(ss);
				$('#form1').ajaxForm(function() {
					alert("Thank you for your comment!"); 
	            }); 
			});
		});
	</script>
	
	<div id="wrap">
		<form id="form1" method="post" action="./fileUpload_proc" enctype="multipart/form-data">
			<input type="hidden" name="admId" value="${vo.admId }" />
			<div>업로드 예제</div>
			
			<div>
				<input type="file" id="file0" name="uploadFiles" />
				<input name="deleteFlag[0]" type="checkbox" id="imageUseYn0" value="20160128152921132001.pdf" />
				<input type="hidden" name="_deleteFlag[0]" value="" />
			</div>
			<div>
				<input type="file" id="file1" name="uploadFiles" />
				<input name="deleteFlag[1]" type="checkbox" id="imageUseYn1" value="20160128153112074002.pdf" />
				<input type="hidden" name="_deleteFlag[1]" value="" />
			</div>
			<div class="mb40">
				<input type="file" id="file2" name="uploadFiles" />
				<input name="deleteFlag[2]" type="checkbox" id="imageUseYn2" value="20160128153418201001.pdf" />
				<input type="hidden" name="_deleteFlag[2]" value="" />
			</div>
			
			<div>
				<input type="submit" id="btnSave" value="실행" />
			</div>
		</form>
		<br class="mb40" />
		<button id="btnTest1">ajax form test</button>
		
		
		
	</div>
