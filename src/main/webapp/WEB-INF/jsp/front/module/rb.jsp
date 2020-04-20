<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		게시판 - 메인게시물
		/module/rb (ModuleController.boardRecent) 참조
 --%>
 	<div id="divRb_${search.rbseq }" style="min-height: 50px;">
 	</div> 	
	<script>
		$(function() {
			oLoader('#divRb_${search.rbseq }'
				, '/ajax/rb.do'
				, 'post'
				, { rbseq: '${search.rbseq}' }
				, false
				, function(data) {
					try {
						$('#divRb_${search.rbseq }').html(data.parsedHtml);
						/* $('span.dateSns').each(function() {
							$(this).text(getDateBySns($(this).text()));
						}); */
					}
					catch(e) {
						console.log(e);
						alert('oLoader callback expcetion : ' + e.message);
					}
				}
			);
		});
	</script>
	