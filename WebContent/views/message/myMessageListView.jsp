<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.message.model.vo.*, java.text.*"%>
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list"); 
	MsgPageInfo mpi = (MsgPageInfo)request.getAttribute("pi");
 	int newMsgCount = (int)(request.getAttribute("newMsgCount")); 
	
	int listCount = mpi.getListCount();
	int currentPage = mpi.getCurrentPage();
	int endPage = mpi.getEndPage();
	int maxPage = mpi.getMaxPage();
	int startPage = mpi.getStartPage();
	
	int index = 1;
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 내게 쓴 쪽지함</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Custom Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
<style>
	.text-primary{
		color:#78c2ad;
	}
	#writeBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: ##78c2ad;
	}
	#writeBtn:hover {
		color: #78c2ad;
		background-color: #fff;
	}
	#pageTag, #sendMsgLink, #resetBtn, #sendBtn, #deleteBtn {
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

    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>

    <div id="main-wrapper">

		<%@ include file="../common/menuSideBar.jsp" %> 

        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">쪽지</li>
                        <li class="breadcrumb-item active">내게 쓴 쪽지함</li>
                    </ol>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body">
                                <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 쪽지함
                                    <%if(newMsgCount > 0){ %>
                                    <span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left : 10px;"> <%= newMsgCount %> </span>
                                    <%} %>
                                    </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/mlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-star font-18 align-middle mr-2"></i><b>내게 쓴 쪽지함</b></a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 내게 쓴 쪽지함 </h4>
                                    </div>
 
                                     <!-- 쪽지함 받아오는 코드 작성 -->
                                    <div class="email-list m-t-15">
									<div class="table-responsive">
									<div class="col-mail col-mail-2">
									<table class="table table-hover" id="msgListTb" style="text-align: center;">
										<thead>
											<tr style="background-color: #78c2ad; color: white;">
												<th style="width:3rem;"></th>
												<th style="width:5rem;">번호</th>
												<th style="width:8rem;"></th>
												<th style="width:40rem;">제목</th>
												<th style="width:12rem;">저장 날짜</th>
											</tr>
										</thead>
										<tbody>					
											<% if(list.isEmpty()){ %>
										 	<tr>
												<td colspan="6">보관함이 비어있습니다.</td>
											</tr>
										 <% }else{  %>
										 	<% for(Message m : list){ %>
										 		<tr id="MsgNo">
										 			<td><input type="checkbox" value="<%= m.getMsgNo() %>"/></td>		 			
										 			<td><%= index++ %></td>
													<td class="btn-like done">❤</td>
													<td><%= m.getMsgTitle() %></td>
													<td><%= m.getRecvtime() %></td>	
													</tr>
													
												<% } %>
										 	<% } %>
										</tbody>
									</table>
									</div>
									</div>
								</div>
                                </div>
									<!-- 삭제 버튼 -->
									<% if(!list.isEmpty()){ %>
									<div class="pagination justify-content-center">
									<button id="deleteBtn" type="button" class="btn btn-sm" onclick="">삭제하기</button>
									</div>
									<% } %>
									
                            </div>
                        </div>
                        
                    </div>
                    
                </div>
                
					<div>
					<ul class="pagination justify-content-center">
						<!-- 맨앞으로 -->
						<li><a id="pageTag" class="page-link" href="<%=contextPath%>/list.ms?currentPage=1"> &laquo; </a></li>
						
						<!-- 이전페이지 -->
						<% if(currentPage == 1) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/list.ms?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
						<%} %>
						
						
						<!-- 페이지 목록 -->
						<%for(int p=startPage; p<=endPage; p++){ %>
						
							<%if(p == currentPage){ %>
								<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
							<%}else{ %>
								<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/list.ms?currentPage=<%= p %>"><%= p %> </a></li>
							<%} %>
							
						<%} %>
						
						
						<!-- 다음페이지 -->
						<% if(currentPage == maxPage) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/list.ms?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
						<%} %>
						
						<!-- 맨뒤로 -->
						<li><a id="pageTag" class="page-link" href="<%= contextPath %>/list.ms?currentPage=<%= maxPage %>"> &raquo; </a></li>
					</ul>
				</div>
            </div>
		
            <!-- #/ container -->
        </div>

		<%@ include file="../common/footer.jsp" %> 

    </div>

	<script>
		<% if(!list.isEmpty()){%>
		$(function(){
			$("table>tbody>tr").click(function(){
				var mno = $(this).children().children().eq(0).val();
				console.log(mno);
				location.href="<%= contextPath %>/mread.ms?mno="+mno;

			})
		})
		<% } %>
	</script>

</body>

</html>