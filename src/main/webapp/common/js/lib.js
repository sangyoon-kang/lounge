/**
 * Float Number to Fixed Float
 */
Number.prototype.toFixedNumber = function(x, base){
  var pow = Math.pow(base||10,x);
  return Math.round(this*pow) / pow;
}

/**
 * StartsWith
 */
if (!String.prototype.startsWith) {
  String.prototype.startsWith = function(searchString, position) {
    position = position || 0;
    return this.indexOf(searchString, position) === position;
  };
}
/**
 * 자바스크립트 유틸리티
 */

/**
 * 빈 값 체크
 */
function checkNull(obj, msg) {
	if (obj.val().replace(/^\s*/, '') == 0) {
		if (msg)
			alert(msg);
		obj.focus();
		return true;
	}
	return false;

}

/**
 * null or empty string 체크 함수 (null 이거나 "" 이면 true) 
 */
function isNull(inputString) {
	if (inputString == null || inputString == "") {
		return true;
	}
	return false;
}


/**
 * 공백 체크 함수 (공백 포함시 true) 
 */
function checkSpace(inputString) {
	if (inputString.indexOf(" ") >= 0) {
		return true;
	}
	return false;
}

/**
 * 숫자 체크 함수 (숫자 이외의 문자 포함시 false)
 */
function checkNumber(inputString) {
	var numPattern = /([^0-9])/;
	numPattern = inputString.match(numPattern);
	if (numPattern != null) {
		return false;
	}
	return true;
}

/* 숫자만 입력 가능하게 하는 함수 */
// function fn_stripcharval(obj) {
// var validstr = "0123456789";
// var ReturnVal = "";
// for (var i = 0; i < obj.value.length; i++) {
// if (validstr.indexOf(obj.value.substring(i, i + 1)) >= 0) {
// ReturnVal = ReturnVal + obj.value.substring(i, i + 1);
// }
// }
// obj.value = ReturnVal;
// }

///**
// * 이메일 주소 검사 true : 형식 맞음 - checkPattern 메서드 사용
// */
//function isRightEmail(inputString) {
//	// var format = /^((\w|[\-\.])+)@((\w|[\-\.])+)\.([A-Za-z]+)$/;
//	var format = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
//	if (inputString.indexOf(";") > 0) {
//		var arrayEmail = inputString.split(";");
//		var checkResult = true;
//		for (var i = 0; i < arrayEmail.length; i++) {
//			checkResult = checkFormat(arrayEmail[i], format);
//		}
//		return checkResult;
//	} else {
//		return checkFormat(inputString, format);
//	}
//}

/**
 * 입력한 정규식과 일치하는 포맷인지 체크 함수 inputString : 입력값 format : 정규식
 */
function checkFormat(inputString, format) {
	if (inputString.search(format) != -1) {
		return true;
	}
	return false;
}


/**
 * 모바일 브라우저 확인 
 * 코드 내부 도메인 설정 필요
 */
function checkBrowser(isRedirect) {
	var arrKeywords = new Array('iPhone', 'iPod', 'BlackBerry', 'Android', 'Windows CE', 'LG', 'MOT', 'SAMSUNG', 'SonyEricsson');

	var isMobile = false;
	for (var key in arrKeywords) {
		if (navigator.userAgent.match(arrKeywords[key]) != null) {
			isMobile = true;
			break;
		}
	}
	var sDomain = 'sample.co.kr';
	var sMobileDomain = 'm.' + sDomain;
	var sWebDomain = 'www.' + sDomain;

	if (isRedirect) {
		if (location.hostname.indexOf(sMobileDomain) < 0 && isMobile) {
			if (parent != null)
				parent.location.href = "http://" + sMobileDomain + "/";
			else
				window.location.href = "http://" + sMobileDomain + "/";

			return;
		}

		if (location.hostname.indexOf(sMobileDomain) > -1 && !isMobile) {
			if (parent != null)
				parent.location.href = "http://" + sWebDomain + "/";
			else
				window.location.href = "http://" + sWebDomain + "/";

			return;
		} 
	}
}

/**
 * 새 창을 화면 한가운데 띄워줌
 */
function openWinCenter(url, wname, wopt) {
	var newopt = "", wHeight = 0, wWidth = 0;
	if (wopt != undefined) {
		var woptlist = wopt.replace(/ /g, "").split(",");
		for ( var i in woptlist) {
			if (woptlist[i].match(/^height=/i)) {
				wHeight = parseInt(woptlist[i].substr(7), 10);
				if (!isNaN(wHeight))
					newopt += "top=" + Math.floor((screen.availHeight - wHeight) / 2) + ",";
			}
			if (woptlist[i].match(/^width=/i)) {
				wWidth = parseInt(woptlist[i].substr(6), 10);
				if (!isNaN(wWidth))
					newopt += "left=" + Math.floor((screen.availWidth - wWidth) / 2) + ",";
			}
		}
	}
	return window.open(url, wname, newopt + wopt);
}


/**
 * 비밀번호 형식 체크
 * -- 인자가 형식 수정 objPasswd : document.폼네임.name값
 */
