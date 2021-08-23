<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.*"%>
<%
	ArrayList<Message> list = (ArrayList<Message>)request.getAttribute("list"); 
	
	MsgPageInfo pi = (MsgPageInfo)request.getAttribute("pi");
	
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
    <title>DO LIKE - 휴지통</title>
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
		#sendMsgLink, #resetBtn, #sendBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
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
                        <li class="breadcrumb-item"><a href="javascript:void(0)">휴지통</a></li>
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
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 쪽지함<span class="badge badge-primary badge-sm float-right m-t-5" style="background: #78c2ad">95</span> </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i><b>휴지통</b></a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 휴지통 </h4>
                                    </div>
 
                                     <!-- 쪽지함 받아오는 코드 작성 -->
                                    <div class="email-list m-t-15">
									<div class="table-responsive">
									<div class="col-mail col-mail-2">
									<table class="table table-hover" style="text-align: center;">
										<thead>
											<tr style="background-color: #78c2ad; color: white;">
												<th>번호</th>
												<th>보낸 사람</th>
												<th>제목</th>
												<th>받은 날짜</th>
											</tr>
										</thead>
										<tbody>					
											<% if(list.isEmpty()){ %>
										 	<tr>
												<td colspan="4">휴지통이 비어있습니다.</td>
											</tr>
										 <% }else{  %>
										 	<% for(Message m : list){ %>
										 		<tr>
										 			<td><%= index++ %></td>
													<td><%= m.getSenderId() %></td>
													<td><%= m.getMsgTitle() %></td>
													<td><%= m.getRecvtime()%></td>
										 		</tr>
										 	<% } %>
										 <% } %>
										</tbody>
									</table>
									</div>
									</div>
								</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
					<div>
					<ul class="pagination justify-content-center">
						<!-- 맨앞으로 -->
						<li><a id="pageTag" class="page-link" href="<%=contextPath%>/dlist.ms?currentPage=1"> &laquo; </a></li>
						
						<!-- 이전페이지 -->
						<% if(currentPage == 1) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/dlist.ms?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
						<%} %>
						
						
						<!-- 페이지 목록 -->
						<%for(int p=startPage; p<=endPage; p++){ %>
						
							<%if(p == currentPage){ %>
								<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
							<%}else{ %>
								<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/dlist.ms?currentPage=<%= p %>"><%= p %> </a></li>
							<%} %>
							
						<%} %>
						
						
						<!-- 다음페이지 -->
						<% if(currentPage == maxPage) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/dlist.ms?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
						<%} %>
						
						<!-- 맨뒤로 -->
						<li><a id="pageTag" class="page-link" href="<%= contextPath %>/dlist.ms?currentPage=<%= maxPage %>"> &raquo; </a></li>
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
		<% if(!list.isEmpty()){%>
		$(function(){
			$("table>tbody>tr").click(function(){
				var mno = $(this).children().eq(0).text();
			
				location.href="<%= contextPath %>/dlist.ms?mno="+mno;
			})
		})
		<% } %>
	</script>

</body>

</html>