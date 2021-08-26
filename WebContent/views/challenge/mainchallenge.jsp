<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
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
<!-- Custom Stylesheet -->
<!-- <link href="../css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->

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
<body>
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="container-fluid">
				<div class="row" style="margin-bottom: 13%;">
					<div class="topList col-10" align="center">

						<div id="thumbList"
							style="height: 10%; padding-left: 15%; padding-right: 5%">
							<div class="card" style="width: 80%;">
								<!--                             <div class="card-body"> -->

								<div class="bootstrap-carousel" style="height: 5rem;">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<ol class="carousel-indicators">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="0" class="active"></li>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="1"></li>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="2"></li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
												<img class="d-block w-100"
													style="width: 10%; height: 18rem;"
													src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/2f584176-70f3-4f90-b940-6df1b60cd0e1/%ED%88%AC%ED%91%9C_%EB%B0%B0%EB%84%88-001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210826T011928Z&X-Amz-Expires=86400&X-Amz-Signature=6ee40b3e716402b105df0a867a7a10b1b5518f55b7c8be7bf431961c6e4e79bf&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25ED%2588%25AC%25ED%2591%259C%2520%25EB%25B0%25B0%25EB%2584%2588-001.png%22"
													alt="First slide">
											</div>
											<div class="carousel-item">
												<img class="d-block w-100"
													style="width: 10%; height: 18rem;"
													src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/af158413-7cf3-4e68-bb99-4d9e2ce9ae7e/%EC%B1%8C%EB%A6%B0%EC%A7%80_%EC%8B%A0%EC%B2%AD-001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210826%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210826T012613Z&X-Amz-Expires=86400&X-Amz-Signature=7d255596af802ada91b32fceba5325b8eb76f11ad5dcc81e8b47b38d21d46d30&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25EC%25B1%258C%25EB%25A6%25B0%25EC%25A7%2580%2520%25EC%258B%25A0%25EC%25B2%25AD-001.png%22"
													alt="Second slide">
											</div>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" data-slide="prev"><span
											class="carousel-control-prev-icon"></span> <span
											class="sr-only">Previous</span> </a><a
											class="carousel-control-next"
											href="#carouselExampleIndicators" data-slide="next"><span
											class="carousel-control-next-icon"></span> <span
											class="sr-only">Next</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="root-container">
					<%
					if (!list.isEmpty() && !fileList.isEmpty()) {
					%>
					<div class="container ">
						<div class="root-content">
							<div class="root-section">
								<section class="challenge-list">
									<div class="section-header">
										<h4>챌린지</h4>
									</div>
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
		<%@ include file="../common/footer.jsp"%>
	</div>
<script>
<% if(!list.isEmpty()){%>
	$(function() {
		$("ul>li").click(function(){
			var chno = $(this).children().eq(0).text();						
					location.href = "<%= contextPath()%>/challengedetail.ch?chno="+chno;
				})					
			})
<% } %>
</script>
</body>
</html>