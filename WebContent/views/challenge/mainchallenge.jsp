<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../common/menuSideBar.jsp" %>
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