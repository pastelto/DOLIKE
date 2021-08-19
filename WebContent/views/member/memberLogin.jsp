<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
/* 	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg"); */
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    
    <!-- Custom Stylesheet -->
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<link href="./css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	
	
	<title>로그인</title>
	<style>
		.loginArea{
			width:800px;
			height:500px;
			background:#eceeef;
			color:white;
			margin:auto;
			margin-top:50px;
		}
		#loginForm{width:60%; margin:auto;}
		#loginForm>table{border:1px solid white;}
		#loginForm>table input{
			width:100%;
			box-sizing:border-box;
		}
	</style>
	<script>
		$(function(){
			if(msg != "null"){
				alert(msg);
				<%session.removeAttribute("msg");%>
			}
		})
		function loginValidate(){
			if($("#userId").val().trim().length == 0){
				alert("아이디를 입력하세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val().trim().length == 0){
				alert("비밀번호를 입력하세요.");
				$("#userPwd").focus();
				return false;
			}
			
			return true;
		}
	
	</script>
</head>
<body>
  	<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
	
	<div class="loginArea">
		<br>
		
		<h2 align="center">로그인</h2>
		<% if(loginUser == null) {%>
		<form id="loginForm" action="<%= contextPath %>/login.me" method="post" onsubmit="return loginValidate();">
			<table>
				<tr>
					<th><label for="userId" style="color:white;">아이디</label></th>
					<td><input id="userId" type="text" name="userId"></th>
				</tr>
				<tr>
				<th><label for="userPwd" style="color:white;">비밀번호</label></th>
				<td><input id="userPwd" type="password" name="userPwd"></th>
				</tr>
			</table>
			
			<div class = "btns" align="center">
				<button id="loginBtn" type="submit">로그인</button>
				<button id="enrollBtn" type="button" onclick="enrollPage();">회원가입</button>
				
			</div>
		</form>
		<%}else{ %>
			<div id="userInfo">
				<b style="color:white;"><%= loginUser.getUserName() %>님</b>의 방문을 환영합니다.
				<br><br>
				<div class="btns" align="center">
					<a href = "<%= request.getContextPath() %>/mypage.me">마이페이지</a>
					<a href = "<%= request.getContextPath() %>/logout.me">로그아웃</a>
				
				</div>
			</div>
		<%} %>
	
	</div>
	<script type="text/javascript">
		function enrollPage(){
			location.href = "<%= request.getContextPath()%>/enrollForm.me";
		}
	</script>
		<!-- 
			<table align="center">
				<tr>
					<td>아이디</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" maxlength="15" name="userPwd" required></td>
				</tr>
			</table>
			<br>
			
			<div class="btns" align="center">
				<button type="submit">로그인</button>
			</div>
			
		</form>
		
		<div class="btns" align="center">
			<button type="submit">회원가입</button>
		</div>
	</div>
	 -->
	<%@ include file="../common/footer.jsp" %>
	</div>
</body>
</html>