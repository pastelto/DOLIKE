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
    <title>DO LIKE - 게시판 </title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <link href="../../css/style.css" rel="stylesheet">
	<style>
		
		a, a:hover {
			color : #000000;
			text-decoration:none;
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
     	.body-wraper{
     		margin-bottom:20px;
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
		.text-right {
	    	text-align: right !important;
		}
	</style>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
        <div class="content-body">
        	<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">카테고리</li>
                        <li class="breadcrumb-item active">게시판</li>
                    </ol>
                </div>
            </div>
        	<div class="container-fluid">
       		<div class="col-12">
	 		<div class="row">
	 			<table name="listArea" class="table table-hover" style="text-align:center; border:1px solid #dddddd">
	 				<thead>
	 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">번호 </th>
			 				<th style="background-color:rgb(228, 243, 240); text-align:center;">태그 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">제목 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성자 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성일 </th>
	 						<th style="background-color:rgb(228, 243, 240); text-align:center;">조회수 </th>
	 					</tr>
	 				</thead>
	 				<tbody>
						<% if(list.isEmpty()){ %>
						<tr> 
							<td colspan="6">조회된 게시글이 없습니다.</td>
						</tr>
		 				<% }else{ %>
			 				<% for(Board b : list){ %>
			 				<tr>
			 					<td><%= b.getBoardNo() %></td>
			 					<td><%= b.getTagName() %></td>
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
	 		<div>
	 			<ul class="pagination justify-content-center">
					<!-- 맨앞으로 -->
					<li><a id="pageTag" class="page-link" href="<%=contextPath%>/list.bo?currentPage=1"> &laquo; </a></li>
					<!-- 이전페이지 -->
					<% if(currentPage == 1) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/list.bo?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
					<%} %>
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
						<%if(p == currentPage){ %>
							<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
						<%}else{ %>
							<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/list.bo?currentPage=<%= p %>"><%= p %> </a></li>
						<%} %>
					<%} %>		
					<!-- 다음페이지 -->
					<% if(currentPage == maxPage) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/list.bo?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
					<%} %>
					<!-- 맨뒤로 -->
					<li><a id="pageTag" class="page-link" href="<%= contextPath %>/list.bo?currentPage=<%= maxPage %>"> &raquo; </a></li>
				</ul>
				<% if(loginUser != null){ %>
					<!-- 글작성하기 버튼 -->
					<div class="text-right"><button id="insertBtn" class="btn btn-primaryw-md m-b-30" onclick="location.href='enrollForm.bo'">작성</button></div>
	 			<% } %>
	 		</div>
			</div>
        	</div>
        </div>
<%@ include file="../common/footer.jsp" %>
</div>
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