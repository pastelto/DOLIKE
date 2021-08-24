<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*"%>
<%
	ArrayList<ChallengeVote> list = (ArrayList<ChallengeVote>)request.getAttribute("list"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row">
				<div class="col-12 m-b-30">
					<h4 class="d-inline">새롭게 참여하고싶은 챌린지를 선택해주세요</h4>
					<p class="text-muted">1개의 챌린지만 선택 가능</p>
					<div class="row">
						<div class="col-md-6 col-lg-3">
						<%if(!list.isEmpty()){%>
							<% for(int i = 0; i < list.size(); i++) { %>
								<form action="<%=contextPath%>/upVote.ch" method="post">
									<div class="card">
										<div class="card-header bg-white">
											<h5 class="card-title"><%= list.get(i).getChTitle()%></h5><!-- 챌린지 타이틀 -->
										</div>
										<div class="card-body">
											<p class="card-text"><%= list.get(i).getContent()%></p><!-- 챌린지 설명 -->
										</div>
										<div class="card-footer">									
											<input type="radio" class="radio" name="challenge" value=<%= list.get(i)%>/>								
										</div>
									</div>
								</form>
							 <%}}%>
						</div>				
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>