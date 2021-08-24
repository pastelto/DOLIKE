<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 

	<!-- 친구추가한 유저 정보 보여주는 부분 -->
	<div class="card">
		<div class="card-body">
			<div class="media align-items-center mb-4">
				<img class="mr-3" src="./resources/images/do_100.png" width="80"
					height="80" alt="">
				<div class="media-body">
					<h3 class="mb-0">유저 닉네임</h3>
					<p class="text-muted mb-0">(유저 아이디)</p>
				</div>
				<button id="iconMsg" class="btn btn-sm px-2"
					onclick="location.href='<%=request.getContextPath()%>/writeForm.ms'">
					<i class="icon-envelope menu-icon"></i> 쪽지
				</button>
			</div>

			<hr>
			<div class="card mt-4">
				<div class="media align-items-center">

					<div class="card-body text-center">
						<p class="text-muted">등록된 관심사가 없습니다.</p>
					</div>

				</div>

			</div>

			<hr>

			<div class="col-12 text-center">
				<button id="byefr" class="btn px-4">친구 삭제하기</button>
			</div>
		</div>
	</div>

	<div class="card">
		<div class="card-body text-center">
			<table class="table table-hover " style="text-align: center;">
		<thead>
			<tr style="background-color: #78c2ad; color: white;">
				<th>#</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>

		<!-- 3개만 보이게  -->
		<tbody>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>

			<%-- <% if(list.isEmpty()){ %>
					 	<tr>
							<td colspan="3">존재하는 게시글이 없습니다.</td>
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
		</div>
	</div>



	<%-- 	<table class="table table-hover " style="text-align: center;">
		<thead>
			<tr style="background-color: #78c2ad; color: white;">
				<th>#</th>
				<th>제목</th>
				<th>날짜</th>
			</tr>
		</thead>

		<!-- 3개만 보이게  -->
		<tbody>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>
			<tr>
				<td colspan="3">존재하는 게시글이 없습니다.</td>
			</tr>

			<% if(list.isEmpty()){ %>
					 	<tr>
							<td colspan="3">존재하는 게시글이 없습니다.</td>
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
					 <% } %>
		</tbody>
	</table>
	
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
</body>
</html>