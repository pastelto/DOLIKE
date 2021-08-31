<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter, com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao, java.util.ArrayList, com.kh.member.model.vo.Member " %>
<%
	Attachment at = (Attachment)request.getAttribute("at");
	ArrayList<Board> blist = (ArrayList<Board>)request.getAttribute("blist");
	System.out.println("화면단 : " + blist);
	System.out.println("썸넬 : " + at);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 게시글 검색</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	<style>
		
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
		<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">카테고리</li>
                        <li class="breadcrumb-item">게시판 검색</li>
                    </ol>
                </div>
            </div>
	 <div class="container-fluid">
	 		<div class="row">
	 			<table name="listArea" class="table table-hover" style="text-align:center; border:1px solid #dddddd">
	 				<thread readonly>
	 					<tr style="background-color: #78c2ad; color: white;"> <!-- 게시글리스트 테이블의 헤더  -->
	 						<th style="width:5rem; text-align:center;">번호 </th>
			 				<th style="width:8rem; text-align:center;">태그 </th>
	 						<th style="width:25rem; text-align:center;">제목 </th>
	 						<th style="width:10rem; text-align:center;">작성자 </th>
	 						<th style="width:10rem; text-align:center;">작성일 </th>
	 						<th style="width:8rem; text-align:center;">조회수 </th>
	 					</tr>
	 				</thread>
	 				<tbody>
	 				<% if(!blist.isEmpty()){ %>
			 				<% for(Board b : blist){ %>
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
	 		</div>
        </div>
<%@ include file="../common/footer.jsp" %>
        <script>
			<%if(!blist.isEmpty()){%>
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