/**
* first coded date : 2010.09
* coded by : @wimy1, wimy1@hanmail.net
* description : 일반화 처리를 위한 jquery를 이용한 common.js
*			: common.js와 같이 사용해야 합니다.
*			: 자유롭게 변경해서 사용가능하나, 이 설명 내용을 제거하지 마십시오. 
*			: 가급적이면 변경 이력을 추가해서 사용하십시오.
*			: 이 코드들이 제대로 작동하지 않을 경우, 페이지의 하단에 추가해 보십시오. 
*
*	2016.01.27 : lib.js와 같이 사용하도록 변경
*	2018.12.21 : 
*			function viewFile(filePath)
*			function downloadFile(saveFilename, originalFilename)
*		 		common.js로 이동
*
*			.dateRange : 기능 변경
*			.onlyNumberWithComma : 추가
*			.inputZipCode : 기능 변경 - common.js openSearchAddress() 호출 (다음 주소 찾기 API 사용)
*			copyClipboard() 메서드 : 마이너 수정 - input element 내용도 복사 가능
*			
*/

//전역 : 모바일 브라우저 여부
var __isMobile = false;
// 전역 : 읽기전용 필드 background-color 처리
var __readonlyColor = '#dadada';


/**
 * onload
 */
$(document).ready(function() {
	_initPageLoad();
});


/**
 * 로그인 
 */
function goLogin() {
	var sRedirectParam = encodeURIComponent(location.pathname + location.search);
	location.href = '/login/login.do?redirectURL=' + sRedirectParam;
}



/**
 * check login
 * ********************************************************************************
 */
// 비동기 함수이므로 붙여서 쓸 것
// ajax 로그인 체크
// jquery 필요
// type : 'front', 'admin'
// return : true:로그인, false:로그인 아님
//function checkLoginAjax(type) {
//	$.ajax({
//		async : false
//		, url : '/pages/ajax/checkLogin.aspx'
//		, type : "post"
//		, dataType : 'text'
//		, data : {
//			checkType : type == null ? 'front' : type
//		}
//		, success : function(msg) {
//			var isLogin = eval(msg);
//			return isLogin;
//		}
//	});
//}
/** ********************************************************************************************* */

/**
 * 일반화 전처리 함수 : 여러가지 일반화 기능이 들어있습니다. css class name 등으로 접근 가능합니다. 상세 내역은 각 기능별
 * 항목별 단일 주석을 참조하십시오.
 * navigator.userAgent.match(/android/i)
 * navigator.userAgent.match(/(iphone)|(ipod)|(ipad)/i)
 */
