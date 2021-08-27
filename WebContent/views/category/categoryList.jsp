<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.category.model.vo.*"%>

<%
	ArrayList<Category> list = (ArrayList<Category>)request.getAttribute("list");
	
	CategoryPageInfo ca = (CategoryPageInfo)request.getAttribute("ca");
	
	int listCount = ca.getListCount();
	int currentPage = ca.getCurrentPage();
	int maxPage = ca.getMaxPage();
	int startPage = ca.getStartPage();
	int endPage = ca.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

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
	#categoryCreateBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
</style>

</head>
<body>
<div id="main-wrapper">
<%@ include file="../common/menuSideBar.jsp" %> 

<div class="container-fluid" >
                <div class="row">
                    <div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
                        <div class="card" >
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>카테고리 목록</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>카테고리</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%if(list.isEmpty()){ %>
                                            <tr>
                                                <td colspan="2">조회된 리스트가 없습니다.</td>                                                
                                            </tr>
                                            <%}else{ %>
												<% for(Category c : list){ %>
                                            <tr>
                                                <td><%= c.getCategoryNo() %></td>
                                                <td><%= c.getCategoryName() %></td>                                             
                                            </tr>
                                            	<%} %>
											<%} %>
                                        </tbody>
                                    </table>
                                </div>
                             	<div class="general-button" align="right">
                             		<%--<% if(loginUser != null){ --%>
                            		<button id="categoryCreateBtn" onclick="location.href='<%= contextPath %>/enrollForm.ca'"  class="btn mb-1 btn-primary">게시판 생성하기</button>
									<%--<% } --%>
								</div>
                            </div>
                        </div>
                    </div>
                 </div>
               </div>              
		<br><br>

		
			<!-- 페이지 처리 -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- 맨앞으로 -->
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/categoryList.ca?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/categoryList.ca?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/categoryList.ca?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/categoryList.ca?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/categoryList.ca?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
		</div>
		</div>
		<script>
		<%if(!list.isEmpty()){ %>
		$(function(){
			$(".table>tbody>tr").click(function(){
				var cno = $(this).children().eq(0).text();
				location.href="<%= contextPath %>/detail.ca?cno=" +cno;
			})
		})
		<%}%>
	</script>
</body>
</html>