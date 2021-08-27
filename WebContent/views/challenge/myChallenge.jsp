<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	ChallengeReply cr = ((ChallengeReply)request.getAttribute("cr"));
	Challenge c = (Challenge)request.getAttribute("c");
	
	String s = list.get(0).getStart();
	String e = list.get(0).getEnd();
	
	SimpleDateFormat sf = new SimpleDateFormat("yy-mm-dd");
	
	Date start = sf.parse(s);
	Date end = sf.parse(e);
	
	long calDate = start.getTime() - end.getTime();
	int dt = (int)calDate;
	long calDays = calDate / (24*60*60*1000);
	calDays = Math.abs(calDays);

	int mod = (int)(calDays%7);
	int row = (int)(calDays/7);

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
						<%}} %>								
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
<script type="text/javascript">
	$(window).load(function(){
		if(c.getRpCount !=0){
			
		}
	})


</script>
</body>
</html>