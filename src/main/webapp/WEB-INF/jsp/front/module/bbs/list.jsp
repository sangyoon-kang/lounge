<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<style>
	.inner p {display:inline-block ;}
</style>
<%--
		게시판 모듈 - 목록
 --%>
<%-- <c:if test="${bm.boardTypeFixedCode eq '001001' or bm.boardTypeFixedCode eq '001002' or bm.boardTypeFixedCode eq '001003'}">
			<div class="board_ser mT15">
				<form id="formSearch" action="" method="post">
					<select name="type1">
						<option value="subject">제목</option>
						<option value="body">내용</option>
						<option value="id">글쓴이</option>
					</select>
					<script>
						$(function() {
							var sType1 = '${search.type1}'; 
							if (sType1 != '')
								$('select[name=type1]').val(sType1);
						});
					</script>
					<input type="text" id="searchWord" name="searchWord" class="input_txt mL3 searchWord" value="${search.searchWord }"/>
					<a id="btnSearch" href="javascript:doSearch();" class="btn_ser mL3">검색</a>
				</form>
			</div>
			<table class="board_list mT15">
				<thead>
					<tr>
						<th class="acen" width="100px">순번</th>
						<th class="acen" width="*">제목</th>
						<th class="acen" width="150px">등록자</th>
						<th class="acen" width="130px">등록일</th>
					</tr>
				</thead>
	<c:forEach var="m" items="${list }" varStatus="s">				
					<tr>
						<td>${search.paging.virtualNumber - s.index }</td>
						<td class="sb">
							<a href="javascript:doView('${m.boardSeq }', '${m.regUser }', '${m.secretYn }', '${bm.autoSecretYn }');">
								${m.subject }
		<c:if test="${m.secretYn eq 'Y' or bm.autoSecretYn eq 'Y'}">
							<img class="mL3" src="/images/ic_lock.png"/>
		</c:if>								
							</a>
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
					</tr>
	</c:forEach>
	<c:if test="${empty list}">
					<tr>
						<td colspan="4"><s:message code="common.noData" /></td>						
					</tr>
	</c:if>
				</tbody>
			</table>
</c:if> --%>
<c:if test="${bm.boardTypeFixedCode eq '001001' or bm.boardTypeFixedCode eq '001002' or bm.boardTypeFixedCode eq '001003' or bm.boardTypeFixedCode eq '001008'}">
      	<c:if test="${ bm.boardTypeFixedCode eq '001003'}">
      		<input type="hidden" name="reguser" value="${search.reguser}"/>
      	</c:if>