function checkPwd(objPasswd, objPasswd_re) {
	var PASSWD = objPasswd.value;
	var PASSWD_RE = objPasswd_re.value;
	var MIN_LENGTH = 8;
	var MAX_LENGTH = 16;

	var reg_pw = /^.*(?=.*[~!@\#$%<>^&*])(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
	if (checkNull(PASSWD)) {
		alert("비밀번호를 입력하세요.");
		objPasswd.focus();
		return false;
	} else if (!reg_pw.test(PASSWD)) {
		alert("영문,숫자,특수문자를 조합해 주세요");
		objPasswd.focus();
		return false;
	} else if (PASSWD.length < MIN_LENGTH || PASSWD.length > MAX_LENGTH) {
		alert("비밀번호는 " + MIN_LENGTH + "자 이상 " + MAX_LENGTH + "자 이내로 입력해야 합니다.");
		objPasswd.focus();
		return false;
	} else if (checkSpace(PASSWD)) {
		alert("비밀번호는 공백이 포함될 수 없습니다.");
		objPasswd.focus();
		return false;
	} else if (checkNull(PASSWD_RE)) {
		alert("비밀번호를 한번 더 입력하세요.");
		objPasswd_re.focus();
		return false;
	} else if (PASSWD != PASSWD_RE) {
		alert("비밀번호가 일치하지 않습니다.");
		objPasswd_re.focus();
		return false;
	} else {
		return true;
	}
}

/**
 * 아이디 검사
 * objID : 엘리먼트 아이디
 */
function checkID(objID) {
	var obj = document.getElementById(objID);
	var sRegex = /^[a-zA-Z0-9]{6,12}$/;

	if (!sRegex.test(obj.value))
	{
		alert("아이디는 6~12자의 영문자와 숫자만 사용할 수 있습니다.");
		obj.focus();
		return false;
	}

	return true;
}


/**
 * 특정 문자열 체크 : 함수 내용 참조
 * true, false 반환
 */
function checkPattern(str, type)	//형식 체크
{
	var pattern;
	switch ( type.toUpperCase() ) {
		case "NUM": //숫자만
			pattern = /^[0-9]+$/;
			break;

		case "PHONE": 	// 전화번호
			pattern = /^[0-9]{2,4}[\-]?[0-9]{3,4}[\-]?[0-9]{4}$/;
			break;

		case "MOBILE": 	// 휴대전화
			pattern = /^01[0|1|6|8|9][\-]?[0-9]{3,4}[\-]?[0-9]{4}$/;
			break;
			
		case "PHONE2": // 전화, 휴대전화
			pattern = /(^02.{0}|^01.{1}|^0[0-9]{2})[\-]?([0-9]{3,4})[\-]?([0-9]{4})$/;
			break;
		
		case "PHONE8": // 8자리 전화
			pattern = /(^1[0-9]{3})[\-]?([0-9]{4})$/;
			break;

		case "ZIPCODE": // 우편번호
			pattern = /^[0-9]{3}[\-]?[0-9]{3}$/;
			break;

		case "EMAIL": //메일
			pattern = /^[a-zA-Z0-9._-]+@([a-zA-Z0-9.-]+\.)+[a-zA-Z]{2,4}$/;
			break;

		case "DOMAIN": //영자 숫자와	.	다음도 영자
			pattern = /^[.a-zA-Z0-9-]+.[a-zA-Z]+$/;
			break;

		case "ENG": //영자만
			pattern = /^[a-zA-Z]+$/;
			break;

		case "ENGNUM": //영자와	숫자
			pattern = /^[a-zA-Z0-9]+$/;
			break;

		case "ACCOUNT": //숫자	와 '-'
			pattern = /^[0-9-]+$/;
			break;

		case "HOST": //영자	와 '-'
			pattern = /^[a-zA-Z-]+$/;
			break;

		case "ID": //첫글자는 영자 그 뒤엔 영어숫자 4이상 15자리	이하
			pattern = /^[a-zA-Z]{1}[a-zA-Z0-9]{4,15}$/;
			break;

		case "ID2": //첫글자는	영자 그뒤엔	영어숫자 4이상 15자리	이하
			pattern = /^[a-zA-Z0-9._-]+$/;
			break;

		case "DATE": //	형식 : 2002-08-15
			pattern = /^[0-9]{4}-[0-9]{2}-[0-9]{2}$/;
			break;

		case "JUMIN": 	// 주민등록번호
			pattern = /^[0-9]{13}$/;
			break;
 
		case "HTMLTAG":	//HTML 태그 유효성
			pattern = /\<[^\>]+\>/;
			break;
			
		case "BOARD_CODE" : //게시판 코드 : 첫 글자 영문, 나머지 4자 이상 10자리 이하  
			pattern = /^[a-zA-Z]{1}[a-zA-Z0-9]{3,10}$/;
			break;

		case "PASSWORD" : //숫자, 영문, 특수문자 - 느슨한 체크
			pattern = /^(?=.*[0-9])(?=.*[!@#\$%\^~&\*\(\)_\+\\\|])(?=.*[a-z])(?=.*[A-Z]).{8,12}$/;							
			break;
		
		case "PASSWORD_ONLY" : //숫자, 영문, 특수문자 - 느슨한 체크
			pattern = /^(?=.*[0-9])(?=.*[a-z]).{8,20}$/;							
			break;
		
		case "BIZNO": // 사업자번호
			pattern = /^[0-9]{3}[\-]?[0-9]{2}[\-]?[0-9]{5}$/;
			break;
		
		case "IP_ADDRESS" : //IPv4, IPv6 둘 다
			pattern = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)|(([0-9a-fA-F]{1,4}:){7,7}[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,7}:|([0-9a-fA-F]{1,4}:){1,6}:[0-9a-fA-F]{1,4}|([0-9a-fA-F]{1,4}:){1,5}(:[0-9a-fA-F]{1,4}){1,2}|([0-9a-fA-F]{1,4}:){1,4}(:[0-9a-fA-F]{1,4}){1,3}|([0-9a-fA-F]{1,4}:){1,3}(:[0-9a-fA-F]{1,4}){1,4}|([0-9a-fA-F]{1,4}:){1,2}(:[0-9a-fA-F]{1,4}){1,5}|[0-9a-fA-F]{1,4}:((:[0-9a-fA-F]{1,4}){1,6})|:((:[0-9a-fA-F]{1,4}){1,7}|:)|fe80:(:[0-9a-fA-F]{0,4}){0,4}%[0-9a-zA-Z]{1,}|::(ffff(:0{1,4}){0,1}:){0,1}((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9])|([0-9a-fA-F]{1,4}:){1,4}:((25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]).){3,3}(25[0-5]|(2[0-4]|1{0,1}[0-9]){0,1}[0-9]))$/;
			break;
		
		case "IPV4": 
			pattern = /^(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])\.(\d{1,2}|1\d\d|2[0-4]\d|25[0-5])$/;
			//pattern = /^(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$/;
			break;
			
		default:
			return false;
	}

	return pattern.test(str);
}


/**
* keyCode 값을 가져온다. firefox 겸용
* 가급적이면 jQuery를 사용하십시오.
* 
* @param e event 객체
* @return 키코드값
* 
* 파이어폭스에서는 다음과 같은 키 이벤트 처리를 이용한다.
* onkeypress="if(getKeyCode(event) == 13){document.getElementById('search').submit(); return false;}"
* onkeypress="if(getKeyCode(event) == 13){메서드; return false;}"
*/
function getKeyCode(e) {
	if (e != null) {
		if (e.keyCode != null) {	// IE
			return e.keyCode;
		}
		else if (e.which != null) {	// Firefox
			return e.which;
		}
		else {
			return 0;
		}
	}
	else
		return 0;
}


//Explorer, FireFox
function onlyNumber(Ev){

	var evCode = (window.netscape) ? Ev.which : event.keyCode;
//	//keydown일 때에만 keyCode에 따라 입력제한이 가능함.
//	//입력 문자열 길이에 따라 포커스 이동은 keyup일 때에만 가능함. 이벤트 분리 처리해야함.
//	//13 : enter
//	//48-57 : 숫자 
//	//96-105 : 키패드 숫자
//	//8 : backspace
//	if((event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105) && event.keyCode != 8 && event.keyCode != 9 && (event.keyCode < 37 || event.keyCode > 40))

	//if ( ! ( evCode == 0 || evCode == 8 || ( evCode > 47 && evCode < 58 ) ) )
    if((evCode < 48 || evCode > 57) && (evCode < 96 || evCode > 105) && evCode != 8 && evCode != 9 && evCode != 13 && (evCode < 37 || evCode > 40))
    { 
    /* 눌러진 키 코드가 숫자가 아닌 경우 
        ( '0'은 FF에서 Tab 키, 
          '8'은 FF에서 BackSpace가 먹히지 않아 삽입)    */ 
        if ( window.netscape ) {        // FF일 경우 
            Ev.preventDefault() ;        // 이벤트 무효화
        } else {                                // IE일 경우 
            event.returnValue=false;    // 이벤트 무효화 
        }
    }   
}


/**
 * 입력 문자 바이트 계산 및 표시 - jquery 필요<br>
 *  - firefox에서는 한글 계산 안될 수 있음<br>
 * @param obj 입력 영역 jquery 객체
 * @param maxBytes 최대 입력 바이트 수 : 기본 200
 * @param displayTagID 현재 입력된 바이트 수 표시 태그 id - 없으면 표시 안함
 */
function checkBytes(obj, maxBytes, displayTagID) {
	var iMaxBytes = 200;
	// iMaxBytes =
	// parseInt(parsdocument.getElementById(maxBytesTagID).innerHTML);
	if (maxBytes != null && !isNaN(maxBytes))
		iMaxBytes = parseInt(maxBytes, 10);
	// var objCurrentBytes = document.getElementById(displayTagID);
	var iCurrentBytes = 0;

	for (var i = 0; i < obj.val().length; i++) {
		var c = escape(obj.val().charAt(i));
		iCurrentBytes += c.length > 4 ? 2 : 1;

		if (iCurrentBytes > iMaxBytes) {
			alert("최대 입력 문자수 " + iMaxBytes + "바이트를 넘어갈 수 없습니다.");
			obj.val(obj.val().substr(0, i));
			iCurrentBytes -= c.length > 4 ? 2 : 1;
			break;
		}
	}

	if (displayTagID != null && $('#' + displayTagID).length > 0)
		$('#' + displayTagID).html(iCurrentBytes);
	// objCurrentBytes.innerHTML = iCurrentBytes;
}

/**
 * 입력 문자 바이트 계산 및 표시 - jquery 필요<br>
 * 2018-07-03 추가 - 광고 발송용 문자 포함 처리
 * 2018-11-26 추가 - true/false 리턴 - false: 제한 바이트 오버
 * @param addObj : 추가 문자열 객체
 * @param obj : 제한 넘어간 문자를 잘라서 표시할 html 객체 
 * @param maxBytes : 제한 바이트
 * @param displayTagID : 현재 바이트 표시 html 객체 id
 */
function checkBytes2(addObj, obj, maxBytes, displayTagID) {
	var isRight = true;
	var iMaxBytes = 200;
	if (maxBytes != null && !isNaN(maxBytes))
		iMaxBytes = parseInt(maxBytes, 10);
	
	var iAddObjBytes = 0;
	for (var i = 0; i < addObj.val().length; i++) {
		var c = escape(addObj.val().charAt(i));
		iAddObjBytes += c.length > 4 ? 2 : 1;
	}
	
	var sInput = obj.val();
	var iCurrentBytes = iAddObjBytes;
	for (var i = 0; i < sInput.length; i++) {
		var c = escape(sInput.charAt(i));
		iCurrentBytes += c.length > 4 ? 2 : 1;

		if (iCurrentBytes > iMaxBytes) {
			alert("최대 입력 문자수 " + iMaxBytes + "바이트를 넘어갈 수 없습니다.\n");
			obj.val(obj.val().substr(0, i));
			iCurrentBytes -= c.length > 4 ? 2 : 1;
			isRight = false;
			break;
		}
	}

	if (displayTagID != null && $('#' + displayTagID).length > 0)
		$('#' + displayTagID).html(iCurrentBytes);
	
	return isRight;
}


//유니코드(한글 포함) 입력 제한, 최대 입력 바이트 제한
//onkeyup 이용
function checkBytesWithdenyUnicode(evt, maxBytes, displayTagID)
{
	denyUnicode(evt);
	checkBytes(evt, maxBytes, displayTagID);
}

//유니코드(한글 포함) 입력 제한
//onkeyup 이용
function denyUnicode(evt)
{
	var objMessage;
	if (evt.srcElement)
		objMessage = evt.srcElement;
	else
		objMessage = evt.target;
		
	for (var i = 0; i < objMessage.value.length; i++)
	{
		var c = escape(objMessage.value.charAt(i));

		if (c.length > 4)
		{
			if (window.netscape)
				evt.preventDefault();
			else
				evt.returnValue = false;
		}
	}
}


//한글 자소 분리
//배열 형태로 반환됨
function hangulToJaso(string)
{
	var ChoSeong = new Array ( 
		0x3131, 0x3132, 0x3134, 0x3137, 0x3138, 0x3139, 
		0x3141, 0x3142, 0x3143, 0x3145, 0x3146, 0x3147, 
		0x3148, 0x3149, 0x314a, 0x314b, 0x314c, 0x314d, 0x314e 
	);
	var JungSeong = new Array ( 
		0x314f, 0x3150, 0x3151, 0x3152, 0x3153, 0x3154, 
		0x3155, 0x3156, 0x3157, 0x3158, 0x3159, 0x315a, 
		0x315b,0x315c, 0x315d, 0x315e, 0x315f, 0x3160, 
		0x3161, 0x3162, 0x3163 
	);
	var JongSeong = new Array ( 
		0x0000, 0x3131, 0x3132, 0x3133, 0x3134,0x3135, 
		0x3136, 0x3137, 0x3139, 0x313a, 0x313b, 0x313c, 
		0x313d, 0x313e, 0x313f, 0x3140, 0x3141, 0x3142, 
		0x3144, 0x3145, 0x3146, 0x3147, 0x3148, 0x314a, 
		0x314b, 0x314c, 0x314d, 0x314e 
	);
	var chars = new Array();
	var v = new Array();
	for (var i = 0; i < text.length; i++) 
	{
		chars[i] = text.charCodeAt(i);
		if (chars[i] >= 0xAC00 && chars[i] <= 0xD7A3) 
		{
			var i1, i2, i3;
			i3 = chars[i] - 0xAC00;
			i1 = i3 / (21 * 28);
			i3 = i3 % (21 * 28);
			i2 = i3 / 28;
			i3 = i3 % 28;
			v.push(String.fromCharCode(ChoSeong[parseInt(i1)]));
			v.push(String.fromCharCode(JungSeong[parseInt(i2)]));
			if (i3 != 0x0000)
				v.push(String.fromCharCode(JongSeong[parseInt(i3)]));
		}
		else {
			v.push(String.fromCharCode(chars[i] ));
		}
	}
	return v;
}





/**
 * html 태그 제거
 * input : 입력 문자열
 * allowed : 제거하지 않을 html 태그
 */
function removeHtmlTags(input, allowed) {
	allowed = (((allowed || "") + "").toLowerCase().match(/<[a-z][a-z0-9]*>/g) || []).join(''); 
	// making sure the allowed arg is a string containing
	// only tags in lowercase (<a><b><c>)
	var tags = /<\/?([a-z][a-z0-9]*)\b[^>]*>/gi, commentsAndPhpTags = /<!--[\s\S]*?-->|<\?(?:php)?[\s\S]*?\?>/gi;
	return input.replace(commentsAndPhpTags, '').replace(
			tags,
			function($0, $1) {
				return allowed.indexOf('<' + $1.toLowerCase() + '>') > -1 ? $0
						: '';
			});
}

/**
 * ReplaceAll (by javascript prototype)
 * 정규식 패턴에서 \는 두 개 사용 
 */
String.prototype.ReplaceAll = function(pattern, changeString) {
	var regExp = new RegExp(pattern, 'g');
	//alert(regExp);
	return this.replace(regExp, changeString);
};

/**
 * Trimming 1 (by javascript prototype)
 */
String.prototype.Trim = function() {
	return this.replace(/^\s+|\s+$/g, '');
};

/**
 * Trimming 2
 */
function trim(s) {
	return s.replace(/^\s+|\s+$/g,'');
}

//Trimming 3 jquery $.trim() 함수 사용


/**
 * Insert character(s)   (by javascript prototype)
 */
String.prototype.Insert = function(index, value) {
	if (this.length - 1 < index)
		return this;

	return this.substr(0, index) + value + this.substr(index - 1 + value.length);
};

/**
 * trimEnd 
 */
function trimEnd(str, trimChar) {
	var sReturn = str;
	if (sReturn.lastIndexOf(trimChar) > -1) {
		var sLastChar = sReturn.substr(sReturn.length - trimChar.length);
		while (sLastChar == trimChar) {
			sReturn = sReturn.substr(0, sReturn.length - trimChar.length);
			sLastChar = sReturn.substr(sReturn.length - trimChar.length);
		}
	}
	return sReturn;
}

/**
 * StartsWith : startsWith 메서드
 */
String.prototype.StartsWith = function(searchString, position) {
	position = position || 0;
    return this.substr(position, searchString.length) === searchString;
};


/**
 * EndsWith : endsWith 메서드
 */
String.prototype.EndsWith = function(searchString, position) {
	var subjectString = this.toString();
    if (typeof position !== 'number' || !isFinite(position) || Math.floor(position) !== position || position > subjectString.length) {
      position = subjectString.length;
    }
    position -= searchString.length;
    var lastIndex = subjectString.indexOf(searchString, position);
    return lastIndex !== -1 && lastIndex === position;
};


function removeDuplicate(arr) {
	var uniq = arr.reduce(function(a, b) {
		if (a.indexOf(b) < 0)
			a.push(b);
		return a;
	}, []);
	return uniq;
}


/**
 * pad left 
 * val : 입력 문자열 (문자열로 강제 변환)
 * len : 패딩 길이
 * padChar : 채울 문자열
 */
function padLeft(val, len, padChar) {
	var sValue = String(val);

	if (sValue.length >= len)
		return val;
	else {
		while (sValue.length < len)
			sValue = padChar + sValue;
		return sValue;
	}
}

/**
 * pad right : padLeft 참조
 */
function padRight(val, len, padChar) {
	var sValue = String(val);

	if (sValue.length >= len)
		return val;
	else {
		while (sValue.length < len)
			sValue = sValue + padChar;
		return sValue;
	}
}


/**
 * left : ASP 레프트 함수
 */
function left(str, n) {
	str = trim(str);
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else
		return String(str).substring(0, n);
}


/**
 * right : ASP 라이트 함수
 */
function right(str, n) {
	str = trim(str);	
	
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else {
		var iLen = String(str).length;
		return String(str).substring(iLen, iLen - n);
	}
}

/**
 * 컴마 추가
 * @param n
 * @returns
 */
function addComma(n) {
	var reg = /(^[+-]?\d+)(\d{3})/; // 정규식
	n += '';  						// 숫자를 문자열로 변환

	while (reg.test(n))
		n = n.replace(reg, '$1' + ',' + '$2');

	return n;
}


/**
 * 쉼표가 들어간 숫자형 문자열에서 쉼표 제거
 * 숫자형이 아니면 다시 반환 
 */
function removeComma(str) {
	var reg = /[,]/g;
	var val = str.replace(reg, '');

	if (isNaN(val))
		return str;
	else
		return parseInt(val, 10);
}

/**
 * abbreviation
 **/
function abbr(val, len, suffix) {
	if (isNull(suffix))
		suffix = '...';
	if (val.length > len) {
		return val.substr(0, len - 2) + suffix;
	}
	else
		return val;
}


/**
 * 첨부파일 경로 제거 후 파일명만 추출
 */
function getFileName(val) {
	var tmpStr = val;

	var cnt = 0;
	while (true) {
		cnt = tmpStr.indexOf("/");
		if (cnt == -1)
			break;
		tmpStr = tmpStr.substring(cnt + 1);
	}
	while (true) {
		cnt = tmpStr.indexOf("\\");
		if (cnt == -1)
			break;
		tmpStr = tmpStr.substring(cnt + 1);
	}

	return tmpStr;
}

/**
 * 파일 확장자 가져오기 
 */
function getFileExtension(filePath) {
	var lastIndex = -1;
	lastIndex = filePath.lastIndexOf('.');
	var extension = "";
	if (lastIndex != -1) {
		extension = filePath.substring(lastIndex, filePath.len);
	} else {
		extension = "";
	}
	return extension;
}

// 자동 ROWSPAN(줄수,테그(td,th)
//function fnbTableRowsPan(index, tagnm) {
//	var RowspanTd = false;
//	var RowspanText = false;
//	var RowspanCount = 0;
//	var Rows = $('tbody  tr', '.tbl');
//
//	jQuery.each(Rows, function() {
//		var This = $(tagnm, this)[index];
//		// var text = $(This).text();
//
//		var text = $(This).find("input").val();
//
//		if (RowspanTd == false) {
//
//			RowspanTd = This;
//			RowspanText = text;
//			RowspanCount = 1;
//		} else if (RowspanText != text) {
//			$(RowspanTd).attr('rowSpan', RowspanCount);
//			$(RowspanTd).css("border", "1px solid #d0d0d0");
//			RowspanTd = This;
//			RowspanText = text;
//			RowspanCount = 1;
//
//		} else {
//			$(This).remove();
//			$(RowspanTd).css("border", "1px solid #d0d0d0");
//			RowspanCount++;
//		}
//	});
//
//	// 반복 종료 후 마지막 rowspan 적용
//	$(RowspanTd).attr('rowSpan', RowspanCount);
//}



/**
 * byte 숫자 체크
 */
function getBytesLength(message) {
	var nbytes = 0;
	for (var i = 0; i < message.length; i++) {
		var ch = message.charAt(i);
		if (escape(ch).length > 4) {
			nbytes += 2;
		} else if (ch != '\r') {
			nbytes++;
		}
	}
	return nbytes;
}


/**
 * 북마크 
 */
function bookmarksite() {
	var sURL = 'http://www.tagoplus.co.kr/';
	var sTitle = '타고플러스';

	if (document.all) {
		window.external.AddFavorite(sURL, sTitle);
	}
	else if (window.chrome) {
		alert("Ctrl+D키를 누르시면 즐겨찾기에 추가하실 수 있습니다.");
	}
	else if (window.sidebar) {
		window.sidebar.addPanel(sTitle, sURL, "");
	}
	else if (window.opera && window.print) {
		var elem = document.createElement('a');
		elem.setAttribute('href', sURL);
		elem.setAttribute('title', sTitle);
		elem.setAttribute('rel', 'sidebar');
		elem.click();
	}
}




/**
 *
 * 특정 날짜 이후, 페이지 사용 불가 처리, 특정 페이지로 이동
 * 이 메서드를 body onload에 등록하여 사용
 * deadline : yyyymmdd 형식의 날짜
 * redirectURL : 리디렉션 페이지
 * alertMessage : 경고 메시지 : 없을 경우 alert 안뜸
 */
function expiredPage(deadline, redirectURL, alertMessage) {

	var today = new Date();
	var exDate = new Date();

	if (deadline.length == 8) {
		exDate = new Date(deadline.substr(0, 4), deadline.substr(4, 2) - 1, deadline.substr(6, 2));
	}

	if (today >= exDate) {
		if (!isNull(alertMessage))
			alert(alertMessage);

		if (!isNull(redirectURL))
			location.href = redirectURL;
	}
}





/************************************************************
 * 추가된 자바스크립트 함수
************************************************************/
/**
* 날짜관련 자바스크립트 공통함수
*
* 분단위 이하(= 초)는 고려하지 않았습니다.
* YYYYMMDDHHMI 형식의 String => 'Time'으로 칭함
*
* 주로 YYYYMMDD 까지만 쓰인다면 아래 함수들을
* YYYYMMDD 형식의 String => 'Date'로 하여 적당히
* 수정하시거나 아니면 함수를, 예를들어 isValidDate()처럼,
* 추가하시기 바랍니다.
*
* @version 2.0, 2001/01/28
* @author 박종진(JongJin Park), jongjpark@lgeds.lg.co.kr
*/
/**
* 유효한(존재하는) 월(月)인지 체크
*/
function isValidMonth(mm) {
    var m = parseInt(mm,10);
    return (m >= 1 && m <= 12);
}

/**
 * 유효한(존재하는) 일(日)인지 체크
 */
function isValidDay(yyyy, mm, dd) {
	var isValid = true;

	var y = parseInt(yyyy, 10);
	var m = parseInt(mm, 10) - 1;
	var d = parseInt(dd, 10);

	if (isNaN(y) || isNaN(m) || isNaN(d))
		isValid = false;	

	var end = new Array(31,28,31,30,31,30,31,31,30,31,30,31);
    if ((y % 4 == 0 && y % 100 != 0) || y % 400 == 0) {
        end[1] = 29;
    }   

    if (m < 0 || m > 11)
    	isValid = false;

    if (d < 1 || d > end[m])
    	isValid = false;

    return isValid; //(d >= 1 && d <= end[m]);
}

/**
* 유효한(존재하는) 시(時)인지 체크
*/
function isValidHour(hh) {
    var h = parseInt(hh,10);
    return (h >= 1 && h <= 24);
}
/**
* 유효한(존재하는) 분(分)인지 체크
*/
function isValidMin(mi) {
    var m = parseInt(mi,10);
    return (m >= 0 && m <= 60);
}
/**
* Time 형식인지 체크(느슨한 체크)
*/
function isValidTimeFormat(time) {
    return (!isNaN(time) && time.length == 12);
}
/**
* 유효하는(존재하는) Time 인지 체크
* ex) var time = form.time.value; //'200102310000'
*     if (!isValidTime(time)) {
*         alert("올바른 날짜가 아닙니다.");
*     }
*/
function isValidTime(time) {
	
	var dateString = time;
	dateString = dateString.replace(/[^\d]/g, '');
	
    var year  = dateString.substring(0,4);
    var month = dateString.substring(4,6);
    var day   = dateString.substring(6,8);
    var hour  = dateString.substring(8,10);
    var min   = dateString.substring(10,12);
    
    /*
    alert( "year : " + year + ":" + (parseInt(year,10) >= 1900) )
    alert( "month : " + month + ":" + isValidMonth(month) )
    alert( "day : " + day + ":" + isValidDay(year,month,day) )
    alert( "hour : " + hour + ":" + isValidHour(hour) )
    alert( "min : " + min + ":" + isValidMin(min) )
    */
    
    if (parseInt(year,10) >= 1900  && isValidMonth(month) &&
        isValidDay(year,month,day) && isValidHour(hour)   &&
        isValidMin(min)) {
        return true;
    }
    return false;
}
/**
* Time 스트링을 자바스크립트 Date 객체로 변환
* @param timeString : Time 형식의 String : yyyyMMddHHmm
* 숫자가 아닌 기호들은 모두 제거
* 초까지 입력. 형식에 맞지 않을 경우 null 반환
*/
function toTimeObject(timeString) { 
	
	var dateString = '' + timeString;
	try {
		if (/[^\d]/g.test(dateString))
			dateString = dateString.replace(/[^\d]/g, '');
		
		if (dateString.length != 8 && dateString.length != 12 && dateString.length != 14)
			return null;
	
		var year = dateString.substr(0, 4);
		var month = parseInt( dateString.substr(4, 2), 10) - 1; // 1월=0,12월=11
		var day = parseInt(dateString.substr(6, 2), 10);
	
	    var hour = 0;
	    var min = 0;
	    var sec = 0;
	    if (dateString.length > 8) {
	    	hour = dateString.substr(8, 2);
	    	if (dateString.length > 10)
	    		min = dateString.substr(10, 2);
	    	if (dateString.length > 12)
	    		sec = dateString.substr(12, 2);
	    }
	    
	    return new Date(year, month, day, hour, min, sec);
	}
	catch(e) {
		console.log(e);
		return null;
	}
}
/**
* 자바스크립트 Date 객체를 Time 스트링으로 변환
* parameter date: JavaScript Date Object
*/
function toTimeString(date) { //formatTime(date)
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 1월=0,12월=11이므로 1 더함
	var day = date.getDate();
	var hour = date.getHours();
	var min = date.getMinutes();
	var sec = date.getSeconds();
	if (("" + month).length == 1) { month = "0" + month; }
	if (("" + day).length == 1) { day = "0" + day; }
	if (("" + hour).length == 1) { hour = "0" + hour; }
	if (("" + min).length == 1) { min = "0" + min; }
	if (("" + sec).length == 1) { sec = "0" + sec; }
	return ("" + year + month + day + hour + min + sec);
}

/**
* 날짜 객체를 yyyy-MM-dd 형식으로 가져옴
* 구분자 : 기본값 (-)
*/
function getyyyyMMdd(date, separator) {
	
	if( separator == null)
		separator = '-';

	return ('' + date.getFullYear() + separator + padLeft(String(date.getMonth() + 1), 2, '0') + separator + padLeft(date.getDate(), 2, '0'));
}

/**
* Time이 현재시각 이후(미래)인지 체크
*/
function isFutureTime(time) {
    return (toTimeObject(time) > new Date());
}
/**
* Time이 현재시각 이전(과거)인지 체크
*/
function isPastTime(time) {
	//console.log(time )
	//console.log(toTimeObject(time) )
	//console.log(new Date() )
	//console.log(toTimeObject(time) < new Date() )
    return (toTimeObject(time) < new Date());
}
/**
* 주어진 Date 와 y년 m월 d일 h시 차이나는 Time을 리턴
* ex) var time = form.time.value; //'20000101000'
*     alert(shiftTime(time,0,0,-100,0));
*     => 2000/01/01 00:00 으로부터 100일 전 Time
*/
function shiftTimeByDateReturnDate(date,y,m,d,h) { //moveTime(time,y,m,d,h)
    //var date = toTimeObject(time);
    date.setFullYear(date.getFullYear() + y); //y년을 더함
    date.setMonth(date.getMonth() + m);       //m월을 더함
    date.setDate(date.getDate() + d);         //d일을 더함
    date.setHours(date.getHours() + h);       //h시를 더함
    return date;
}
/**
* 주어진 Date 와 y년 m월 d일 h시 차이나는 Time을 리턴
* ex) var time = form.time.value; //'20000101000'
*     alert(shiftTime(time,0,0,-100,0));
*     => 2000/01/01 00:00 으로부터 100일 전 Time
*/
function shiftTimeByDate(date,y,m,d,h) { //moveTime(time,y,m,d,h)
    //var date = toTimeObject(time);
    date.setFullYear(date.getFullYear() + y); //y년을 더함
    date.setMonth(date.getMonth() + m);       //m월을 더함
    date.setDate(date.getDate() + d);         //d일을 더함
    date.setHours(date.getHours() + h);       //h시를 더함
    return toTimeString(date);
}
/**
* 주어진 Time 과 y년 m월 d일 h시 차이나는 Time을 리턴
* ex) var time = form.time.value; //'20000101000'
*     alert(shiftTime(time,0,0,-100,0));
*     => 2000/01/01 00:00 으로부터 100일 전 Time
*/
function shiftTime(time,y,m,d,h) { //moveTime(time,y,m,d,h)
    var date = toTimeObject(time);
    date.setFullYear(date.getFullYear() + y); //y년을 더함
    date.setMonth(date.getMonth() + m);       //m월을 더함
    date.setDate(date.getDate() + d);         //d일을 더함
    date.setHours(date.getHours() + h);       //h시를 더함
    return toTimeString(date);
}
/**
* 두 Time이 몇 개월 차이나는지 구함
* time1이 time2보다 크면(미래면) minus(-)
*/
function getMonthInterval(time1,time2) { //measureMonthInterval(time1,time2)
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);
    var years  = date2.getFullYear() - date1.getFullYear();
    var months = date2.getMonth() - date1.getMonth();
    var days   = date2.getDate() - date1.getDate();
    return (years * 12 + months + (days >= 0 ? 0 : -1) );
}
/**
* 두 Time이 며칠 차이나는지 구함
* time1이 time2보다 크면(미래면) minus(-)
*/
function getDayInterval(time1,time2) {
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);
    var day   = 1000 * 3600 * 24; //24시간
    return parseInt((date2 - date1) / day, 10);
}
/**
* 두 Time이 몇 시간 차이나는지 구함
* time1이 time2보다 크면(미래면) minus(-)
*/
function getHourInterval(time1,time2) {
    var date1 = toTimeObject(time1);
    var date2 = toTimeObject(time2);
    var hour  = 1000 * 3600; //1시간
    return parseInt((date2 - date1) / hour, 10);
}
/**
* 현재 시각을 Time 형식으로 리턴
*/
function getCurrentTime() {
    return toTimeString(new Date());
}
/**
* 현재 시각과 y년 m월 d일 h시 차이나는 Time을 리턴
*/
function getRelativeTime(y,m,d,h) {
/*
    var date = new Date();
    date.setFullYear(date.getFullYear() + y); //y년을 더함
    date.setMonth(date.getMonth() + m);       //m월을 더함
    date.setDate(date.getDate() + d);         //d일을 더함
    date.setHours(date.getHours() + h);       //h시를 더함
    return toTimeString(date);
*/
    return shiftTime(getCurrentTime(),y,m,d,h);
}
/**
* 현재 年을 YYYY형식으로 리턴
*/
function getYear() {
/*
    var now = new Date();
    return now.getFullYear();
*/
    return getCurrentTime().substr(0,4);
}
/**
* 현재 月을 MM형식으로 리턴
*/
function getMonth() {
/*
    var now = new Date();
    var month = now.getMonth() + 1; // 1월=0,12월=11이므로 1 더함
    if (("" + month).length == 1) { month = "0" + month; }
    return month;
*/
    return getCurrentTime().substr(4,2);
}
/**
* 현재 日을 DD형식으로 리턴
*/
function getDay() {
/*
    var now = new Date();
    var day = now.getDate();
    if (("" + day).length == 1) { day = "0" + day; }
    return day;
*/
    return getCurrentTime().substr(6,2);
}
/**
* 현재 時를 HH형식으로 리턴
*/
function getHour() {
/*
    var now = new Date();
    var hour = now.getHours();
    if (("" + hour).length == 1) { hour = "0" + hour; }
    return hour;
*/
    return getCurrentTime().substr(8,2);
}

