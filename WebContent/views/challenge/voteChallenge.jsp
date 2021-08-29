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
<style>
	#voteBtn{
		padding: 5px;
   		width: 100%;
	}
	#robster{
		font-family: 'Lobster', cursive;
		color:#ffce67;	
	}
	#inline-vote_common{
		display:inline-block; !important
	}
</style>
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">챌린지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">챌린지 투표</a></li>
                    </ol>
                </div>
            </div>
            <div class="col-1"></div>
             <div class="container-fluid">
				<div class="row">	
				<div class="col-12 m-b-30">				
				<div class="votingBanner" style="text-align:center">
					<img src="./resources/challenge_upfiles/투표진행중.png" alt="vote banner" class="voting" align="center" width="1350px"><br><br>				
					</div>
					<div class="row" style="margin-left:130px; margin-right:130px; margin-top:30px;" width="100%">						
						<%if(!list.isEmpty()){%>
							<% for(int i = 0; i < list.size(); i++) { %>
							<div class="col-lg-4" id="inline-vote">
								<form action="<%=contextPath%>/upVote.ch" method="post" id="voteMe">
									<div class="card">
										<div class="card-header bg-white">
											<h5 align="center"><input type="hidden" class="card-title" style="text-align:center" name="chTitle" value="<%= list.get(i).getChTitle()%>"/><%= list.get(i).getChTitle()%></h5><!-- 챌린지 타이틀 -->
										</div>
										<div class="card-body">
											<p class="card-text"><%= list.get(i).getContent()%></p><!-- 챌린지 설명 -->
										</div>
										<div class="card-footer">									
											<button class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit" id="voteBtn">
													<i class="fa fa-paper-plane m-r-5"></i> Vote ME!
											</button>								
										</div>
									</div>
								</form>
								</div>
							 <%}%>
						<%} %>										
					</div>
				</div>
			</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>