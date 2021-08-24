<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
<%
	 ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	 ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>)request.getAttribute("fileList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">

	</div>
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>