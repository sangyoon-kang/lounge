<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		상품 - 메인 & 추천 상품
		/module/rp (ModuleController.prdRecent) 참조
 --%>
 	<div id="divRp_${search.rpseq }" style="min-height: 50px;">
 	</div> 	
	<script>
		$(function() {
			oLoader('#divRp_${search.rpseq }'
				, '/ajax/rp.do'
				, 'post'
				, { rpseq: '${search.rpseq}' }
				, false
				, function(data) {
					try {
						$('#divRp_${search.rpseq }').html(data.parsedHtml);
						$('span.dateSns').each(function() {
							$(this).text(getDateBySns($(this).text()));
						});
					}
					catch(e) {
						console.log(e);
						alert('oLoader callback expcetion : ' + e.message);
					}
				}
			);
		});
	</script>
	