<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
	
<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	<%@ include file="/WEB-INF/include/front_header_html.jsp"%>
	
	<script type="text/javascript">
		$(function() {
			
			if (location.pathname.indexOf('/test/') > -1) {
				$(document.body).css({
					'background': 'none'
					, 'padding': ' 10px 20px'
				});
			}
			
			$('button, .btn').button();			
			
			//날짜 함수 테스트
			$('#btnTest1').click(function() {
				var dt = getDateByjQueryDateFormat('-1y -1d', new Date());	//오늘 기준으로 -1년 -1일
				alert(getyyyyMMdd(dt, '.'));
			});
			
			//ajax 테스트
			$('#btnTest2').click(function() {
				$.ajax({
					async: true
					, url: '/test/jsonTest'
					, type: 'post'
					, dataType: 'json'
					, data: { searchWord: 'test' 
					}
					, beforeSend: function () {
						var iWidth = ($('#wrap').width() - 48) / 2;
						$('#wrap').oLoader({
						  backgroundColor: '#fff',
						  fadeLevel: 0.9,
						  style: '<div style="position:fixed; top:300px; left:' + iWidth + 'px"><img src="/images/loading_6.gif" /></div>',
						  waitLoad: true
						});
					}
					, complete: function () {
						$('#wrap').oLoader('hide');
					}
					, success: function (msg) {
						//json객체의 경우 한 개일 때 인덱서 자체가 없으므로 반드시 확인 필요.
						//alert(msg.list.length + ' : ' + msg.sampleSearchVO.length);
						//debugObject(msg.list[1]);
						//alert(msg);
						
						if ($('#divTest').length == 0)
							$('#divAjaxTest').append('<div id="divTest"></div>');
						$('#divTest').text('look development tool.');
						
						console.log(msg);
					}
					, error: function (data) {
						//$('#divSearchList').unblock();
						alert("error ajax :\n" + data.responseText);
					}
				});
			});
			
			$('#btnTest3').click(function() {
				$('#divAjaxTest2').oLoader({
					url: './jsonTest3'
					, type: 'POST'
					, data: {
						txtPwd: $('#txtPwd').val()
					}
					, image: '/images/loading_6.gif'
					, backgroundColor: '#eee'
					, style: 2
					, updateContent: false 			//자기 자신에게 업데이트 금지
					, complete: function(successData) {
						$('#divHash').text(successData + ' : ' + successData.length + 'chars');
					}
				});
			});
		});
	
		function foo() {
			var args = foo.arguments;
			alert(args + ' : ' + args.length + '\n페이지 최하단 생성 html 확인');
			debugObject(args[0]);	//객체 디버깅용 함수 : common.jquery.util.js 참조
		}
	</script>
	
	<div class="wrap_contents">
	
		<!-- path 영역-->
	    <div class="wrap_path">
	        <div class="section_contents">
	            <h2>예제 페이지1</h2>
	            <div class="area_path">
	                <p>
	                    <a href="/" class="sprite sprite_header sprite_home">Home</a><a href="#" class="path path_current">locator</a>
	                </p>
	            </div>
	        </div>
	    </div>
	    
	    <style>
	    	.olTemp {margin-bottom: 5px;}
	    	.olTemp li {margin-bottom: 5px;}
	    </style>
	    <div class="section_contents">
	    	<h4>jquery.locater 예제</h4>
			<s:eval expression="@globals['admin.map.key']" />
			<ol class="olTemp">
				<li>1. <a href="javascript:$.Nav('self', {param1: 1, param2: 2, param3: 3});">현재 URL + param1=1&amp;param2=2&amp;param3=3</a></li>
				<li>2. <a href="javascript:$.Nav('self', {param2:''});">1에서 param2 제거</a></li>
				<li>3. <a href="javascript:$.Nav('go', './sample_list');">현재 파라미터를 유지한 상태로 list 페이지로 이동</a></li>
				<li>4. <a href="javascript:$.Nav('write');">3 리스트 페이지에서 등록/수정 페이지로 이동</a></li>
				<li>5. <a href="javascript:$.Nav('go', './sample_proc',{param5:'dd'});">4 등록/수정 페이지에서 처리 페이지로 이동 후, alert 메시지, 페이지 리디렉션. 모든 파라미터 제거. TestController 참조</a></li>
				<li>6. <a href="javascript:$.Nav('self', null, null, true);">모든 get 파라미터 제거.</a></li>
				<li>7. <a href="javascript:$.Nav('self', null, 'middleTable');">middleTable 해쉬 태그 추가</a></li>
				<li>8. <a href="javascript:$.Nav('func', foo, {param1: 1, param2: 2});">외부 함수 호출. 전달 파라미터1:추가한 파라미터, 전달 파라미터2:현재 get파라미터</a></li>
			</ol>
			
			<div class="mb40">
				※ 주의 : 예약어를 이용한 페이지 이동 조건(self, list, write) : 파일명에 언더스코어(_)를 한 개와 한 개의 확장명을 사용해야 함. 언더스코어 뒤의 문자열을 list, write, proc 등으로 변환처리.<br />
				상세 내용 jquery.locator.js 참조
			</div>
			
			<div class="mb40">
				<h4>globals.properties 사용 (소스 참조)</h4>
				&lt;c:set var="CDN_URL"&gt;&lt;s:eval expression="@globals['url.cdn.local']" /&gt;&lt;/c:set&gt;
				<c:set var="CDN_URL"><s:eval expression="@globals['url.cdn.local']" /></c:set>
			</div>
			
			
			<div class="mb40">
				<button id="btnTest1">날짜 함수(getDateByjQueryDateFormat()) 테스트</button>
			</div>
			
			<div class="mb40">
				<h4>범위 캘린더 사용 예제</h4>
				<input type="text" class="datepicker" maxlength="10" /> ~ <input type="text" class="datepicker" maxlength="10" /> <br />
				
				<a class="mousePointer btn medium bg-orange dateRange mrg20L" range="0" title="">
					<span class="button-content">오늘</span>
				</a>
				<a class="mousePointer btn medium bg-orange dateRange" range="-1d" title="">
					<span class="button-content">-1일</span>
				</a>
				<a class="mousePointer btn medium bg-orange dateRange" range="-2d" title="">
					<span class="button-content">-2일</span>
				</a>
				<a class="mousePointer btn medium bg-orange dateRange" range="-3d" title="">
					<span class="button-content">-3일</span>
				</a>
				<a class="mousePointer btn medium bg-orange dateRange" range="-4d" title="">
					<span class="button-content">-4일</span>
				</a>
				
				<a class="mousePointer btn medium bg-orange dateRange" range="-1m +1d" title="">
					<span class="button-content">-1개월 +1일</span>
				</a>
				
				<a class="mousePointer btn medium bg-orange dateRange" range="-1y" reverse="true" title="">
					<span class="button-content">-1년 뒤집기</span>
				</a>
			</div>
			
			<div id="divAjaxTest" class="mb40">
				<h4>ajax 예제 </h4>
				<button id="btnTest2">ajaxTest</button>	
			</div>
			
			<div id="divAjaxTest2" class="mb40">
				<h4>ajax 예제 2 - jquery oLoader plugin - SHA256 암호화</h4>
				<input type="text" id="txtPwd" /> <button id="btnTest3">암호화 테스트</button>
				<div id="divHash"></div>
			</div>
			
			<div class="mb40">
				<h4>자바 커스텀 태그 라이브러리 예제 (<strong class="font15"><a href="/test/locator">/test/locator</a></strong>)</h4>
				
				
				<div class="mb20">
					1. <span class="b font15">abbreviation</span> : &lt;tt:abbr&gt; <br />
					<tt:abbr length="20" value="${alphabet }" notation="!!!" /> <br />
					<tt:abbr length="25" value="${alphabet }" /> <br /><br />
					<tt:abbr length="20" value="${quot }" showTooltip="true" /> <br /><br />
				</div>
				
				<div class="mb20">
					2. <span class="b font15">selectBox &lt;tt:select&gt;</span> <br />
					<tt:select name="option1" id="option1" list="${listOpt1 }" listKey="value" listValue="text" selected="${search.option1 }"  /> <br /><br />
				</div>
				
				<div class="mb20">
					3. <span class="b font15">checkBox &lt;tt:checkboxes&gt;</span> <br />
					<tt:checkboxes name="option2" id="option2" list="${listOpt1 }" listKey="value" listValue="text" checked="${search.option2 }" /> <br /><br />
				</div>
				
				<div class="mb20">
					4. <span class="b font15">radio buttons &lt;tt:radios&gt;</span> <br />
					<tt:radios name="option3" id="option3" list="${listOpt1 }" listKey="value" listValue="text" checked="${search.option1 }"  /> <br /><br />
				</div>
				
				<div class="mb20">
					숫자만 입력 : <input type="text" class="onlyNumber mr20" />
					소수점. 마이너스 입력 <input type="text" class="onlyRealNumber mr20" />
				</div>
				
				<div class="mb20">
					대문자 변환 : <input type="text" class="toUpperCase mr20" />
				</div>
				
				
				<div id="middleTable" class="mb20">
					<h4>페이지 include 예제 : 스프링 action URL 사용 가능 : 모듈형 로직 적용 가능</h4>
					<div class="test">
