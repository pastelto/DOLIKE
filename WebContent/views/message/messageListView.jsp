<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.Message"%>
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">쪽지함</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="email-left-box"><a href="writeForm.ms" class="btn btn-primary btn-block" style="background: #78c2ad">쪽지보내기</a>
                                    <div class="mail-list mt-4"><a href="list.ms" class="list-group-item border-0 text-primary p-r-0"><i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>받은 쪽지함</b> <span class="badge badge-primary badge-sm float-right m-t-5" style="background: #78c2ad">95</span> </a>
                                        <a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a> 
                                        <a href="#" class="list-group-item border-0 p-r-0"><i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
                                    </div>
                                   
                                </div>
<<<<<<< HEAD
<<<<<<< HEAD
                                <div class="email-right-box">
=======
                                <div class="email-right-box"  style="height: 40rem">
>>>>>>> parent of 75d1fc3 (05.02. 받은 쪽지함, 받은 쪽지 내용, 첨부파일, 보낸 쪽지함, 보낸 쪽지 내용, 보낸 쪽지 첨부파일, 휴지통, 로그인전)
=======
                                <div class="email-right-box"  style="height: 40rem">
>>>>>>> parent of d136e57 (Merge pull request #42 from pastelto/DH)
                                   <div class="toolbar" role="toolbar">
										<h4> 받은 쪽지함 </h4>
                                    </div>
<<<<<<< HEAD
 
                                     <!-- 쪽지함 받아오는 코드 작성 -->
                                    <div class="email-list m-t-15">
									<div class="table-responsive">
									<div class="col-mail col-mail-2">
									<table class="table table-hover" style="text-align: center;">
										<thead>
											<tr style="background-color: #78c2ad; color: white;">
												<th>번호</th>
												<th>보낸사람</th>
												<th>제목</th>
												<th>받은 날짜</th>
											</tr>
										</thead>
										<tbody>					
											<% if(list.isEmpty()){ %>
										 	<tr>
												<td colspan="4">받은 쪽지가 없습니다.</td>
											</tr>
										 <% }else{  %>
										 	<% for(Message m : list){ %>
										 		<tr>
<<<<<<< HEAD
<<<<<<< HEAD
										 			<td><input type="checkbox" value=<%= m.getMsgNo()%>/></td>
=======
>>>>>>> parent of 75d1fc3 (05.02. 받은 쪽지함, 받은 쪽지 내용, 첨부파일, 보낸 쪽지함, 보낸 쪽지 내용, 보낸 쪽지 첨부파일, 휴지통, 로그인전)
=======
>>>>>>> parent of d136e57 (Merge pull request #42 from pastelto/DH)
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
=======
                                    
                                    
                                    <div class="email-list m-t-15"> <!-- 쪽지함 받아오는 코드 작성 -->
                                        <div class="message">
                                            <a href="list.ms">
                                                <div class="col-mail col-mail-1">
                                                    <div class="email-checkbox" style="height: 650px">
                                                        <input type="checkbox" id="chk2">
                                                        <label class="toggle" for="chk2"></label>
                                                    </div><span class="star-toggle ti-star"></span>
                                                </div>
                                                <div class="col-mail col-mail-2">
                                                    <div class="subject">Ingredia Nutrisha, A collection of textile samples lay spread out on the table - Samsa was a travelling salesman - and above it there hung a picture</div>
                                                    <div class="date">11:49 am</div>
                                                </div>
                                            </a>
                                            
                                        </div>
                                       
                                    </div>
                                    
                                    <!-- panel -->
                                    <!-- 쪽지함 페이지 코드 작성할 곳  -->
                                    <div class="row"> 
                                        <div class="col-7">
                                            <div class="text-left">1 - 20 of 568</div>
                                        </div>
                                        <div class="col-5">
                                            <div class="btn-group float-right">
                                                <button class="btn btn-gradient" type="button" style="background: #ced4da"><i class="fa fa-angle-left"></i>
                                                </button>
                                                <button class="btn" type="button" style="background: #78c2ad"><i class="fa fa-angle-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
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
<<<<<<< HEAD

=======
	<script>
		<% if(!list.isEmpty()){%>
		$(function(){
			$("table>tbody>tr").click(function(){
				var mno = $(this).children().eq(0).text();
			
				location.href="<%= contextPath %>/list.ms?mno="+mno;
			})
		})
		<% } %>
	</script>
>>>>>>> parent of 75d1fc3 (05.02. 받은 쪽지함, 받은 쪽지 내용, 첨부파일, 보낸 쪽지함, 보낸 쪽지 내용, 보낸 쪽지 첨부파일, 휴지통, 로그인전)

</body>

</html>