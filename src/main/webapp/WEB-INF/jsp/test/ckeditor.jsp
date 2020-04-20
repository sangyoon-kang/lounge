<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	<%@ include file="/WEB-INF/include/front_header_html.jsp"%>
	
	<div id="wrap">
		<script type="text/javascript">
		    $(function(){
		         
			    CKEDITOR.on('dialogDefinition', function(ev) {
			        var dialogName = ev.data.name;
			        var dialogDefinition = ev.data.definition;
			        switch (dialogName) {
			            case 'image': //Image Properties dialog
			                //dialogDefinition.removeContents('info');
			                dialogDefinition.removeContents('Link');
			                dialogDefinition.removeContents('advanced');
			                break;
			        }
			    });
			});
		</script>
		<form id="form1" action="">
	
			<textarea id="body" name="body" style="width:.100%;height:200px;" class="editor"></textarea>
			<script type="text/javascript" src="/common/ckeditor/ckeditor.js" charset="utf-8"></script>
			<script type="text/javascript" src="/common/ckeditor/config.js" charset="utf-8"></script>
	
			<script type="text/javascript">
				CKEDITOR.replace('body');
			</script>
		</form>
	</div>
	
	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>
