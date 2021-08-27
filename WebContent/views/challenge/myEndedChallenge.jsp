<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
	java.util.Date, java.text.SimpleDateFormat"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	Challenge c = (Challenge)request.getAttribute("c");	
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
				<%for (int i=0; i < list.size();i++) {%>
					<%	
						 String s = list.get(i).getStart();
							String e = list.get(i).getEnd();
							
							SimpleDateFormat sf = new SimpleDateFormat("yy-mm-dd");
							
							Date start = sf.parse(s);
							Date end = sf.parse(e);
							
							long calDate = start.getTime() - end.getTime();
							
							long calDays = calDate / (24*60*60*1000);
							calDays = Math.abs(calDays);
							
							int mod = (int)(calDays%7);
							int row = (int)(calDays/7); 
					 %>				 				
					<table border='lightgrey 0.5px'>
					<%if(mod == 0){%>
						<%for(int j = 0; j < row; j++){%>
						<tr height = '100px'>
							<%for(int k=0; k<7; j++) {%>
							<td width='100px'>
							<%}%>
						<%}%>
					<%} else { %>
						<%for(int j = 0; j < row+1; j++){%>
						<tr height = '100px'>
							<%for(int k=0; k<7; k++) {%>
							<td width='100px'>
							<%}%>
						<%}%>
					<%}%>
					</td>
					</tr>
					</table>
				<%} %>
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