<section class="wrap_scon">

		<div class="scon">
			<!--board_search_type04-->
			<div class="board_search_type04" style="margin-bottom:0;">
				<div class="custom-select">
				  <select name="searchType">
				  <c:forEach items="${BoardSearchType}" var="m" varStatus="s">
								<option ${search.searchType eq m.value ? 'selected' : ''} value="${m.value }">${m.text }</option>
							</c:forEach>
				  <%-- <tt:select class="" list="${BoardSearchType }" name="searchType" listKey="value" listValue="text" selected="${search.searchType }"/> --%>
					
				  </select>
				</div>
				<c:choose>
							<c:when test="${bm.writerFormatFixedCode eq '002001'}">
								<!-- 이름 --> 
								<input type="hidden" name="type1" value="userName" data-id="userName" /> 
							</c:when>
							<c:when test="${bm.writerFormatFixedCode eq '002002'}">
								<!-- 닉네임 --> 
								<input type="hidden" name="type1" value="nickName" data-id="nickName" /> 
							</c:when>
							<c:when test="${bm.writerFormatFixedCode eq '002003'}">
								<!-- 닉네임(이름) --> 
								<input type="hidden" name="type1" value="nickUserName" data-id="nickUserName" /> 
							</c:when>
							<c:when test="${bm.writerFormatFixedCode eq '002004'}">
								<!-- 이름(아이디) --> 
								<input type="hidden" name="type1" value="regUserName" data-id="regUserName" /> 
							</c:when>
							<c:when test="${bm.writerFormatFixedCode eq '002005'}">
								<!-- 닉네임(아이디) --> 
								<input type="hidden" name="type1" value="nickRegName" data-id="nickRegName" /> 
							</c:when>
							<c:otherwise>
								<input type="hidden" name="type1" value="regUser" data-id="regUser" /> 
							</c:otherwise>
						</c:choose>		
						<script>
							$(function() {
								var sType1 = '${search.type1}'; 
								if (sType1 != '')
									$('input[name=type1]').val(sType1);
							}); 
						</script>
						
						
				<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요" value="${search.searchWord }"/>
				<button onclick="javascript:doSearch();" class="btn dark-grey input-group-append">검색</button>
			</div>
			<!--//board_search_type04-->

			<!--list_basic_type01-->
			<div class="board_basic_type01 board_basic_type01_01">
				<table>
					
					<thead>
						<tr>
						<th class="acen" width="100px">순번</th>
						<th class="acen" width="*">제목</th>
						<th class="acen" width="150px">등록자</th>
						<th class="acen" width="130px">등록일</th>
							
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list }" varStatus="s">				
								<tr>
									<td><c:if test="${m.noticeYn eq 'Y' }">
										<img src="/images/contents/ico_notice.png">
										</c:if>
										<c:if test="${m.noticeYn ne 'Y' }">
										${search.paging.virtualNumber - s.index }
										</c:if>
									</td>
									<td class="td_left title">
										<c:if test="${!empty m.answer}">
											<span class="txt_blue" style="margin-right:10px">답변완료</span>
										</c:if>
										<c:choose>
											<c:when test="${m.secretYn == 'Y' && m.userName != tagoplusSolution1_session_user.userName }">
												<p class="txt_lock">비밀글 입니다.<img src="/images/contents/ico_key.png" alt="자물쇠" class="ico_key"></p>
											</c:when>
											<c:otherwise>
												<a href="javascript:doView('${m.boardSeq }', '${m.regUser }', '${m.secretYn }', '${bm.autoSecretYn }');">${m.subject }</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td class="reg_user">
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
									<td class="reg_date">
										<fmt:formatDate value="${m.regDate }" pattern="${bm.dateFormatList }"/>
									</td>
								</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<!--//list_basic_type01-->
			
			<div class="board_bt_set01 mb30">
				<c:if test="${bm.authWrite eq 0 or bm.authWrite ge tagoplusSolution1_session_user.gradeLevel }">
					
					
						<a href="javascript:doWrite();" class="bt_list">글쓰기</a>
					
				</c:if>
			</div>
			<%@ include file="/WEB-INF/jsp/common/tp_new_paging/inc-paging-front.jsp"%>
			
			<!--page_nv_type01-->
			
			<!--//page_nv_type01-->
		</div>
	</section>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001004' }">
	