function _initPageLoad() {
	var arrKeywords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');
	var isMobile = false;
	for ( var key in arrKeywords) {
		if (navigator.userAgent.indexOf(arrKeywords[key]) > -1) {
			isMobile = true;
			__isMobile = true;
			break;
		}
	}

	// 모바일 브라우저; URL 입력폼 숨김 스크롤
	if (isMobile) {
		setTimeout(function() {
			window.scrollTo(0, 1)
		}, 100);
	}
	
	// 웹 접근성을 적용할 경우 사용 금지
	// $('img, a').focusin(function () {
	// $(this).blur();
	// });
	
	//global ajax setting
	//<div style="position:fixed; top:300px; left:' + iWidth + 'px"><img src="/images/loading_6.gif" /></div>
	$.ajaxSetup({
		beforeSend: function() {
			var $loadingArea = null;
			if ($('.loading_area').length > 0) 
				$loadingArea = $('.loading_area');
			
			if ($loadingArea != null)
				$loadingArea.waitMe({
					effect: 'win8'
					, bg: 'rgba(255,255,255,0.7)'
					, color: '#000'
					, text: ''
				});
		}
		, complete: function () {
			var $loadingArea = null;
			if ($('.loading_area').length > 0) 
				$loadingArea = $('.loading_area');
			
			if ($loadingArea != null)
				$loadingArea.waitMe('hide');
		}
	});
	
	

	// readonly 속성일 경우 색상 변경
	// 추가 : nochangebgcolor 클래스를 가지고 있으면 변경안함
	$('input, select, textarea').each(function() {
		if ($(this).attr('readonly') != null && !$(this).hasClass('nochangebgcolor')) {
			if ($(this).attr('readonly') == 'readonly' || $(this).attr('readonly') == true) {
				$(this).css({
					'background-color' : __readonlyColor
				});

				if ($(this).parent('span').parent('span.input').length == 1) {
					$(this).parent('span').parent('span.input').addClass('readonly');
				}
			}
		}
	});

	// html object cursor:pointer 속성 설정
	$('.mousePointer').each(function() {
		$(this).css({
			cursor : 'pointer'
		});
		// if ($(this).context.nodeName.toLowerCase() == "a")
		// $(this).css({ 'font-weight': 'bold' });
	});

	// cursor:pointer 속성 설정2 : img, a 태그에 onclick 이벤트가 있을 경우
	$('a, img').each(function() {
		if ($(this).attr('onclick') != null) {
			$(this).css({
				cursor : 'pointer'
			// , 'font-weight': 'bold'
			});
		}
	});

	// , input[type=image]
	// 이미지태그, 이미지 버튼 이미지 연결 오류시
	// alert($('img').length);
	$('.onerror').each(function() {
		// alert($(this).attr('complete'))
		var sText = '이미지가 없습니다.';
		$(this).error(function() {
			$(this).prop('alt', sText).prop('title', sText);
		});
	});

	// 단순 개발중 경고 이벤트
	$('.devAlert').css('cursor', 'pointer').click(function() {
		alert('구현중입니다.');
		event.preventDefault();
	});

	// 날짜 선택기 설정 - 캘린더 이미지는 텍스트폼 다음에 있어야 함
	// lib.js 필요 - getyyyyMMdd(), getDate(), getDateByjQueryDateFormat() 필요
	// maxDate, minDate 속성 지원
	$('.datepicker').each(function() {
		if ($(this).context.nodeName == "INPUT") {
			$(this).css({
				'ime-mode' : 'disabled'
				, 'width' : '90px'
			}).attr('autocomplete', 'off');
			
			$(this).datepicker({
				showOtherMonths : true, showButtonPanel : true, selectOtherMonths : true, changeMonth : true, changeYear : true, option : {
					width : 600
				}, minDate : $(this).attr('minDate'), maxDate : $(this).attr('maxDate')
			});

			if ($(this).attr('maxDate') != null) {
				// 최대 날짜 등록
				var maxDate = toTimeObject(getyyyyMMdd(getDateByjQueryDateFormat($(this).attr('maxDate'), new Date())));
				$(this).data('maxDate', maxDate);
			}
		} else if ($(this).context.nodeName == "IMG" || $(this).context.nodeName == "A") {
			$(this).css({
				cursor : 'pointer'
			});
			$(this).click(function() {
				$(this).prev().focus();
			});
		}
	});

//	// 날짜 범위 자동 설정 - has bugs
//	// input.datepicker필요
//	// lib.js 필요 - getyyyyMMdd(), getDate(), getDateByjQueryDateFormat() 필요
//	// n개의 세트 지원
//	// baseDay 속성 지원 : 기본값:오늘 (0).  ex) baseDay = 1이면 내일, -1이면 어제로 기본일 설정
//	// range 속성 지원 : jquery datepicker의  '1y', '1m', '1d' 형식의 값. 설정하면 두 개의 날짜 선택기에 해당 기간 만큼의 날짜가 설정됨.
//	// reverse 속성 지원 : range속성이 있을 경우만 사용 가능. 두 개의 날짜 선택기에 표시될 값을 뒤집어서 표시 : 기본값 (사용안함), true : 뒤집기
//	
//	if ($('input.datepicker').length > 0) {
//
//		var objDatepickers = $('input.datepicker');
//		var iFormCount = 1;
//		if (objDatepickers.length > 2)
//			iFormCount = objDatepickers.length / 2; // datepicker 세트수
//
//		var objDateRange = $('.dateRange');
//		var iDateRangeCount = objDateRange.length / iFormCount; // 날짜 범위 설정 컨트롤
//		
//		objDateRange.each(function(idx, elm) {
//			$(this).click(function() {
//				//alert('iFormCount : ' + iFormCount);
//				//alert($(this).prevAll('input.datepicker:eq(0)').attr('id'));
//				//alert($(this).prevAll('input.datepicker:eq(1)').attr('id'));				
//				try {
//					//TODO : 주의 : 버그 있음
//					//특정 datepicker세트 다음에 dateRange세트가 있고, 특정 datepicker세트 다음에  dateRange세트가 없을 경우 비정상 작동
//					//	-> dateRange 전체 개수를 formCount 개수로 나눠서 datepicker로 할당하기 때문에 오류 가능성 있음.
//					//		alert($(this).prevAll('input.datepicker:eq(0)').attr('id'));
//					//		alert($(this).prevAll('input.datepicker:eq(1)').attr('id')); 로 바꿔야 함.
//					if (iFormCount > 1) {
//						var iCurrentIndex = Math.floor(idx / iDateRangeCount);
//						var iMin = iCurrentIndex * 2 - 1;
//						var iMax = iCurrentIndex * 2 + 2 - 1;
//						//alert('iCurrentIndex : ' + iCurrentIndex + '\niMin : ' + iMin + "\niMax : " + iMax);
//						if (iMin < 1) {
//							iMax = 2;
//							objDatepickers = $('input.datepicker:lt(' + iMax + ')');
//						} else
//							objDatepickers = $('input.datepicker:gt(' + iMin + '):lt(' + iMax + ')');
//					}
//
//					
//					var today = new Date();
//					var baseDay = $(this).attr('baseDay');
//					if (baseDay != null) {
//						// 오늘 - 1 이 기본값
//						today.setDate(today.getDate() + parseInt(baseDay, 10));
//					}
//					
//					var range = $(this).attr('range');
//					if (range == 'none') {
//						objDatepickers.each(function(idxDate, elmDate) {
//							$(this).val('');
//						});
//					} else {
//						var startDate = getDateByjQueryDateFormat(range, today);
//						//alert(startDate + "\n" + today);
//						//alert(getyyyyMMdd(startDate) + "\n" + getyyyyMMdd(today));
//						if(!eval($(this).attr('reverse'))) {
//							$(objDatepickers[0]).val(getyyyyMMdd(startDate));
//							$(objDatepickers[1]).val(getyyyyMMdd(today));
//						}
//						else {
//							$(objDatepickers[0]).val(getyyyyMMdd(today));
//							$(objDatepickers[1]).val(getyyyyMMdd(startDate));
//						}							
//					}
//					
//					//data-click="btnSearch" : $('#btnSearch').click();
//					if ($(this).data('click') != null) {
//						$('#' + $(this).data('click')).click();
//					}
//					
//				} catch (e) {
//					alert('datepicker 날짜 범위 설정에서 오류 발생\n' + e.message);
//				}
//			});
//		});
//	}
	
	//날짜 범위 자동 설정 - 변경 
	// input.datepicker 필요
	// lib.js 필요 - getyyyyMMdd(), getDate(), getDateByjQueryDateFormat() 필요
	// baseDay 속성 지원 : 기본값:오늘 (0).  ex) baseDay = 1이면 내일, -1이면 어제로 기본일 설정
	// range 속성 지원 : jquery datepicker의  '1y', '1m', '1d' 형식의 값. 설정하면 두 개의 날짜 선택기에 해당 기간 만큼의 날짜가 설정됨.
	// reverse 속성 지원 : range속성이 있을 경우만 사용 가능. 두 개의 날짜 선택기에 표시될 값을 뒤집어서 표시 : 기본값 (사용안함), true : 뒤집기
	// 2018-12-19: scope 속성 필수 : 페이지 내 또 다른 input.datepicker가 있을 경우 버그 발생
	//	- scope 범위 내의 input.datepicker 대상 적용
	if ($('.dateRange').length > 0) {
		var hasScope = true;
		var arrScopes = [];
		var hasDps = true;
		var $drs = $('.dateRange');
		
		$drs.each(function() {
			if (isNull($(this).attr('scope'))) {
				hasScope = false;
				arrScopes = [];
				return false;
			}
			else {
				if ($.inArray($(this).attr('scope'), arrScopes) === -1) {
					arrScopes.push($(this).attr('scope'));
				}
			}
		});
		
		if (!hasScope) {
			alert('.dateRange 엘리먼트에 scope 속성을 추가해야 합니다.\ndateRange는 작동하지 않습니다.');
		}
		else {
			for (var x in arrScopes) {
				var $scope = $('' + arrScopes[x]);
				if ($scope.find('input.datepicker').length < 2) {
					alert(arrScopes[x] + '영역에 input.datepicker가 없거나 부족합니다.\n날짜 입력 폼 2개가 필요합니다.');
					hasDps = false;
					break;
				}
				else if ($scope.find('input.datepicker').length > 2) {
					alert(arrScopes[x] + '영역에 input.datepicker가  많습니다.\n날짜 입력 폼 2개가 필요합니다.');
					hasDps = false;
					break;
				}
			}
		}
		
		if (hasScope && hasDps) {
			$.each(arrScopes, function(i, val) {
				var $dps = $('' + val).find('input.datepicker');
				
				$drs.each(function() {
					if ($(this).attr('scope') != val)
						return true;
					
					$(this).unbind('click').bind('click', function() {
						var today = new Date();
						var baseDay = $(this).attr('baseDay');
						if (baseDay != null) {
							// 오늘 - 1 이 기본값
							today.setDate(today.getDate() + parseInt(baseDay, 10));
						}
						
						var range = $(this).attr('range');
						if (range == 'none') {
							$dps.each(function() {
								$(this).val('');
							});
						} 
						else {
							var startDate = getDateByjQueryDateFormat(range, today);
							if(!eval($(this).attr('reverse'))) {
								$dps.eq(0).val(getyyyyMMdd(startDate));
								$dps.eq(1).val(getyyyyMMdd(today));
							}
							else {
								$dps.eq(0).val(getyyyyMMdd(today));
								$dps.eq(1).val(getyyyyMMdd(startDate));
							}							
						}
						
						//data-click="btnSearch" : $('#btnSearch').click();
						if ($(this).data('click') != null) {
							$('#' + $(this).data('click')).click();
						}
					});
				});
			});
		}
	}

	// 우편번호 양식 설정 : 총 4개의 입력 양식을 기준으로 설정 (우편번호, 우편번호 찾기 버튼, 주소1, 주소2)
	// 한 화면에 N개의 우편번호 양식이 존재할 경우 : 우편번호 팝업에 인덱스 값을 넘김
	// 인덱스 값을 다시 보내므로 인덱스 값으로 바인딩할 부분을 맞춰서 매핑 처리해야함
	$('.inputZipCode').each(function(idx, elm) {

		var i = idx % 4;
		var iFormIndex = 0;

		// 우편번호
		if (i == 0 && $(this).context.nodeName == "INPUT") {
			$(this).attr('readonly', 'true');
			$(this).css({'background-color' : __readonlyColor});
			$(this).attr('maxlength', '7');

			$(this).click(function() {
				$(this).nextAll('a.inputZipCode').click();
			});
		}
		// 버튼
		else if (i == 1 && ($(this).context.nodeName == "IMG" || $(this).context.nodeName == "A" || $(this).attr('type') == "button")) {
			$(this).css({'cursor' : 'pointer'});
			$(this).click(function() {
				iFormIndex = Math.floor(idx / 4);
				// 외부 함수 필요 - common.js
				// 다음 주소 검색 api 사용
				// 버튼 엘리먼트 속성 설정 필요 : data-form-zipcode="" data-form-addr1="" data-form-addr2=""
				if (openSearchAddress != null)					
					openSearchAddress($(this).data('formZipcode'), $(this).data('formAddr1'), $(this).data('formAddr2'));
				else
					alert('주소 검색창을 열기 위한 코드가 필요합니다.');
			});
		}
		// 주소1
		else if (i == 2 && $(this).context.nodeName == "INPUT") {
			$(this).attr('readonly', 'true');
			$(this).css({'background-color' : __readonlyColor});
			$(this).click(function() {
				$(this).prevAll('a.inputZipCode').click();
			});
		} 
		else if (i == 3 && $(this).context.nodeName == "INPUT") {
			$(this).css({'ime-mode' : 'active'});
		}
	});

	// 전화번호 양식 설정
	$('.inputPhone').each(function(idx, elm) {
		var objPhones = $('.inputPhone');
		var iFormSet = 1;
		var iDivisor = 3; // n개의 세트 구분용
		if (objPhones.length > iDivisor)
			iFormSet = objPhones.length / iDivisor;

		if ($(this).context.nodeName == "INPUT") {

			$(this).css({
				'ime-mode' : 'disabled'
			});
			$(this).attr('maxlength', ((idx % iDivisor) == 0) ? '3' : '4');

			if ($(this) != null) {
				$(this).keydown(function(event) {
					var iKeyCode = event.which;
					if (event.shiftKey)
						event.preventDefault();
					
					//for chrome
					if (iKeyCode >= 229) {
						event.preventDefault();
					}
					
					if ((iKeyCode < 48 || iKeyCode > 57) && (iKeyCode < 96 || iKeyCode > 105) && (iKeyCode < 37 || iKeyCode > 40) && iKeyCode != 8 && iKeyCode != 9 && iKeyCode != 13)
						event.preventDefault();
				});
				//for chrome, firefox
				if (window.event != null && !window.event.keyCode) {
					$(this).keyup(function(event) {
						$(this).val($(this).val().replace(/[^0-9]/g, ''));
					}).focusout(function () {
						$(this).val($(this).val().replace(/[^0-9]/g, ''));
					});
				}
			}

			// 두번째 입력 폼으로 이동
			if ((idx % iDivisor) == 0) {
				$(this).keyup(function() {
					if ($(this).val().length == 3)
						$($('.inputPhone')[idx + 1]).focus();
				});
			}
			// 세번째 입력폼으로 이동
			else if ((idx % iDivisor) == 1) {
				$(this).keyup(function() {
					if ($(this).val().length == 4)
						$($('.inputPhone')[idx + 1]).focus();
				});
			}
		}
	});

	// 이메일 입력 양식 설정 : (이메일 도메인 입력 폼, 이메일 도메인 선택 셀렉트 박스 엘리먼트 기준)
	$('input.inputEmail').each(function(idx) {
		$(this).css({
			'ime-mode' : 'disabled'
		});
	});

	// 이메일 입력 양식 설정2 - 셀렉트 박스
	$('select.inputEmail').each(function(idx) {
		var iFormSet = 2; // n개의 세트 구분용
		var objEmails = $('input.inputEmail');
		$(this).change(function() {
			if (objEmails.length == 0)
				return;

			if ($(this).val() == "") {
				$(objEmails[(idx * iFormSet) + 1]).val('');
				$(objEmails[(idx * iFormSet) + 1]).removeAttr('readonly');
				$(objEmails[(idx * iFormSet) + 1]).css({
					'background-color' : '#ffffff'
				});
				$(objEmails[(idx * iFormSet) + 1]).focus();
				// 프론트용 일부 조건 추가
				// if ($(objEmails[(idx * iFormSet) +
				// 1]).parent('span').parent('span.input').length = 1) {
				// $(objEmails[(idx * iFormSet) +
				// 1]).parent('span').parent('span.input').removeClass('readonly');
				// }
			} else {
				$(objEmails[(idx * iFormSet) + 1]).val($(this).val());
				$(objEmails[(idx * iFormSet) + 1]).attr('readonly', 'readonly');
				$(objEmails[(idx * iFormSet) + 1]).css({
					'background-color' : __readonlyColor
				});
				// 프론트용 일부 조건 추가
				// if ($(objEmails[(idx * iFormSet) +
				// 1]).parent('span').parent('span.input').length = 1) {
				// $(objEmails[(idx * iFormSet) +
				// 1]).parent('span').parent('span.input').addClass('readonly');
				// }
			}
		});
	});

	// 주민등록번호 입력양식(이름 포함) : 3개 입력 폼 필요
	$('input.inputRegistNumber').each(function(idx, elm) {
		if (idx == 0) {
			$(this).css('ime-mode', 'active');
			$(this).attr('maxlength', '20');
		} else {
			$(this).css('ime-mode', 'disabled');

			// 첫번째 주민번호 입력 폼
			if (idx == 1) {
				$(this).attr('maxlength', '6');
				$(this).keyup(function() {
					if ($(this).val().length == 6) // 포커스 자동이동
						$($('input.inputRegistNumber')[idx + 1]).focus();
				});
			}
			// 두번째 주민번호 입력 폼
			else if (idx == 2) {
				$(this).attr('maxlength', '7');
			}

			$(this).keydown(function(event) {
				var iKeyCode = event.which;
				if (event.shiftKey)
					event.preventDefault();
				if ((iKeyCode < 48 || iKeyCode > 57) && (iKeyCode < 96 || iKeyCode > 105) && (iKeyCode < 37 || iKeyCode > 40) && iKeyCode != 8 && iKeyCode != 9 && iKeyCode != 13)
					event.preventDefault();
			});
		}
	});

	// 일반 팝업 페이지 사이즈 자동 조절 : 브라우저마다 iAddWidth 값을 조절할 필요가 있음
	$('.popupResizeJ').each(function() {

		var iAddWidth = 20;
		// if ($(document.body).innerWidth() > $(this).width())
		// iAddWidth += $(this).width() - $(document.body).innerWidth();

		var iAddHeight = 100;

		var iWidth = 0;
		var iHeight = 0;

		if (iWidth == 0)
			iWidth = $(this).width() + iAddWidth;

		if (iHeight == 0)
			iHeight = $(this).height() + iAddHeight;

		window.resizeTo(iWidth, iHeight);

		var left = (screen.availWidth - iWidth) / 2;
		var top = (screen.availHeight - iHeight) / 2;

		window.moveTo(left, top);
	});

	// iframe 너비, 높이 자동 조절 : 로컬 리소스만 가능
	// 주의 : html DOCTYPE이 쿼크 모드일 경우 제대로 작동하지 않음
	$('iframe.autoIframe').each(function() {
		// $(this).width($(this).contents().width() + 10);
		// $(this).height($(this).contents().height());

		$(this).load(function() {
			$(this).width($(this).contents().width());
			$(this).height($(this).contents().height());
		});
	});

	// iframe 높이 자동 조절
	$('iframe.resizeIframe').each(function() {
		$(this).load(function() {
			$(this).height($(this).contents().height());
		});
	});

	// 해당 클래스 하위 자식으로 존재하는 이미지(<img>)의 가로 사이즈를 조절 : 0.125배율로 축소
	// 이미지에 팝업 링크 포함시킴
	$('.editorChangeMode').ready(function() {
		var children = $('.editorChangeMode').children().find('img');
		children.each(function() {
			var iWidth = $(this).width();
			if (iWidth && iWidth > 630) {
				while (iWidth > 630) {
					iWidth = iWidth * 0.875;
				}

				$(this).width(iWidth);
			}
			$(this).css({
				'cursor' : 'pointer'
			});
//			$(this).click(function() {
//				// 프로젝트에서 사용되는 이미지 팝업 스크립트 적용
//				openFileViewPop($(this).attr('src'), $(this).attr('src').substr($(this).attr('src').lastIndexOf("/") + 1));
//			});
		});
	});

	// 검색 입력 엘리먼트에서 엔터키 입력시 지정된 검색 버튼 실행 처리 : 해당 객체에 이미 이벤트가 있으면 이 로직은 무시됨
	// 검색 필드 class에 searchWord가 있어야 함
	// 기본값: 검색 버튼의 ID에는 btnSearch가 있어야 함
	// 텍스트 폼에 validate 속성이 있을 경우, 빈 공백으로 엔터키 입력시 해당 속성값을 경고창으로 띄움
	$('input.searchWord').each(function() {
		// 텍스트 폼 일 경우

		var btnObj = $('input[id*=btnSearch], a[id*=btnSearch]');

		// 검색 엘리먼트에 data-btnid 값이 있을 경우 해당 폼 사용
		if ($(this).data('btnid') != null && $(this).data('btnid') != '') {
			btnObj = $('input[id*=' + $(this).data('btnid') + ']');
		}

		if ($(this).attr('type') == "text") {
			$(this).keypress(function(event) {
				if (event.which == 13) {
					//검색 엘리먼트에 validate 속성이 있을 경우, 빈 공백으로 엔터키 입력시 해당 속성값을 경고창으로 띄움 
					if ($(this).attr('validate') != null) {
						if ($.trim($(this).val()) == "") {
							alert($(this).attr('validate'));
							event.preventDefault();
						} else {
							btnObj.click();
							event.preventDefault();
						}
					} else {
						btnObj.click();
						event.preventDefault();
					}
				}
			});
		}

	});

	// 엔터 금지
	$('.disableEnter').each(function() {
		$(this).keydown(function(event) {
			var iKeyCode = event.which;
			if (iKeyCode == 13)
				event.preventDefault();
		});
	});

	// 숫자만 입력
	// Ctrl+V 입력 가능
	$('input.onlyNumber').each(function() {
		$(this).css({
			 '-webkit-ime-mode': 'disabled'
			, 'moz-ime-mode': 'disabled'
			, '-ms-ime-mode': 'disabled'
			, 'ime-mode': 'disabled'
		}).keydown(function(event) {
			var iKeyCode = event.which;
			//alert(iKeyCode);
			if (event.shiftKey)
				event.preventDefault();
			
			//console.log('keyCode : ', iKeyCode);
			
			//for chrome
			if (iKeyCode >= 229) {
				//alert('한글은 입력할 수 없습니다.');		//alert을 띄우면 한글 표시를 막을 수는 있음
				event.preventDefault();
			}
			
			// 8 : backspace, 9 : tab, 17 : Ctrl, 45 : insert, 46 : delete, 86 : v(for Ctrl+V)
			if ((iKeyCode < 48 || iKeyCode > 57) && (iKeyCode < 96 || iKeyCode > 105) && (iKeyCode < 37 || iKeyCode > 40) && iKeyCode != 8 && iKeyCode != 9 && iKeyCode != 46 && iKeyCode != 13 && iKeyCode != 86)
				event.preventDefault();
		});

		//for chrome, firefox
		if (window.event != null && !window.event.keyCode) {
			$(this).keyup(function(event) {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			}).focusout(function () {
				$(this).val($(this).val().replace(/[^0-9]/g, ''));
			});
		}
	});
	
	// 숫자만 입력 - 컴마 구분 추가 - lib.js : addComma 메서드 필요
	$('input.onlyNumberWithComma').each(function() {
		var ctrlDown = false, ctrlKey = 17, cmdKey = 91, vKey = 86, cKey = 67;
		$(this).css({
			 '-webkit-ime-mode': 'disabled'
			, 'moz-ime-mode': 'disabled'
			, '-ms-ime-mode': 'disabled'
			, 'ime-mode': 'disabled'
		}).keydown(function(event) {
			var iKeyCode = event.which;
			//alert(iKeyCode);
			//console.log('keyCode : ' + iKeyCode);
			if (event.shiftKey)
				event.preventDefault();

			//for chrome
			if (iKeyCode >= 229) {
				//alert('한글은 입력할 수 없습니다.');		//alert을 띄우면 한글 표시를 막을 수는 있음
				event.preventDefault();
			}
			// 8 : backspace, 9 : tab, 45 : insert, 46 : delete, 188 : comma
			if ((iKeyCode < 48 || iKeyCode > 57) 
					&& (iKeyCode < 96 || iKeyCode > 105) 
					&& (iKeyCode < 37 || iKeyCode > 40) 
					&& iKeyCode != 8 
					&& iKeyCode != 9 
					&& iKeyCode != 46 
					&& iKeyCode != 13 
					&& iKeyCode != ctrlKey
					&& iKeyCode != cmdKey
					&& iKeyCode != vKey
					&& iKeyCode != cKey)
				event.preventDefault();
			
			if (iKeyCode == ctrlKey) 
				ctrlDown = true;
		});

		//for chrome, firefox		
		if (!window.event.keyCode) {
			$(this).keyup(function(event) {
				if (event.which == ctrlKey) 
					ctrlDown = false;
				var val = $(this).val().replace(/^0+|[^\d]/g, '');
				val = addComma(val);
				$(this).val(val);
			}).focusout(function () {
				var val = $(this).val();
				val = $(this).val().replace(/^0+|[^\d]/g, '');
				val = addComma(val);
			});
		}
	});

	// 숫자, 소수점, 마이너스 가능
	$('input.onlyRealNumber').each(function() {
		$(this).css({
			 '-webkit-ime-mode': 'disabled'
			, '-moz-ime-mode': 'disabled'
			, '-ms-ime-mode': 'disabled'
			, 'ime-mode': 'disabled'
		}).keydown(function(event) {
			var iKeyCode = event.which;
			// alert(iKeyCode);
			if (event.shiftKey)
				event.preventDefault();
			
			//for chrome
			if (iKeyCode >= 229) {
				//alert('한글은 입력할 수 없습니다.');		//alert을 띄우면 한글 표시를 막을 수는 있음
				event.preventDefault();
			}

			if ((iKeyCode < 48 || iKeyCode > 57) && (iKeyCode < 96 || iKeyCode > 105) && (iKeyCode < 37 || iKeyCode > 40) && iKeyCode != 8 && iKeyCode != 9 && iKeyCode != 46 && iKeyCode != 13 && iKeyCode != 190 && iKeyCode != 110 && iKeyCode != 189 && iKeyCode != 109)
				event.preventDefault();
		});
		
		//for chrome, firefox		
		if (!window.event.keyCode) {
			$(this).keyup(function(event) {
				$(this).val($(this).val().replace(/[^0-9\.\-]/g, ''));
			}).focusout(function () {
				$(this).val($(this).val().replace(/[^0-9\.\-]/g, ''));
			});
		}
	});
	
	//대문자로 변환
	$('.toUpperCase').each(function() {
		$(this).css({
			 '-webkit-ime-mode': 'disabled'
			, '-moz-ime-mode': 'disabled'
			, '-ms-ime-mode': 'disabled'
			, 'ime-mode': 'disabled'
		}).keyup(function(event) {
			$(this).val($(this).val().toUpperCase());
		});
	});

	// twitter
	// anchor 태그를 사용할 것(_blank 창 필요함)
	// class = sendtotwitter
	$('.sendtotwitter').each(function() {
		var sText = "";
		if ($(this).attr('text') != null && $.trim($(this).attr('text')) != "")
			sText = $.trim($(this).attr('text'));
		else
			sText = encodeURIComponent(document.title);

		$(this).attr('target', '_blank');
		$(this).attr('href', 'http://twitter.com/share' + (sText != "" ? "?text=" + sText : ""));
	});

	// 전화번호 링크
	// class = tel(모바일 웹 브라우저에서 전화걸기 지원)
	// telno 추가 속성 필요
	$('.tel').each(function() {
		if ($(this).attr('telno') != null && $.trim($(this).attr('telno')) != "") {
			$(this).css({
				'cursor' : 'pointer'
			});
			$(this).click(function() {
				location.href = "tel:" + $(this).attr('telno');
			});
		}
	});

	// jquery validator 기본값 설정
	if ($.validator != null) {
		$.validator.setDefaults({
			debug : false
			, onfocusout : false
			, onkeyup : false
			, onclick : false
			, invalidHandler : function(form, validator) {
				var errors = validator.numberOfInvalids();
				if (errors) {
					var msg = validator.errorList[0].message;
					alert(msg);
					validator.errorList[0].element.focus();
				}
			}
			, errorPlacement : function(error, element) {
				// Override error placement to not show error messages beside
				// elements
			}
		});
	}
}	// end _initPageLoad()


