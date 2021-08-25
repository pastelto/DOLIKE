<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.message.model.vo.*, java.text.*"%>
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list"); 
	MsgPageInfo mpi = (MsgPageInfo)request.getAttribute("pi");
	int newMsgCount = (int)(request.getAttribute("newMsgCount"));
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd hh:mm");
	
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
    <title>DO LIKE - 쪽지함</title>
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
    	border-color: #78c2ad;
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

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->

    
    <!--**********************************
        Main wrapper start
    ***********************************-->
    <div id="main-wrapper">


        <!--**********************************
            Sidebar start
        ***********************************-->
		<%@ include file="../common/menuSideBar.jsp" %> 

        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">쪽지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">받은쪽지함</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body">
                                <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i><b>받은 쪽지함</b>
                                    <%if(newMsgCount > 0){ %>
                                    <span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left : 10px;"> <%= newMsgCount %> </span>
                                    <%} %>
                                    </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 받은 쪽지함 </h4>
                                    </div>
 
                                     <!-- 쪽지함 받아오는 코드 작성 -->
                                    <div class="email-list m-t-15">
									<div class="table-responsive">
									<div class="col-mail col-mail-2">
									<table class="table table-hover" id="msgListTB" style="text-align: center;">
										<thead>
											<tr style="background-color: #78c2ad; color: white;">
												<th style="width:3rem;"></th>
												<th style="width:5rem;">번호</th>
												<th style="width:8rem;">보낸사람</th>
												<th style="width:40rem;">제목</th>
												<th style="width:12rem;">받은 날짜</th>
												<th>상태</th>
											</tr>
										</thead>
										<tbody>					
											<% if(list.isEmpty()){ %>
										 	<tr>
												<td colspan="6">받은 쪽지가 없습니다.</td>
											</tr>
										 <% }else{  %>
										 	<% for(Message m : list){ %>
										 		<% if( m.getMsgStatus().equals("Y") ){ %>
										 		
										 		<tr id="MsgNo">
										 			<td><input type="checkbox"/></td>
										 			<td><input id="msgInfo" name="mno"></td>
													<td><input id="msgInfoSenderId"></td>
													<td><input id="msgInfoTitle"></td>
													<td><input id="msgInfoDate"></td>
													<td><input id="msgInfoReadStatus"></td>	
													</tr>
													
												<% } else if( m.getMsgStatus().equals("N")){  %>	
												<tr id="MsgNo">
										 			<td><input type="checkbox"/></td>
										 			<%-- <td><%= index++ %></td> --%>
										 			<td><%= m.getMsgNo()%></td>
													<td><%= m.getSenderId() %></td>
													<td><span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a"> New </span> &nbsp; <%= m.getMsgTitle() %></td>
													<td><%= sdf.format(m.getRecvtime()) %></td>
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
        
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
		<%@ include file="../common/footer.jsp" %> 
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
	<script>
	 $(function(){
         $('#MsgNo').click(function(){
            var mno = $('input[name="mno"]').val();
            
            console.log(mno);
            
            $.ajax({
               url: "rread.ms",
               
               data: {
                  mno:mno,
               }, 
               
               type: "post",
               
               //json으로 받을 꺼라 명시
               dataType: "json",
               
               success: function(map){
                  console.log(map)
                  console.log(map["jArr"])
                  
                  var $msgListTB = $("#msgListTB tbody")
                  
                  $tableBody.html("");
                  if(map["jArr"].isEmpty()){ 
                	  var $tr = $("<tr>");
                	  var $msgInfoNo = $("<td colspan='6'>").text("받은 쪽지가 없습니다.");

                	  $tr.append($msgInfoNo);   
                	  $tableBody.append($tr);
                	  
                  } else {
                	  if( m.getMsgStatus().equals("Y") ){  
                		  
                		  
                	  }
                  } 
                  }
                	  if( m.getMsgStatus().equals("N")){ 
                  $.each(map["jArr"], function(index, value){
                	  console.log(value);
                	  var $tr = $("<tr>");
                	  var $msgInfoNo = $("<td>").text(value.msgNo);
                	  var $msgInfoSenderId = $("<td>").text(value.SenderId);
                	  var $msgInfoTitle = $("<td>").text(value.title);
                	  var $msgInfoDate = $("<td>").text(value.sendDate);
                	  var $msgInfoReadStatus = $("<td>").text(value.readStatus);
                	 
                	  
                	  $tr.append($msgInfoNo);   
                      $tr.append($msgInfoSenderId);
                      $tr.append($msgInfoTitle);
                      $tr.append($msgInfoDate);
                      $tr.append($msgInfoReadStatus);
                      
                      $tableBody.append($tr);
                  })
               },
               
               error:function(e){
            	   console.log("ajax통신 실패");
               }
               
            })
         })
      })
	</script>

</body>

</html>