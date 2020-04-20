<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	배너관리 - 등록 수정 UI
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>


	<!--wrap_scon S-->
<div id="wrap_scon">

	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>
	
		<div class="scon_title">
			<h2>fixed code</h2>
		<p>홈 &gt; 기본설정 &gt; 지역설정 &gt; 등록/수정</p>
		</div>
		<div class="scon">
			<form id="form1" action="./list_proc" method="post" enctype="multipart/form-data">
				
				
				<input hidden type="hidden" name="status" value />
				<input hidden type="hidden" name="sortNum" value="0" />
				<input hidden type="hidden" name="errorselect" value="${errorselect}" />
				<input hidden type="hidden" name="errorentered" value="${errorentered}" />
				<input hidden type="hidden" name="errornull" value="${errornull}" />
				
				
				<br>
				<h4>code add/edit</h4>
				<table class="board_write">
					<colgroup>
						<col width="15%" />
						
						<col width="85%" />
					</colgroup>
					<tbody>
						<tr>
							<th><strong>code type</strong></th>
							<td >
								<input name="codeType" class="w40" value="${vo.codeType }" maxlength="3" type="text" /> 
								(3자 입력)
								
							</td>
						</tr>
						<tr>
							<th>code id</th>
							<td >
								<input name="codeId" class="w40" value="${vo.codeId }"  maxlength="6" type="text" /> 
								(6자 입력)
								
							</td>
							
						</tr>
						<tr>
							<th>code name</th>
							<td >
								<input name="codeName" class="w40" value="${vo.codeName }" maxlength="100" type="text" /> 
								(100자 이내로 입력하세요)
								
							</td>
							
						</tr>
						<tr>
							<th>code info</th>
							<td >
								<input name="codeInfo" class="w40" value="${vo.codeInfo}" maxlength="1000" type="text" /> 
								(1000자 이내로 입력하세요)
								
							</td>
							
						</tr>
						<tr>
							<th>sort number</th>
							<td >
								<input name="sortNum" class="w40" value="${vo.sortNum}" maxlength="6" type="integer" /> 
								(최대 6 자리)
								
							</td>
							
						</tr>	
						<tr>
						<th>use /not use</th>
							<td >
								<span class="button-checkbox">
							        <button	 type="button" class="btn2 bg_gray" data-color="bg_gray"> use/not use </button>
							        <input name="useFlag" type="checkbox"  data-color="black" hidden  value="${vo.useFlag}"/>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
				
					<div class="summmit_btn">
						<a onclick="javascript:doSubmit();" class="btn2 bg_navy">저장</a>
						<a onclick="javascript:$.Nav('go', './list');" class="btn2 bg_gray">목록</a>
						<c:choose>
										         
							<c:when test = "${search.codeId != 0 }">
							
								<a	onclick="javacript:doDelete('${search.codeId }');" class="btn2 bg_gray">삭제</a>
							</c:when>
							
						</c:choose>
						</td>
					</div>
				</form>
		</div>
	</div>
	<!--wrap_scon E-->
	
	

<!--button	-->
<script type="text/javascript">
			if($('input[name=codeId]').val()==0){
				
				$('input[name=status]').val('N');
			}


	
$(function () {
    $('.button-checkbox').each(function () {
		
        // Settings
        var $widget = $(this),
            $button = $widget.find('button'),
            $checkbox = $widget.find('input:checkbox'),
            color = $button.data('color'),
            settings = {
                on: {
                    icon: 'glyphicon glyphicon-check'
                },
                off: {
                    icon: 'glyphicon glyphicon-unchecked'
                }
            };
       
        
		 if($checkbox.val() == "U"){
			 
			 $checkbox.prop('checked', !$checkbox.is(':checked'));
	            $checkbox.triggerHandler('change');
	            updateDisplay();  
			 
		}
		// Event Handlers
        $button.on('click', function () {
            $checkbox.prop('checked', !$checkbox.is(':checked'));
            $checkbox.triggerHandler('change');
            updateDisplay();
            
        });
        

        // Actions
        function updateDisplay() {
            var isChecked = $checkbox.is(':checked');
			
            // Set the button's state
            $button.data('state', (isChecked) ? "on" : "off");
            if(isChecked){
            	$("input:checkbox").attr("checked");
            	 $checkbox.val("U");
            }
            else{
            	 $checkbox.val("S");}
            
           
            // Set the button's icon
            

            // Update the button's color
            if (isChecked) {
                $button
                .removeClass('btn2 ' + color)
                .addClass('btn2 bg_orange');
            }
            else {
                $button
	                .removeClass('btn2 bg_orange')
	                .addClass('btn2 ' + color);
                    
            }
        }

        // Initialization
        
        
    });
});
</script>	
<!--button	-->	
	
	
<script type="text/javascript">
	

	function doSubmit() {
		if ($('input[name=codeType').val().length==3&&$('input[name=codeId').val().length==6)
		{	
			
			if (!confirm('"'+$('input[name=codeName]').val()+'"'+' 코드를 추가 하시겠습니까?'))
				return;
			
			$('#form1').submit();
		}else{
			alert("code type or code id length incorrect");
		}
		
			
				
		}
	function doDelete(seq) {
		var sMsg = '';
		
		sMsg = '"${vo.codeName }" 코드를 삭제 하시겠습니까?';
		
		if (!confirm(sMsg))
			return;
		
		
		$('input[name=codeId]').val(seq);
		
		$('input[name=status]').val('d');
		
		$('#form1').submit();
	}
	
</script>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>
	