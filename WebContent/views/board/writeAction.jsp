	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.kh.board.model.dao.BoardDao" %>
    <%@ page import="java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="board" class="com.kh.board.model.vo.Board" scope="page" />
    <jsp:setProperty name="board" property="boardTitle" />
    <jsp:setProperty name="board" property="boardContent" />
    
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
		}else {
			if(board.getBoardTitle() == null || board.getBoardContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다.')");
				script.println("</script>");
			} else {
				BoardDao bDao = new BoardDao();
				int result = bDao.write(board.getBoardTitle(), nickName, board.getBoardContent());
				if(result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'index2.jsp'");
					script.println("</script>");
				}
			}
		}
		
	%>
</body>
</html>