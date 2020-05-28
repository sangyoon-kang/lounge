<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<%@ include file="/WEB-INF/include/fx_include/front_start.jsp"%>
<script type="text/javascript" src="/common/js/charting_library/charting_library/charting_library.min.js"></script>
<script type="text/javascript" src="/common/js/charting_library/datafeeds/udf/dist/polyfills.js"></script>
<script type="text/javascript" src="/common/js/charting_library/datafeeds/udf/dist/bundle.js"></script>
<script type="text/javascript">
	var device ='';
	var limit;
	$(document).ready(function(){
		if (window.matchMedia('(max-width: 767px)').matches) {
			device = 'mobile';
			limit = 600;
		} else{
			limit = 3600;
		}
	})

	function getParameterByName(name) {
		name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
				results = regex.exec(location.search);
		return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
	}

	function initOnReady() {
		var widget = window.tvWidget = new TradingView.widget({
			// debug: true, // uncomment this line to see Library errors and warnings in the console
			//fullscreen: false,
			width: '100%',
			autosize: true,
			symbol: 'GBPAUD',
			interval: ${search.runTime},
			container_id: "tv_chart_container",
			timezone: "Asia/Seoul",
			//	BEWARE: no trailing slash is expected in feed URL
			datafeed: new Datafeeds.UDFCompatibleDatafeed("http://chart.fxlounge.co.kr",1000),
			library_path: "/common/js/charting_library/charting_library/",
			locale: getParameterByName('lang') || "ko",
            enabled_features: [""],
			client_id: '${URL_HOST_OP}',
			user_id: 'public_user_id',
			theme: 'light',
			preset:device,
		});

		var ts = Math.round((new Date()).getTime() / 1000);
		var min = ts - limit * ${search.runTime};
		var range = {
			from: min,
			to : ts
		};
		var options = {
			applyDefaultRightMargin: false,
			percentRightMargin: 10
		}
		widget.onChartReady(function() {
			widget.chart().setVisibleRange(range,options);
		});
	};

	window.addEventListener('DOMContentLoaded', initOnReady, false);
</script>
<style>
	#tv_chart_container {
		position: absolute;
        left: 0px; right: 0px;
        top: 0px; bottom: 0px;
	}

	@media ( max-width :576px) {
		#tv_chart_container {
			height: 300px;
		}
	}
</style>
<div id="tv_chart_container" class="mb-4" style="border-top: 4px solid rgb(224, 227, 235);"></div>

</script>