/**
 * jquery animation scroll
 * @param targetSelector 스크롤 위치 셀렉터 
 * @param addHeight 추가적인 높이
 */
function scrollToElement(targetSelector, addHeight) {
	if (isNull(addHeight))
		addHeight = 50;
	$('html').animate({scrollTop: $(window.document).find(targetSelector).offset().top - addHeight});
}

/**
 * 클립보드 복사
 * malsup's  jquery.blockUI plugin 필요
 * \n, \t 제거됨
 * @param selector : 복사할 문자열이 있는 셀렉터
 */
function copyClipboard(selector) {
	
	var sCbId = 'hidClipboard';
	if ($('#' + sCbId).length > 0)
		$('#' + sCbId).remove();
	
	if ($(selector).length == 0) {
		alert('오류 : 클립보드로 복사할 영역을 jquery 객체 또는 jquery selector 문자열로 입력해야 합니다.');
		return;
	}
	
	try {
		var $hidden = $('<input type="text" id="' + sCbId + '" style="position: absolute; top: -9999px;" />');
		$(document.body).append($hidden);
		
		var sText = $.trim($(selector).text() || $(selector).val()).replace(/[\n\t]/g, '');
		//console.log('>>>> ' + sText)
		$('#' + sCbId).val(sText).select();
		
		var isCopied = document.execCommand('Copy');
		
		if (isCopied)
			$.growlUI('', '클립보드에 복사되었습니다.', 1500); 
		else
			alert('클립보드 복사가 지원되지 않는 브라우저 입니다.');
	}
	catch (e) {
		console.log(e);
		alert('클립보드 복사 중 오류가 발생했습니다. - copyClipboard()\n' + e.message );
	}
	finally {
		$('#' + sCbId).remove();
	}
}


