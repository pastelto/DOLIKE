<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*, java.util.Date"%>
<%
	Challenge c = (Challenge)request.getAttribute("c");
	ChallengeAttachment at = (ChallengeAttachment) request.getAttribute("at");
%>
<!DOCTYPE html>
<html>
<head>
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> <!-- font Awesome cdn -->
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
#mission{
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#mission:hover{
	color: #78c2ad;
	background-color: #fff;
	border-color: #78c2ad;
}
#text-center{
	text-align:center;
}
#m-challenge{
	color:#78c2ad;
}
#e-challenge{
	color:#f3969a;
}
#a-challenge{
	color:#f3969a;
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
	text-align:center;
	padding-left:110px;
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
	width: 70%;
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
		<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">챌린지</li>
                        <li class="breadcrumb-item active">마이 챌린지</li>
                    </ol>
                </div>
            </div>	
            <br>
		<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#ch-body-m" id="m-challenge">참여중인 챌린지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="<%= request.getContextPath() %>/myEndedChallenge.ch" id="e-challenge">종료된 챌린지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="<%= request.getContextPath() %>/myApList.ch" id="a-challenge">신청 리스트</a></li>				
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade show active" id="ch-body-m" >
				<br>
				<br>
				<h2 align="center"><b><%= loginUser.getNickName()%></b> 님의 챌린지</h2>
					<br>
					<br>
				<div class="root-container" align="center">
					<%
					if (c != null && at != null) {
					%>
					<div class="container ">
						<div class="root-content">
							<div class="root-section">
								<section class="challenge-list">
									<ul class="live-item-list" id="clickUl">
										<li class="item">
											<div class="hide"><%=c.getChNo()%></div>
											<div class="item-wrap">
												 <img src="./resources/challenge_upfiles/<%=at.getNewName()%>" alt="챌린지이미지" class="img-challenge">												
												<div class="item-info">
													<div>
													<h4 class="title" style="float:left">
														<%=c.getChTitle()%>
													</h4>
													</div> 
													<br><br>
													<div>									
													<ul class="challenge-period">
														<li>진행일정 : <%=c.getStart().substring(2,10)%> ~ <%=c.getEnd().substring(2,10)%></li>
														<li>카테고리 : <%=c.getCategoryTitle()%></li>
													</ul>
													</div>
												</div>
											</div>
										</li>
									</ul>
								</section>
							</div>
						</div>
					</div>
					<%} else {%>
						<div class="container col-5 ">
							<div class="card" id="null-end">
								<div class="card-header" id="text-center">참여중인 챌린지가 없습니다</div>
								<div class="card-body">
									<div class="items-center" style="text-align:center;">
										<a href="<%=request.getContextPath()%>/challengeMain.ch" class="item-click"> 
											<img src="./resources/challenge_upfiles/null-my.png" alt="null-my" class="null-my" width="300px" height="300px"><br><br>
											<button class="btn btn-primary px-3 ml-4" id="mission">챌린지 도전하러 가기</button>
										</a>
									</div>
								</div>
							</div>
						</div>
					<%} %>
				</div>
						
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
	</div>
	<script>
	<% if(c != null){%>
		$(function() {
			$("#clickUl>.item").click(function(){
				var chno = $(this).children().eq(0).text();				
						
						location.href = "<%=request.getContextPath()%>/challengedetail.ch?chno="+chno;
					})					
				})
	<% } %>
	</script>
</body>
</html>