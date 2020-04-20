<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	상품 관리 - 상품 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb.do" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb.do" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>상품 관리</h2>
		<p>홈 &gt; 상품 관리 &gt; 상품 관리</p>
	</div>

	<div class="scon">
	
		<form id="form1" action="./prd_list.do">
			<div class="scon_search">
<%-- 				<div class="mb5">
					<tt:select list="${listGroup }" name="type1" listKey="groupSeq" listValue="groupName" indexKey="" indexValue="= 카테고리1 =" />
					<tt:select list="${listGroup }" name="type1" listKey="groupSeq" listValue="groupName" indexKey="" indexValue="= 카테고리2 =" />
				</div>
 --%>				<div class="search mb20">
					<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
					<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink">검색</a>
					<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
				</div>
				<span class="table_aside">상품 수 : ${search.totalCount } / ${count } </span>
				<ul class="table_aside02">
					<li>
						<a onclick="javascript:$.Nav('go', './prd_write.do', {prdseq: ''});" class="btn btn_round bg_purple">상품 추가</a>
					</li>
				</ul>
			</div>
		
			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="10%" />
					<col width="*" />
					<col width="9%" />
					
					<col width="7%" />
					<col width="10%" />
					<col width="18%" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll"  /></th>
						<th>번호</th>
						<th>카테고리</th>
						<th>상품명</th>
						<th>상품 코드</th>
						
						<th>스킨</th>
						<th>상품 요약</th>
						<th>기능</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="l" varStatus="s">
					<tr>
						<td>
							<input type="checkbox" name="checkPrd" value="${l.prdSeq } ">
						</td>
						<td>${search.paging.virtualNumber - s.index }</td>
						<td>${l.categoryName }</td>
						<td>${l.prdName }</td>
						<td>${l.productCode }</td>
						<td>${l.cssPrefix }</td>
						<td>${l.summary }	</td> 
						<td>
							<a onclick="javascript:$.Nav('go', './prd_write.do', {prdseq: '${l.prdSeq}'});" class="btn btn_round bg_blue btnh_22">수정</a>
							<a onclick="javascript:doDelete('${l.prdSeq }');" class="btn btn_round bg_red btnh_22">삭제</a>
						</td>
					</tr>
			</c:forEach>				
			
			<c:if test="${empty list }">
					<tr>
						<td colspan="8"><s:message code="common.noData" /></td>
					</tr>
		</c:if>
				</tbody>
			</table>
			<br class="clear mb5" />
			<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
			<br class="clear mb5" />
			
			<div>
				<div class="fl">
					<a onclick="javascript:doDelete('');" class="btn bg_green">선택삭제</a>
					<!-- <a class="btn bg_green">상품이동</a>
					<a class="btn bg_green">상품복사</a> -->
				</div>
			</div>
			<br class="clear mb5" />
		</form>
		
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	function doSearch() {
		$('#form1').submit();	
	}
	
	$('#checkAll').change(function() {
		$('input[name=checkPrd]').prop('checked', $(this).is(':checked'));
	});
	
	function doOrderingUpdate(prdSeq, ordering, type) {
		$.Nav('go', './prd_ordering_update.do', {prdSeq: prdSeq, ordering : ordering, type : type});	
	}
	
	function doDelete (prdSeq) {
		if (prdSeq == '') {
			if (!$('input[name=checkPrd]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			var prdseqs = new Array();
			$('input[name=checkPrd]').each(function() {
				if ($(this).prop('checked')) {
					prdseqs.push($(this).val());
				}
			});
			
			$.Nav('go', './prd_proc.do', {status : 'd', prdseqs : prdseqs });		
			
		} else {			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			
			$.Nav('go', './prd_proc.do', {prdseq : prdSeq, status : 'd' });
		}		
	}
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>