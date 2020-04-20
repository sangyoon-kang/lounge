<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
	
<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	<%@ include file="/WEB-INF/include/front_header_html.jsp"%>
	
	<div class="wrap_contents">
	
		<!-- path 영역-->
	    <div class="wrap_path">
	        <div class="section_contents">
	            <h2>bxSlider</h2>
	            <div class="area_path">
	                <p>
	                    <a href="/" class="sprite sprite_header sprite_home">Home</a><a href="#" class="path path_current"></a>
	                </p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="section_contents">
			<div class="bxslider" style="text-align: center;">
				<div><img src="/images/temp/1180004.jpg" /></div>
				<div><img src="/images/temp/19201200-2.jpg" /></div>
				<div><img src="/images/temp/ekutP.jpg" /></div>
			</div>
	    </div>
	    <script>
			$(function(){
			  $('.bxslider').bxSlider({
				  //responsive: false
			  });
			});
		</script>
	</div>
	
	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>