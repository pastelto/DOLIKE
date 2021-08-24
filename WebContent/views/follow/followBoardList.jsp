<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
</body>
</html>