<section class="wrap_scon">
	<div class="scon">
		<c:if test="${!empty bm.boardCategoryVO}">
			<ul class="board_tab_sty01">
				<c:set var="classOn" value=""/>
				<c:if test="${search.bcseq eq 0 or empty search.bcseq}">
					<c:set var="classOn" value="on"/>
				</c:if>
				<li onclick="javascript:$.Nav('self', {bcseq:'0'},{cpage:'0'});" class="${search.bcseq eq 0 ? 'current' : ''}">
					전체
				</li>	
				<c:forEach items="${bm.boardCategoryVO }" var="l">			
					<c:set var="classOn" value=""/>
					<c:if test="${search.bcseq eq l.bcSeq }">
						<c:set var="classOn" value="on"/>
					</c:if>		
						
					<li class="${search.bcseq eq l.bcSeq ? 'current' : ''}" id="tab1" onclick="javascript:$.Nav('self', {bcseq:'${l.bcSeq }'},{cpage:'0'});">
						${l.cateName } 
					</li>
				</c:forEach>
			</ul>
		</c:if>
		
		
			
			<div id="board-tab-1" class="board-tab-content current">
				<!--board_basic_faq_type01-->
				<div class="board_basic_faq_type01">
					<ul>
					<c:forEach items="${list }" var="l" varStatus="s">
						<li>
							 <div class="board_basic_faq_q">
								<a href="#" class="accordion break"><span class="icon">Q </span>${l.subject }</a>
								
								<div class="plus-minus-toggle"></div>
							</div>
							<div class="board_basic_faq_a">
								 <span class="icon" >A </span><span class="break">${l.body}</span>
							</div> 
							<%-- <div class="board_basic_faq_q">
								<h3>${l.subject }</h3>
								<div class="plus-minus-toggle"></div>
							</div>
							<div class="board_basic_faq_a">
								<p>${l.body}</p> 
							</div>--%>
						</li>
						
						</c:forEach>
						
						<c:if test="${empty list }">
							<li class="text-center bt-1-light-grey bb-1-light-grey pt-2 pb-2">조회된 결과가 없습니다.</li>
						</c:if>
					</ul>
				
				</div>
				

				
			</div>


		
			
	<div>
</section>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001005' }"><%-- 
				<div class="inner">
					<div class="m_tit fleft">${bm.boardName }</div>
				</div> --%>
				<ul class="m_port">
	<c:forEach items="${list }" var="l">
					<li>
						<p class="port_img">
							<a href="${l.linkUrl }" target="_blank">
								<img src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }" alt="이미지" />
							</a>
						</p>
						<p class="sb">
							<a href="${l.linkUrl }" target="_blank">${l.subject }</a>
						</p>
						<p class="http">
							<a href="${l.linkUrl }" target="_blank" class="red bold"><tt:abbr length="25" value="${l.linkUrl }"/></a>
						</p>
						<%-- <p class="sb">
							<a href="${l.linkUrl }" target="_blank">${l.subject }</a>
						</p>
						<p class="sb">
							<a href="${l.linkUrl }" target="_blank"><tt:abbr length="25" value="${l.linkUrl }"/></a>
						</p> --%>
					</li>	
	</c:forEach>
			<c:if test="${empty list}">
				<li style="width: 100%;">
					<s:message code="common.noData" />
				</li>
			</c:if>
				</ul>
</c:if>

