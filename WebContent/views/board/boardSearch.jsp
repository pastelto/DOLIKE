<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao, java.util.ArrayList, com.kh.member.model.vo.Member " %>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list"); 
	
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
	<div class="content-body">
	 		<div class="row">
	 			<table name="listArea" class="table table-hover" style="text-align:center; border:1px solid #dddddd">
	 				<thread>
	 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
	 						
			 				<!-- <th style="background-color:rgb(228, 243, 240); text-align:center;">이미지 </th> -->
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">번호 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">제목 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성자 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성일 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">조회수 </th>
	 					</tr>
	 				</thread>
	 				<tbody>
	 				<% if(findBoard != null){ %>
						
			 				<% for(Board b : list){ %>
			 				<tr>
			 				<% if(b.getTitleImg() != null ){ %>
			 					<td><img src="<%=contextPath %>/resources/board_upfiles/<%= b.getTitleImg() %>" width="200px" height="150px"> </td>
			 					<%} else{ %>
			 					
			 					<%} %>
			 					<td><%= b.getBoardNo() %></td>
			 					<td><%= b.getBoardTitle() %></td>
			 					<td><%= b.getNickName() %></td>
			 					<td><%= b.getBoardDate() %></td>
			 					<td><%= b.getViews() %></td> 
			 				</tr>
			 				<% } %>
		 			
		 			<% } %>
		 				
	 				</tbody>
	 			</table>	
	 			
	 		</div>
        </div>
        <%@ include file="../common/footer.jsp" %>
        <script>
			<%if(!list.isEmpty()){%>
			$(function(){
				$(".table>tbody>tr").click(function(){
					var bno = $(this).children().eq(0).text();
					location.href="<%= contextPath %>/detail.bo?bno="+bno;
				})
			})
			<%}%>
		
		</script>
</body>
</html>