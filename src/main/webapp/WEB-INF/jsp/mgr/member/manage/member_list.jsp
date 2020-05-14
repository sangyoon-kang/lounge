<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	회원 관리 > 회원등급 관리 - 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>
	<style>
		.board_st1 th {padding:5px 10px;}
		a.bt_modify {padding: 2px 6px 6px 6px}
	</style>
	<div class="scon_title">
		<h2>회원 관리</h2>
		<p>홈 &gt; 회원 관리 &gt; 회원 관리</p>
	</div>

	<div class="scon">

		<form id="form1">
			<div class="scon_search">
				<div class="search mb20 w100">
					<table class="mem_search">
						<colgroup>
							<col width="15%" />
							<col width="*" />
						</colgroup>
						<tbody>
						<tr>
							<th style="background: #e0f3fd;"><strong>조건검색</strong></th>
							<td>
								<tt:select list="${grade }" name="glevel" listKey="gradeLevel" listValue="gradeName" indexKey="0" indexValue="= 전체등급 =" selected="${search.glevel }" onchange="javascript:doSearch();"/>
								<tt:select list="${type2s}" name="type2" listKey="value" listValue="text" selected="${search.type2 }" />
								<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" />
								<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ml10">검색</a>
								<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a><br/>
							</td>
						</tr>
						<tr>
							<th style="background: #e0f3fd;"><strong>가입일</strong></th>
							<td>
								<input type="text" name="startDate" class="input_type2 datepicker" value="${search.startDate }" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a> ~
								<input type="text" name="endDate" class="input_type2 datepicker" value="${search.endDate }" /><a class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
							</td>
						</tr>
						</tbody>
					</table>
				</div>

				<span class="table_aside">전체 회원 수 : ${count } , 검색 회원 수 : ${search.totalCount } </span>
				<ul class="table_aside02">
					<!-- <li><a onclick="javascript:doDelete();" class="bt_green2">회원삭제</a></li> -->
					<!-- <li><a onclick="javascript:doSendPopup();" class="bt_green2">이메일발송</a></li>
                    <li><a onclick="javascript:void(0);" class="bt_green2">SMS</a></li> -->
					<li><a onclick="javascript:$.Nav('go', './member_excel.do', {glevel:${search.glevel }})" class="bt_boardmake">엑셀파일저장</a></li>
					<!-- <li><a onclick="javascript:doWrite(0);" class="bt_boardmake">회원등록</a></li> -->
				</ul>
			</div>
			<table class="board_st1 mb20">
				<colgroup>
					<col width="2%" />
					<col width="2%" />
					<col width="7%" />
					<col width="8%" />
					<col width="10%" />
					<col width="10%" />
					<col width="10%" />
					<col width="12%" />
					<col width="6%" />
					<col width="8%" />
					<col width="7%" />
					<col width="8%" />
					<col width="8%" />
				</colgroup>
				<thead>
				<tr>
					<th><input type="checkbox" id="checkAll" /></th>
					<th>회원번호</th>
					<th>등급</th>
					<th>이름</th>
					<th>아이디</th>
					<th>추천인</th>
					<th>휴대폰</th>
					<th>이메일</th>
					<th>방문수</th>
					<th>가입일</th>
					<th>거래조회</th>
					<th>입출금내역</th>
					<th>지원금내역</th>
				</tr>
				</thead>
				<tbody>
				<c:if test="${!empty list}">
					<c:forEach var="m" items="${list }" varStatus="s">
						<tr>
							<td><input type="checkbox" name="chkseq" value="${m.memberSeq }" /></td>
							<td>${m.memberSeq }</td>
							<td>${m.gradeName }</td>
							<td><a href="javascript:doWrite(${m.memberSeq })">${m.userName }</a></td>
							<td><a href="javascript:doWrite(${m.memberSeq })">${m.userId }</a></td>
							<td>${m.recommNickname }</td>
							<td>${m.phone }</td>
							<td>${m.email}</td>
							<td>${m.loginCount}</td>
							<td><fmt:formatDate value="${m.regDate }" pattern="${DATE_FORMAT }"/></td>
							<td><a onclick="javascript:showHistory('${m.userId }');" class="bt_modify">거래조회</a></td>
							<td><a onclick="javascript:showDepositHistory('${m.userId }');" class="bt_modify">입출금내역</a></td>
							<td><a onclick="javascript:showSupportCashHistory('${m.userId }');" class="bt_modify">지원금내역</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${empty list}">
					<tr>
						<td colspan="11"><s:message code="common.noData" /></td>
					</tr>
				</c:if>
				</tbody>
			</table>
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			<!-- <hr class="memhr" />
            <a onclick="javascript:doDelete();" class="btn btn_round bg_darkgray">회원삭제</a>
            <a onclick="javascript:doSendPopup();" class="btn btn_round bg_darkgray">이메일발송</a> -->
		</form>
	</div>
</div>
<!--wrap_scon E-->
<c:set var="delete"><s:message code="common.delete.msg" /></c:set>
<script type="text/javascript">
	$('.searchWord').on('keydown',function(event){
		if(event.keyCode == '13'){
			event.preventDefault();
			doSearch();
		}
	})
	$(function() {
		$('#checkAll').click(function(){
			if ($(this).prop('checked'))
				$('input[name=chkseq]').prop('checked', true);
			else
				$('input[name=chkseq]').prop('checked', false);
		});
	});

	function showHistory(userId) {
		openPop('?userId=' + userId, 'memberhistory');
	}

	function showDepositHistory(userId) {
		openPop('?userId=' + userId, 'memberDepositHistory');
	}

	function showSupportCashHistory(userId) {
		openPop('?userId=' + userId, 'memberSupportCashHistory');
	}

	function doSendPopup() {
		var chk = '';
		if (!$('input[name=chkseq]:checked').val()) {
			alert('회원을 선택해주세요.');
			return;
		}

		$('input[name=chkseq]').each(function(idx){
			if ($(this).prop('checked')) {
				chk += '&chkseq=' + $(this).val();
			}
		});

		openPop('?' + chk, 'memberSendEmail');
	}

	function doWrite(seq) {

		$.Nav('go', './member_write.do', {mseq:seq});
	}

	function doDelete() {
		var sMsg = '${delete}';

		if (!$('input[name=chkseq]:checked').val()){
			alert('삭제할 회원을 선택하세요.');
			return;
		}

		if (!confirm(sMsg))
			return;
		var sUrl = './member_proc.do';
		var sParam = $.Nav('getSearch', {status:'d'});
		$('#form1').attr('action', sUrl + sParam);
		$('#form1').attr('method', 'post');
		$('#form1').submit();
	}

	function doSearch() {
		$('#form1').attr('action', './member_list');
		$('#form1').attr('method', 'get');
		$('#form1').submit();
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>