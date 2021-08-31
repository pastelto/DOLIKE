<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.*"%>
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list"); 
	MsgPageInfo pi = (MsgPageInfo)request.getAttribute("pi");
	int newMsgCount = (int)(request.getAttribute("newMsgCount"));
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int index = 1;
	
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 보낸 쪽지함</title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <link href="./css/style.css" rel="stylesheet">
<style>
	.text-primary{
		color:#78c2ad;
	
	}
	#writeBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#writeBtn:hover {
		color: #78c2ad;
		background-color: #fff;
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
	#sendMsgLink, #resetBtn, #sendBtn, #deleteBtn, #pageTag{
   	color: #fff;
   	background-color: #78c2ad;
   	border-color: #78c2ad;
	}
	
	#sendMsgLink, #resetBtn, #sendBtn, #deleteAllBtn, #submitBtn, #deleteBtn{
    color: #fff;
    background-color: #78c2ad;
    border-color: #78c2ad;
	}
		
	#deleteAllBtn:hover, #sendMsgLink:hover, #sendBtn:hover, #resetBtn:hover, #submitBtn:hover, #deleteBtn:hover{
		color: #78c2ad !important;
	    background-color: #fff !important;
	    border-color: #78c2ad !important;
	}

	#recvMenu, #sendMenu, #myMenu, #binMenu{
		color: #78c2ad !important;	
	}
	
	#recvMenu:hover, #sendMenu:hover, #myMenu:hover, #binMenu:hover{
		color: #f3969a !important;	
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
                       <li class="breadcrumb-item">쪽지</li>
                       <li class="breadcrumb-item">보낸 쪽지함</li>
                   </ol>
               </div>
           </div>

           <div class="container-fluid">
               <div class="row">
                   <div class="col-lg-12">
                       <div class="card" >
                           <div class="card-body">
                               <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad;">쪽지보내기</a>
                                   <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0" id="recvMenu"><i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 쪽지함
                                   <%if(newMsgCount > 0){ %>
                                   <span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left : 10px;"> <%= newMsgCount %> </span>
                                   <%} %>
                                   </a>
                                       <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0" id="sendMenu"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i><b>보낸 쪽지함</b></a> 
                                       <a href="<%= request.getContextPath() %>/mlist.ms" class="list-group-item border-0 p-r-0" id="myMenu"><i class="fa fa-star font-18 align-middle mr-2"></i>내게 쓴 쪽지함</a> 
                                       <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0" id="binMenu"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                   </div>
                                  
                               </div>
                               <div class="email-right-box"  style="height: 40rem">
                                  <div class="toolbar" role="toolbar">
									<h4> 보낸 쪽지함 </h4>
                                   </div>

                                    <!-- 쪽지함 받아오는 코드 작성 -->
                                   <div class="email-list m-t-15">
								<div class="table-responsive">
								<div class="col-mail col-mail-2">
								<table class="table table-hover" style="text-align: center;">
									<thead>
										<tr style="background-color: #78c2ad; color: white;">
											<th style="width:3rem;"></th>
											<th style="width:5rem;">번호</th>
											<th style="width:8rem;">받는 사람</th>
											<th style="width:40rem;">제목</th>
											<th style="width:12rem;">보낸 날짜</th>
											<th>수신 확인</th>
										</tr>
									</thead>
									<tbody>					
										<% if(list.isEmpty()){ %>
									 	<tr>
											<td colspan="6">보낸 쪽지가 없습니다.</td>
										</tr>
									 <% }else{  %>
									 	<% for(Message m : list){ %>
									 	<% if( m.getMsgStatus().equals("Y") ){ %>
									 		<tr>
									 			<td><input type="checkbox" value="<%= m.getMsgNo() %>"/></td>
									 			<td><%= index++ %></td>
												<td><%= m.getRecvId() %></td>
												<td><%= m.getMsgTitle() %></td>
												<td><%= m.getRecvtime()%></td>
												<td><%= "읽음" %></td>
									 		</tr>
									 	<% } else if( m.getMsgStatus().equals("N")){  %>	
									 		<tr>
									 			<td><input type="checkbox" value="<%= m.getMsgNo() %>"/></td>
									 			<td><%= index++ %></td>
												<td><%= m.getRecvId() %></td>
												<td><%= m.getMsgTitle() %></td>
												<td><%= m.getRecvtime()%></td>
												<td><%= "읽지 않음" %></td>
									 		</tr>
									 	<% } %>
									 	<% } %>
									 <% } %>
									</tbody>
								</table>
								</div>
								</div>
							</div>
                               </div>
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

					<li><a id="pageTag" class="page-link" href="<%=contextPath%>/slist.ms?currentPage=1"> &laquo; </a></li>

					<% if(currentPage == 1) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/slist.ms?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
					<%} %>

					<%for(int p=startPage; p<=endPage; p++){ %>
					
						<%if(p == currentPage){ %>
							<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
						<%}else{ %>
							<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/slist.ms?currentPage=<%= p %>"><%= p %> </a></li>
						<%} %>
						
					<%} %>

					<% if(currentPage == maxPage) {%>
					<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
					<% }else{ %>
					<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/slist.ms?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
					<%} %>

					<li><a id="pageTag" class="page-link" href="<%= contextPath %>/slist.ms?currentPage=<%= maxPage %>"> &raquo; </a></li>
				</ul>
			</div>
           </div>
	
       </div>

	<%@ include file="../common/footer.jsp" %> 

   </div>

 	<script>
	<% if(!list.isEmpty()){%>
	$(function(){
		$("table>tbody>tr").click(function(){
			var mno = $(this).children().children().eq(0).val();
			location.href="<%= contextPath %>/sread.ms?mno="+mno;
		})
	})
	<% } %>
</script>

</body>

</html>	