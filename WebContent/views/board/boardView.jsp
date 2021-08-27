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
		#insertBtn{
	      	background-color: #78c2ad;
	      	color:#fff;
	      	border-color:#78c2ad;
	      
     	}
     	#insertBtn:hover{
	      	background-color: #fff;
	      	color:#78c2ad;
	      	border-color:#78c2ad;
     	}
     	.btn-group{
	      	background-color: #78c2ad;
	      	color:#fff;
	      	border-color:#78c2ad;
	      
     	}
     	.btn-group:hover{
	      	background-color: #fff;
	      	color:#78c2ad;
	      	border-color:#78c2ad;
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
			 					<td> image </td> 
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
	 		</div>
	 		<% if(loginUser != null){ %>
	 		<div>
	 			<div class="pagingArea" align="center">
	 				<!-- 맨 처음페이지로  -->
	 				<button class="btn btn-sm btn-rounded" name="btn-group" onclick="location.href='<%=contextPath%>/list.bo?currentPage=1'"> &lt;&lt; </button>
	 				<!-- 이전 페이지로 -->
	 				<%if(currentPage == 1){ %>
					<button class="btn btn-sm btn-rounded" name="btn-group" disabled> &lt; </button>
					<%}else{ %>
					<button class="btn btn-sm btn-rounded" name="btn-group" onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>'"> &lt; </button>
					<%} %>
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
						
						<%if(p == currentPage){ %>
						<button class="btn btn-sm btn-rounded" name="btn-group" disabled> <%= p %> </button>
						<%}else{ %>
						<button class="btn btn-sm btn-rounded" name="btn-group" onclick="location.href='<%=contextPath %>/list.bo?currentPage=<%= p %>'"> <%= p %> </button>
						<%} %>
						
					<%} %>
					<!-- 다음페이지로(>) -->
					<%if(currentPage == maxPage){ %>
					<button class="btn btn-sm btn-rounded" name="btn-group" disabled> &gt; </button>
					<%}else { %>
					<button class="btn btn-sm btn-rounded" name="btn-group" onclick="location.href='<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>'"> &gt; </button>
					<%} %>
				
					<!-- 맨 끝으로 (>>) -->
					<button class="btn btn-sm btn-rounded" name="btn-group" onclick="location.href='<%=contextPath%>/list.bo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
					
					<!-- 글작성하기 버튼 -->
					<button id="insertBtn" class="btn btn-sm btn-rounded pull-right" onclick="location.href='enrollForm.bo'" >작성하기</button>
	 			</div>
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