/**
 * AJAX 호출 var args [] = "" var args = []; args['url'] = '넘길주소';
 * args['dataType'] = 'json'; args['type'] = 'POST,GET';
 *
 * form = $("#form") callback = 성공후 보내줄 함수명
 */
function ajaxFunction(args, form, callback) {
	jQuery.ajax({
		contentType : args['contentType'],
		url : args['url'],
		dataType : args['dataType'],
		type : args['type'],
		data : $(form).serialize(),
		error : function(xhr, status, e) {
			alert('ajaxFunction exception : 처리중 문제가 발생하였습니다.\n관리자에게 문의하세요.\n에러메시지 : ' + e);
			console.log(xhr);
		},
		success : callback
	});
}


/**
 * oLoader ajax 처리 <br>
 * 	- 콜백에서 한글 깨짐 이슈 - 컨트롤러 RequestMapping produces = "application/json; charset=utf-8" 강제 지정 필요
 * @param selector
 * @param url
 * @param method
 * @param data
 * @param isWholeWindow
 * @param onComplete 필수 : 완료 후 처리할 콜백 메서드
 * @param onStart : 시작 시 실행 메서드
 */
function oLoader(selector, url, method, data, isWholeWindow, onComplete, onStart) {
	if (typeof onComplete !== 'function') {
		alert('onComplete(data) 메서드가 필요합니다.');
		return;
	}
	
	$(selector).oLoader({
		url: url
		, type: method || 'POST'
		, data: data
		, backgroundColor: '#fff'
		, fadeLevel: 0.9
		, image: '/images/loading_3_32.gif'
		, style: 0
		, wholeWindow: isWholeWindow || false
		, updateContent: false 			//자기 자신에게 업데이트 금지 - 결과를 별도 위치에 표시할 경우 사용 : complete()에서 처리
		, complete: onComplete
		, onStart: onStart || ''
		, onError: function(jqXHR, textStatus, errorThrown) {
			//console.log(jqXHR);
			//alert('error : ' + textStatus);
			alert('error : ' + jqXHR.statusText);
			$(selector).oLoader('hide');
		}
	});
	
	/*
	 * oLoader : http://projects.ownage.sk/
	{
	  image: 'images/ownageLoader/loader1.gif',
	  style: 1,
	  modal: true,
	  fadeInTime: 300, // time in milliseconds
	  fadeOutTime: 300,
	  fadeLevel: 0.7, // overlay opacity (values 0 - 1)
	  backgroundColor: '#000',
	  imageBgColor: '#fff', // background under the loader image
	  imagePadding: '10',
	  showOnInit: true,
	  hideAfter: 0, // time in ms
	  url: false,
	  type: 'GET',
	  data: false,
	  updateContent: true,
	  updateOnComplete: true,
	  showLoader: true, // shows the loader image
	  effect: '',
	  wholeWindow: false, // when true, oLoader covers the whole window
	  lockOverflow: false, // locks body's overflow while loading
	  waitLoad: false, // oLoader will hide after element is loaded (works
						// on imgs, body and iframes)
	  checkIntervalTime: 100, // interval which checks for position
								// changes
	   
	  // callback functions
	  complete: '', // executes on complete
	  onStart: '', // executes when animation starts
	  onError: '' // executes when ajax request fails
	}
	*/
}


