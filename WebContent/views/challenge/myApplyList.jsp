<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*, java.util.Date, java.text.SimpleDateFormat"%>
<%
		ArrayList<ChallengeApply> list = (ArrayList<ChallengeApply>)request.getAttribute("list"); 
		
		PageInfo pi = (PageInfo)request.getAttribute("pi");
		
		int listCount = pi.getListCount();
		int currentPage = pi.getCurrentPage();
		int endPage = pi.getEndPage();
		int maxPage = pi.getMaxPage();
		int startPage = pi.getStartPage();

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
* {
	box-sizing: border-box;
}

body {
	display: block;
	width: 100%;
	margin: 0;
	word-break: keep-all;
	word-wrap: breke-word;
	color: #2363747;
	text-align: left;
}
#mission{
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#mission:hover{
	color: #78c2ad;
	background-color: #fff;
	border-color: #78c2ad;
}
#text-center{
	text-align:center;
}
#m-challenge{
	color:#f3969a;
}
#e-challenge{
	color:#f3969a;
}
#a-challenge{
	color:#78c2ad;
}

.navbar {
	display: flex !important;
	flex-basis: auto;
	flex-grow: 1;
	align-item: center;
}

.nav {
	justify-content: end;
}

.challenge-list .section-header {
	justify-content: space-between;
}

.section-header {
	display: flex;
	align-items: center;
	margin-bottom: 1rem;
}

.root-content .root-section {
	display: flex;
	padding-top: 0.5rem;
	text-align:center;
	padding-left:110px;
}

.challenge-list {
	padding: 0 0 2.5rem 0;
}

.live-item-list {
	display: block;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-lnline-end: 0px;
	padding-inline-start: 40px;
}

.challenge-list .live-item-list .item-wrap {
	list-style: none;
	list-style-position: initial;
	list-style-image: initial;
	list-style-type: none;
}

.item-wrap {
	display: flex;
	width: 800px;
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

.item {
	width: 800px;
	height: 165px;
	overflow: hidden;
	list-style: none;
	margin-bottom: 1.5rem;
}

.item-info {
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
.hide{
	display: none;
}

a {
	cursor: pointer;
}
#pageTag {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#pageTag:hover {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#pageDisable {
	color: gray;
	background-color: #ced4da;
	border-color: #ced4da;
}
</style>
</head>

<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row page-titles mx-0">
	                <div class="col p-md-0">
	                    <ol class="breadcrumb">
	                        <li class="breadcrumb-item">챌린지</li>
	                        <li class="breadcrumb-item active">마이 챌린지</li>
	                    </ol>
	                </div>
	        </div> <br>
       	
		<div class="container-fluid">
			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link "
					data-bs-toggle="tab" href="#ch-body-m" id="m-challenge">참여중인 챌린지</a></li>
				<li class="nav-item"><a class="nav-link" data-bs-toggle="tab"
					href="<%= request.getContextPath() %>/myEndedChallenge.ch" id="e-challenge">종료된 챌린지</a></li>
				<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab"
					href="<%= request.getContextPath() %>/myApList.ch" id="a-challenge">신청 리스트</a></li>				
			</ul>
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade show active" id="ch-body-a" >
					<br>
					<br>
				<div style="height:40rem;">
				<div class="col-lg-8" style="margin: 0 auto;">
					<div class="table-responsive">
					<div>
					
					<h2 align="center"><%= loginUser.getNickName()%> 님의 신청 리스트</h2>
					<br><br>
						<table class="table table-hover" style="text-align: center;">						
							<thead>
								<tr style="background-color: #78c2ad; color: white;">
									<th>#</th>
									<th>신청내용</th>
									<th>카테고리</th>
									<th>신청유저</th>
									<th>날짜</th>
								</tr>
							</thead>
							<tbody>					
								<% if(list.isEmpty()){ %>
							 	<tr>
									<td colspan="4">신청된 챌린지가 없습니다.</td>
								</tr>
							 <% }else{  %>
							 	<% for(ChallengeApply ca: list){ %>
							 		<tr>
							 			<td><%= ca.getApNo() %></td>
										<td><%= ca.getContent() %></td>
										<td><%= ca.getCategoryNo() %></td>
										<td><%= ca.getApUser() %></td>
										<td><%= ca.getApDate() %></td>
							 		</tr>
							 	<% } %>
							 <% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		
		<!-- 페이지 처리 -->
					<div>
						<ul class="pagination justify-content-center">
							<!-- 맨앞으로 -->
							<li><a id="pageTag" class="page-link" href="<%=contextPath%>/applyList.ch?currentPage=1"> &laquo; </a></li>
							
							<!-- 이전페이지 -->
							<% if(currentPage == 1) {%>
							<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
							<% }else{ %>
							<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
							<%} %>
							
							
							<!-- 페이지 목록 -->
							<%for(int p=startPage; p<=endPage; p++){ %>
							
								<%if(p == currentPage){ %>
									<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
								<%}else{ %>
									<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/applyList.ch?currentPage=<%= p %>"><%= p %> </a></li>
								<%} %>
								
							<%} %>
							
							
							<!-- 다음페이지 -->
							<% if(currentPage == maxPage) {%>
							<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
							<% }else{ %>
							<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
							<%} %>
							
							<!-- 맨뒤로 -->
							<li><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= maxPage %>"> &raquo; </a></li>
						</ul>
					</div>		
				</div>
	  		</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp"%>
</div>

</body>
</html>