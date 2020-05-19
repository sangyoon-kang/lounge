<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>
<form id="form1" action="./list.do">

<section class="wrap_scon">
	<div class="scon">
		<div class="board_search_type04" style="margin-bottom:0;">
				<div class="custom-select">
				  <select name="type1">
				  <option value="" ${!search.type1 ? 'selected' : ''}>선택</option>
				  	<c:forEach items="${runTimeVO}" var="r" varStatus="s">
						<option ${search.type1 eq r.runTime ? 'selected' : ''} value="${r.runTime}">${r.runTime }분거래</option>
					</c:forEach>
					
				  </select>
				</div>
						
						
				<input type="text"  name="startDate" id="startDate"  value="${search.startDate }" >
				<button onclick="javascript:doSearch();" class="btn dark-grey input-group-append">검색</button>
			</div>
	<div class="board_basic_type01 board_basic_type01_03">
		<table class="table mt-2 striped">
				<thead>
					<tr>
						<th>번호</th>
						<th>시간</th>
						<th>거래유형</th>
						<th>시가</th>
						<th>고가</th>
						<th>저가</th>
						<th>종가</th>
						<th>결과</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="m" varStatus="s">
						<tr>
							<td>${m.rowNumber}</td>
							<fmt:formatDate var="rDate" value="${m.modTime }" pattern="YYYY-MM-dd" />
							<fmt:formatDate var="rHour" value="${m.modTime }" pattern="HH" />
							<fmt:formatDate var="rMinute" value="${m.modTime }" pattern="mm" />
							<td><fmt:formatDate var="resultDate" value="${m.modTime }" pattern="${DATE_TIME_FORMAT}" />${resultDate}</td>
							<td>${m.rTime}</td>
							<td>${m.sVal}</td>
							<td>${m.hVal}</td>
							<td>${m.lVal}</td>
							<td>${m.eVal}</td>
							<td>
							<c:if test="${fn:contains(m.goodsResult, '매수') }">
							
								
								
								<a style="color:#d92222" onclick="javascript:viewApi ('${resultDate}','${search.type1}');" >
									${m.goodsResult}
								</a>
							</c:if>
							<c:if test="${fn:contains(m.goodsResult, '매도') }">
							
								<%-- <a class="badge blue" onclick="window.open('/fxresult/listResult.do?resultDate=${resultDate}&runTime=${search.type1}', 'listresult', 'width=1000,height=660,top=200, left=400,location=no,status=no,scrollbars=yes');">
									${m.goodsResult}
								</a> --%>
								<a style="color:#4c84ff" onclick="javascript:viewApi ('${resultDate}','${search.type1}');" >
									${m.goodsResult}
								</a>
							</c:if>
							</td>
						</tr>
					</c:forEach>
					<c:if test="${empty list}">
						<tr>
							<td colspan="8"><s:message code="common.noData" /></td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>
			<%@ include file="/WEB-INF/jsp/common/tp_new_paging/inc-paging-front.jsp"%>
			<div id="dim" style="display:none"></div>
			<div class="pop_con pop_result" id="viewdata" style="display:none">
				
			</div>
	</div>
</section>

</form>




<script type="text/javascript">
function closeView(){

	$('#viewdata').html("");
	$('#dim').hide();
	 $(".pop_con.pop_result")[0].style.display="none";
	}
	
function viewApi (resultDate, runTime) {
	 $.ajax({
		type : 'post',
		url : '/fxresult/listResult.do',
		data : {
			
			resultDate:resultDate,
			runTime:runTime
			
		},
		
		success : function(data) {
			$('#viewdata').html(data);
		
		$('#dim').show();
		
		 $(".pop_con.pop_result")[0].style.display="block";	
				
		}
				 
		
	}); 
	
}
	
	
function doSearch() {
  $('#form1').submit(); 
}

$('#startDate').datepicker(
  {
    language: 'kr',
    switchOnClick: true,
    autoClose:true
  });
     
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
<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