function resizeIframeAfterAjax () {
	//common.jqeury.util.js 참조
	var $iframe = $('iframe');
	var iDocHeight = $(document.body).height();
	var iPlusHeight = 20;
	if ($iframe.length > 0) {
		$iframe.height(iDocHeight + iPlusHeight);
	} 
}

/**
 * ajaXray : Multilevel subselect (jquery-1.3.x) 자식 select > option 개체에
 * class="sub_부모카테고리값"을 추가하면 동적 바인딩 가능
 */
function makeSublist(parent, child, isSubselectOptional, childVal) {

	$("body").append("<select style='display:none' id='" + parent + child + "'></select>");
	$('#' + parent + child).html($("#" + child + " option"));

	var parentValue = $('#' + parent).val();
	$('#' + child).html($("#" + parent + child + " .sub_" + parentValue).clone());

	$('#' + parent).change(function() {
		var parentValue = $('#' + parent).val();
		$('#' + child).html($("#" + parent + child + " .sub_" + parentValue).clone());

		if (isSubselectOptional)
			$('#' + child).prepend("<option value='-1' selected='selected'>-- 선택 --</option>");

		$('#' + child).trigger('change');
		// $('#' + child).focus();

		childVal = (childVal == null) ? "" : childVal;
		$('#' + child).val(childVal).attr('selected', 'selected');
	});
}

