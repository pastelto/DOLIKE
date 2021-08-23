<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">

</head>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link active"
				data-bs-toggle="tab" href="#ch-body-m" id="m-challenge">참여중인 챌린지</a></li>
			<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
				href="<%= request.getContextPath() %>/myEndedChallenge.ch" id="e-challenge">종료된 챌린지</a></li>			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade show active" id="ch-body-m" >
				
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>