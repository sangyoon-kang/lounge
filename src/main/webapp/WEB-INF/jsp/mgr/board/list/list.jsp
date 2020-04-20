<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판별 게시물 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style>
ul.faq {margin-top:20px; border-top:1px solid #000;}
ul.faq li {border-bottom:1px solid #E0E0E0; }
ul.faq li.faq_q {padding-left:70px; font-size:13px; line-height:45px;}
ul.faq li.faq_q a {display:block;}
ul.faq li.faq_q:hover { background:#f8f8f8 ;}
ul.faq li.on {padding-left:70px; font-size:13px; line-height:45px; color:#fff; background:#A4A4A4;}
ul.faq li.on a {color:#fff;}
ul.faq li.faq_a {padding:15px 15px 15px 70px; line-height:20px; background:#f8f8f8;}
.faq li .ic_q { background: #a8a8a8;}
.faq li .ic_a { background: #e74c4c;}
.faq li .ic_q, .faq li .ic_a {float: left; margin: 0 40px; width: 30px; height: 30px; font-size: 14px; line-height: 30px; text-align: center; color: #fff; font-weight: bold; border-radius: 50%;}
.faq li p.faq_body {overflow-wrap: break-word; word-wrap: break-word;} 
</style>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>${bm.boardName }</h2>
		<p>홈 &gt; 게시판 관리 &gt; ${bm.boardName }</p>
	</div>

	<div class="scon">

	<form id="form1" action="./${bm.boardCode }" method="get">
		<div class="mb10">전체 게시물 수 : <fmt:formatNumber value="${search.totalCount }" pattern="#,###" /></div>
		<div class="scon_search">
			<div class="search mb10">
				<select name="type1">
					<option value="">제목 + 내용</option>
					<option value="subject">제목</option>
					<option value="body">내용</option>
					<option value="username">이름 + 닉네임</option>
					<option value="id">아이디</option>
				</select>
				<input type="text" name="searchWord" class="input_type1 searchWord" value="${search.searchWord }" /> 
				<a id="btnSearch" onclick="javascript:doSearch();" class="btn bg_pink ml10">검색</a>
				<a id="btnSearchInit" onclick="javascript:$.Nav('self', null, null, true);" class="btn bg_pink ml10">검색 초기화</a>
			</div>
		</div>
		<script>
		$(function() {
			var sType1 = '${search.type1}'; 
			if (sType1 != '')
				$('select[name=type1]').val(sType1);
		}); 
		</script>
		
<c:if test="${!empty listBCs and bm.boardTypeFixedCode ne '001004'}">		
		<div class="tab mb5">
	<c:set var="tabClass" value="" />

		<c:if test="${empty search.bcseq || search.bcseq eq 0}">
			<c:set var="tabClass" value=" bold sky" />
		</c:if>
			<span class="mr10${tabClass }"><a onclick="javascript:$.Nav('self', {bcseq: ''});">전체</a></span>

	<c:forEach items="${listBCs }" var="c">
		<c:set var="tabClass" value="" />
		<c:if test="${search.bcseq eq c.bcSeq}">
			<c:set var="tabClass" value=" bold sky" />
		</c:if>
			<span class="mr10${tabClass }"><a onclick="javascript:$.Nav('self', {bcseq: '${c.bcSeq}'});">${c.cateName }</a></span>
	</c:forEach>
		</div>
</c:if>
<c:if test="${empty listBCs}">	
	<div class="tab mb5">
		<span class="mr10"></span>
	</div>
</c:if>
			
<c:if test="${bm.boardTypeFixedCode eq '001001' or bm.boardTypeFixedCode eq '001002' or bm.boardTypeFixedCode eq '001003' or bm.boardTypeFixedCode eq '001008' }">
		<table class="board_st1">
			<colgroup>
				<col width="5%" />
				<col width="5%" />
				<col width="10%" />
				<col width="*" />
				<col width="10%" />
				
				<col width="12%" />
				<col width="7%" />
				<col width="8%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="chkAll"  /> </th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					
					<th>작성일</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="m" varStatus="s">
				<tr>
					<td class="first">
						<input type="checkbox" name="chks" value="${m.boardSeq }" />
					</td>
					<td>${search.paging.virtualNumber - s.index }</td>
					<td>${m.cateName }
						
					</td>
					<td class="left">
						<a href="javascript:$javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${m.boardSeq }'});"><tt:abbr length="${bm.subjectCharCount}" value="${m.subject }"/></a>
						<c:if test="${!empty m.answer }">
							<span class="bg_green">답현완료</span>
						</c:if>
					</td>
					<td>
			<c:choose>
				<c:when test="${bm.writerFormatFixedCode eq '002001'}">
							<!-- 이름 -->
							${m.userName }
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002002'}">
							<!-- 닉네임 --> 
							${m.nickname }
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002003'}">
							<!-- 닉네임(이름) -->
							${m.nickname }(${m.userName })
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002004'}">
							<!-- 이름(아이디) --> 
							${m.userName }(${m.regUser })
				</c:when>
				<c:when test="${bm.writerFormatFixedCode eq '002005'}">
							<!-- 닉네임(아이디) --> 
							${m.nickname }(${m.regUser })
				</c:when>
				<c:otherwise>
							${m.regUser }
				</c:otherwise>
			</c:choose>
					</td>
					<td>
						<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
					</td>
					<td><fmt:formatNumber value="${m.readCount }" pattern="#,###" /></td>
					<td>
						<fmt:formatNumber value="${m.recommCount }" pattern="#,###" /> - <fmt:formatNumber value="${m.notRecommCount }" pattern="#,###" />
					</td>
				</tr>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
				<tr>
					<td colspan="8"><s:message code="common.noData" /></td>
				</tr>
	</c:if>
			</tbody>
		</table>
</c:if>

	<div class="inner mT30">
<c:if test="${bm.boardTypeFixedCode eq '001005' }">
		<div id="tab01" style="display:block">
				<div class="inner"></div>
				<ul class="m_port">
	<c:if test="${!empty list}">
		<c:forEach items="${list }" var="l">
					<li>
						<p class="port_img">
							<a href="${l.linkUrl }" target="_blank">
								<img src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지" width="100%" height="100%" />
							</a>
						</p>
						<p class="ex"><tt:abbr length="${bm.subjectCharCount}" value="${l.subject }"/></p>
						<p class="ex">
							<a href="${l.linkUrl }" target="_blank"><tt:abbr length="25" value="${l.linkUrl }"/></a>							
						</p>
						<p class="sb">
							<input type="checkbox" name="chks" value="${l.boardSeq }" />
							<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn_round bg_blue btnh_22">수정</a>
							<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn_round bg_red btnh_22">삭제</a>
						</p>
					</li>
		</c:forEach>
	</c:if>
	<c:if test="${empty list}">
					<li class="w100">
						<s:message code="common.noData" />
					</li>
	</c:if>
				</ul>
			</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001006' }">
			<div id="tab01" style="display:block">
				<div class="inner"></div>
				<ul class="m_port">
	<c:forEach items="${list }" var="l">
					<li style="width: ${(93-(bm.lfCount*2))/bm.lfCount}% !important;  height: 100%;" >
						<p class="port_img" >
							<a  href="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});">
								<img src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지" width="100%" height="100%" />
							</a>
						</p>
						<p class="ex">
							<a href="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="thumbnail"><tt:abbr length="${bm.subjectCharCount}" value="${l.subject }"/></a>
						</p>
						<p class="sb">
							<input type="checkbox" name="chks" value="${l.boardSeq }" />
							<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn_round bg_blue btnh_22">수정</a>
							<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn_round bg_red btnh_22">삭제</a>
						</p>
					</li>
	</c:forEach>
	<c:if test="${empty list}">
					<li class="w100">
						<s:message code="common.noData" />
					</li>
	</c:if>
				</ul>
			</div>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001004' }">
	<div id="tab01" style="display:block">
		<div class="inner"></div>
		<ul class="nor_tab2">
	<c:set var="classOn" value=""/>
	<c:if test="${search.bcseq eq 0 or empty search.bcseq}">
		<c:set var="classOn" value="on"/>
	</c:if>
	
			<li>
				<a href="javascript:$.Nav('self', {bcseq:'0'});" class="${classOn }">전체</a>
			</li>
			
	<c:forEach items="${bm.boardCategoryVO }" var="l">			
		<c:set var="classOn" value=""/>
		<c:if test="${search.bcseq eq l.bcSeq }">
			<c:set var="classOn" value="on"/>
		</c:if>				
			<li>
				<a href="javascript:$.Nav('self', {bcseq:'${l.bcSeq }'});" class="${classOn }">${l.cateName }</a>
			</li>

	</c:forEach>
		</ul>
		
		<div class="inner2">
			<ul class="faq">
	<c:forEach items="${list }" var="l" varStatus="s">
				<li class="faq_q"><p class="ic_q">Q</p>
					<a href="javascript:doViewAnser('${s.count }');" style="display: inline-block; word-wrap: break-word; -ms-word-wrap: break-word; -ms-word-break: break-all;" ><span>${l.subject }</span></a>
					<span class="fright">
						<input type="checkbox" name="chks" value="${l.boardSeq }" />
						<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}', {bseq: '${l.boardSeq }'});" class="btn btn_round bg_blue btnh_22" style="display: inline-block;">수정</a>
						<a onclick="javascript:doDelete('${l.boardSeq }', '${l.boardCode }');" class="btn btn_round bg_red btnh_22" style="display: inline-block;">삭제</a>
					</span>	
				</li>
				<li class="faq_a" id="faq_a${s.count }" style="display:none;">
				<p class="ic_a ">A</p>
				<p class="faq_body" style="word-break: break-word;">${l.body }</p>
				</li>
	</c:forEach>

	<c:if test="${empty list }">
				<li class="faq_q">조회된 결과가 없습니다.</li>
	</c:if>
			</ul>
		</div>
	</div>
</c:if>

</div>
		<br class="clear mb5" />
		<div>
			<div class="fl">
				<a onclick="javascript:doSelect('${bm.boardCode}', 'delete');" class="btn bg_green">선택삭제</a>
				<a onclick="javascript:doSelect('${bm.boardCode}', 'copy');" class="btn bg_green">선택복사</a>
				<a onclick="javascript:doSelect('${bm.boardCode}', 'move');" class="btn bg_green">선택이동</a>
			</div>
			<div class="fr">
				<a onclick="javascript:$.Nav('go', '../write/${bm.boardCode}');" class="btn bg_blue">글쓰기</a>
			</div>
		</div>
		<br class="clear mb5" />
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		<br class="clear mb5" />
	</form>
		게시판 유형 : ${bm.boardTypeFixedCode } : ${bm.boardTypeFixedCodeName }<br/>
		게시판 css 이름 : ${bm.cssPrefix }<br/>
		카테고리 개수: ${fn:length(bm.boardCategoryVO) }<br/>
		게시판 관리자 : ${bm.boardAdmin }<br/>
				
	</div>
</div>
<!--wrap_scon E-->

<script type="text/javascript">
	$(function() {
		$('#chkAll').change(function() {
			$('input[name=chks]').prop('checked', $(this).is(':checked'));
		});
	});

	function doViewAnser(idx) {
		$faq_a = eval('$("#faq_a' + idx + '")');
		if ($faq_a.css('display') == 'none') {
			$faq_a.css('display', 'inherit');
		} else {
			$faq_a.hide();
		} 
	}
	
	function doSearch() {
		var sType1 = $('select[name=type1]').val();
		var sSearchWord = $('input[name=searchWord]').val();
		$.Nav('go', location.pathname, {
			'type1' : sType1,
			'searchWord' : sSearchWord
		});
	}
	
	function doSelect (bcode, mode) {
		
		if (!$('input[name=chks]').is(':checked')) {
			alert('상품을 선택해 주세요');
			return;
		}
		
		var bseqs = new Array();
		$('input[name=chks]').each(function() {
			if ($(this).prop('checked')) {
				bseqs.push($(this).val());
			}
		});
		
		if (mode == 'delete') {
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			$.Nav('go', '../proc.do', {status : 'd', bseqs : bseqs, bcode : bcode });
			
		} else {
			openPop('?bseqs=' + bseqs + '&bcode=' + bcode + '&mode='+mode, 'boardCategory');
		}
	}
	
	/* function doDelete (bSeq, bCode) {
		if (bSeq == '') {
			if (!$('input[name=chks]').is(':checked')) {
				alert('삭제할 상품을 선택해 주세요');
				return;
			}
			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			var bseqs = new Array();
			$('input[name=chks]').each(function() {
				if ($(this).prop('checked')) {
					bseqs.push($(this).val());
				}
			});
			
			$.Nav('go', '../proc.do', {status : 'd', bseqs : bseqs, bcode : bCode });		
			
		} else {			
			if (!confirm('삭제하시겠습니까?')) {
				return;
			}
			
			$.Nav('go', '../proc.do', {bseq : bSeq, status : 'd', bcode : bCode });
		}		
	} */
	
	function doDelete (bSeq, bCode) {
		if (!confirm('삭제하시겠습니까?')) {
			return;
		}
		
		$.Nav('go', '../proc.do', {bseq : bSeq, status : 'd', bcode : bCode });
	}	
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>