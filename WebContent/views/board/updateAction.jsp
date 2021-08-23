	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.dao.BoardDao" %>
    <%@ page import="com.kh.board.model.vo.Board" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Write Page</title>
<link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
	<%
		String nickName = null;
		if(session.getAttribute("nickName") != null){
			nickName = (String) session.getAttribute("nickName"); //자신에게 할당된 세션id를 저장 
		}
		if(nickName != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'Login.jsp'");
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
		} else {
			if(request.getParameter("boardTitle") == null || request.getParameter("boardContent") == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("</script>");
			} else {
				BoardDao bDao = new BoardDao();
				int result = bDao.boardUpdate(boardNo, request.getParameter("boardTitle"), request.getParameter("boardContent"));
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글수정에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'boardView.jsp'");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>