<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>

<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>SNS설정</h2>
		<p>홈  &gt; 환경설정 &gt; SNS설정 </p>
	</div>
	<div class="scon">
	<span class="table_aside">&#9654;SNS설정</span>
		<form id="form2" action="./sns_proc" method="post" enctype="multipart/form-data">
			<table class="board_write">
				<colgroup>
					<col width="15%" />
					
					<col width="85%" />
					
				</colgroup>
				<tbody>
					<tr>
						<th><strong>네이버 로그인</strong></th>
						<td>
						<label><input type="radio" name="naverAPI" id="naveruse"  ${set.naverAPI =='1' ? 'checked' : ''} value="1" >사용 <label  id="naverAPI" ${(set.naverAPI eq '0' || set.naverAPI eq null) ? 'hidden=true' : ''}>( KEY <input type="test" id="naverAPI" name="naverKey" value="${set.naverKey}" class="w60" >)</label></label>
						&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
						<label><input type="radio" name="naverAPI" id="navernotuse" ${set.naverAPI =='0' ? 'checked' : ''} value="0">사용안함</label>
							
						</td>
					</tr>
					<tr>
						<th><strong>구글 로그인</strong></th>
						<td>
							<label><input type="radio" name="googleAPI" id="googleuse" ${set.googleAPI =='1' ? 'checked' : ''} value="1">사용 <label  ${(set.googleAPI eq '0' || set.googleAPI eq null) ? 'hidden=true' : ''} id="googleAPI">( KEY <input type="test" id="googleAPI" name="googleKey" value="${set.googleKey}" class="w60" >)</label></label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
							<label><input type="radio" name="googleAPI" id="googlenotuse" ${set.googleAPI =='0' ? 'checked' : ''} value="0">사용안함</label>
						</td>
					</tr>
					<tr>
						<th><strong>카카오 로그인</strong></th>
						<td>
							<label><input type="radio" name="kakaoAPI" id="kakaouse" ${set.kakaoAPI =='1' ? 'checked' : ''} value="1">사용<label ${(set.kakaoAPI eq '0' || set.kakaoAPI eq null) ? 'hidden=true' : ''} id="kakaoAPI">( KEY <input type="test" id="kakaoAPI" name="kakaoKey" value="${set.kakaoKey}" class="w60" >)</label></label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
							<label><input type="radio" name="kakaoAPI" id="kakaonotuse" ${set.kakaoAPI =='0' ? 'checked' : ''} value="0">사용안함</label>
						</td>
					</tr>
					<tr>
						<th><strong>페이스북 로그인</strong></th>
						<td>
							<label><input type="radio" name="facebookAPI" id="facebookuse" ${set.facebookAPI =='1' ? 'checked' : ''} value="1">사용 <label ${(set.facebookAPI eq '0' || set.facebookAPI eq null) ? 'hidden=true' : ''} id="facebookAPI">( KEY <input type="test" id="facebookAPI"  name="facebookKey" value="${set.facebookKey}" class="w60" >)</label></label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
							<label><input type="radio" name="facebookAPI" ${set.facebookAPI =='0' ? 'checked' : ''} id="facebooknotuse" value="0">사용안함</label>
						</td>
					</tr>
					
				</tbody>
				
			</table>
			<div class="summmit_btn">
				<a onclick="javascript:Submit();" class="btn2 bg_blue">저장</a>
				<a onclick="javascript:$.Nav('go', './sns');" class="btn2 bg_darkgray">취소</a>
			</div>
		</form>
	</div>
		<c:set var="delete"><s:message code="common.delete.msg" /></c:set>	
</div>		
		<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
   
function Submit() {
	if (!confirm('저장하시겠습니까?'))
		return;
	$('#form2').submit();
}
$('input[type="radio"]').on('change', function(e){ 
	$('input[name='+ e.target.id +']').val((e.target.checked) ? e.target.value : 0); 
	$('label[id='+ e.target.name +']').attr( "hidden", (e.target.id.substring(e.target.id.length-6,e.target.id.length)=='notuse')? true : false );
	if(e.target.id.substring(e.target.id.length-6,e.target.id.length)!='notuse'){   
		$('input[id='+ e.target.name +']').focus();
 		}
});
</script>
<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>