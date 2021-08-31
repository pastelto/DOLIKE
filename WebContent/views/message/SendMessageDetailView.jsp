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
                        <li class="breadcrumb-item">쪽지</li>
                        <li class="breadcrumb-item active">보낸 쪽지 읽기</li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card" >
                            <div class="card-body">
                                <div class="email-left-box"  style="height: 40rem" ><a href="<%= request.getContextPath() %>/writeForm.ms" id="sendMsgLink" class="btn btn-primary btn-block" style="background: #78c2ad; border: none;">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> 받은 쪽지함
                                    <%if(newMsgCount > 0){ %>
                                    <span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left : 10px;"> <%= newMsgCount %> </span>
                                    <%} %>
                                     </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i><b>보낸 쪽지함</b></a> 
                                        <a href="<%= request.getContextPath() %>/mlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-star font-18 align-middle mr-2"></i>내게 쓴 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
                                <div class="email-right-box"  style="height: 40rem">
                                   <div class="toolbar" role="toolbar">
										<h4> 보낸 쪽지 </h4>
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
		<script>
		
		function deleteSMsg(){
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal.fire({
                title: '확인',        // 제목
                text: "정말 쪽지를 삭제하시겠습니까?",  // 내용
                type: 'warning',                              // 종류
                confirmButtonText: '삭제',               // 확인버튼 표시 문구
                showCancelButton: true,                 // 취소버튼 표시 문구
                cancelButtonText: '취소',                 // 취소버튼 표시 문구
                cancelButtonColor: "#f3969a",
                confirmButtonColor: "#78c2ad"
            }).then(function(result) { 
                if(result.value) {                 // 확인 버튼이 눌러진 경우
                
                	$("#msgDel").attr("action", "<%=contextPath%>/dsmsg.ms");
                	$("#msgDel").submit();
                /*	swal.fire(
						{title: '삭제',
						 text: '성공적으로 삭제되었습니다.',
						 type: 'success',
						 confirmButtonColor: "#78c2ad"}).then(function(result){
		
					
				}); */
                
            }  else if(result.dismiss === 'cancel') { 
                swal.fire(
                		title: '취소',
                		text: '삭제가 취소되었습니다.',
                		type:'error',
                		confirmButtonColor: "#78c2ad"
                		);
         
            }
        });
		}
		</script>

</body>

</html>