<c:if test="${bm.boardTypeFixedCode eq '001006' }">
				<%-- 
				<div class="inner">
					<div class="m_tit fleft">${bm.boardName }</div>
				</div> 
				--%>	
			<%-- 	<ul class="m_port">
	<c:forEach items="${list }" var="l">
					<li style="width: ${(93-(bm.lfCount*2))/bm.lfCount}% !important;">
						<p class="sol_img text-center" >
							<a href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})">
								<img src="${UPLOAD_ROOT}${l.fileVOList[0].saveFilename }"  alt="이미지" />
							</a>
						</p>
						<p class="ex" style="font-size: ${(60-(bm.lfCount*2))/bm.lfCount}% !important;">
							<a href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})">${l.subject }</a>
						</p>
					</li>
	</c:forEach>
	
	<c:if test="${empty list}">
					<li style="width: 100%;">
						<s:message code="common.noData" />
					</li>
	</c:if>
				</ul> --%>	
    	<div class="col-sm-4 py-2  ">
           	<form id="formSearch" action="" method="post" class="row no-gap">
	           	<div class="input-group">
				<tt:select class="col-3" list="${BoardSearchType }" name="searchType" listKey="value" listValue="text" selected="${search.searchType }"/>
				<c:choose>
					<c:when test="${bm.writerFormatFixedCode eq '002001'}">
						<!-- 이름 --> 
						<input type="hidden" name="type1" value="userName" data-id="userName" /> 
					</c:when>
					<c:when test="${bm.writerFormatFixedCode eq '002002'}">
						<!-- 닉네임 --> 
						<input type="hidden" name="type1" value="nickName" data-id="nickName" /> 
					</c:when>
					<c:when test="${bm.writerFormatFixedCode eq '002003'}">
						<!-- 닉네임(이름) --> 
						<input type="hidden" name="type1" value="nickUserName" data-id="nickUserName" /> 
					</c:when>
					<c:when test="${bm.writerFormatFixedCode eq '002004'}">
						<!-- 이름(아이디) --> 
						<input type="hidden" name="type1" value="regUserName" data-id="regUserName" /> 
					</c:when>
					<c:when test="${bm.writerFormatFixedCode eq '002005'}">
						<!-- 닉네임(아이디) --> 
						<input type="hidden" name="type1" value="nickRegName" data-id="nickRegName" /> 
					</c:when>
					<c:otherwise>
						<input type="hidden" name="type1" value="regUser" data-id="regUser" /> 
					</c:otherwise>
				</c:choose>		
					<script>
						$(function() {
							var sType1 = '${search.type1}'; 
							if (sType1 != '')
								$('input[name=type1]').val(sType1);
						}); 
					</script>
				<input type="search" id="searchWord" name="searchWord" class="form-control searchWord" value="${search.searchWord }"/>
				<button href="javascript:doSearch();" class="btn btn-default btn-sm input-group-append">검색</button>
				</div>
			</form>
		</div>
	<div class="row">
	<c:forEach items="${list }" var="l">
		<div class="col-sm-6 col-md-4 col-sm-12">
	         <a class="card" href="javascript:$.Nav('self', {mode: 'view', bseq: '${l.boardSeq }'})">
	              <div class="img-wrapper" style="background-image:url(${UPLOAD_ROOT}${l.fileVOList[0].saveFilename })">
	             </div>
	             <div class="card-title">${l.subject }</div>
	             <%-- <c:if test="${l.regDate => now}">
	                 <span class="badge">new</span>
	             </c:if> --%>
	               
	          </a>
	     </div>	
     </c:forEach>
     <c:if test="${empty list}">
		<div style="width: 100%;">
			<s:message code="common.noData" />
		</div>
	  </c:if>
	</div>
</c:if>
	
<script type="text/javascript">

	var loginUser = '${tagoplusSolution1_session_user.userId}';
	$('input[name=reguser]').val() == loginUser;

	function doSearch() {
		var sType1 = $('input[name=type1]').val();
		var sSearchType = $('select[name=searchType]').val();
		var sSearchWord = $('input[name=searchWord]').val();
		$.Nav('go', location.pathname, {
			'searchType' : sSearchType,
			'type1' : sType1,
			'searchWord' : sSearchWord
		});
	}

	function doView(seq, id, secretYn, autoSecretYn) {
		if (secretYn == 'Y' || autoSecretYn == 'Y') {
			if (id != loginUser) {
				alert('비밀글 입니다.');
				return;
			}
		}

		$.Nav('self', {
			mode : 'view',
			bseq : seq
		});
	}

	function doWrite() {
		if (loginUser == '') {
			alert('로그인이 필요 합니다.');
			$.Nav('go', '/login');
		}else{
			$.Nav('self', {
				mode : 'write',
				status : 'i',
				bseq : ''
			});
		}

		
	}
</script>



	
	
	

<script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>




<script type="text/javascript">

$(document).ready(function(){
  $(".board_basic_faq_a").hide();
  $(".board_basic_faq_q").click(function(){
	$(this).next().slideToggle(300);;
	$(this).parent().toggleClass('on');
    $(this).children(".plus-minus-toggle").toggleClass('collapsed')
	$(".board_basic_faq_q").not(this).parent().removeClass('on');
	$(".board_basic_faq_q").not(this).children(".plus-minus-toggle").removeClass('collapsed');
    $(".board_basic_faq_q").not(this).next().slideUp(300);
    return false;
  });
});
</script>


<script language="Javascript">
$(document).ready(function(){
	
	$('.board_tab_sty01 li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('.board_tab_sty01 li').removeClass('current');
		$('.board-tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
