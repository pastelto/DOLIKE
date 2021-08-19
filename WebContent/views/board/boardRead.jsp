<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.kh.board.model.vo.Board" %>
<%@ page import="com.kh.board.model.dao.BoardDao" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <link href="../../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<style>
	.nk-sidebar{
		padding:30px;
	}
	.content-body{
		padding:5px 0px 0px 30px;
	}
</style>
</head>
<body>
	<%@ include file="../common/menuSideBar.jsp" %> 
	<%
	
		String nickName = null;
		if(session.getAttribute("nickName") != null){
			nickName = (String)session.getAttribute("nickName"); //로그인한 유저의 정보 저장 
		}
		int boardNo = 0;
		if(request.getParameter("boardNo") != null){
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		if(boardNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardView.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDao().getBoard(boardNo);
	%>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
	 		<div class="row" style="margin:20px">
		 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		 				<thread>
		 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
		 						<th colspan="3" style="background-color:rgb(228, 243, 240); text-align:center;">게시판 글보기 </th>
		 					</tr>
		 				</thread>
		 				<tbody>
		 					<tr> 
		 						<td style="width:20%;">글 제목</td>
		 						<td colspan="2"><%= board.getBoardTitle().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성자</td>
		 						<td colspan="2"><%= board.getNickName() %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성일자</td>
		 						<td colspan="2"><%= board.getBoardDate() %></td>
		 					</tr>
		 					<tr> 
		 						<td>내용</td>
		 						<td colspan="2" style="min-height:200px; text-align:left;"><%= board.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 				</tbody>
		 			</table>
		 			<a href="boardView.jsp" class="btn btn-primary">목록</a>
		 			<% if(nickName != null && nickName.equals(board.getNickName())){ %>
		 				<a onclick="return confirm('수정하시겠습니까?')" href="boardUpdate.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">수정</a>
		 				<a onclick="return confirm('삭제하시겠습니까?')" href="boardDelete.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">삭제</a>
		 			<% } %>
		 			
	 		</div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp" %> 
</body>
</html>