function getMinute() {
	return getCurrentTime().substr(10,2);
}

/**
* 오늘이 무슨 요일이야?
* ex) alert('오늘은 ' + getDayOfWeek() + '요일입니다.');
* 특정 날짜의 요일을 구하려면? => 여러분이 직접 만들어 보세요.
*/
function getDayOfWeek() {
    var now = new Date();
    var day = now.getDay(); //일요일=0,월요일=1,...,토요일=6
    var week = new Array('일','월','화','수','목','금','토');
    return week[day];
}

/**
 * jquery datepicker의 y m d 형식의 문자열로 날짜 구하기
 *   
 * @param value jquery datepicker의 "-1y +1m +2d" 형식
 * @param baseDate 자바스크립트 date 객체  
 */
function getDateByjQueryDateFormat(value, baseDate) {
	var today = new Date();
	if(baseDate != null && typeof(baseDate) === 'object')
		today = new Date(baseDate.getFullYear(), baseDate.getMonth(), baseDate.getDate());
	//alert("today : " + today);
	var elements = value.toString().split(' ');
	for(var x in elements) {
		var num = eval(elements[x].substr(0, elements[x].length - 1).toString());
		var flag = elements[x].substr(elements[x].length -1).toString().toLowerCase();
		if(flag == 'd')
			today.setDate(today.getDate() + num);
		else if(flag == 'm')
			today.setMonth(today.getMonth() + num);
		else if(flag == 'y')
			today.setFullYear(today.getFullYear() + num);
	}
	return today;
}

