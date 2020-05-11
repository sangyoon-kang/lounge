/**
 * 공통 처리용 스크립트
 */

/**
 * 프로젝트 내에서 사용되는 팝업들을 일반화할 수 있도록 도와줍니다. popupWin() 함수에 의존합니다. param : 추가할 get
 * parameter : ? 추가필요
 */
function openPop(param, gubun, formObj) {
	// gubun 을 중심으로 popUpWin 값을 세팅하고 호출한다.
	switch (gubun) {
		// 게시판 그룹 팝업
		case "boardGroup":
			popUpWin('/mgr/board/manage/board_group_popup' + param, gubun, 655, 350, 0, 0, "yes", "yes", true);
			break;
			
		// 게시판 카테고리
		case "boardCategory":
			popUpWin('/mgr/board/manage/board_category_popup' + param, gubun, 655, 350, 0, 0, "yes", "yes", true);
			break;
			
		// 페이지관리 그룹 팝업
		case "pageGroup":
			popUpWin('/mgr/page/page_group_popup' + param, gubun, 655, 350, 0, 0, "yes", "yes", true);
			break;
		
		// 게시판 카테고리
		case "previewRecentBoard":
			popUpWin('/mgr/config/board/preview_recent_board_popup' + param, gubun, 655, 250, 0, 0, "yes", "yes", true);
			break;
		
		case "previewRecentPrd":
			popUpWin('/mgr/config/prd/preview_recent_prd_popup' + param, gubun, 1300, 1000, 0, 0, "yes", "yes", true);
			break;	
			
		// 폼메일관리 항목추가
		case "formmailInfo":
			popUpWin('/mgr/formmail/manage/formmail_popup_write' + param, gubun, 720, 550, 0, 0, "yes", "yes", true);
			break;
		//	회원 이메일발송
		case "memberSendEmail":
			popUpWin('/mgr/member/manage/mail_send_popup' + param, gubun, 750, 970, 0, 0, "yes", "yes", true);
			break;
			
		case "prdImgSize":
			popUpWin('/mgr/prd/manage/prd_img_size_popup' + param, gubun, 650, 400, 0, 0, "yes", "yes", true);
			break;	
			
		// Created By Mongolian Team 2018-10-15 Dealer & Branch
		case "dealerBranch":
			popUpWin('/mgr/dealer/branch_popup' + param, gubun, 655, 350, 0, 0, "yes", "yes", true);
			break;
		case "statUrl":
			popUpWin('/mgr/stat/manage/path_popup' + param, gubun, 750, 550, 0, 0, "yes", "yes", true);
			break;
		case "statAuth":
			popUpWin('/mgr/stat/manage/stat_list' + param, gubun, 750, 550, 0, 0, "yes", "yes", true);
			break;
		case "memberhistory":
			popUpWin('/mgr/member/manage/member_history_popup' + param, gubun, 1000, 600, 0, 0, "yes", "yes", true);
			break;
		case "historyView":
			popUpWin('/mgr/member/manage/history_view_popup' + param, gubun, 600, 650, 0, 0, "yes", "yes", true);
			break;
		case "memCashPop_16":
			popUpWin('/mgr/payment/cash/mem_cash16_pop.do' + param, gubun, 800, 650, 0, 0, "yes", "yes", true);
			break;
		case "memCashPop_17":
			popUpWin('/mgr/payment/cash/mem_cash17_pop.do' + param, gubun, 800, 650, 0, 0, "yes", "yes", true);
			break;
		case "memberDepositHistory":
			popUpWin('/mgr/member/manage/deposit_history_view_popup' + param, gubun, 1000, 600, 0, 0, "yes", "yes", true);
			break;
		//입출금 내역에서 회원정보 팝업 추가
		case "memberInfo":
			popUpWin('/mgr/member/manage/member_info_popup' + param, gubun, 800, 650, 0, 0, "yes", "yes", true);
			break;

		case "memberSupportCashHistory":
			popUpWin('/mgr/member/manage/member_support_cash_history_pop' + param, gubun, 1000, 600, 0, 0, "yes", "yes", true);
			break;



		// 상관관계 매트릭스 팝업 - 공분산 매트릭스
		// case "correlation2":
		// popUpWin("/front/solution/correlation2.do" + param, gubun, 830, 630,
		// 0, 0, "auto", "yes", true, formObj, true);
		// break;
			
		default:
			break;

		// //폼 서브밋 예제
		// case "openOrderAgreeParent" :
		// popUpWin(param, gubun, 560, 485, 0, 0, "yes", "yes", true, formObj,
		// true);
		// break;
	}
}

/**
 * 팝업창을 띄운다.
 * 
 * @param urlWin
 *            경로
 * @param winName
 *            팝업명
 * @param widthWin
 *            팝업의 폭
 * @param heightWin
 *            팝업의 높이
 * @param topWind
 *            팝업의 상단위치
 * @param leftWin
 *            팝업의 좌측위치
 * @param scrollbarsWin
 *            스크롤(yes, no, auto)
 * @param resizableWin
 *            리사이즈(yes, no)
 * @param centerFlag
 *            팝업창 중앙위치(true, false)
 */
