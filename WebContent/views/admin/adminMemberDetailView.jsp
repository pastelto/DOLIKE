<%@ page language="java" contentType="text/html; charset=UTF-8"  buffer="100kb"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.kh.member.model.vo.*, com.kh.board.model.vo.*
									,com.kh.admin.model.vo.*"    
%>
 
 <%

 	Member am = (Member)request.getAttribute("am");
 	Board ab = (Board)request.getAttribute("ab");
 	ArrayList<Board> list = (ArrayList<Board>)request.getAttribute("list");
 	System.out.println("어드민디테일jps 보드의 list 값 : " + list);
 	System.out.println("어드민디테일jps 맴버의 list 값 : " + am);
	
 	
 	AdminPageInfo amb = (AdminPageInfo)request.getAttribute("amb");
 	System.out.println("어드민디테일jps amb 값 : " + amb);

	int listCount = amb.getListCount();
	int currentPage = amb.getCurrentPage();
	int maxPage = amb.getMaxPage();
	int startPage = amb.getStartPage();
	int endPage = amb.getEndPage();
 	int i = 0;
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세보기</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>

#iconMsg, #comment1 {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad; 
}

#StatusBtn1 {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
	
	top: 30px;
}

#StatusBtn2 {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
	
	top: 30px;
}

#StatusBtn3 {

	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
	
	top: 40px;
	left: 65px;
}
#byefr , #StatusBtn3, #StatusBtn4, #StatusBtn5, #comment2 {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#comment3 {
	color: #fff;
	background-color: #5F5C5C;
	border-color: #5F5C5C;
}

#status1, #status2, #status3 {
	height: 30px;
	width: 30px;
}

#statusCard {
	position: relative;
	height: 130px;
	width: 220px;
}