/**
 * for ASP.NET asp:CheckBoxList 객체 요소 체크 여부 확인 uniqueID : asp.net의 UniqueID 필요
 * 체크된 개수 반환
 */
function checkCheckBoxList(uniqueID) {
	var iCount = $('input[name*="' + uniqueID + '"]:checked').length;
	return iCount;
}

/**
 * 라디오버튼 초기화 radioName : html 객체 또는 이름
 */
function clearRadioButtons(radioName) {
	// alert(typeof radioName);
	var jqObj = $(radioName);
	if (typeof radioName == "string") {
		jqObj = $('input[name="' + radioName + '"]:radio');
	}

	if (jqObj == null)
		return;

	jqObj.each(function() {
		$(this).attr('checked', false);
	});
}

/**
 * 라디오버튼 값 리턴, name으로 가져옴
 */
function returnRadioButton(radioName) {
	$.trim($('input:radio[name="' + radioName + '"]:checked').val());
	if (typeof ($('input:radio[name="' + radioName + '"]:checked').val()) == 'undefined') {
		return '';
	} else {
		return $('input:radio[name="' + radioName + '"]:checked').val();
	}
}

/**
 * 라디오 버튼 체크 처리 
 * @param name 라디오 버튼 그룹 이름
 * @param value 체크 처리될 값
 * @param defaultValue value가 빈 값일 때 적용할 기본값
 */
function checkRadio(selectorName, value, defaultValue) {
	if (defaultValue != null && value.length == 0)
		value = defaultValue;
	
	$('input[name="' + selectorName + '"]:radio').each(function() {
		if ($(this).val() == value) {
			$(this).prop('checked', true);
			return false;
		}											
	});
}

/**
 * 체크박스 체크 처리
 *  - 2018-07-05 : 히든 폼 자동 추가
 * @param checkboxSelectorName : 체크박스 셀렉터 이름
 * @param hiddenName : 처리될 히든 폼 (실제 저장될 필드) - 히든폼이 없을 경우 추가
 * @param value : 값 배열(쉼표 구분자)
 * @param defaultValue 값이 없을 경우 기본값 - 선택된 체크박스가 없을 경우 hiddenName 폼에 바인딩될 기본값
 */
