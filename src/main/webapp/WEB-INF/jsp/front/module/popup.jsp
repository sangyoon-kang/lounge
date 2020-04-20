<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%--
		팝업생성
 --%>
<script id="popupTmpl" type="text/x-jquery-tmpl">
	<div class="popup">
		<div class="title_area">
			<h1>\${subject}</h1>
			<a href="javascript:closePopup(\${popupSeq});" class="btn_close"></a>
        	</div>
		<div class="pop_cons">{{html body}} </div>
		<div class="bo_area">
		<div class="fleft">
			<label class="notToday" data-seq="\${popupSeq}"><input type="checkbox"><span>오늘 하루동안 보이지 않기</span> </label></div>
			<a class="fright" href="javascript:closePopup(\${popupSeq});">닫기</a>
        </div>
    </div>
</script>
	<script type="text/javascript">
		$(function() {
			getPopup();
		});
		
		//TODO : 팝업 레이아웃 수정 필요, 테스트 필요
		function getPopup() {
			
			$.ajax({
				url : '/ajax/getPopup.do',
				type : 'post',
				data : {
						popupSeq : '${pVo.popupSeq}' 
					},
				dataType : 'json',
				success : function(data) {
					$(data).each(function(i, el) {
						if (GetCookie('${COOKIE_POPUP_PREFIX}' + el.popupSeq) == 'Y')
							return true;

						if (el.popupType == 'L') {
							var $layer = $('<div id="popup'+ el.popupSeq +'" class="popup_wrap">');
							$('#popupTmpl').tmpl(el).appendTo($layer);
							$(document.body).append($layer);
		
						}
						else if (el.popupType == 'W') {
							//오늘 하루동안 보지 않기 길이 미포함 처리 + 30
							popUpWin('/module/open_popup.do?popupSeq='+el.popupSeq, 'popup'+ el.popupSeq, el.horizontalSize, el.verticalSize + 30, el.positionX, el.positionY, "auto", "yes", false);							
						}
						
					});

				},
				error : function(data) {
					alert("error ajax :\n" + data.responseText);
				}
			});
		}

		function closePopup(seq) {
			$('#popup' + seq).hide('fade');
		}

		function closePopupNotToday(seq) {
			$('#popup' + seq).hide(function() {
				var expired = getDateByjQueryDateFormat('1d');
				SetCookie('${COOKIE_POPUP_PREFIX}' + seq, 'Y', null, null, expired);
			});
		}
		$('body').on('click', 'label.notToday', function() {
			var seq = $(this).data('seq');
			closePopupNotToday(seq);
		});
	</script>