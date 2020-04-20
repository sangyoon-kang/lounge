<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_header.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_banner.jsp"%>

<style>
.map_overlay {
    position: absolute;
    top: 20px;
    left: 20px;
    background: #fff;
    padding: 10px;
    z-index: 2;
    max-width: 300px;
 }
 .map_overlay h4 {
      font: 16px;
      font-weight: 500; }
 .map_overlay p {
      font-size: 14px;
      margin-top: 8px;
      font-weight: 300; }
</style>
<section class="wrap_scon">
		<div class="scon">
			<div class="loc">
				<%-- <div class="map_wrapper">
                    		<div id="map" style="width:100%;height:900px;"></div>
                    		<div class="map_overlay">
                    			<h4>${tagoplusSolution1_session_site.footBusinessName }</h4>
                    			<p>${tagoplusSolution1_session_site.footAddr1 } ${tagoplusSolution1_session_site.footAddr2 }</p>
                    		</div>
                    	</div> --%>
				<div class="map" id="map" style="width:100%;height:400px;">
				<!-- old -->
				<!-- <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3164.9141302840667!2d127.03940541531011!3d37.50994337980849!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca40995b22ec5%3A0x432701d796fb67b8!2z64yA7ZWc66-86rWtIOyEnOyauO2KueuzhOyLnCDqsJXrgqjqtawg64W87ZiEMuuPmSDrtInsnYDsgqzroZwgMzE3!5e0!3m2!1sko!2smn!4v1582431311823!5m2!1sko!2smn" width="100%" height="900" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                 -->    <!-- new -->
					<div class="map_overlay">
                   			<h4>${tagoplusSolution1_session_site.footBusinessName }</h4>
                   			<p>${tagoplusSolution1_session_site.footAddr1 } ${tagoplusSolution1_session_site.footAddr2 }</p>
                   		</div>
				</div>
				<div class="add_info">
					<h3>${tagoplusSolution1_session_site.footBusinessName }</h3>
					<ul>
						<li><strong>주소</strong><span>${tagoplusSolution1_session_site.footAddr1 }&nbsp;${tagoplusSolution1_session_site.footAddr2 }</span></li>
						<li><strong>대표전화</strong><span>${tagoplusSolution1_session_site.footPhone }</span></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

<%@ include file="/WEB-INF/include/fx_include/front_footer.jsp"%>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${tagoplusSolution1_session_siteapi.mapKey}&libraries=services"></script>
<script>
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
// 키워드로 장소를 검색합니다
ps.keywordSearch('${tagoplusSolution1_session_site.footAddr1 } ', placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        displayMarker(data[1]);    
       	bounds.extend(new kakao.maps.LatLng(data[1].y, data[1].x));     

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);

    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}



</script>
</script>
