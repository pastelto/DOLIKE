<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	String contextPath = request.getContextPath();
%>  
<%
	String loginUser = "admin";
	//Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
%>    
<<<<<<< HEAD
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.kh.board.model.vo.Board" %>
<%@ page import="com.kh.board.model.dao.BoardDao" %>
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
=======
>>>>>>> parent of 7e12f2c (Merge pull request #46 from pastelto/mingi)
<!DOCTYPE html>
<html lang="ko">
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
    <!-- Custom Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<style>
	.nk-sidebar{
		padding:30px;
	}
	.content-body{
		padding:5px 0px 0px 30px;
	}
</style>
</head>

<body>
<<<<<<< HEAD
	<%@ include file="../common/menuSideBar.jsp" %> 
	<%--
<<<<<<< HEAD
=======
	<%
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
=======
>>>>>>> parent of 7e12f2c (Merge pull request #46 from pastelto/mingi)
	
		String nickName = null;
		if(session.getAttribute("nickName") != null){
			nickName = (String)session.getAttribute("nickName"); //로그인한 유저의 정보 저장 
		}
		int boardNo = 0;
		if(request.getParameter("boardNo") != null){
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		if(boardNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardView.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDao().getBoard(boardNo);
<<<<<<< HEAD
<<<<<<< HEAD
	--%>
=======
	%>
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
            Nav header start
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index.html">
                    <b class="logo-abbr"><img src="images/do_32.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/mainLogo_text.png" alt=""></span>
                    <span class="brand-title">
                        <img src="images/mainLogo_text.png" alt="">
                    </span>
                </a>
            </div>
        </div>
        <!--**********************************
            Nav header end
        ***********************************-->

        <!--**********************************
            Header start
        ***********************************-->
        <div class="header">    
            <div class="header-content clearfix">
                
                <div class="nav-control">
                    <div class="hamburger">
                        <span class="toggle-icon"><i class="icon-menu"></i></span>
                    </div>
                </div>
                <div class="header-left">
                    <div class="input-group icons">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <input type="search" class="form-control" placeholder="전체 게시글 검색하기" aria-label="Search Dashboard">
                        <div class="drop-down animated flipInX d-md-none">
                            <form action="#">
                                <input type="text" class="form-control" placeholder="Search">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-email-outline"></i>
                                <span class="badge badge-pill gradient-1">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">3 New Messages</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span class="badge badge-pill gradient-1">3</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/1.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Saiful Islam</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li class="notification-unread">
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/2.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Adam Smith</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Can you do me a favour?</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/3.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Barak Obama</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hi Teddy, Just wanted to let you ...</div>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <img class="float-left mr-3 avatar-img" src="images/avatar/4.jpg" alt="">
                                                <div class="notification-content">
                                                    <div class="notification-heading">Hilari Clinton</div>
                                                    <div class="notification-timestamp">08 Hours ago</div>
                                                    <div class="notification-text">Hello</div>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown"><a href="javascript:void(0)" data-toggle="dropdown">
                                <i class="mdi mdi-bell-outline"></i>
                                <span class="badge badge-pill gradient-2">3</span>
                            </a>
                            <div class="drop-down animated fadeIn dropdown-menu dropdown-notfication">
                                <div class="dropdown-content-heading d-flex justify-content-between">
                                    <span class="">2 New Notifications</span>  
                                    <a href="javascript:void()" class="d-inline-block">
                                        <span class="badge badge-pill gradient-2">5</span>
                                    </a>
                                </div>
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events near you</h6>
                                                    <span class="notification-text">Within next 5 days</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Started</h6>
                                                    <span class="notification-text">One hour ago</span> 
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-success-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Event Ended Successfully</h6>
                                                    <span class="notification-text">One hour ago</span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <span class="mr-3 avatar-icon bg-danger-lighten-2"><i class="icon-present"></i></span>
                                                <div class="notification-content">
                                                    <h6 class="notification-heading">Events to Join</h6>
                                                    <span class="notification-text">After two days</span> 
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                    
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown d-none d-md-flex">
                            <a href="javascript:void(0)" class="log-user"  data-toggle="dropdown">
                                <span>한국어</span>  <i class="fa fa-angle-down f-s-14" aria-hidden="true"></i>
                            </a>
                            <div class="drop-down dropdown-language animated fadeIn  dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li><a href="javascript:void()">한국어</a></li>
                                        <li><a href="javascript:void()">English</a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative"   data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span>Profile</span></a>
                                        </li>
                                        <li>
                                            <a href="javascript:void()">
                                                <i class="icon-envelope-open"></i> <span>Inbox</span> <div class="badge gradient-3 badge-pill gradient-1">3</div>
                                            </a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="page-lock.html"><i class="icon-lock"></i> <span>Lock Screen</span></a>
                                        </li>
                                        <li><a href="page-login.html"><i class="icon-key"></i> <span>Logout</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!--**********************************
            Header end ti-comment-alt
        ***********************************-->

        <!--**********************************
            Sidebar start
        ***********************************-->
        <div class="nk-sidebar">           
            <div class="nk-nav-scroll">
                <ul class="metismenu" id="menu">
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">메인</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./index.html">하위 카테고리</a></li>
                            <!-- <li><a href="./index-2.html">Home 2</a></li> -->
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">카테고리</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./email-inbox.html">하위카테고리1</a></li>
                            <li><a href="./email-read.html">하위카테고리2</a></li>
                            <li><a href="./email-compose.html">하위카테고리3</a></li>
                        </ul>
                    </li>
                     <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">팔로잉</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./app-profile.html">Profile</a></li>
                            <li><a href="./app-calender.html">Calender</a></li>
                        </ul>
                    </li>
                    </li>
                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-graph menu-icon"></i> <span class="nav-text">챌린지</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./chart-flot.html">Flot</a></li>
                            <li><a href="./chart-morris.html">Morris</a></li>
                            <li><a href="./chart-chartjs.html">Chartjs</a></li>
                            <li><a href="./chart-chartist.html">Chartist</a></li>
                            <li><a href="./chart-sparkline.html">Sparkline</a></li>
                            <li><a href="./chart-peity.html">Peity</a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i><span class="nav-text">공지사항</span>
                        </a>
                        <ul aria-expanded="false">
                            <li><a href="./page-login.html">Login</a></li>
                            <li><a href="./page-register.html">Register</a></li>
                            <li><a href="./page-lock.html">Lock Screen</a></li>
                            <li><a class="has-arrow" href="javascript:void()" aria-expanded="false">Error</a>
                                <ul aria-expanded="false">
                                    <li><a href="./page-error-404.html">Error 404</a></li>
                                    <li><a href="./page-error-403.html">Error 403</a></li>
                                    <li><a href="./page-error-400.html">Error 400</a></li>
                                    <li><a href="./page-error-500.html">Error 500</a></li>
                                    <li><a href="./page-error-503.html">Error 503</a></li>
                                </ul>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <!--**********************************
            Sidebar end
        ***********************************-->

>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
=======
	--%>
>>>>>>> parent of 7e12f2c (Merge pull request #46 from pastelto/mingi)
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
	 		<div class="row" style="margin:20px">
		 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		 				<thread>
		 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
		 						<th colspan="3" style="background-color:rgb(228, 243, 240); text-align:center;">게시판 글보기 </th>
		 					</tr>
		 				</thread>
		 				<tbody>
		 					<tr> 
		 						<td style="width:20%;">글 제목</td>
		 						<td colspan="2"><%= board.getBoardTitle().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성자</td>
		 						<td colspan="2"><%= board.getNickName() %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성일자</td>
		 						<td colspan="2"><%= board.getBoardDate() %></td>
		 					</tr>
		 					<tr> 
		 						<td>내용</td>
		 						<td colspan="2" style="min-height:200px; text-align:left;"><%= board.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 				</tbody>
		 			</table>
<<<<<<< HEAD
		 			<br>
		 			<div class="bottom-btns" align="center">
		 				<button type="button" onclick="location.href='<%= contextPath %>/list.bo?currentPage=1';">목록으로</button>
		 				<% if (loginUser != null && loginUser.getUserId().equals(b.getNickName())){ %>
		 					<button type="button" onclick="updateForm();">수정 </button>
		 					<button type="button" onclick="deleteBoard();">삭제 </button>
		 				<% } %>
		 			</div>		
		 			<form action="" id="postForm" method="post">
		 				<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
		 			</form>
		 			<script>
						function updateForm(){
							$("#postForm").attr("action", "<%=contextPath%>/updateForm.bo");
							$("#postForm").submit();
						}
						
						function deleteBoard(){
							$("#postForm").attr("action", "<%=contextPath%>/deleteB.bo");
							$("#postForm").submit();
						}
					</script>
		 			<%--
<<<<<<< HEAD
=======
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
=======
>>>>>>> parent of 7e12f2c (Merge pull request #46 from pastelto/mingi)
		 			<a href="boardView.jsp" class="btn btn-primary">목록</a>
		 			<% if(nickName != null && nickName.equals(board.getNickName())){ %>
		 				<a onclick="return confirm('수정하시겠습니까?')" href="boardUpdate.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">수정</a>
		 				<a onclick="return confirm('삭제하시겠습니까?')" href="boardDelete.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">삭제</a>
		 			<% } %>
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> parent of 7e12f2c (Merge pull request #46 from pastelto/mingi)
		 			--%> 			
	 		</div>
	 	<!-- ************ 댓글 에어리어 **************** -->
	 		<div class="replyArea">
	 			<table border="1" align="center">
	 				<tr>
	 					<th>댓글작성</th>
	 					<% if(loginUser != null) {%>
	 					<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
	 					<td><button id="addReply">댓글등록</button></td>
	 					<% } else{ %>
	 					<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">로그인한 사용자만 가능합니다.</textarea></td>
	 					<td><button disabled>댓글등록</button></td>
	 					<% } %>
	 				</tr>
	 			</table>
	 			<!-- 댓글리스트  -->
	 			<div id="replyListArea">
	 				<table id="replyList" border="1" align="center"></table>
	 			</div>
	 		</div>
	 		<script>
		$(function(){
			selectReplyList(); //온로드되는 시점에 댓글 달린게 있으면 보여야 함
			$('#addReply').click(function(){
				var content = $('#replyContent').val();
				var bId = <%= b.getBoardNo()%>;
				
				$.ajax({
					url:"rinsert.bo",
					type:"post",
					data:{
						content:content,
						bId:bId
					},
					success:function(status){
						if(status == "success"){
							selectReplyList(); //성공하면 댓글 달고 바로 보여야 함
							$('#replyContent').val("");//댓글칸에 적은 내용 비워져야 함(다시 작성 가능하도록)
						}
					},
					error:function(){
						console.log("ajax 통신 실패 - 댓글등록");
					}
				})
			})
		})
		function selectReplyList(){
			$("#replyList").empty(); //먼저 테이블을 지우고 새로 뿌림(??)
			$.ajax({
				url:"rList.bo",
				data:{bId:<%= b.getBoardNo()%>}, //해당되는 게시판번호의 게시글 가져옴
				type:"get",
				success:function(list){ //한사람이 아니기때문에 list로 가져옴
					console.log(list)
					var value = "";
					for(var i in list){
						value += '<tr>'+
									'<td width="100px">'+list[i].replyWriter+'</td>'+
									'<td width="330px">'+list[i].replyContent+'</td>'+
									'<td width="150px">'+list[i].createDate+'</td>'+
								 '</tr>';
					}
					$("#replyList").html(value);
				},
				error:function(){
					console.log("ajax 통신 실패 - 댓글조회");
				}
			})
		}
	</script> 
=======
		 			
	 		</div>
            <!-- #/ container -->
>>>>>>> parent of 6ceba06 (Merge branch 'master' of https://github.com/pastelto/DOLIKE)
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
        <div class="footer">
            <div class="copyright">
                <p>&copy; <a href="https://github.com/pastelto/DOLIKE">TEAM DOLIKE</a> 2021</p>
            </div>
        </div>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->
	
    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>

    <!-- Chartjs -->
    <script src="./plugins/chart.js/Chart.bundle.min.js"></script>
    <!-- Circle progress -->
    <script src="./plugins/circle-progress/circle-progress.min.js"></script>
    <!-- Datamap -->
    <script src="./plugins/d3v3/index.js"></script>
    <script src="./plugins/topojson/topojson.min.js"></script>
    <script src="./plugins/datamaps/datamaps.world.min.js"></script>
    <!-- Morrisjs -->
    <script src="./plugins/raphael/raphael.min.js"></script>
    <script src="./plugins/morris/morris.min.js"></script>
    <!-- Pignose Calender -->
    <script src="./plugins/moment/moment.min.js"></script>
    <script src="./plugins/pg-calendar/js/pignose.calendar.min.js"></script>
    <!-- ChartistJS -->
    <script src="./plugins/chartist/js/chartist.min.js"></script>
    <script src="./plugins/chartist-plugin-tooltips/js/chartist-plugin-tooltip.min.js"></script>



    <script src="./js/dashboard/dashboard-1.js"></script>



</body>
</html>
 	
 
 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
</body>
</html>