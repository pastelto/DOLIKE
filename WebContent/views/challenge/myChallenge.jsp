<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
	java.util.Date"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	
	Date start = list.get(0).getStart();
	Date end = list.get(0).getEnd();
	
	long calDate = start.getTime() - end.getTime();
	
	long calDays = calDate / (24*60*60*1000);
	calDays = Math.abs(calDays);

	int mod = 3; //calDays%7;
	int row = 2; //calDays/7;
%>
<!DOCTYPE html>
<html>
<head>
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<style>
	table {
		text-align : center;
		margin:auto;
	}
</style>
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
				<h2 align="center"><%= loginUser.getNickName()%> 님의 챌린지</h2>
				<table border='lightgrey 0.5px'>
				<%if(mod == 0){%>
					<%for(int i = 0; i < row; i++){%>
					<tr height = '100px'>
						<%for(int j=0; j<7; j++) {%>
						<td width='100px'>
						<%}%>
					<%}%>
				<%} else { %>
					<%for(int i = 0; i < row+1; i++){%>
					<tr height = '100px'>
						<%for(int j=0; j<7; j++) {%>
						<td width='100px'>
						<%}%>
					<%}%>
				<%}%>
				</td>
				</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>