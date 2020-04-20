<%@ page language="java" contentType="text/html;charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<style type="text/css">
	div.share-front {
		width: auto;
	    padding: 7px 2px;
	    text-align: right;
    }
    .share-front img{
    	height: 42px;
	    width: 42px;
	    margin-right: 5px;
    }
    #content{
    	margin: 0px;
    }
</style>
<%--
		SNS Share if possible	
 --%>
<div class="share-front">
	<c:if test="${set.facebookFlag eq 'Y'}">
		<img src="/images/share_login_facebook.png" class="" name="facebookKey" alt="facebook" id="shareBtn" onclick="javascript:void(0)" >
	</c:if>
	<c:if test="${set.twitterFlag eq 'Y'}">
		<img src="/images/share_twitter.png" name="twitterKey" alt="twitter" id="tweet-this-post" onclick="javascript:void(0)">
	</c:if>
	<c:if test="${set.kakaoFlag eq 'Y'}">
		<img src="/images/share_kakao.png" name="kakaoKey" alt="kakao" onclick="javascript:shareStory()">
	</c:if>
	<c:if test="${set.naverFlag eq 'Y'}">
		<img src="/images/share_naver.png" name="naverKey" alt="naver" onclick="javascript:naverShare()">
	</c:if>
</div>
<c:if test="${set.facebookFlag eq 'Y'}">
<script>
//Load the SDK asynchronously
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "https://connect.facebook.net/en_US/sdk.js";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

window.fbAsyncInit = function() {
    FB.init({
      appId      : '${set.facebookKey}',
      cookie     : true,  // enable cookies to allow the server to access 
                          // the session
      xfbml      : true,  // parse social plugins on this page
      version    : 'v2.8' // use graph api version 2.8
    });
}
const url = window.location.href;
document.getElementById('shareBtn').onclick = function() {
 FB.ui({
   method: 'share',
   display: 'popup',
   href: url,
 }, function(response){});
}
</script>
</c:if>
<c:if test="${set.twitterFlag eq 'Y'}">
<script>
(function() {
    linkElement = document.getElementById("tweet-this-post"),
    getPostLink = window.location.href;
    getPostTitle = document.title;
    
  linkElement.setAttribute("href", getPostLink);

  $(linkElement).on("click", function(event) {

    event.preventDefault();

    var tweetedLink = this.getAttribute("href");

    window.open("https://twitter.com/intent/tweet?url=" + tweetedLink + "&text=" + getPostTitle + "&via=kaidez&", "twitterwindow", "height=450, width=550, toolbar=0, location=0, menubar=0, directories=0, scrollbars=0");
  });
})();
</script>
</c:if>
<c:if test="${set.naverFlag eq 'Y'}">
<script> 
    function naverShare() {
      var nurl = window.location.href;
      var ntitle = document.title;
      ntitle = encodeURI(ntitle);
      nurl = encodeURI(encodeURIComponent(nurl));
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + nurl + "&title=" + ntitle;
      window.open(shareURL, "naverwindow", "height=450, width=550, toolbar=0, location=0, menubar=0, directories=0, scrollbars=0");
    }
</script>
</c:if>
<c:if test="${set.kakaoFlag eq 'Y'}">
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
//<![CDATA[
  // Set JavaScript Key of current app.
  Kakao.init('${set.kakaoKey}');
  // Create KakaoStory share button.
  const kurl = window.location.href;
  const ktitle = document.title;
  function shareStory() {
    Kakao.Story.share({
      url: ''+kurl+'',
      text: ''+ktitle+''
    });
  }
//]]>
</script>
</c:if>
