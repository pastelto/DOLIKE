<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.follow.model.vo.*, com.kh.member.model.vo.*, com.kh.category.model.vo.*"%>
<%
ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	ArrayList<Category> catList = (ArrayList<Category>)request.getAttribute("catList");
	FollowPageInfo pi = (FollowPageInfo)request.getAttribute("pi");
	int followCount = (int)request.getAttribute("followCount");
	Member m = (Member)request.getAttribute("m");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	String nickId = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 상세 보기</title>

<style>
#fList {
	height: 40rem;
}

#iconMsg {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#iconMsg:hover {
	color: #78c2ad;
	background-color: #fff;
	border-color: #78c2ad;
}

#byefr, #deleteBtn {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#byefr:hover {
	color: #f3969a;
	background-color: #fff;
	border-color: #f3969a;
}

#jum {
	padding: 1rem 0.5rem;
	margin-bottom: 1rem;
	background: #78c2ad;
	color: #fff;
	border-radius: .3rem;
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

#up {
	position: relative !important;
}

#down {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

#interestLabel {
	/* background: #78c2ad; */
	background: gray;
}

#dia {
	color: #78c2ad;
}

#iconfl {
	color: #f3969a;
}
</style>

</head>
<body>
<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>

		<div class="content-body">


			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="javascript:void(0)">회원 목록</a></li>
						<li class="breadcrumb-item active"><a
							href="javascript:void(0)">회원 상세보기</a></li>
					</ol>
				</div>
			</div>


			<br> <br>

						
			<div class="container-fluid">
				<div class="col-10" style="margin: 0 auto;">

					<div class="row">
						<div class="col-1"></div>


						<!-- 친구 선택 안했을 경우 보여지는 창 -->
						<div id="nonCheckFl" class="col-5" style="display: block;">

							<div id="fList">
								<div class="text-center" style="text-align: center;">

									<div id="down" style="text-align: left;">
										<img src="./resources/images/do_100.png" width="100%" height="100%">
									</div>
								</div>
							</div>
						</div>

