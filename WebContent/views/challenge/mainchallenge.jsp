<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 챌린지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
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
	<div class="content-body">
		<div class="root-container">
			<div class="full-banner-style">
				<div class="top-content">
					<a href="투표하기 링크">
					<div class="root-banner-wrap" style="background: "><!-- 색지정 -->
						<a href="투표하기 링크">
						<div class="banner-item-wide" style="background: ">
							<div class="left">
								<h6 class="label-text">Vote your Challenge!</h6>
								<h4 class="headline"><<!-- 투표타이틀 --></h4>
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
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="이미지루트" alt="첼린지이미지" class="img-challenge">		
										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지">챌린지 타이틀</a>
											</h4>
											<ul class="challenge-period">
												<li>신청 : </li>
												<li>진행일정 : </li>
												<li>카테고리 : </li>
											</ul>
										</div>
									</div>
								</li>
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/f1309092-2006-4ab9-a96b-69a26cd0141b/%E1%84%80%E1%85%A9%E1%86%BC%E1%84%87%E1%85%AE_%E1%84%87%E1%85%A2%E1%84%82%E1%85%A5_%28%E1%84%8F%E1%85%A9%E1%84%83%E1%85%B5%E1%86%BC%29.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210818%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210818T070156Z&X-Amz-Expires=86400&X-Amz-Signature=55a4b6f3c7a65f43b669d7ac204e32c5dc3cf709950c1057750226b2e9f81f9a&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25E1%2584%2580%25E1%2585%25A9%25E1%2586%25BC%25E1%2584%2587%25E1%2585%25AE_%25E1%2584%2587%25E1%2585%25A2%25E1%2584%2582%25E1%2585%25A5_%28%25E1%2584%258F%25E1%2585%25A9%25E1%2584%2583%25E1%2585%25B5%25E1%2586%25BC%29.png%22" 
											alt="첼린지이미지" class="img-challenge">		
										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지">챌린지 타이틀</a>
											</h4>
											<ul class="challenge-period">
												<li>신청 : </li>
												<li>진행일정 : </li>
												<li>카테고리 : </li>
											</ul>
										</div>
									</div>
								</li>
								<li class="item">
									<div class="item-wrap">
										<a href="진행중인 챌린지 페이지" class="item-click">
											<img src="이미지루트" alt="첼린지이미지" class="img-challenge">		
										</a>
										<div class="item-info">
											<h4 class="title">
												<a href="진행중인 챌린지 페이지">챌린지 타이틀</a>
											</h4>
											<ul class="challenge-period">
												<li>신청 : </li>
												<li>진행일정 : </li>
												<li>카테고리 : </li>
											</ul>
										</div>
									</div>
								</li>
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