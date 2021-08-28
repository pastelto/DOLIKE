<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
	java.util.Date, java.text.SimpleDateFormat"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>) request.getAttribute("list");
	ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>) request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<style>
* {
	box-sizing: border-box;
}

body {
	display: block;
	width: 100%;
	margin: 0;
	word-break: keep-all;
	word-wrap: breke-word;
	color: #2363747;
	text-align: left;
}

.navbar {
	display: flex !important;
	flex-basis: auto;
	flex-grow: 1;
	align-item: center;
}

.nav {
	justify-content: end;
}

.challenge-list .section-header {
	justify-content: space-between;
}

.section-header {
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
}

.root-content .root-section {
	display: flex;
	padding-top: 0.5rem;
}

.challenge-list {
	padding: 0 0 2.5rem 0;
}

.live-item-list {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-lnline-end: 0px;
	padding-inline-start: 40px;
}

.challenge-list .live-item-list .item-wrap {
	list-style: none;
	list-style-position: initial;
	list-style-image: initial;
	list-style-type: none;
}

.item-wrap {
	display: flex;
	width: 800px;
	height: 165px;
	transition-delay: initial;
	transition-duration: 0.1s;
	transition-property: all;
	transition-timing-function: ease-in-out;
	overflow: hidden;
	width: 100%;
	border: 0.0625rem solid #D7E2EB;
	border-top-color: rgb(215, 226, 235);
	border-top-style: solid;
	border-top-width: 0.0625rem;
	border-right-color: rgb(215, 226, 235);
	border-right-style: solid;
	border-right-width: 0.0625rem;
	border-bottom-color: rgb(215, 226, 235);
	border-bottom-style: solid;
	border-bottom-width: 0.0625rem;
	border-left-color: rgb(215, 226, 235);
	border-left-style: solid;
	border-left-width: 0.0625rem;
	border-image-source: initial;
	border-image-slice: initial;
	border-image-width: initial;
	border-image-outset: initial;
	border-image-repeat: initial;
	border-radius: 0.5rem;
}

.item {
	width: 800px;
	height: 165px;
	overflow: hidden;
	list-style: none;
	margin-bottom: 1.5rem;
}

.item-info {
	width: 54%;
	padding-left: 1.5rem;
	padding-right: 1rem;
	padding-top: 1rem;
	padding-bottom: 1rem;
}

li, h5 {
	font-size: 16px;
	letter-spacing: -0.009em;
	line-height: 1.6;
}

li {
	display: list-item;
	list-style: none;
	text-align: -webkit-match-parent;
}
.hide{
	display: none;
}

.item>img {
	position: absolute;
	top: 50%;
	left: 50%;
	width: auto;
	height: 100% transform: translate(-50%, -50%);
}

img {
	vertical-align: middle;
	border-style: none;
}

a {
	cursor: pointer;
}
</style>
</head>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link"
				data-bs-toggle="tab" href="<%= request.getContextPath() %>/myChallenge.ch" id="m-challenge">참여중인 챌린지</a></li>
			<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab"
				href="#ch-body-e" id="e-challenge">종료된 챌린지</a></li>			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade" id="ch-body-m" >
				
			</div>
			<div class="tab-pane fade show active" id="ch-body-e">
				<h2 align="center"><%= loginUser.getNickName()%> 님의 챌린지</h2>				
					<div class="root-container">
					<%
					if (!list.isEmpty() && !fileList.isEmpty()) {
					%>
					<div class="container ">
						<div class="root-content">
							<div class="root-section">
								<section class="challenge-list">
									<ul class="live-item-list">
										<%
										for (int i = 0; i < list.size(); i++) {
										%>
										<li class="item">
											<div class="hide"><%=list.get(i).getChNo()%></div>
											<div class="item-wrap">
												<a href="<%=request.getContextPath()%>/challengedetail.ch"
													class="item-click"> <img src="./resources/challenge_upfiles/<%=fileList.get(i).getNewName()%>" alt="챌린지이미지" class="img-challenge">
												</a>
												<div class="item-info">
													<div>
													<h4 class="title" style="float:left">
														<a href="<%=request.getContextPath()%>/challengedetail.ch"><%=list.get(i).getChTitle()%></a>
													</h4></div> <br>
													<div>									
													<ul class="challenge-period">
														<li>진행일정 : <%=list.get(i).getStart()%> ~ <%=list.get(i).getEnd()%></li>
														<li>카테고리 : <%=list.get(i).getCategoryTitle()%></li>
													</ul>
													</div>
												</div>
											</div>
										</li>
										<%}%>
									</ul>
								</section>
							</div>
						</div>
					</div>
					<%} %>
				</div>
			</div>				
		</div>
	</div>
	<script>
	$(".nav a").click(function(){
		$(this).parent().addClass("active").
				siblings().removeClass("active");
		
		var id=$(this).attr("href");
		$(id).show().siblings().hide();
		
		return false;
	});
	</script>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>