/**
 * sns 시각 표시 형태로 가져오기
 * @param dt 형식 문자열
 */
function getDateBySns(dt) {
	var dd = new Date(dt);
	var today = new Date();
	var gap = today - dd;
	
	var c_sec = 1000;
	var c_minute = c_sec * 60;
	var c_hour = c_minute * 60;
	var c_day = c_hour * 24;
	var c_month = c_day * 30; 
	
	//7개월 이상 : yyyy-MM-dd
	if (gap / c_month >= 7)
		sRtn = getyyyyMMdd(dd, '-');
	else if (gap / c_month >= 1 && gap / c_month < 7)
		sRtn = parseInt(gap / c_month, 10) + '개월 전';
	else if (gap / c_day >= 1 && gap / c_month < 1)
		sRtn = parseInt(gap / c_day, 10) + '일 전';
	else if (gap / c_hour >= 1 && gap / c_day < 1)
		sRtn = parseInt(gap / c_hour, 10) + '시간 전';
	else if (gap / c_minute >= 1 && gap / c_hour < 1)
		sRtn = parseInt(gap / c_minute, 10) + '분 전 ';
	else if (gap / c_sec >= 1 && gap / c_minute < 1)
		sRtn = parseInt(gap / c_sec, 10) + '초 전';

	return sRtn;
}