</style>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
			
        <div class="content-body">
		
            <div class="row page-titles mx-0" >
                <div class="col p-md-0" >
                    <ol class="breadcrumb" >
                    <%if(am.getUserStatus().equals("Y")) { %>
                        <li class="breadcrumb-item">회원 목록</li>
                        <li class="breadcrumb-item active">회원 상세보기</li>
                    <%} else if(am.getUserStatus().equals("N")) { %>
                    	<li class="breadcrumb-item">블랙리스트</li>
                        <li class="breadcrumb-item active">회원 상세보기</li>
                    <%} else if(am.getUserStatus().equals("B")) { %>
                    	<li class="breadcrumb-item">블랙리스트</li>
                        <li class="breadcrumb-item active">회원 상세보기</li>
                    <% } %>        
                    </ol>
                </div>
            </div>
            <!-- row -->
			
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-xl-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="media align-items-center mb-4">                                   
                                    <div class="media-body">
                                        <h3 class="mb-0"><%= am.getUserId() %></h3>
                                        <p class="text-muted mb-0"><%= am.getNickName() %></p>
                                    </div>
                                </div>
                                
                                <h4>계정 정보</h4>
                                
                                <ul class="card-profile__info">
                                    <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span><%= am.getPhone() %></span></li>                             	
                                    <li><strong class="text-dark mr-4">Email</strong> <span><%= am.getEmail() %></span></li>
                                    <li class="mb-1"><strong class="text-dark mr-4">생성일</strong> <span><%= am.getUserCreateDate() %></span></li>                                
                                </ul>
                                
                               
                                <div class="row mb-5">
                                    <div class="col">
                                        <div class="card card-profile text-center" id="statusCard">
                                        <%if(am.getUserStatus().equals("Y")) { %>
                                            <span class="mb-1 text-primary"><img src="./resources/images/MemberListStatusGood.png" id="status1"></span>
                                            <h3 class="mb-0" id="comment1">정상(Good!)</h3>
                                            <p class="text-muted px-4">상태 정보</p>
                                        <%}else if(am.getUserStatus().equals("N")){ %>
                                        	<span class="mb-1 text-primary"><img src="./resources/images/MemberOut.png" id="status2"></span>
                                            <h3 class="mb-0" id="comment2">삭제(탈퇴)</h3>
                                            <p class="text-muted px-4">상태 정보</p>
                                        <%}else if(am.getUserStatus().equals("B")){ %>
                                        	<span class="mb-1 text-primary"><img src="./resources/images/blackListMemberStatus.png" id="status3"></span>
                                            <h3 class="mb-0" id="comment3">블랙리스트(정지)</h3>
                                            <p class="text-muted px-4">상태 정보</p>
										<% } %>
										                                       
                                        </div>
                                    </div>                                  
                                    
                                    
                                    <table align="center">
                                    
                                    <tr>
                                    	<td>
	                                    	<div class="col-12 text-center" id="StatusBtn1">
	                                        <button class="btn">복구하기</button>
	                                    	</div>
                                    	</td>
                                    	
                                    	<td>
	                                    	<div class="col-12 text-center" id="StatusBtn2">
	                                        <button class="btn">삭제하기</button>
	                                    	</div>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td>
                                    		<div class="col-12 text-center" id="StatusBtn3">
                                        <button class="btn">블랙리스트</button>
                                    </div>
                                    	</td>                                 		                                   	                                                                                                                                                                       
                                    </table> 
                                   </div>                                  
                                    
                                

                                
                            </div>
                        </div>  
                    </div>
                    <div class="col-lg-7 col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form action="#" class="form-profile">
								<h4>게시글 검색하기</h3>
								<div class="card-body" style="text-align: center;">
									<div id="up">
										<div id="down" class="input-group-prepend">
											<form id="searchForm" class="form-inline" action="insert.fl"
												method="post">

												<div class="input-group text-center mb-3">
													<input type="text" class="form-control"
														placeholder="검색할 게시글 작성" name="followId" size="35%">
													<div class="input-group-append">
														<button id="iconMsg" class="btn" type="button"
															onclick="searchId();">검색</button>
														<button id="byefr" class="btn" type="reset">취소</button>
													</div>
												</div>
											</form> 
										</div>
									</div>                                   
									 </div>
                                   
                                </form>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid" >
                <div class="row">
                    <div class="col-lg-12" style="margin-left: auto; margin-right: auto;">
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
                                                <th>제목</th>
                                                <th>작성자</th>
                                                <th>생성일</th>
                                                <th>카테고리 번호</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<% if(list.isEmpty()){ %>
                                            <tr>
                                                <td colspan="2">조회된 리스트가 없습니다.</td>                                                
                                            </tr>
                                            <%} else if(!list.isEmpty()){ %>
                                           	<% for(Board b : list) { %>
                                           	<% System.out.println("b.getNickName, am.getNickName : " + b.getNickName()+ am.getNickName()); %>
                                            <%if(b.getNickName().equals(am.getUserId())) {%> 
                                            <tr>
                                                <td><%= b.getBoardNo() %></td>
                                                <td><%= b.getBoardTitle() %></td>
                                                <td><%= b.getNickName() %></td>
                                                <td><%= b.getBoardDate() %></td>
                                                <td><%= b.getCategoryNo() %></td>                                             
                                            </tr>
                                            
                                           <% } %>
                                         <%} %>
                                         <%} %> 	
                                        </tbody>
                                    </table>
                                </div>
                             	<div class="general-button" align="right">
                             		
									
								</div>
                            </div>
                        </div>
                    </div>
                    
                    	<!-- 페이지 처리 -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- 맨앞으로 -->
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/MemberDetail.am?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/MemberDetail.am?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/MemberDetail.am?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/MemberDetail.am?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/MemberDetail.am?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
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
                    
                    
                 </div>
               </div> 
                                </div>
                            </div>
                            
             
            <!-- #/ container -->
        </div>
        </div>
        </div>
        </div>
        <%@ include file="../common/footer.jsp"%>
        </div>
        
		

</body>
</html>