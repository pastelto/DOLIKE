<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.notice.model.vo.Notice"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>DO LIKE - 공지사항</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../images/do_32.png">
<!-- Custom Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- 메인 네비게이터(현재 로드 안됨) -->
	<%-- <%@ include file="../common/menuSideBar.jsp" %>  --%>

	<div class="content-body">
		<br>
		<div class="col-lg-8" style="margin: 0 auto;">
			<!-- <div class="table-responsive"> -->
			<div>
			<table class="table table-hover" style="text-align: center">
				<caption style="caption-side: top; text-align: center"><h1>공지사항</h1></caption>
				<thead>
					<tr style="background-color: #78c2ad; color: white;">
						<th>#</th>
						<th>제목</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan="4">공지사항 없다.</td>
					</tr>
					<tr>
						<td colspan="4">확인용</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>제목칸</td>
						<td>조회수칸</td>
						<td>작성 일자칸</td>
					</tr>
					<%-- <% if(list.isEmpty()){ %>
						<tr>
							<td colspan="4">공지사항이 없습니다.</td>
						</tr>
					<% }else{ %>
						<% for(Notice n : list){ %>
							<tr>
								<td><%= n.getNoiceNo() %></td>
								<td><%= n.getNoticeTitle() %></td>
								<td><%= n.getCount() %></td>
								<td><%= n.getCreateDate() %></td>
							</tr>
						<%} %>
					<%} %> --%>
				</tbody>
			</table>
			</div>
		</div>
	</div>
</body>
</html>