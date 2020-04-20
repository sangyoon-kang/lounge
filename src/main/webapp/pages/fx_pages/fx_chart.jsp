<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp" %>

<div id="tradingview_5ee24" class="col-sm-12"></div>

<script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
<script>
new TradingView.widget({
	  "width": '100%',
	  "height": 450,
	"symbol": "OANDA:GBPAUD",
	"interval": "2",
	"timezone": "Asia/Seoul",
	"theme": "Light",
	"style": "2",
	"locale": "kr",
	"toolbar_bg": "#f1f3f6",
	"enable_publishing": false,
	"allow_symbol_change": true,
	"container_id": "tradingview_5ee24",
	"onReady": function(data){
		"supported_resolutions" = ["1","2","D"];
	},
	});
</script>


