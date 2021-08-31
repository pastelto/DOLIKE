<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.*"%>
<%
	Message mesg = (Message)request.getAttribute("message");
	MsgAttachment mat = (MsgAttachment)request.getAttribute("mat");
	int newMsgCount = (int)(request.getAttribute("newMsgCount"));
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 내게 쓴 쪽지</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Custom Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
<style>
	#deleteBtn{
	background-color:#78c2ad;
	color: white;
	}
	
	#resetBtn:hover, #sendBtn:hover, #deleteBtn:hover ,#sendMsgLink:hover{
		color: #78c2ad !important;
    	background-color: #fff !important;
    	border-color: #78c2ad !important;
	}
	
	#sendMsgLink, #resetBtn, #sendBtn, #deleteAllBtn, #submitBtn{
	    color: #fff;
	    background-color: #78c2ad;
	    border-color: #78c2ad;
	}
		
	#deleteAllBtn:hover, #sendMsgLink:hover, #sendBtn:hover, #resetBtn:hover, #submitBtn:hover{
		color: #78c2ad !important;
	    background-color: #fff !important;
	    border-color: #78c2ad !important;
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
                        <li class="breadcrumb-item active">내게 쓴 쪽지</li>
                    </ol>
                </div>
            </div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body">
                                <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad;">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i>받은 쪽지함
                                    <%if(newMsgCount > 0){ %>
                                    <span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left : 10px;"> <%= newMsgCount %> </span>
                                    <%} %>
                                    </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/mlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-star font-18 align-middle mr-2"></i></b>내게 쓴 쪽지함</b></a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 내게 쓴 쪽지함 </h4>
                                    </div>
                                    <div class="read-content">
                                        <div class="media pt-5">
                                            <div class="media-body">
                                                <p class="m-b-3" style="color: #78c2ad"><b><%= loginUser.getNickName() %></b>님</p>
                                            </div>
                                            
                                        </div>
                                        <hr>
                                        <div class="media mb-4 mt-1">
                                            <div class="media-body"><span class="float-right"></span></div>
                                            <small class="float-right" style="color: gray"><b>작성 시간</b>  &nbsp;  <%= mesg.getRecvtime() %></small>
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
										&nbsp; &nbsp; &nbsp;첨부파일이 없습니다.
										<% } %>
										
						
                                        </div>
                                        <hr>
                                    </div>
                                    <div class="text-right">
                                        <!-- <button class="btn btn-primaryw-md m-b-30" id="deleteBtn" type="button" onclick="deleteMsg();" >삭제하기</button> -->
                                        <button class="btn btn-primaryw-md m-b-30" id="deleteBtn" type="button" onclick="deleteMsg();">삭제하기</button>
                                    </div>
                                    	<form id="msgDel" method="post">
											<input type="hidden" name="mno" value="<%= mesg.getMsgNo() %>">
										</form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

      		<%@ include file="../common/footer.jsp" %> 
		<script>
		
		function deleteMsg(){
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal.fire({
                title: '확인', 
                text: "정말 쪽지를 삭제하시겠습니까?", 
                type: 'warning', 
                confirmButtonText: '삭제', 
                showCancelButton: true,     
                cancelButtonText: '취소', 
                cancelButtonColor: "#f3969a",
                confirmButtonColor: "#78c2ad"
            }).then(function(result) { 
                if(result.value) {             
                
                $("#msgDel").attr("action", "<%=contextPath%>/dmmsg.ms");
				swal.fire(
						{title: '삭제',
						 text: '성공적으로 삭제되었습니다.',
						 type: 'success',
						 confirmButtonColor: "#78c2ad"}).then(function(result){
		
					$("#msgDel").submit();
				});
                
            } else if(result.dismiss === 'cancel') { 
                swal.fire(
                		{title: '취소',
                		text: '삭제가 취소되었습니다.',
                		type:'error',
                		confirmButtonColor: "#78c2ad"
                		});
         
            }
        });
		}
		</script>
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
</body>

</html>