<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.*"%>
<%
	Message mesg = (Message)request.getAttribute("message");
	MsgAttachment mat = (MsgAttachment)request.getAttribute("mat");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 보낸 쪽지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Custom Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
<style>
	#deleteBtn{
	background-color:#78c2ad;
	color: white;
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


     		<%@ include file="../common/menuSideBar.jsp" %> 

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">쪽지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">보낸 쪽지 읽기</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body">
                                <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad;">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>받은 쪽지함</b> </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 받은 쪽지 </h4>
                                    </div>
                                    <div class="read-content">
                                        <div class="media pt-5">
                                            <div class="media-body">
                                                <p class="m-b-3"><b>받는 사람</b> &nbsp; <%= mesg.getSenderId() %> <br>
                                               					 <b>보낸 날짜</b>  &nbsp;  <%= mesg.getRecvtime() %></p>
                                            </div>
                                            
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body"><span class="float-right"></span></div>
                                        </div>
                                        <h4 class="m-0" style="color: #78c2ad"><%= mesg.getMsgTitle() %></h4>
                                        <br>
                                        <div style="height:15rem">
                                        <p><%= mesg.getMsgContent() %></p>
                                        </div>
                                        </div>
                                        <hr>
                                        <h6 class="p-t-15"><i class="fa fa-download mb-2"></i> 첨부파일 <span></span></h6>
                                        <div class="row m-b-30">
					 					<% if(mat != null){ %>
										<div class="col-auto">
										<a download="<%= mat.getMatOrigin() %>" href="<%=contextPath%>/resources/message_upfiles/<%=mat.getMatNewName()%>" class="text-muted"><%= mat.getMatOrigin() %></a>
                                        </div>
										<% }else{ %>
										&nbsp; &nbsp; &nbsp;보낸 첨부파일이 없습니다.
										<% } %>
										
						
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="text-right">
                                        <button class="btn btn-primaryw-md m-b-30" id="deleteBtn" type="button" onclick="deleteSMsg();">삭제하기</button>
                                    </div>
                                    	<form action="" id="msgDel" method="post">
											<input type="hidden" name="mno" value="<%= mesg.getMsgNo() %>">
										</form>
										<script>
	                                    function deleteSMsg(){
	                        				$("#msgDel").attr("action", "<%=contextPath%>/dsmsg.ms");
	                        				$("#msgDel").submit();
                        				}
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->

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


</body>

</html>