/**
 * 5분단위 올림 처리 시각 문자열 리턴 yyyy-MM-dd HH:mm:ss 
 */
function getDateTimeBy5MinuteCeil() {
	var now = new Date();
	var iMilliMin = 1000 * 60;
	var iRemain = now.getMinutes() % 5;
	var sRtn = toTimeString(new Date(now.valueOf() + (iMilliMin * (iRemain > 0 ? 5 - iRemain : 0))));
	return sRtn.substr(0, 4) + '-' + sRtn.substr(4, 2) + '-' + sRtn.substr(6, 2) + ' ' + sRtn.substr(8, 2) + ':' + + sRtn.substr(10, 2) + ':' + sRtn.substr(12, 2);
}

/************************************************************/



/************************************************************
Cookie
	주의 : 
	- 도메인 당 최대 쿠키 수 50개
	- 쿠키 저장 용량 : 4KB
************************************************************/
function getCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);

    if (endstr == -1) {
        endstr = document.cookie.length;
    }

    return decodeURIComponent(document.cookie.substring(offset, endstr));
    //return document.cookie.substring(offset, endstr);
}

/**
쿠키 이름으로 쿠키 값 가져오기
*/
function GetCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;

    while (i < clen) {
        var j = i + alen;

        if (document.cookie.substring(i, j) == arg) {
            return getCookieVal(j);
        }

        i = document.cookie.indexOf(" ", i) + 1;

        if (i == 0) {
            break;
        }
    }
    return null;
}

