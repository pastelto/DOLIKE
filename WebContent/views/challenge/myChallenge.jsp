<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*, java.util.Date, java.text.SimpleDateFormat"%>
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
	table {
		text-align : center;
		margin:auto;
	}
</style>
<!-- 
<i class="fab fa-fort-awesome-alt"></i> // 원+성
<i class="fas fa-truck"></i> // 트럭
<i class="fas fa-heart"></i> //하트
 -->

</head>

<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<div class="container-fluid">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#ch-body-m" id="m-challenge">참여중인 챌린지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="<%= request.getContextPath() %>/myEndedChallenge.ch" id="e-challenge">종료된 챌린지</a></li>			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade show active" id="ch-body-m" >
				<h2 align="center"><%= loginUser.getNickName()%> 님의 챌린지</h2>
				<div height="20px"></div>
				<div class="root-container">
					<%
					if (c != null && at != null) {
					%>
					<div class="container ">
						<div class="root-content">
							<div class="root-section">
								<section class="challenge-list">
									<ul class="live-item-list">
										<li class="item">
											<div class="hide"><%=c.getChNo()%></div>
											<div class="item-wrap">
												<a href="<%=request.getContextPath()%>/challengedetail.ch"
													class="item-click"> <img src="./resources/challenge_upfiles/<%=at.getNewName()%>" alt="챌린지이미지" class="img-challenge">
												</a>
												<div class="item-info">
													<div>
													<h4 class="title" style="float:left">
														<a href="<%=request.getContextPath()%>/challengedetail.ch"><%=c.getChTitle()%></a>
													</h4></div> <br>
													<div>									
													<ul class="challenge-period">
														<li>진행일정 : <%=c.getStart()%> ~ <%=c.getEnd()%></li>
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
					<%} %>
				</div>
						
			</div>
		</div>
	</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
<
</body>
</html>