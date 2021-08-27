<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao, java.util.ArrayList, com.kh.member.model.vo.Member " %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
		
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
		body{
			margin-right : 100px ;
			margin-left : 100px ;
		}
	</style>
</head>
<body>

	<%@ include file="../common/menuSideBar.jsp" %> 

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        	<div class="container-fluid">
        
	 		<div class="row">
	 			<table name="listArea" class="table table-hover" style="text-align:center; border:1px solid #dddddd">
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
							<td colspan="6">조회된 게시글이 없습니다.</td>
						</tr>
		 				<% }else{ %>
			 				<% for(Board b : list){ %>
			 				<tr>
			 				<% if(b.getTitleImg() != null ){ %>
			 					<td><img src="<%=contextPath %>/resources/board_upfiles/<%= b.getTitleImg() %>" width="200px" height="150px"> </td>
			 					<td><%= b.getBoardNo() %></td>
			 					<td><%= b.getBoardTitle() %></td>
			 					<td><%= b.getNickName() %></td>
			 					<td><%= b.getBoardDate() %></td>
			 					<td><%= b.getViews() %></td> 
			 					<%} else{ %>
			 					<td> 111</td>
			 					<td><%= b.getBoardNo() %></td>
			 					<td><%= b.getBoardTitle() %></td>
			 					<td><%= b.getNickName() %></td>
			 					<td><%= b.getBoardDate() %></td>
			 					<td><%= b.getViews() %></td> 
			 					<%} %>
			 					
			 				</tr>
			 				<% } %>
		 				<% } %>
		 				
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
	 			
	 		</div>
	 		<% if(loginUser != null){ %>
			<div class="btn btn-primary pull-right" >
				<button onclick="location.href='enrollForm.bo'" style="border:none; background:none; color:white">작성하기</button>
			</div>
			<% } %>
        </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp" %>

	<script>
		<%if(!list.isEmpty()){%>
		$(function(){
			$(".table>tbody>tr").click(function(){
				var bno = $(this).children().eq(1).text();
				location.href="<%= contextPath %>/detail.bo?bno="+bno;
			})
		})
		<%}%>
		
	</script>

</body>
</html>