<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
	
<%@ include file="/WEB-INF/include/front_start_html.jsp"%>
	<%@ include file="/WEB-INF/include/front_header_html.jsp"%>
	
	<script type="text/javascript">
		swfobject.embedSWF("/images/swf/test.swf", "myContent", "300", "140", "9.0.0", "/images/swf/expressInstall.swf");
	</script>
	
	<div class="wrap_contents">
	
		<!-- path 영역-->
	    <div class="wrap_path">
	        <div class="section_contents">
	            <h2>플래시 로딩</h2>
	            <div class="area_path">
	                <p>
	                    <a href="/" class="sprite sprite_header sprite_home">Home</a><a href="#" class="path path_current">load flash</a>
	                </p>
	            </div>
	        </div>
	    </div>
	    
	    <div class="section_contents">
	    	<div>
            	swfobject.js 사용
            </div>
            <div id="myContent">
				<h1>Alternative content</h1>
				<p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
			</div>
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/include/front_footer_html.jsp"%>
<%@ include file="/WEB-INF/include/front_end_html.jsp"%>