function checkCheckbox(checkboxSelectorName, hiddenName, value, defaultValue) {
	if (defaultValue != null && value.length == 0)
		value = defaultValue;
	var values = value.split(',');
	var $checks = $('input[name="' + checkboxSelectorName + '"]:checkbox');
	if ($checks.length == 0) {
		alert('체크박스가 없습니다.');
		return;
	}
	
	var $hidden = $('input[name="' + hiddenName + '"]');
	//히든 폼 추가
	if ($hidden.length == 0) {
		var $form = $checks.parent('form');
		if ($form.length == 0) 
			$(document.body).append($hidden);
		else
			$form.append($hidden);
	}
	$hidden.val(value);
	$checks.each(function(i, el) {
		$.each(values, function(j, val) {
			if ($(el).val() == val) {
				$(el).prop('checked', true);
			}
		});
		
		$(el).change(function() {
			var newVals = '';
			$checks.each(function() {
				if ($(this).prop('checked'))
					newVals += $(this).val() + ',';
			});
			newVals = newVals.replace(/,$/g, '');
			//추가 - value가 없을 경우 기본값 바인딩
			if (newVals === '')
				newVals = defaultValue;
			$hidden.val(newVals);
		});
	});
}

/**
 * 리스트 박스의 내용을 히든폼으로 복사 : 구분자 설정 가능
 * valueAttr : 히든폼으로 옮길 속성 : 기본값 = value
 * separator : 구분자 : 기본값 = ;
 */
function copyToHiddenFromListBox(listBoxID, hiddenID, valueAttr, separator) {

	if (separator == null)
		separator = ";"

	var hidden = $('#' + hiddenID);
	var options = $('#' + listBoxID + ' > option');

	var value = '';
	options.each(function() {
		if (valueAttr == null)
			value += $(this).val() + separator;
		else
			value += $(this).attr(valueAttr) + separator;
	});

	value = value.substr(0, value.lastIndexOf(separator));
	hidden.val(value);
}

/**
 * required blockUI plugin
 * element block : loading
 */
function loadingIcon(element, imageURL, msg) {
	if (element == null)
		return;

	if (imageURL == null)
		imageURL = '/images/preload_72x72.gif';

	if (msg == null)
		msg = '';

	var sMsg = '<img src="' + imageURL + '" />';
	if (msg != '')
		sMsg += '<br/>' + msg;

	// blockUI 환경 변수
	var varBlockUI = {
		message : sMsg, fadeIn : 100, fadeOut : 100, centerY : true, centerX : true, css : {
			border : 'none'
		}, overlayCSS : {
			backgroundColor : '#fff', opacity : 0.7
		}
	};

	$(element).block(varBlockUI);
}

/**
 * jQuery 경고 : jqobj 객체를 받아 해당 객체 위치의 바로 아래에 growlUI출력
 * jQuery.blockUI 필요
 */
function warnForm(jqobj, addedMsg, delayTime) {

	// 여러 개의 객체일 경우 처음 한 개를 지정
	var jqobjTarget = jqobj;
	//console.log(jqobjTarget)
	if (jqobjTarget.length > 1) {
		jqobj.each(function(idx, elm) {
			jqobjTarget = $(elm);
			return false;
		});
	}

	// 표시용 메시지 만들기
	if ($('div.growlUI').length == 0) {
		$(document.body).after("<div class='growlUI'><h1>Alert</h1><h2>Message Here.</h2></div>");
	}

	var htmlTag = jqobjTarget[0].nodeName.toLowerCase();
	if (htmlTag == "#document" || htmlTag == null)
		var htmlTag = jqobjTarget.attr('type') || '';

	var htmlObjectType = jqobjTarget.attr('type') || '';
	alert("nodeName : " + htmlTag + "\nobject Type : " + htmlObjectType);
	//alert(isNull(htmlObjectType))
	
	var msg = "Please fill this form.";
	if (isNull(htmlObjectType)) 
		msg = "Please input this form.";
	else if (htmlObjectType.indexOf("select") > -1 || htmlTag == "select")
		msg = "Please select this form.";
	else if (htmlObjectType.indexOf("checkbox") > -1 || htmlObjectType.indexOf("radio") > -1)
		msg = "Please check this form(s) at least one.";

	if (addedMsg != null && addedMsg != "")
		msg = addedMsg;

	$('div.growlUI > h2').html(msg);

	var bgColor = jqobjTarget.css('background-color');

	// 브라우저가 스크롤되어 경고 대상 객체가 스크롤 위에 있을 때, 우선적으로 화면 스크롤
	if ($(window).scrollTop() > $(jqobjTarget).offset().top) {
		$(window).scrollTop($(jqobjTarget).offset().top + $(jqobjTarget).height() - $(document).scrollTop());
	}

	// blockUI 환경 변수
	var varBlockUI = {
		message : $('div.growlUI'),
		fadeIn : 500,
		fadeOut : 500,
		timeout : (delayTime == null) ? 1500 : delayTime,
		showOverlay : false,
		centerY : false,
		css : {
			width : '250px',
			top : $(jqobjTarget).offset().top + $(jqobjTarget).height() - $(document).scrollTop(),
			left : $(jqobjTarget).offset().left,
			right : '10px',
			border : 'none',
			padding : '5px',
			backgroundColor : '#000',
			'-webkit-border-radius' : '10px',
			'-moz-border-radius' : '10px',
			opacity : .6,
			color : '#fff',
			cursor : 'default'
		}
	};

	if (htmlObjectType == 'text' || htmlObjectType == 'password' || htmlObjectType == 'file' || htmlTag == "select" || htmlTag == "textarea") {

		jqobjTarget.animate({
			'background-color' : '#ff5555'
		}, 50).animate({
			'background-color' : bgColor
		}, 50).animate({
			'background-color' : '#ff5555'
		}, 50).animate({
			'background-color' : bgColor
		}, 50, function() {
			$.blockUI(varBlockUI);
			$(this).focus();
		});
	} 
	else if (htmlObjectType == "checkbox" || htmlObjectType == "radio" || htmlTag == "a") {
		$.blockUI(varBlockUI);
	} 
	else {
		$.blockUI(varBlockUI);
		//alert("Undefined HTML object. please contact system engineer and check warnForm method.");
	}

	return false;
}

/**
 * jquery blockUI를 이용하여 레이어 메시지 출력
 * jQuery.blockUI 필요
 */
