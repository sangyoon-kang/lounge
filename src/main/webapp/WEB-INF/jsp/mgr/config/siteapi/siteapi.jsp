<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
	게시판 관리 - 게시판 마스터 목록
 --%>
<%@ include file="/WEB-INF/include/admin_start_html.jsp"%>
<style type="text/css">
	div.share-icon{float: left; width:auto; height:42px;}
	div.share-icon img.notuseshare{-ms-filter:"progid:DXImageTransform.Microsoft.Alpha(Opacity=50)"; filter:alpha(Opacity=20); opacity:0.2;pointer-events: none;}
	div.share-icon img{height:42px; width:42px;margin-right:5px;}
</style>
<jsp:include page="${URL_ADMIN_ROOT }/common/gnb" flush="true"></jsp:include>

<!--wrap_scon S-->
<div id="wrap_scon">

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<jsp:include page="${URL_ADMIN_ROOT }/common/lnb" flush="true"></jsp:include>

	<div class="scon_title">
		<h2>API관리</h2>


		<p>홈 &gt; 환경설정 &gt; API관리</p>
	</div>
	<div class="scon">
		<span class="table_aside">&#9654;API관리</span>
		<p class="fr mb10">네이버로그, 구글 애널리틱스, 본인인증, IPIN인증의 정보를 입력하면 자동
			실행됩니다.</p>
		<form id="form" action="./api_proc" method="post"
			enctype="multipart/form-data">




			<table class="board_write">
				<colgroup>
					<col width="5%" />
					<col width="15%" />
					<col width="30%" />
					<col width="15%" />
					<col width="15%" />
					<col width="20%" />


				</colgroup>
				<tbody>
					<tr>
						<th colspan="2"><strong>지도</strong></th>
						<td colspan="4"><label><input type="radio"
								name="mapType" id="navermap"
								${set.mapType =='naver' ? 'checked' : ''} value="naver">네이버지도</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="mapType" id="googlemap"
								${set.mapType =='google' ? 'checked' : ''} value="google">구글지도</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="mapType" id="daummap"
								${set.mapType =='daum' ? 'checked' : ''} value="daum">다음지도</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
							<label><font color="red" class="fr">**운영 중에 에디터의
									설정을 변경하지 마세요. </font></label> <br>
						<label
							${(set.mapType eq '0' || set.mapType eq null) ? 'hidden' : ''}
							id="mapType">( Key <input class="w30" type="text" id="mapType"
								name="mapKey" value="${set.mapKey}">)
						</label></td>
					</tr>
					<tr>
						<th colspan="2"><strong>에디터</strong></th>
						<td colspan="4"><label><input type="radio"
								name="editorType" id="CKEditor"
								${set.editorType =='CKEditor' ? 'checked' : ''} value="CKEditor">CKEditor</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <%-- <label><input type="radio" name="editorType" id="naver" ${set.editorType =='naver' ? 'checked' : ''} value="naver">Naver Smart Editor</label>
								&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; --%>
							<label><font color="red" class="fr">**운영 중에 에디터의
									설정을 변경하지 마세요. </font></label> <br>
						<label
							${(set.editorType eq '0' || set.editorType eq null) ? 'hidden' : ''}
							id="editorType">( KEY <input type="text" id="editorType" class="w30"
								name="editorKey" value="${set.editorKey}">)
						</label></td>
					</tr>
					<%-- <tr>
							<th colspan="2"><strong>업로드컴퍼넌트</strong></th>
							<td colspan="4">
								<label><input type="radio" name="uploadType" id="DextUpload" ${set.uploadType =='DextUpload' ? 'checked' : ''} value="DextUpload">DextUpload</label>
								&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;
								<label><input type="radio" name="uploadType" id="ABCUpload" ${set.uploadType =='ABCUpload' ? 'checked' : ''} value="ABCUpload">ABCUpload</label>
								<br><label  ${(set.uploadType eq '0' || set.uploadType eq null) ? 'hidden' : ''} id="uploadType">( KEY <input type="text" id="uploadType" name="uploadKey" value="${set.uploadKey}" >)</label>
							</td>
						</tr> --%>
					<tr>
						<th colspan="2"><strong>네이버 로그분석 ID</strong></th>
						<td colspan="1"><input type="text" class="w95"
							name="naverlogID" maxlength="20" value="${set.naverlogID}">
						</td>
						<td colspan="1"><strong>전환값</strong></td>
						<td colspan="1" style="border-right: unset;"><span>회원가입</span>
							<br>
						<br> <span>장바구니담기</span> <br>
						<br> <span>신청/예약</span> <br>
						<br> <span>게시글작성</span></td>
						<td colspan="1"><input type="text" name="" value="">
							<br>
						<br> <input type="text" name=""  readonly="readonly" value=""> <br>
						<br> <input type="text" name=""  readonly="readonly" value=""> <br>
						<br> <input type="text" name="" value=""></td>
					</tr>
					<tr>
						<th colspan="2" ><strong>구글 애널리틱스 ID</strong></th>
						<td colspan="4"> 
						<input type="text" class="w80"
										name="googlelogId" maxlength="1000"
										value="${set.googlelogId}">
							</td>
						
									
					</tr>
					
					<tr >
					<th colspan="2" ><strong>VIEW ID</strong></th>
									<td ><input type="text" class="w95"
										name="googlelogValue" maxlength="1000"
										value="${set.googlelogValue}"></td>
							
						
										
									<td  ><strong>UA</strong></td>
									
									<td colspan="2"><input type="text" class="w95"
										name="googleUa" maxlength="100" value="${set.googleUa}">
									</td>
							</tr>
					
					<tr>
						<th colspan="2"><strong>본인인증 코드</strong></th>
						<td><input type="text" class="w95" name="phonecheckID"
							maxlength="10" value="${set.phonecheckID}"></td>
						<td><strong>본인인증 패스워드</strong></td>
						<td colspan="2"><input type="text" class="w95"
							name="phonecheckPW" maxlength="20" value="${set.phonecheckPW}">
						</td>
					</tr>
					<tr>
						<th colspan="2"><strong>IPIN인증 코드</strong></th>
						<td><input type="text" class="w95" name="ipinID"
							maxlength="10" value="${set.ipinID}"></td>
						<td><strong>IPIN인증 패스워드</strong></td>
						<td colspan="2"><input type="text" class="w95" name="ipinPW"
							maxlength="20" value="${set.ipinPW}"></td>
					</tr>
					<tr>
            <th colspan="2" ><strong>LIVERATE API</strong></th>
            <td colspan="4"><input type="text" class="w80" name="liverateKey" 
              maxlength="30" value="${set.liverateKey}"></td>
          </tr>
					<tr>
						<th rowspan="4"><strong>SNS공유</strong></th>
						<th><strong>페이스북</strong></th>
						<td colspan="4"><label><input type="radio"
								name="facebookFlag" id="facebookuse"
								${set.facebookFlag =='Y' ? 'checked' : ''} value="Y">사용</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <input
							type="text" id="facebookFlag" name="facebookKey"
							${set.facebookFlag =='N' ? 'hidden' : ''}
							value="${set.facebookKey}">
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="facebookFlag" id="facebooknotuse"
								${set.facebookFlag =='N' ? 'checked' : ''} value="N">사용안함</label>
						</td>
					</tr>
					<tr>
						<th><strong>트위터</strong></th>
						<td colspan="4"><label><input type="radio"
								name="twitterFlag" id="twitteruse"
								${set.twitterFlag =='Y' ? 'checked' : ''} value="Y">사용</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <input
							type="text" id="twitterFlag" name="twitterKey"
							${set.twitterFlag =='N' ? 'hidden' : ''}
							value="${set.twitterKey}">
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="twitterFlag" id="twitternotuse"
								${set.twitterFlag =='N' ? 'checked' : ''} value="N">사용안함</label>
						</td>
					</tr>
					<tr>
						<th><strong>카카오스토리</strong></th>
						<td colspan="4"><label><input type="radio"
								name="kakaoFlag" id="kakaouse"
								${set.kakaoFlag =='Y' ? 'checked' : ''} value="Y">사용</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <input class="w30"
							type="text" id="kakaoFlag" name="kakaoKey"
							${set.kakaoFlag =='N' ? 'hidden' : ''} value="${set.kakaoKey}">
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="kakaoFlag" id="kakaonotuse" 
								${set.kakaoFlag =='N' ? 'checked' : ''} value="N">사용안함</label></td>
					</tr>
					<tr>
						<th><strong>네이버블로그</strong></th>
						<td colspan="4"><label><input type="radio" 
								name="naverFlag" id="naveruse"
								${set.naverFlag =='Y' ? 'checked' : ''} value="Y">사용</label>
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <input
							type="text" id="naverFlag" name="naverKey" class="w30"
							${set.naverFlag =='N' ? 'hidden' : ''} value="${set.naverKey}">
							&thinsp;&thinsp;&thinsp;&thinsp;&thinsp;&thinsp; <label><input
								type="radio" name="naverFlag" id="navernotuse"
								${set.naverFlag =='N' ? 'checked' : ''} value="N">사용안함</label></td>
					</tr>
				</tbody>
			</table>


			<div class="summmit_btn">
				<a onclick="javascript:Submit();" class="btn2 bg_blue">저장</a> <a
					onclick="javascript:$.Nav('go', './api');" class="btn2 bg_darkgray">취소</a>
			</div>
			<div class="share-icon">
				<img src="/images/share.png" alt="share"> <img
					src="/images/share_login_facebook.png"
					class="${(set.facebookFlag eq 'Y' || set.facebookFlag eq null) ? '' : 'notuseshare'}"
					name="facebookFlag" alt="facebook"> <img
					src="/images/share_twitter.png"
					class="${(set.twitterFlag eq 'Y' || set.twitterFlag eq null) ? '' : 'notuseshare'}"
					name="twitterFlag" alt="twitter"> <img
					src="/images/share_kakao.png"
					class="${(set.kakaoFlag eq 'Y' || set.kakaoFlag eq null) ? '' : 'notuseshare'}"
					name="kakaoFlag" alt="kakao"> <img
					src="/images/share_naver.png"
					class="${(set.naverFlag eq 'Y' || set.naverFlag eq null) ? '' : 'notuseshare'}"
					name="naverFlag" alt="naver">
			</div>
		</form>


	</div>

	<c:set var="delete">
		<s:message code="common.delete.msg" />
	</c:set>

	<!-- -------------------------------------------------------------------------------------------------------------------------------- -->
	<script type="text/javascript">
		function Submit() {
			if (confirm("저장 하시겠습니까?")) {
				$('#form').submit();
			}

		}
		$('input[type="radio"]').on(
				'change',
				function(e) {
					$(this).siblings().prop('checked', false);
					$('input[name=' + e.target.id + ']').val(
							(e.target.checked) ? e.target.value : 0);
					$('label[id=' + e.target.name + ']').attr(
							"hidden",
							(e.target.id.substring(e.target.id.length - 6,
									e.target.id.length) == 'notuse') ? true
									: false);
					$('input[id=' + e.target.name + ']').attr(
							"hidden",
							(e.target.id.substring(e.target.id.length - 6,
									e.target.id.length) == 'notuse') ? true
									: false);
					$('img[name=' + e.target.name + ']').toggleClass(
							"notuseshare");
					$('input[id=' + e.target.name + ']').focus();
				});
	</script>

</div>

</div>

<%@ include file="/WEB-INF/include/admin_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/admin_end_html.jsp"%>