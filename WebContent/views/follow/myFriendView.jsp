<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = (String)request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 나의 친구</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<!-- Custom Stylesheet -->
<link href="css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
	
<style>
	#fList{
		height: 100%
	}
</style>	
	
</head>
<body>
	<%-- <div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%> --%>

	<div class="content-body">


		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-4 col-xl-4">

					<!-- 친구추가한 유저 정보 보여주는 부분 -->
					<div class="card">
						<div class="card-body">
							<div class="media align-items-center mb-4">
								<div class="media-body">
									<h3 class="mb-0">유저 닉네임</h3>
									<p class="text-muted mb-0">(유저 아이디)</p>
								</div>
							</div>

							<div class="row mb-5">
								<div class="col">
									<div class="card card-profile text-center">
										<span class="mb-1 text-primary"><i class="icon-people"></i></span>
										<h3 class="mb-0">263</h3>
										<p class="text-muted px-4">Following</p>
									</div>
								</div>
								<div class="col">
									<div class="card card-profile text-center">
										<span class="mb-1 text-warning"><i
											class="icon-user-follow"></i></span>
										<h3 class="mb-0">263</h3>
										<p class="text-muted">Followers</p>
									</div>
								</div>
								<div class="col-12 text-center">
									<button class="btn btn-danger px-5">Follow Now</button>
								</div>
							</div>

							<h4>About Me</h4>
							<p class="text-muted">Hi, I'm Pikamy, has been the industry
								standard dummy text ever since the 1500s.</p>
							<ul class="card-profile__info">
								<li class="mb-1"><strong class="text-dark mr-4">Mobile</strong>
									<span>01793931609</span></li>
								<li><strong class="text-dark mr-4">Email</strong> <span>name@domain.com</span></li>
							</ul>
						</div>
					</div>

					<br>

					<!-- 친구 추가한 유저가 작성한 게시글 리스트  -->

					<div class="card">
						<div class="card-body">
							<table class="table table-hover" style="text-align: center;">
								<caption style="caption-side: top; text-align: center">
									<h6 style="color: #78c2ad"">
										<b>게시글</b>
									</h6>
								</caption>
								<thead>
									<tr style="background-color: #78c2ad; color: white;">
										<th>#</th>
										<th>제목</th>
										<th>조회수</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>번호</td>
										<td>글제목</td>
										<td>조회수(이건 빼야하나..)</td>
										<td>날짜</td>
									</tr>
									<%-- <% if(list.isEmpty()){ %>
									 	<tr>
											<td colspan="4">존재하는 게시글이 없습니다.</td>
										</tr>
									 <% }else{  %>
									 	<% for(Notice n : list){ %>
									 		<tr>
									 			<td><%= n.getNoticeNo() %></td>
												<td><%= n.getNoticeTitle() %></td>
												<td><%= n.getCount() %></td>
												<td><%= n.getCreateDate()%></td>
									 		</tr>
									 	<% } %>
									 <% } %> --%>
								</tbody>
							</table>
							<%-- 
								<!-- 페이지 처리 -->
								<div>
									<ul class="pagination justify-content-center">
										<!-- 맨앞으로 -->
										<li><a id="pageTag" class="page-link" href="<%=contextPath%>/noticeView.no?currentPage=1"> &laquo; </a></li>
										
										<!-- 이전페이지 -->
										<% if(currentPage == 1) {%>
										<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
										<% }else{ %>
										<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
										<%} %>
										
										
										<!-- 페이지 목록 -->
										<%for(int p=startPage; p<=endPage; p++){ %>
										
											<%if(p == currentPage){ %>
												<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
											<%}else{ %>
												<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/noticeView.no?currentPage=<%= p %>"><%= p %> </a></li>
											<%} %>
											
										<%} %>
										
										
										<!-- 다음페이지 -->
										<% if(currentPage == maxPage) {%>
										<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
										<% }else{ %>
										<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
										<%} %>
										
										<!-- 맨뒤로 -->
										<li><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= maxPage %>"> &raquo; </a></li>
									</ul>
								</div>
								 --%>
						</div>
					</div>

				</div>
				
				<!-- 친구추가 검색창 및 리스트 -->
				
				<div class="col-lg-3 col-xl-3">

					<div id="fList" class="card">
						<div class="card-body">
							<div class="media media-reply">
								<div class="media-body">
									<div class="input-group icons">
										<div class="input-group-prepend">
											<form action="#">
												<span><input type="search" class="form-control"
													placeholder="친구를 찾아보세요!" aria-label="Search Dashboard">

												<button type="submit">버튼</button>
												</span>
											</form>
										</div>
									</div>
								</div>
							</div>
							</div>

							<br>
							
							<div class="media media-reply">
								
                            	여기는 친구 추가한 리스트 노출 부분
                            	(테이블로 처리)
                            	
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%-- 		<%@ include file="../common/footer.jsp" %> 
	</div> --%>

</body>
</html>