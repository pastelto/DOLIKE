<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
<%
	 ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	 ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
 <title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<!-- Custom Stylesheet -->
<!-- <link href="../css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->

<style>
	*{
		box-sizing: border-box;
	}
	body{
		display: block;
		width: 100%;
		margin: 0;
		word-break: keep-all;
		word-wrap: breke-word;
		color: #2363747;
		text-align: left;
	}
	.navbar{
		display: flex !important;
		flex-basis: auto;
		flex-grow: 1;
		align-item: center;
		
	}
	.nav{
		justify-content: end;
	}
	.challenge-list .section-header{
		justify-content: space-between;
	}
	.section-header{
		display:flex;
		align-items: center;
		margin-bottom: 1rem;
	}
	.root-content .root-section{
		display: flex;
		padding-top: 0.5rem;
	}
	.challenge-list{
		padding:0 0 2.5rem 0;
	}
	.live-item-list{
		display: block;
		margin-block-start: 1em;
		margin-block-end: 1em;
		margin-inline-start: 0px;
		margin-lnline-end: 0px;
		padding-inline-start: 40px;
	}
	.challenge-list .live-item-list .item-wrap{
		list-style: none;
		list-style-position: initial;
		list-style-image: initial;
		list-style-type: none;
	}
	.item-wrap{
		display: flex;
		width:800px ;
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
	.item{
		width:800px ;
		height: 165px;
		overflow: hidden;
		list-style:none;
		margin-bottom: 1.5rem;
		
	}
	.item-info{
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
	.item > img {
		position: absolute;
		top: 50%;
		left: 50%;
		width: auto;
		height: 100%
		transform: translate(-50%, -50%);
	}
	img{
		vertical-align: middle;
		border-style: none;
	}
	a{
		cursor: pointer;
	}
</style>
</head>
<body>

	<%@ include file="../common/menuSideBar.jsp"%>

	<div class="content-body">

	<div class="navbar">
		<ul class="nav">
			<li class="nav-item">
				<a class="nav-link" href="">챌린지 투표</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">이달의 챌린저</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">마이 챌린지</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="">종료된 챌린지</a>
			</li>
		</ul>
	</div>
		<div class="root-container">
			<div class="full-banner-style">
				<div class="top-content">
					<a href="투표하기 링크">
					<div class="root-banner-wrap" style="background: "><!-- 색지정 -->
						<a href="투표하기 링크">
						<div class="banner-item-wide" style="background: ">
							<div class="left">
								<h6 class="label-text">Vote your Challenge!</h6>
								<h4 class="headline"><!-- 투표타이틀 --></h4>
								<h5 class="period"><!-- 기간 --></h5>
							</div>
							<div class="right">
								<img src="투표이미지루트" alt="이달의 투표">
							</div>
						</div>
						</a>
					</div>
					</a>
				</div>
			</div>
			
			<div class="container">
				<div class="root-content">
					<div class="root-section">
						<section class="challenge-list">
							<div class="section-header">
								<h4>챌린지</h4>
							</div>
							<ul class="live-item-list">
							<%for(int i=0; i< list.size(); i++) {%>
								<%if(i==0) { %>
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="./resources/challenge_upfiles/<%=fileList.get(i).getNewName() %>" 
											alt="챌린지이미지" class="img-challenge">		
										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지"><%= list.get(i).getChTitle()%></a>
											</h4>
											<ul class="challenge-period">
												<li>진행일정 : <%= list.get(i).getStart() %> ~ <%= list.get(i).getEnd() %></li>
												<li>카테고리 : <%= list.get(i).getCategoryTitle()%> </li>
											</ul>
										</div>
									</div>
								</li>
								<%} else if(i == 1){ %>
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="./resources/challenge_upfiles/<%=fileList.get(i).getNewName() %>" 
											alt="챌린지이미지" class="img-challenge">		

										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지"><%= list.get(i).getChTitle()%></a>
											</h4>
											<ul class="challenge-period">
												<li>진행일정 : <%= list.get(i).getStart() %> ~ <%= list.get(i).getEnd() %></li>
												<li>카테고리 : <%= list.get(i).getCategoryTitle()%> </li>
											</ul>
										</div>
									</div>
								</li>
								<%} else if(i == 2){ %>
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="./resources/challenge_upfiles/<%=fileList.get(i).getNewName() %>" 
											alt="챌린지이미지" class="img-challenge">		
										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지"><%= list.get(i).getChTitle()%></a>
											</h4>
											<ul class="challenge-period">
												<li>진행일정 : <%= list.get(i).getStart() %> ~ <%= list.get(i).getEnd() %></li>
												<li>카테고리 : <%= list.get(i).getCategoryTitle()%> </li>
											</ul>
										</div>
									</div>
								</li>
								<%}} %>
							</ul>
						</section>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>