/**
배열 형태의 쿠키 값 가져오기
배열 형태(parameterized 형식)의 쿠키 값에서 쿠키 값을 가져옵니다.
cName : 쿠키 이름
cKey : 쿠키 값에 있는 키 이름
*/
function GetCookieValueByKey(cName, cKey) { 
	var sRtn = "";
	var cValue = GetCookie(cName);
	if (cValue != null && cValue != "" && (cValue.indexOf("&") > -1 && cValue.indexOf("=") > -1)) {
		var arrCookieVals = cValue.split("&");
		for (var x in arrCookieVals) {
			var key = arrCookieVals[x].split("=")[0];
			var value = arrCookieVals[x].split("=")[1];
			if (key == cKey)
				sRtn = value;
		}
	}

	return sRtn;
}


function SetCookie(name, value, domain, path, expires, secure) {
	try {
		var argv = SetCookie.arguments;
		var argc = SetCookie.arguments.length;
		/*
		var expires = (2 < argc) ? argv[2] : null;
		var path = (3 < argc) ? argv[3] : null;
		var domain = (4 < argc) ? argv[4] : null;
		var secure = (5 < argc) ? argv[5] : false;
		 */
		document.cookie = name + "=" + encodeURIComponent(value) 
			+ ((expires == null) ? "" : ("; expires=" + expires.toGMTString())) 
			+ ((path == null) ? "; path=/" : ("; path=" + path)) 
			+ ((domain == null) ? "" : ("; domain=" + domain)) 
			+ ((secure == true) ? "; secure" : "");
	}
	catch (e) {
		alert(e.message);
		console.log(e)
	}
}

function DelCookie(name)
{
	var expireDate = new Date();
	expireDate.setDate( expireDate.getDate() - 1 );
	document.cookie = name + "= " + "; expires=" + expireDate.toGMTString() + "; path=/";
}
/************************************************************
Cookie 끝
************************************************************/