function alertGrowl(title, addedMsg, delayTime) {

	// 표시용 메시지 만들기
	if ($('div.growlUI').length == 0) {
		$(document.body).after("<div class='growlUI'><h1>Information</h1><h2>Message Here.</h2></div>");
	}

	if (title != null && title != "")
		$('div.growlUI > h1').html(title);

	if (addedMsg != null && addedMsg != "")
		$('div.growlUI > h2').html(addedMsg);

	// blockUI 환경 변수
	var varBlockUI = {
		message : $('div.growlUI'), fadeIn : 500, fadeOut : 500, timeout : (delayTime == null) ? 1200 : delayTime, showOverlay : false, centerY : false, centerX : false, css : {
			width : '250px', border : 'none', padding : '5px', backgroundColor : '#000', '-webkit-border-radius' : '10px', '-moz-border-radius' : '10px', opacity : .6, color : '#fff', cursor : 'default'
		}
	};

	$.blockUI(varBlockUI);
}


/**
 * jQuery ajax + jQuery BlockUI
 * blockUI를 이용하여 화면 가운데에 다른 HTML페이지를 출력
 * jQuery.blockUI 필요
 */
function showBlockPageAjax(URL, paramMap) {

	var iWidth = 0;
	var iHeight = 0;

	var tagString = "<div class='divAjaxDetail' style='display:none; text-align:left;'></div>";

	if ($('div.divAjaxDetail').length == 0) {
		$(document.body).after(tagString);
	} else {
		$('div.divAjaxDetail').remove();
		$(document.body).after(tagString);
	}

	// $.ajax({ async: true });
	// $('div.divAjaxDetail').ajaxStart(function () {
	// $(this).html('<img src="/images/preload_72x72.gif" border="0" />');
	// });

	$('div.divAjaxDetail').load(URL, paramMap, function() {
		iWidth = $(this).width();
		iHeight = $(this).height();

		// $(this).html($(this).html() + "<center><input type='button'
		// class='button01' value='Close' onclick='$.unblockUI();'
		// /></center>");
		// $('input[type=button]').css({ 'display': 'block', 'text-align':
		// 'center' });

		$.blockUI({
			message : $('div.divAjaxDetail'), centerX : true, centerY : true, fadeIn : 700, fadeOut : 700
			// , css: { width: iWidth, height: iHeight, left:
			// ($(document.body).width() - iWidth) / 2, top:
			// ($(document.body).height() - iHeight) / 2 }
			, overlayCSS : {
				backgroundColor : '#fff', opacity : 0.7
			}
		});
	});
}

/**
 * blockUI를 이용하여 이미지를 화면 가운데 보여주기
 * jQuery.blockUI 필요
 */
function showBlockPageImage(imageURL) {
	var tagString = "<img id='imgBlockUI' src='" + imageURL + "' onclick='$.unblockUI();' style='display:none;'/>"

	if ($('#imgBlockUI').length > 0)
		$('#imgBlockUI').remove();

	$(document.body).append(tagString);

	$('#imgBlockUI').load(function() {
		// alert($(this).width() + " : " + $(this).height());
		$.blockUI({
			message : $(this)
			, fadeIn : 700
			, fadeOut : 700
			, centerX : true
			, centerY : true
			, css : {
				left : ($(document.body).width() - $(this).width()) / 2
				, top : ($(document.body).height() - $(this).height()) / 2
			}
			, overlayCSS : {
				backgroundColor : '#fff', opacity : 0.8
			}
		});
	});
}

/**
 * 객체 화면 출력
 */
function documentWrite(obj) {
	if ($('div.divDebug').length == 0)
		$(document.body).append('<div class="divDebug"></div>');

	$('div.divDebug').html('<xmp>' + obj + '</xmp>');
}

/**
 * 인풋박스를 만들어서 form 안에 넣는다.
 * @param frm		form 객체
 * @param name		태그 이름
 * @param value		태그 값
 */
function createElementInput(frm, name, value) {
	var useElement = null;
	try {
		for ( var i=0 ; i < frm.elements.length ; i++ ) {
			if (frm.elements[i].type == "hidden" && frm.elements[i].name == name) {
				useElement = frm.elements[i];
			}
		}
		if (useElement == null) {
			var input = document.createElement("input");
			input.type = "hidden";
			input.id = name;
			input.name = name;
			input.value = value;
			frm.appendChild(input);
		} else {
			useElement.value = value;
		}
	}
	catch(ex) {
		try {
			$(frm).find('input[name='+name+']').remove();
			$(frm).append('<input type="hidden" name="'+name+'" \>');
			$(frm).find('input[name='+name+']').val(value);
		}
		catch(ex) {};
	};
}


/**
 * 자바스크립트 객체 속성 확인
 * for debugging : loop element
 * obj : 루프가 가능한 객체
 * @param obj
 */
function debugObject(obj) {
	
	if ($('div.divDebug').length == 0)
		$(document.body).append('<div class="divDebug"></div>');
	var str = debugObjectLoop(obj);
	$('div.divDebug').html(str);
	
	function debugObjectLoop(obj) {
		var sStr = '';
		sStr +=	'<table border="1" cellspacing="0" cellpadding="0" style="width:100%; margin: 30px 0 30px 0;">';
		sStr += '<colgroup><col style="width:10%;" /><col style="width:10%;" /><col style="width:80%;" /></colgroup>';
		sStr += '<tbody>';
		sStr += '<tr><td colspan="3" style="padding:0 0 0 20px; height: 50px;">' + String(obj) + '</td></tr>';
		sStr += '<tr style="background:#eee;"><th>key</th><th>type</th><th>value</th></tr>';
		for ( var x in obj) {
			// 자바스크립트 객체는 재귀시 무한 루프에 걸릴 수 있으므로 한 단계만 확인 
			// if (typeof obj[x] != 'object')
			// sStr += '<tr><th style="font-weight:bold;">' + x + '</th><td>' +
			// (obj[x] == null || obj[x] == '' ? '&nbsp;' : obj[x]) + '</td></tr>';
			// else {
			// //var sInnerObject = debugObjectLoop(obj[x]);
			// sStr += '<tr><th style="font-weight:bold;">' + x + '</th><td><a>' +
			// obj[x] + '</a></td></tr>';
			// }
			sStr += '<tr><th style="font-weight:bold; background:#0ef;">' + x + '</th><th>' + (typeof obj[x]) + '</th><td>' + (obj[x] == null || obj[x] == '' ? '&nbsp;' : obj[x]) + '</td></tr>';
		}
		sStr += '</tbody></table>';
		return sStr;
	};
}

/**
 * 파일 보기 json
 *  - 파일 존재 여부 판단 처리
 * @param filePath
 */
//function viewFile(filePath) {
// common.js로 이동

/**
 * 파일 다운로드 
 * @param saveFilename 저장 파일 (디렉토리 경로 포함)
 * @param originalFilename 원본 파일명 (다운로드될 파일명)
 */
//function downloadFile(saveFilename, originalFilename) {
// common.js로 이동
