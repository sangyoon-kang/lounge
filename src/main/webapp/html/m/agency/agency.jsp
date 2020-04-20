<!--#include virtual="/m/include/top.asp" -->
<!--#include virtual="/m/include/header.asp" -->
<script type="text/javascript">
	jQuery.fn.center = function () {
		this.css("position","absolute");
		this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 2) + $(window).scrollTop()) + "px");
		this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + $(window).scrollLeft()) + "px");
		return this;
	}
	
	agency_info = function() {
		$("#agency_info").show();
		$("#agency_info").center();
	}

</script>
<article>
    <div class="container">
        <h2>지점안내</h2>
        <div class="contents">
        	<div class="agency">
                <ul>
                    <li>
                        <a class="ar mu_tit" href="javascript:void(0);">서울</a>
                        <div class="depth1">
                        	<ul>
                            	<li><a class="bold" href="" ><span class="ic_bar"></span>김포공항</a>
                                	<div class="depth2">
                                    	<ul>
                                            <li><a href="javascript:;" onclick="javascript:agency_info()">타고렌트카</a></li>
                                            <li><a href="javascript:;" onclick="javascript:agency_info()">우리렌트카</a></li>
                                        </ul>
                                    </div>
                                </li>
                                <li><a href=""><span class="ic_bar"></span>서울역</a>
                                </li>
                                <li><a href=""><span class="ic_bar"></span>강남구</a>
                                </li>
                                <li><a href=""><span class="ic_bar"></span>마포구</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li><a class="ar mu_tit" href="javascript:void(0);">인천</a></li>
                    <li><a class="ar mu_tit" href="javascript:void(0);">부산</a></li>
             	</ul>
            </div>
        </div><!-- contents -->
    </div><!-- container -->
</article>
<!-- content//end-->
<!--#include virtual="/m/include/footer.asp" -->

<div id="agency_info" class="pop_wrp">
	<div class="pop_tit"><span class="fleft">지점정보</span><a href="" class="ico btn_close"></a></div>
	<div class="cons">
    	<div class="gy_box1">
        	<ul class="box_info aleft">
            	<li><span class="ic_jm"></span>지점 : 서울/김포공항</li>
                <li><span class="ic_jm"></span>업체 : 타고렌트카</li>
                <li><span class="ic_jm"></span>장소 : 서울시 금천구 가산동 327-32번지</li>
            </ul>
        </div>
        <div class="agency_map">
        	지도영역
        </div>
    </div><!-- cons -->
	<div>
       	<a href="" class="btn_b_cor">확인</a>
     </div>
</div><!-- 팝업 -->