function popUpWin(urlWin, winName, widthWin, heightWin, topWind, leftWin, scrollbarsWin, resizableWin, centerFlag, formObj, isSubmitPopup) {
	var x;
	var y;

	var nameWin = (winName != null && winName.length > 0) ? winName : 'winPop1';

	// nameWin += getYear() + getMonth() + getDay() + getHour() + getMinute() +
	// getSecond() + getMillisecond();

	if (centerFlag == true) {
		x = (screen.availWidth - widthWin) / 2;
		y = (screen.availHeight - heightWin) / 2;
	}
	else {
		x = leftWin;
		y = topWind;
	}

	var tempUrl = urlWin;

	if (formObj != null && isSubmitPopup != null && isSubmitPopup == true)
		urlWin = '';

	var popWindObj = window.open(urlWin, nameWin, 'top=' + y + ',left=' + x + ',width=' + widthWin + ',height=' + heightWin + ',toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=' + scrollbarsWin + ',resizable=' + resizableWin + ',copyhistory=no');

	urlWin = tempUrl;

	if (formObj != null && isSubmitPopup != null && isSubmitPopup == true) {
		formObj.target = nameWin;
		formObj.action = urlWin;
		formObj.submit();
	}

	if (popWindObj != null)
		popWindObj.focus();
}



/**
 * 다음 주소 찾기
 * <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script> 필요
 * @param zipCodeName
 * @param addr1Name
 * @param addr2Name
 */
function openSearchAddress(zipCodeName, addr1Name, addr2Name) {
	if ($('input[name=' + zipCodeName + ']').length == 0) {
		alert('올바른 엘리먼트 이름을 지정해 주세요.');
		return;
	}
	if ($('input[name=' + addr1Name + ']').length == 0) {
		alert('올바른 엘리먼트 이름을 지정해 주세요.');
		return;
	}
	
	new daum.Postcode({
		oncomplete : function(data) {
			//json 확인 필요
			//console.log(data)
			$('input[name=' + zipCodeName + ']').val(data.zonecode);
			$('input[name=' + addr1Name + ']').val(data.address);
			if (addr2Name != null) {
				$('input[name=' + addr2Name + ']').focus();
			}
		}
	}).open();
}


/**
 * 아이디 중복 검사 - ajax
 * @param loadingSelector 로딩 영역
 * @param checkedSelector 아이디 중복 검사 결과 (Y, N) 엘리먼트
 * @param idType 아이디 유형
 * @param id 검사할 아이디
 */
function checkUserId(loadingSelector, checkedSelector, idType, id) {
	oLoader(loadingSelector
		, '/ajax/checkId'
		, 'post'
		, {
			idType: idType
			, id: id
		}
		, false
		, function(data) {
			console.log(data)
			if (data.result == null) {
				alert('사용가능합니다.');
				$(checkedSelector).val('Y');
			}
			else {
				alert(data.result.userID + '계정은 사용할 수 없습니다.');
				$(checkedSelector).val('N');
			}
			
		}
	);
}

/**
 * 이미지 보기/다운로드 
 * 	- 이미지 보기 : colorbox jquery plugin 필요
 * 	- 이미지 파일이 아닐 경우 다운로드 처리 
 * 
 * 	TODO : 이미지 보기 형태 수정 필요 
 * 
 * @param filePath 서버에 저장된 업로드 파일 경로
 * @param fileName 다운로드 시 저장될 파일명
 */
function viewFile(filePath, fileName) {
	$.ajax({
		url: '/common/file_exist_json.do'
		, async: false
		, type: 'post'
		, dataType: 'json'
		, data: { 
			filePath: filePath
		}
		, success: function (data) {
			if (data.isFile) {
				if (data.isImage && data.imageUrl != '') {
					$.colorbox({
						href: data.imageUrl
						, initialWidth: '30%'
						, initialHeight: '30%'
						, maxWidth: '87.5%'
						, maxHeight: '87.5%'
						, closeButton: false
						, opacity: '0.4'
						, onComplete: function() {
						}
					});
					//$.colorbox.resize();
				}
				else
					downloadFile(filePath, fileName, true);
			}
			else 
				alert('파일이 존재하지 않습니다.');
		}
		, error: function (data) {
			alert("error ajax :\n" + data.responseText);
		}
	});
}

/**
 * 파일 다운로드
 * @param filePath 서버에 저장된 업로드 파일 경로
 * @param fileName 다운로드 시 저장될 파일명
 * @param isChecked 파일 존재 여부 체크 여부
 */
function downloadFile(filePath, fileName, isChecked) {
	
	if (!isChecked) {
		$.ajax({
			url: '/common/file_exist_json.do'
			, async: false
			, type: 'post'
			, dataType: 'json'
			, data: { 
				filePath: filePath
			}
			, success: function (data) {
				if (data.isFile) {
					var sUrl = '/common/download.do?filePath=' + encodeURIComponent(filePath) + '&fileName=' + encodeURIComponent(fileName);
					location.href = sUrl;
				}
				else 
					alert('파일이 존재하지 않습니다.');
			}
			, error: function (data) {
				console.log(data);
				alert("error ajax :\n" + data.responseText);
			}
		});
	}
	else {
		var sUrl = '/common/download.do?filePath=' + encodeURIComponent(filePath) + '&fileName=' + encodeURIComponent(fileName);
		location.href = sUrl;
	}
}