<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%--
		상품 상세
 --%>
<div id="title">
	<div class="fleft">
		<h2><strong>${vo.prdName }</strong></h2>
		<div class="tit_ex">${vo.summary }</div>
	</div>
	<div class="fright location"><img src="/images/ic_home.png" /> > ${vo.categoryName } > ${vo.prdName }</div>
</div><!--  end title -->
			
<div id="content">	
	<div class="sol_det">
		<div class="line"></div>
	
		<div class="cons">
			<div class="sol_img">
				<img id="mainImg" src="${UPLOAD_ROOT}${vo.prdImageVO[0].largeFilename }" onload="resize(this)" alt="상품이미지" />
			</div>
			<div class="sol_ex">
				<div class="price">
<fmt:formatNumber value="${vo.price }"/>				
				</div>
				<ul>
	<c:forEach items="${vo.prdSubVO }" var="sL">		
					<li>
						<p class="sb">${sL.header }</p>
						<p class="ex">${sL.content }</p>	
					</li>
	</c:forEach>			
				</ul>
				<p class="p15">${vo.summary }</p>
			</div>
		</div>
	
		<div class="inner2">
	
	<c:forEach items="${vo.prdImageVO }" var="iL">
			<div class="p10 fleft">
				<a href="javascript:doImgChange (${iL.prdImageSeq });">
					<img src="${UPLOAD_ROOT}${iL.smallFilename }" style="height: 50px;" alt="상품이미지" />
				</a>
			</div>
	</c:forEach>
			
		</div>
		<div class="line"></div>
	</div>
	
	<div class="inner2 mT30">
		<p class="p15">${vo.body }</p>
	</div>
	
	<div class="btn_area">
		<p class="fleft">
			<a href="javascript:$.Nav('self', {category1 : '${vo.category1 }', mode: 'list'}, null, true);" class="btn_m_nor">목록가기</a>
		</p>
	</div>
</div>	

<script type="text/javascript">

function doImgChange (prdImgSeq) {
	$.ajax({
		type : 'post',
		url : '../module/prd/ajax_img_change.do',
		data : {
			prdimgseq : prdImgSeq	
		},
		dataType : 'json',
		success : function(data) {
			console.log(data);
			$('#mainImg').attr('src', '${UPLOAD_ROOT}' + data);
		}
	});
}

//비율 맞춰 리사이즈 적용
function resize(img){

	// 원본 이미지 사이즈 저장
	var width = img.width;
    var height = img.height;

    // 가로, 세로 최대 사이즈 설정
    var maxWidth = 417; 
    var maxHeight = 300;

   	// 가로가 세로보다 크면 가로는 최대사이즈로, 세로는 비율 맞춰 리사이즈
	if (width > maxWidth) {		
		height = Math.round(height * (maxWidth / width));
		width = maxWidth;
	}
   	
	// 세로가 가로보다 크면 세로는 최대사이즈로, 가로는 비율 맞춰 리사이즈
   	if (height > maxHeight) {
		width = Math.round(width * (maxHeight / height));
		height = maxHeight;
	}

	// 리사이즈한 크기로 이미지 크기 다시 지정
	img.width = width;
	img.height = height;
}

</script>