<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.Message"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 쪽지 보내기</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Custom Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
	<style>
	#submitBtn, #resetBtn, #sendBtn {
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
                        <li class="breadcrumb-item active"><a href="write.ms">쪽지 보내기</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box"><a href="<%= request.getContextPath() %>/write.ms" id="sendBtn" class="btn btn-primary btn-block">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>받은 쪽지함</b> <span class="badge badge-primary badge-sm float-right m-t-5" style="background: #78c2ad">95</span> </a>
                                        <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                </div>
                                
                                <div class="email-right-box">                                                                                                                                                                                                                                  
                                    <div class="toolbar" role="toolbar">
										<h4> 쪽지 보내기 </h4>
                                    </div>
                                    <div class="compose-content mt-5">
                                        <form id="newMessageInsertForm" action="<%= request.getContextPath() %>/write.ms" method="post" enctype="multipart/form-data">
                                        	
                                        	<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">
                                        	
                                            <div class="form-group">
                                                <input type="text" class="form-control bg-transparent" name="recvId" placeholder=" 받는 사람 아이디">
                                            </div>
                                            <div class="form-group">
                                                <input type="text" name="messageTitle" class="form-control bg-transparent" placeholder=" 제목">
                                            </div>
                                            <div class="form-group">
                                                <textarea class="textarea_editor form-control bg-light" name="messageContent" rows="15" placeholder="메세지를 입력해주세요."></textarea>
                                            </div>
                                       
                                        <h5 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일</h5>
                                            <div class="form-group">
                                                <div class="fallback">
                                                    <input class="l-border-1" name="upfile" type="file" multiple="multiple">
                                                </div>
                                            </div>
                                    
                                    <div class="text-left m-t-15">
                                        <button id="submitBtn" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit"><i class="fa fa-paper-plane m-r-5"></i> 보내기</button>
                                        <button id="resetBtn" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="reset"><i class="ti-close m-r-5 f-s-12"></i> 취소</button>
                                    </div>
                                    </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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
</body>

</html>