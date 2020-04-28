<%@ page contentType="text/html;charset=utf-8" pageEncoding = "utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<c:choose>
	<c:when test="${resultFlag eq 'true' || ipin.getsReservedParam1() eq 'idSearch' || ipin.getsReservedParam1() eq 'pwSearch' || myAccountCount eq 0}">
		<head>
			<title>NICE신용평가정보 가상주민번호 서비스</title>
			<script type="text/javascript">
				function fnLoad(){
					/* opener.document.joinForm.ipin_encdata.value = "<c:out value="${ipin.sResponseData}"/>";
					opener.document.joinForm.ipin_param1.value = "<c:out value="${ipin.sReservedParam1}"/>";
					opener.document.joinForm.ipin_param2.value = "<c:out value="${ipin.sReservedParam2}"/>";
					opener.document.joinForm.ipin_param3.value = "<c:out value="${ipin.sReservedParam3}"/>";
					opener.document.joinForm.cert_type.value = "<c:out value="${sCertType}"/>";
					opener.document.joinForm.recomm_code.value = "<c:out value="${recomm_code}"/>"; */
					opener.document.formJoin.userName.value = "<c:out value="${search.userName}"/>";
					opener.document.formJoin.accountOwner.value = "<c:out value="${search.userName}"/>";
					opener.document.formJoin.phone.value = "<c:out value="${search.phone}"/>";
					opener.document.formJoin.certType.value = "<c:out value="${search.certType}"/>";
					opener.document.formJoin.ipinEncdata.value = "<c:out value="${search.ipinEncdata}"/>";

					// 미성년 가입은 회원가입이 불가하므로 여기에만 미성년 로직 넣기  tyrus-k added
					var isAdult="<c:out value="${search.getAdult()}"/>";

					if(isAdult=="" || isAdult =="false") {
						var chk = opener.document.querySelector('#userNameChk');
						var mbck = opener.document.querySelector('#userMobileChk');
						chk.style.display = "block";
						mbck.style.display = "block";

						chk.innerHTML = "미성년자는 가입이 불가합니다.";
						mbck.innerHTML = "미성년자는 가입이 불가합니다.";

						opener.document.formJoin.isAdult.value = isAdult;
					}else{
						var chk = opener.document.querySelector('#userNameChk');
						var mbck = opener.document.querySelector('#userMobileChk');
						chk.style.display = "none";
						mbck.style.display = "none";

						opener.document.formJoin.isAdult.value = isAdult;
					}

					var phonenumber="<c:out value="${search.phone}"/>";

					if(phonenumber){
						opener.document.formJoin.phone1.value = phonenumber.substring(0, 3);
						opener.document.formJoin.phone2.value = phonenumber.substring(3, 7);
						opener.document.formJoin.phone3.value = phonenumber.substring(7, 11);
					}


					//opener.document.joinForm.submit();
					self.close();
				}
			</script>
		</head>
		<body onLoad="fnLoad()">
		</body>
	</c:when>
	<c:when test="${resultFlag eq 'dupl'}">
		<head>
			<title>NICE신용평가정보 가상주민번호 서비스</title>
		</head>
		<body onLoad="fnLoad()">
			<script type="text/javascript">
				function fnLoad(){
					/* opener.document.joinForm.ipin_encdata.value = "<c:out value="${ipin.sResponseData}"/>";
					opener.document.joinForm.ipin_param1.value = "<c:out value="${ipin.sReservedParam1}"/>";
					opener.document.joinForm.ipin_param2.value = "<c:out value="${ipin.sReservedParam2}"/>";
					opener.document.joinForm.ipin_param3.value = "<c:out value="${ipin.sReservedParam3}"/>";
					opener.document.joinForm.cert_type.value = "<c:out value="${sCertType}"/>";
					opener.document.joinForm.recomm_code.value = "<c:out value="${recomm_code}"/>"; */
					opener.document.formJoin.userName.value = "<c:out value="${search.userName}"/>";
					opener.document.formJoin.accountOwner.value = "<c:out value="${search.userName}"/>";
          			opener.document.formJoin.phone.value = "<c:out value="${search.phone}"/>";
          			opener.document.formJoin.certType.value = "<c:out value="${search.certType}"/>";
					opener.document.formJoin.ipinEncdata.value = "<c:out value="${search.ipinEncdata}"/>";
					var chk = opener.document.querySelector('#userNameChk');
					var mbck = opener.document.querySelector('#userMobileChk');
					chk.style.display = "block";
					mbck.style.display = "block";

					chk.innerHTML = "이미 등록되어 있습니다.";
					mbck.innerHTML = "이미 등록되어 있습니다.";

          			var phonenumber="<c:out value="${search.phone}"/>";
					if(phonenumber){
						opener.document.formJoin.phone1.value = phonenumber.substring(0, 3);
						opener.document.formJoin.phone2.value = phonenumber.substring(3, 7);
						opener.document.formJoin.phone3.value = phonenumber.substring(7, 11);
					}

					//opener.document.joinForm.submit();
					self.close();
				};
			</script>
		</body>
	</c:when>
	<c:otherwise>
		<head>
			<title>NICE신용평가정보 가상주민번호 서비스</title>
		</head>
		<body onLoad="self.close()">
		</body>
	</c:otherwise>
</c:choose>
</html>

