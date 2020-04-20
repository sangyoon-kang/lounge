<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>
<style>
.board_write th {
	background: #F7F7F7;
}

.board_st1 th {
	background: #6F7784;
	color: #fff;
}

div.search {
	margin-bottom:0px;
}
</style>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>코멘트 통합관리</h2>
		<p>홈 &gt; 게시판 관리 &gt; 코멘트 통합관리</p>
	</div>
	<div class="scon">
		<form id="formSearch" name="formSearch" action="./comment_list"
			enctype="multipart/form-data">
			<div class="scon_search">
				<div class=" mb10">
					<table class="board_write">
						<colgroup>
							<col width="15%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>게시판별 보기</th>
								<td><tt:select list="${bmList }" id="bcode" name="bcode"
										listKey="boardCode" listValue="boardName" indexKey=""
										indexValue="전체" selected="${search.bcode }" /></td>
							</tr>
							<tr>
								<th>등록일</th>
								<td><input type="text" name="startDate"
									class="input_type2 datepicker" value="${search.startDate }" /><a
									class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									~ <input type="text" name="endDate"
									class="input_type2 datepicker" value="${search.endDate }" /><a
									class="datepicker ml5"><img src="/images/ic_calender.png" /></a>
									<input type="button"
									class="btn bg_gray ${search.type2 == 'today' ? 'bg_green' : ''} dateFilter"
									data-id="today" value="오늘" /> <input type="button"
									class="btn bg_gray ${search.type2 == 'yesterday' ? 'bg_green' : ''} dateFilter"
									data-id="yesterday" value="어제" /> <input type="button"
									class="btn bg_gray ${search.type2 == 'week' ? 'bg_green' : ''} dateFilter"
									data-id="week" value="1 주일" /> <input type="button"
									class="btn bg_gray ${search.type2 == 'month' ? 'bg_green' : ''} dateFilter"
									data-id="month" value="1 개월" /> <input type="hidden"
									id="type2" name="type2" value="" /></td>
							</tr>
							<tr>
								<th>키 워 드 검색</th>
								<td>
									<div class="search">
										<select name="type1" id="type1">
											<option value="">제목 + 코멘트</option>
											<option value="id">Registered User</option>
											<option value="body">Body</option>
											<option value="type">Status</option>
											<!-- <option value="username">이름 + 닉네임</option>
				<option value="id">아이디</option> -->
										</select> <input ${search.type1 == 'type' ? 'hidden': ''} type="text"
											name="searchWord" class="input_type1 searchWord"
											value="${search.type1 != 'type' ? search.searchWord : ''}"
											id="searchWord" /> <select id="Fstatus"
											${search.type1 == 'type' ? '': 'hidden'}>
											<option value="">---</option>
											<option ${search.searchWord == '009000' ? 'selected' : ''}
												value="009000">PUBLISH</option>
											<option ${search.searchWord == '009001' ? 'selected' : ''}
												value="009001">UNPUBLISH</option>
										</select>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<br class="clear mb5" />
					<div>
						<div class="right">
							<a id="btnSearch" onclick="javascript:doSearch();"
								class="btn bg_blue">검색하기</a> <a id="btnSearchInit"
								onclick="javascript:$.Nav('self', null, null, true);"
								class="btn bg_blue ml10">검색 초기화</a>
						</div>
					</div>
					<span class="table_aside">전체 게시물 수 : <fmt:formatNumber
							value="${search.totalCount }" pattern="#,###" /></span>
				</div>
			</div>
			<table class="board_st1">
				<colgroup>
					<col width="5%" />
					<col width="5%" />
					<col width="10%" />
					<col width="*" />
					<col width="8%" />
					<col width="10%" />
					<col width="10%" />
					<col width="30%" />
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="chkDAll" /></th>
						<th>번호</th>
						<th>코멘트위치</th>
						<th>코멘트내용</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>IP</th>
						<th>수정 | 삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${!empty list}">
						<c:forEach items="${list }" var="m" varStatus="s">
							<tr>
								<td class="first"><input type="checkbox" name="chksD"
									value="${m.commentSeq }" /></td>
								<td>${search.paging.virtualNumber - s.index }</td>

								<td>${m.boardCode }</td>
								<td>${m.body }</td>
								<td>${m.regUser }</td>
								<td><fmt:formatDate value="${m.regDate }"
										pattern="${m.dateFormatList }" /></td>
								<td><fmt:formatNumber value="${m.ipAddr }" pattern="#,###" /></td>
								<td><a
									onclick="javascript:$.Nav('go', './comment_stat.do', {commentSeq : '${m.commentSeq}', displayYn : 'Y' });"
									class="publishYn btn btn_round ${m.displayYn == 'Y' ? 'bg_blue' : 'bg_red'}  btnh_22">보이기</a>
									<a
									onclick="javascript:$.Nav('go', './comment_stat.do', {commentSeq : '${m.commentSeq}', displayYn : 'N' });"
									class="publishYn btn btn_round ${m.displayYn == 'N' ? 'bg_blue' : 'bg_red'} btnh_22">숨기기</a>
									<a onclick="javacript:doDelete('${m.commentSeq }');"
									class="btn btn_round bg_red btnh_22">삭제</a></td>
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
		</form>
		<br class="clear mb5" />
		<div>
			<div class="fl">
				<a class="btn bg_gray ml5 selectALl" data-id="nocheck">&#10003;
					전쳬선택</a> <a class="btn bg_gray ml5 selectALl">&#9866; 전쳬해재</a> <a
					onclick="javascript:doDelete('');" class="btn bg_gray ml5">&#10006;
					선택삭제</a>
			</div>
		</div>
		<%@ include file="/WEB-INF/jsp/common/inc-paging-admin.jsp"%>
		<br class="clear mb5" />

		<c:set var="delete">
			<s:message code="common.delete.msg" />
		</c:set>

		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->

		<script type="text/javascript">
			//Jquery Code
			$(document).ready(
					function() {
						$('#chkDAll').change(
								function() {
									$('input[name=chksD]').prop('checked',
											$(this).is(':checked'));
								});
					});
			/* $('a[data-toggle="tab"]').on('click', function(e) {
				let id = $(this).attr('id');
				$.Nav('go', './comment_list', {
					activeTab : id
				}, null, true);
			}); */

			$('#type1').on('focusout', function(e) {
				if ($(this).val() === 'type') {
					$('#Fstatus').show();
					$('#searchWord').hide();
				} else {
					$('#Fstatus').hide();
					$('#searchWord').show();
				}
			});

			$('#Fstatus').on('focusout', function(e) {
				$('#searchWord').val($(this).val())
			});

			$('.dateFilter').on(
					'click',
					function(e) {
						$('input[name=startDate]').val('');
						$('input[name=endDate]').val('');
						$(this).toggleClass(
								'bg_green',
								function() {
									$(this).hasClass('bg_green') ? $('#type2')
											.val($(this).data('id')) : $(
											'#type2').val('');
								}).siblings().removeClass('bg_green');
					});

			$('.selectALl').on(
					'click',
					function(e) {
						$('input[name=chksD]').prop(
								'checked',
								(($(this).data('id') == 'nocheck') ? true
										: false));
					})

			//Javascript
			function doDelete(seq) {
				var sMsg = '${delete}';
				if (seq) {
					if (!confirm(sMsg))
						return;
					$.Nav('go', './comment_proc', {
						commentSeq : seq,
						status : 'd'
					});
				} else {
					if (!$('input[name=chksD]').is(':checked')) {
						alert('삭제할 상품을 선택해 주세요');
						return;
					}
					if (!confirm(sMsg))
						return;

					const bseqs = new Array();
					$('input[name=chksD]').each(function() {
						if ($(this).prop('checked')) {
							bseqs.push($(this).val());
						}
					});

					$.Nav('go', './comment_proc', {
						status : 'd',
						bseqs : bseqs
					});
				}

			}

			/* function doAccept(seq, code) {
				const accform = document.formAccept;
				accform.commentSeq.value = seq;
				accform.statusFixedCode.value = code;
				accform.submit();
			}

			function doPublish() {
				if (!$('input[name=chksF]').is(':checked')) {
					alert('삭제할 상품을 선택해 주세요');
					return;
				}
				var bseqs = new Array();
				$('input[name=chksF]').each(function() {
					if ($(this).prop('checked')) {
						bseqs.push($(this).val());
					}
				});
				$("<div><p>Selected Comments : " + bseqs.length + "</p></div>")
						.dialog({
							resizable : false,
							title : 'Publish to Board',
							height : 140,
							modal : true,
							buttons : {
								"PUBLISH" : function() {
									$(this).dialog("close");
									$.Nav('go', './comment_stat.do', {
										bseqs : bseqs,
										statusFixedCode : '009000'
									});
								},
								"UNPUBLISH" : function() {
									$(this).dialog("close");
									$.Nav('go', './comment_stat.do', {
										bseqs : bseqs,
										statusFixedCode : '009001'
									});
								}
							}
						});
			} */
			function doSearch() {
				document.formSearch.submit();
			}
		</script>

	</div>

</div>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>