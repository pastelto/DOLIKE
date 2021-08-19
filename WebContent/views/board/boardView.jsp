<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao, java.util.ArrayList" %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
		
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
		
	String contextPath = request.getContextPath();
		
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
	<style>
		.nk-sidebar{
			padding:30px;
		}
		.content-body{
			padding:5px 0px 0px 30px;
		}
		a, a:hover {
			color : #000000;
			text-decoration:none;
		}
	</style>
	<link href="../../css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>
<body>

	<%@ include file="../common/menuSideBar.jsp" %> 

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
	 		<div class="row">
	 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	 				<thread>
	 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">이미지 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">번호 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">제목 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성자 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성일 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">조회수 </th>
	 					</tr>
	 				</thread>
	 				<tbody>
						<% if(list.isEmpty()){ %>
						<tr> 
							<td colspan="6">조회된 리스트가 없습니다.</td>
						</tr>
		 				<% }else{ %>
			 				<% for(Board b : list){ %>
			 				<tr>
			 					<td><%= b.getBoardNo() %></td>
			 					<td><%= b.getCategoryNo() %></td>
			 					<td><%= b.getBoardTitle() %></td>
			 					<td><%= b.getNickName() %></td>
			 					<td><%= b.getViews() %></td>
			 					<td><%= b.getBoardDate() %></td>
			 				</tr>
			 				<% } %>
		 				<% } %>
		 				<%--
	 					<tr><a href="view.jsp?bbsId=<%= list.get(i).getBoardNo() %>"></a> <!-- 게시글리스트 테이블의 바디 -->
	 						<td>image</td>
	 						<td>1</td>
	 						<td>제목칸입니다</td>
	 						<td>운영자</td>
	 						<td>2021-08-12</td>
	 						<td>99</td>
	 						
	 						<td><%= list.get(i)%></td> <!-- 게시글 이미지(첨부파일) -->
	 						<td><%= list.get(i).getBoardNo() %></td> <!-- 게시글 번호 -->
							<td><%= list.get(i).getBoardTitle() %></td> <!-- 게시글 제목 -->
							<td><%= list.get(i).getNickName() %></td> <!-- 게시글 작성자 -->
							<td><%= list.get(i).getBoardDate() %></td> <!-- 게시글 작성일 -->
							<td><%= list.get(i).getViews() %></td> <!-- 게시글 조회수 -->
							 
	 					</tr>
	 				 --%>
	 				</tbody>
	 			</table>	
	 				
	 			<br><br>
	 			
	 			<div class="pagingArea" align="center">
	 				<!-- 맨 처음페이지로  -->
	 				<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=1'"> &lt;&lt; </button>
	 				<!-- 이전 페이지로 -->
	 				<%if(currentPage == 1){ %>
					<button disabled> &lt; </button>
					<%}else{ %>
					<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>'"> &lt; </button>
					<%} %>
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
						
						<%if(p == currentPage){ %>
						<button disabled> <%= p %> </button>
						<%}else{ %>
						<button onclick="location.href='<%=contextPath %>/list.bo?currentPage=<%= p %>'"> <%= p %> </button>
						<%} %>
						
					<%} %>
					<!-- 다음페이지로(>) -->
					<%if(currentPage == maxPage){ %>
					<button disabled> &gt; </button>
					<%}else { %>
					<button onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>'"> &gt; </button>
					<%} %>
				
					<!-- 맨 끝으로 (>>) -->
					<button onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
	 			</div>
	 			<div align="center">
				<% if(loginUser != null){ %>
				<button onclick="location.href='enrollForm.bo'">작성하기</button>
				<% } %>
				</div>
	 			<a href="boardWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
	 		</div>

        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp" %>

	<script>
		<%if(!list.isEmpty()){%>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				var bno = $(this).children().eq(0).text();
				location.href="<%= contextPath%>/detail.bo?bno="+bno;
			})
		})
		<%}%>
		
	</script>

</body>
</html>