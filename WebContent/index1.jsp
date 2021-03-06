<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<style type="text/css">
	*{box-sizing:board-box;}
	<%-- .video-film {box-shadow: rgba(0, 7, 15, 0.7) 0 0 0 9999px; z-index: 100;} --%>
	.video-background {
		background: #000; position: fixed;
		top: 0; right: 0; bottom: 0; left: 0; z-index: -99;
	}
	.video-foreground, .video-background iframe {
		position: absolute; top: 0; left: 0;
		width: 100%; height: 100%; pointer-events: none;
	}
	@media ( min-aspect-ratio : 16/9) {
		.video-foreground {height: 300%; top: -100%;}
	}
	@media ( max-aspect-ratio : 16/9) {
		.video-foreground {width: 300%; left: -100%;}
	}
	h1 {color: white;}
	#visual-btn {
		z-index: 50; color: #78c2ad; font-size: 20px; border: 2px solid #78c2ad;
		padding: 12px 24px; border-radius: 5px; cursor: pointer; background-color: rgba(0, 0, 0, 0);
	}
	#visual-btn:hover {
		color: #ff6868; font-size: 20px; border: 2px solid #ff6868;
		padding: 12px 24px; border-radius: 5px; cursor: pointer;
	}
	#indexBtn {position: fixed; text-align: center}
	.center {position: absolute; top: 70%; left: 47%; margin: -50px 0 0 -50px;}
</style>
</head>
<body>

	
	<p class="type_text" style="text-align:center; color:#d5d4f7; font-size:18pt"></p>
	
	<div id="indexBtn" class="center">
		<button id="visual-btn" onclick="location.href='<%=contextPath%>/main.do'">Visit our Site!</button>
	</div>
	
	<div class="video-background">
		<div class="video-foreground">
			<div id="muteYouTubeVideoPlayer"></div>
		</div>
	</div>
	
	<div class="video-film"></div>
	

	
<!-- 	<script defer src="https://www.youtube.com/iframe_api"></script> -->
	<script defer src="https://www.youtube.com/iframe_api"></script>
	<script type="text/javascript">
		var player;
		
		function onYouTubePlayerAPIReady(){
			player = new YT.Player('muteYouTubeVideoPlayer', {
				videoId : '60iIXM1oPMs',
				playerVars : {
					autoplay : 1, 		// Auto-play the video on load // ?????? ?????? (???)
					controls : 0, 		// Show pause/play buttons in player // ??????????????? ?????? (???)
					rel : 0,			// ?????? ????????? ????????? ??? ?????? ????????? ????????????
					start : 105,
					end : 301,
					showinfo : 0, 		// Hide the video title // ?????? ????????? ?????? ?????? ??????
					modestbranding : 1, // Hide the Youtube Logo
					loop : 1, 			// Run the video in a loop // ?????? ????????? ?????? ??????
					playlist : '60iIXM1oPMs',
					fs : 0, 			// Hide the full screen button
					cc_load_policy : 0, // Hide closed captions
					iv_load_policy : 3, // Hide the Video Annotations
					autohide : 1		// Hide video controls when playing
				},
				events:{
					onReady:function(e){
						e.target.mute();
					}
				}
			});
		}
		
	</script>
	
	
	<!--	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<script  src="https://cdn.jsdelivr.net/jquery.typeit/4.4.0/typeit.min.js"></script>
	
	<!-- <script type="text/javascript" src="resource/js/typeit.min.js"></script> -->
	<!-- <script>
		$(function(){
			var str1 = ["???????????????~  ??????~ ,??????????????????????????????!"];
			var str2 = ["???????????? ????????? ??????!!!!"];
			var str3 = ["Hey, you!!<br>_Right Now Start!!"];
			
			
			
			 $('.type_text').typeIt({
			      strings: [str1, str2,str3],
			      speed: 80,
			      autoStart: true,
			      loop:true
			      });
			 
		});
	</script> -->
	  
	
</body>
</html>