<%-- <jsp:include page="/test/tile" flush="true">
	<jsp:param name="type1" value="A" />
</jsp:include> --%>
					</div>
				</div>
			</div>
			<div class="mb40">
				<h4>EL 기본객체</h4>
				<table>
					<colgroup>
						<col width="15%">
						<col width="*">
					</colgroup>
					<thead>
						<tr>
							<th>기본객체</th>
							<th>설명</th>
						</tr>						
					</thead>
					<tbody>
						<tr>
							<td>pageContext</td>
							<td>JSP의 page 기본 객체와 동일</td>
						</tr>
						<tr>
							<td>pageScope</td>
							<td> pageContext 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체</td>
						</tr>
						<tr>
							<td>requestScope</td>
							<td>request 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체 </td>
						</tr>
						<tr>
							<td>sessionScope</td>
							<td>session 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체 </td>
						</tr>
						<tr>
							<td>applicationScope</td>
							<td>application 기본 객체에 저장된 속성의 <속성, 값> 매핑을 저장한 Map 객체 </td>
						</tr>
						<tr>
							<td>param</td>
							<td>요청 파라미터의 <파라미터이름, 값> 매핑을 저장한 Map 객체, 타입은 String (request.getParameter(이름)의 결과와 동일)</td>
						</tr>
						<tr>
							<td>paramValues</td>
							<td>요청 파라미터의 <파라미터이름, 값 배열>매핑을 저장한 Map 객체, 타입은 String[] (request.getParameterValues(이름)의 결과와 동일)</td>
						</tr>
						<tr>
							<td>header</td>
							<td>요청 정보의 <헤더이름, 값> 매핑을 저장한 Map 객체 (request.getHeader(이름)의 결과와 동일)</td>
						</tr>
						<tr>
							<td>headerValues</td>
							<td>요청 정보의 <헤더이름, 값 배열> 매핑을 저장한 Map 객체 (request.getHeaders(이름)의 결과와 동일)</td>
						</tr>
						<tr>
							<td>cookie</td>
							<td><쿠키 이름, Cookie> 매핑을 저장한 Map 객체 (request.getCookies()로 구한 Cookie 배열로 부터 매핑을 생성)</td>
						</tr>
						<tr>
							<td>initParam</td>
							<td>초기화 파라미터의<이름, 값> 매핑을 저장한 Map 객체 (application.getInitParameter(이름)의 결과와 동일)</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>