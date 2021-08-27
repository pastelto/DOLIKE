<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.notice.model.vo.*"%>
<%
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list"); 
	String contextPath = request.getContextPath();
	
	NoticePageInfo pi = (NoticePageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>DO LIKE - 공지사항</title>
<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<!-- Custom Stylesheet -->
<!-- <link href="../../css/style.css" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->
<link href="./css/style.css" rel="stylesheet">
<style>
	#writeBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#writeBtn:hover {
		color: #78c2ad;
		background-color: #fff;
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
</style>

</head>
<body>
    <div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 

	<div class="content-body">
		<br>
		<div class="col-lg-8" style="margin: 0 auto;">
			<div style="height: 40rem">
			<div class="table-responsive">
			<div>
			<table class="table table-hover" style="text-align: center;">
				<caption style="caption-side: top; text-align: center"><h1 style="color: #78c2ad""><b>공지사항</b></h1></caption>
				<thead>
					<tr style="background-color: #78c2ad; color: white;">
						<th>#</th>
						<th>제목</th>
						<th>조회수</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>					
					<% if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="5">존재하는 공지사항이 없습니다.</td>
					</tr>
				 <% }else{  %>
				 	<% for(Notice n : list){ %>
				 		<tr>
				 			<td><%= n.getNoticeNo() %></td>
							<td><%= n.getNoticeTitle() %></td>
							<td><%= n.getCount() %></td>
							<td><%= n.getCreateDate()%></td>
				 		</tr>
				 	<% } %>
				 <% } %>
				</tbody>
			</table>
			</div>
			</div>
			</div>
		</div>
		
		
		<!-- 페이지 처리 -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- 맨앞으로 -->
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/noticeView.no?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/noticeView.no?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/noticeView.no?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
		</div>

		
		
		
	
		<div align="center">
		<!-- 로그인 세션 생성시 이부분 주석 풀기  -->
			<%-- <% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
			
			<button id="writeBtn" class="btn btn-sm" onclick="location.href='<%=contextPath%>/enrollpage.no'">작성하기</button> 
		<% } %> --%>
		<button id="writeBtn" class="btn btn-sm" onclick="location.href='<%=contextPath%>/enrollpage.no'">작성하기(확인용)</button> 
		</div>
		
		
	</div>
	    
	<%@ include file="../common/footer.jsp" %> 
</div>

	<script>
		<% if(!list.isEmpty()){%>
		$(function(){
			$("table>tbody>tr").click(function(){
				var nno = $(this).children().eq(0).text();
			
				location.href="<%= contextPath %>/read.no?nno="+nno;
			})
		})
		<% } %>
	</script>
	

	
</body>
</html>