j
						<!--오른 쪽 친구추가한 유저 정보 보여주는 부분 -->
						<div id="checkFl" class="col-5" style="display: none">



							<div id="fList" class="card">
								<div class="card-body">
									<div class="media align-items-center mb-4">
										<img class="mr-3" src="./resources/images/do_100.png"
											width="80" height="80" alt="">
										<div class="media-body">
											<h3 class="mb-0">
												<b id="nick"></b>
											</h3>
											<p class="text-muted mb-0">
												(id: <small id="flid"></small>)
											</p>
										</div>
										<button id="iconMsg" class="btn btn-sm px-2"
											onclick="location.href='<%=request.getContextPath()%>/writeForm.ms'">
											<i class="icon-envelope menu-icon"></i> 쪽지
										</button>
									</div>
									<hr>
									<div class="text-center">
										<div class="card-footer border-0 bg-transparent">
											<div class="row">
												<div class="col-6 border-right-1">
													<span><h3>
															<i id="iconfl" class="fa fa-user gradient-1-text"
																aria-hidden="true"></i>
															<p id="followerCount">팔로워 수</p>
														</h3> </span>
												</div>
												<div class="col-6">
													<span><h3>
															<i id="iconfl" class="fa fa-pencil gradient-3-text"></i>
															<p id="boardCount">게시글 수</p>
														</h3> </span>
												</div>
											</div>
										</div>
									</div>

									<hr>
									<div class="card mt-4">
										<div class="media align-items-center">

											<div class="card-body text-center">
												<!-- <span id="interestLabel" class="label label-pill label-primary"></span> -->
												<!-- <p class="text-muted" id="followInterest">등록된 관심사가 없습니다.</p> -->
												<!-- ----------------- -->

												<table id="catTable" class="table table-borderless"
													style="text-align: center;">
													<% if(catList.isEmpty()){ %>
													<tr>
														<td colspan="3">등록 된 카테고리가 없습니다.</td>
													</tr>
													<% }else{  %>
													<% for(int i=0;i<catList.size();i++){ %>
													<%if(i%3==0){ %>
													<tr>
														<td width="33.3%"><span id="<%= i %>"
															class="label label-pill label-primary"># <b><%= catList.get(i).getCategoryName() %></b></span></td>
														<%}else if(i%3==1){ %>
														<td width="33.3%"><span id="<%= i %>"
															class="label label-pill label-primary"># <b><%= catList.get(i).getCategoryName() %></b></span></td>
														<%}else{ %>
														<td width="33.3%"><span id="<%= i %>"
															class="label label-pill label-primary"># <b><%= catList.get(i).getCategoryName() %></b></span></td>
													</tr>
													<%} %>
													<% } %>
													<% } %>
												</table>

												<!-- ----------------- -->
											</div>

										</div>

									</div>

									<hr>

									<div class="col-12 text-center">
										<form action="deleteFl2.fl" method="get">
											<input type="hidden" id="flidinput" name="flidinput">
											<button id="byefr" class="btn px-4 mt-2" type="submit">친구
												삭제하기</button>
										</form>

									</div>
								</div>
							</div>



						</div>



						<!-- 친구추가 검색창 및 리스트 -->

						<div class="col-5">

							<div id="fList" class="card">
								<div id="jum" class="jumbotron text-center">
									<b>나의 친구 (<%= followCount %>명)
									</b>
								</div>
								<div class="card-body" style="text-align: center;">
									<div id="up">
										<div id="down" class="input-group-prepend">
											<form id="searchForm" class="form-inline" action="insert.fl"
												method="post">

												<div class="input-group text-center mb-3">
													<input type="text" class="form-control"
														placeholder="친구를 찾아보세요!" name="followId" size="35%">
													<div class="input-group-append">
														<button id="iconMsg" class="btn" type="button"
															onclick="searchId();">검색</button>
														<button id="byefr" class="btn" type="reset">취소</button>
													</div>
												</div>
											</form>
										</div>
									</div>

									<br>
									<hr>
									<!-- 친구 목록 페이지 불러오기 -->
									<!-- <div> -->
									<%if (list.isEmpty()) {%>
									<div id="down" style="text-align: center;">
										<img src="./resources/images/friend.png" width="50%"
											height="50%">
									</div>
									<% } else {%>

									<div class="card-body"
										style="height: 360px; padding-top: 10px; padding-bottom: 10px">
										<table id="flList" class="table table-hover table-borderless"
											style="text-align: center;">

											<% for (Follow fl : list) {%>
											<tr>
												<td><%=fl.getFollowId()%></td>
												<td>
													<form action="delete.fl" method="post">
														<input type="hidden" name="fno"
															value="<%=fl.getFollowNo()%>">
														<button id="deleteBtn" type="submit" class="btn btn-sm">삭제하기</button>
													</form>
												</td>
											</tr>

											<%}%>
										</table>
									</div>
									<hr>
									<!-- 페이지 처리 -->

									<div class="card-footer border-0 bg-transparent">

										<div>
											<ul class="pagination justify-content-center">
												<!-- 맨앞으로 -->
												<li><a id="pageTag" class="page-link"
													href="<%=contextPath%>/MyFollow.fl?currentPage=1">
														&laquo; </a></li>

												<!-- 이전페이지 -->
												<% if(currentPage == 1) {%>
												<li class="page-item disabled"><a id="pageDisable"
													class="page-link"> &lt; </a></li>
												<% }else{ %>
												<li class="page-item"><a id="pageTag" class="page-link"
													href="<%= contextPath %>/MyFollow.fl?currentPage=<%= currentPage-1 %>">
														&lt; </a></li>
												<%} %>


												<!-- 페이지 목록 -->
												<%for(int p=startPage; p<=endPage; p++){ %>

												<%if(p == currentPage){ %>
												<li class="page-item disabled"><a id="pageDisable"
													class="page-link"> <%= p %>
												</a></li>
												<%}else{ %>
												<li class="page-item"><a id="pageTag" class="page-link"
													href="<%=contextPath %>/MyFollow.fl?currentPage=<%= p %>"><%= p %>
												</a></li>
												<%} %>

												<%} %>


												<!-- 다음페이지 -->
												<% if(currentPage == maxPage) {%>
												<li class="page-item disabled"><a id="pageDisable"
													class="page-link"> &gt; </a></li>
												<% }else{ %>
												<li class="page-item"><a id="pageTag" class="page-link"
													href="<%= contextPath %>/MyFollow.fl?currentPage=<%= currentPage+1 %>">
														&gt; </a></li>
												<%} %>

												<!-- 맨뒤로 -->
												<li><a id="pageTag" class="page-link"
													href="<%= contextPath %>/MyFollow.fl?currentPage=<%= maxPage %>">
														&raquo; </a></li>
											</ul>
										</div>
									</div>

									<%}%>

								</div>






							</div>

						</div>
						<div class="col-1"></div>
					</div>
				</div>
			</div>
			
			

		</div>


	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>