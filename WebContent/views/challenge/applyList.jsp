<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.ChallengeApply, com.kh.challenge.model.vo.PageInfo"%>
<%
	ArrayList<ChallengeApply> list = (ArrayList<ChallengeApply>)request.getAttribute("list"); 
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
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
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<style>
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
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">챌린지</li>
                        <li class="breadcrumb-item active">신청리스트</li>
                    </ol>
                </div>
            </div>	
		<br>
		<div style="height:60rem;">
		<div class="col-lg-8" style="margin: 0 auto;">
			<div class="table-responsive">
			<div>
			<table class="table table-hover" style="text-align: center;">
				<caption style="caption-side: top; text-align: center"><h1 style="color: #78c2ad"><b>챌린지 신청 리스트</b></h1></caption>
				<thead>
					<tr style="background-color: #78c2ad; color: white;">
						<th>#</th>
						<th>신청내용</th>
						<th>신청유저</th>
						<th>날짜</th>
					</tr>
				</thead>
				<tbody>					
					<% if(list.isEmpty()){ %>
				 	<tr>
						<td colspan="4">신청된 챌린지가 없습니다.</td>
					</tr>
				 <% }else{  %>
				 	<% for(ChallengeApply ca: list){ %>
				 		<tr>
				 			<td><%= ca.getApNo() %></td>
							<td><%= ca.getContent() %></td>
							<td><%= ca.getApUser() %></td>
							<td><%= ca.getApDate() %></td>
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
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/applyList.ch?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/applyList.ch?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/applyList.ch?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
		</div>		
	</div>
	    
	<%@ include file="../common/footer.jsp" %> 
</div>	
</body>
</html>