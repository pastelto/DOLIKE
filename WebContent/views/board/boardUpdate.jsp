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
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
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
		if(nickName == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int boardNo = 0;
		if(request.getParameter("boardNo") != null ) {
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		if(boardNo ==0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardView.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDao().getBoard(boardNo);
		if(!nickName.equals(board.getNickName())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'boardView.jsp'");
			script.println("</script>");
		}
	%>
   
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
	 		<div class="row" style="margin:20px">
	 			<form method="post" action="views/board/updateAction.jsp?nickName=<%= nickName %>" style="width:100%; max-width:1000px">
		 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		 				<thread>
		 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
		 						<th colspan="2" style="background-color:rgb(228, 243, 240); text-align:center;">글수정 양식 </th>
		 					</tr>
		 				</thread>
		 				<tbody>
		 					<tr> <!-- 게시글리스트 테이블의 바디 -->
		 						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50" value="<% board.getBoardTitle(); %>"></td>
		 					</tr>
		 					<tr>
		 						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height:350px" value="<% board.getBoardContent(); %>"></textarea></td>
		 					</tr>
		 				</tbody>
		 				
		 			</table>
		 			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
		 			<input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.back();"/>
	 			</form>	
	 		</div>
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp" %> 
</body>
</html>