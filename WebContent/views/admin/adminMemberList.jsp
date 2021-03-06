<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.member.model.vo.*, com.kh.admin.model.vo.*, java.text.SimpleDateFormat"%>
    
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
	
	AdminPageInfo ami = (AdminPageInfo)request.getAttribute("ami");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
		
	int listCount = ami.getListCount();
	int currentPage = ami.getCurrentPage();
	int maxPage = ami.getMaxPage();
	int startPage = ami.getStartPage();
	int endPage = ami.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DO LIKE - 회원 목록</title>

<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

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
	#size1 {
		height: 110%
	}
</style>

</head>
<body>
<div id="main-wrapper">
<%@ include file="../common/menuSideBar.jsp" %> 
<div class="content-body">

<div class="container-fluid" >
			
			<form id="size1">
			
			<div class="row page-titles mx-0" >
			
                <div class="col p-md-0" >
                    <ol class="breadcrumb" >
                        <li class="breadcrumb-item">회원 관리</li>
                        <li class="breadcrumb-item active">회원 목록</li>
                    </ol>
                </div>
            </div>
			
                <div class="row">               
                    <div class="col-lg-10 mt-5" style="margin-left: auto; margin-right: auto;">
                        <div class="card" >
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>회원 목록</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>                                                
                                                <th>유저ID</th>
                                                <th>이름</th>
                                                <th>생년월일</th>
                                                <th>전화번호</th>
                                                <th>이메일</th>
                                                <th>닉네임</th>
                                                <th>생성일</th>
                                                <th>유저 상태</th>
                                             </tr>
                                        </thead>
                                        <tbody>
                                        	<%if(list.isEmpty()){ %>
                                            <tr>
                                                <td colspan="8">조회된 회원이 없습니다.</td>                                                
                                            </tr>
                                            <%}else{ %>
												<% for(Member am : list){ %>
                                            <tr>
                                                <td><%= am.getUserId() %></td>
                                                <td><%= am.getUserName() %></td> 
                                                <td><%= am.getBirthDate() %></td>
                                                <td><%= am.getPhone() %></td>
                                                <td><%= am.getEmail() %></td>
                                                <td><%= am.getNickName() %></td>
                                                <td><%= am.getUserCreateDate() %></td>
                                                <th>&emsp;&emsp;<%= am.getUserStatus() %></th>                                             
                                            </tr>
                                            	<%} %>
											<%} %>
                                        </tbody>
                                    </table>
                                </div>
                             	<div class="general-button" align="right">
                             		<%--<% if(loginUser != null){ --%>
                            		<%--<button id="따로 버튼이 필요하지 않음" onclick="location.href='<%= contextPath %>/enrollForm.ca'"  class="btn mb-1 btn-primary">게시판 생성하기</button>
									<% } --%>
								</div>
                            </div>
                        </div>
                    </div>                    
                 </div>
                 
                 	<!-- 페이지 처리 -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- 맨앞으로 -->
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/adminMemberList.am?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/adminMemberList.am?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/adminMemberList.am?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/adminMemberList.am?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/adminMemberList.am?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
		</div>
                 
                 </form>
                
                
                
                </div>
                
		<br><br>
	
		</div>
		<%@ include file="../common/footer.jsp" %>
		</div>
		
		<script>
		<%if(!list.isEmpty()){ %>
		$(function(){
			$(".table>tbody>tr").click(function(){
				var amno = $(this).children().eq(0).text();
				location.href="<%= contextPath %>/MemberDetail.am?amno=" +amno;
				console.log("amno 값을 알려줘!"+amno)
			})
		})
		<%}%>
	</script>
</body>
</html>