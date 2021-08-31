<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.board.model.vo.*, com.kh.follow.model.vo.*"%>
<%
	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
	FollowCategoryPageInfo pi = (FollowCategoryPageInfo)request.getAttribute("pi");
	String catTitle = (String)request.getAttribute("catTitle");
	String followId = (String)request.getAttribute("followId");
	
 	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	
	System.out.println("followBoard: "+list);
	System.out.println(pi);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Do Like - 내친구의 글</title>
<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
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
		<%@ include file="../common/menuSideBar.jsp"%>
	
		<div class="content-body">
			
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">팔로잉</li>
                        <li class="breadcrumb-item active">친구의 글모음</li>
                    </ol>
                </div>
            </div>
		 
		 	<br>
			
			<div class="col-lg-8" style="margin: 0 auto;">
				<div style="height: 40rem">
					<div class="table-responsive">
						<div>
							<table class="table table-hover" style="text-align: center;">
								<caption style="caption-side: top; text-align: center"><h1 style="color: #78c2ad"><b><%= followId %> 의 <<%= catTitle %>>게시글</b></h1></caption>
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
										<td colspan="4"> 해당 카데고리에 존재하는 게시글이 없습니다.</td>
									</tr>
								<% }else{ %>
				 					<% for(Board b : list){ %>
							 			<tr>
							 				<td><%= b.getBoardNo() %></td>
											<td><%= b.getBoardTitle() %></td>
											<td><%= b.getViews() %></td>
											<td><%= b.getBoardDate() %></td>
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
					<li><a id="pageTag" class="page-link" href="<%=contextPath%>/catBoard.fl?catTitle=<%= catTitle %>&followId=<%= followId %>&currentPage=1"> &laquo; </a></li>
					
					<!-- 이전페이지 -->
					<% if(currentPage == 1) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/catBoard.fl?catTitle=<%= catTitle %>&followId=<%= followId %>&currentPage=<%= currentPage-1 %>"> &lt; </a></li>
					<%} %>
					
					
					<!-- 페이지 목록 -->
					<%for(int p=startPage; p<=endPage; p++){ %>
					
						<%if(p == currentPage){ %>
							<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
						<%}else{ %>
							<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/catBoard.fl?catTitle=<%= catTitle %>&followId=<%= followId %>&currentPage=<%= p %>"><%= p %> </a></li>
						<%} %>
						
					<%} %>
					
					
					<!-- 다음페이지 -->
					<% if(currentPage == maxPage) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/catBoard.fl?catTitle=<%= catTitle %>&followId=<%= followId %>&currentPage=<%= currentPage+1 %>"> &gt; </a></li>
					<%} %>
					
					<!-- 맨뒤로 -->
					<li><a id="pageTag" class="page-link" href="<%= contextPath %>/catBoard.fl?catTitle=<%= catTitle %>&followId=<%= followId %>&currentPage=<%= maxPage %>"> &raquo; </a></li>
				</ul>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp" %> 
	<script>
		<%if(!list.isEmpty()){%>
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