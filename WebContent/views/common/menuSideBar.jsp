<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<% 	
 	// Member loginUser = (Member)session.getAttribute("loginUser");
 	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg"); 
	String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <!-- Favicon icon 
    <link rel="icon" type="image/png" sizes="16x16" href=../../images/do_32.png">
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    
    <!-- Custom Stylesheet -->
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="./css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script>
	function msgLoginerror(){
		alert("로그인 후 이용가능합니다.");
	}
</script>
</head>
<body>
    
        <!--**********************************
            Nav header start  
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index2.jsp" style="background:#eceeef">
                    <b class="logo-abbr"><img src="images/do_32.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/mainLogo_text.png" alt=""></span>
                    <span class="brand-title">
                        <img src="./images/mainLogo_text.png" alt="">
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
                    <div class="hamburger is-active">
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
                
            <% if(loginUser == null) {%>  
			<div class="loginArea">
				<button class="btn btn-primary px-3 ml-4" id="loginBtn" type="button" onclick="location.href='<%=contextPath%>/views/member/memberLogin.jsp'">로그인</button>
			</div>

            <%}else{ %>
            <div class="header-right">
                    <ul class="clearfix">
                        <li class="icons dropdown show"><a href="list.ms" data-toggle="dropdown" aria-expanded="true"> 
                                <i class="mdi mdi-email-outline"></i>
                            </a>

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
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="app-profile.html"><i class="icon-user"></i> <span><%= loginUser.getNickName() %>님</span></a>
                                        </li>
                                        <li>
                                            <a href="<%= request.getContextPath() %>/list.ms">
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
               	<%} %> 
                
            </div>
           </div>
      <!--**********************************
                Header end ti-comment-alt
        ***********************************-->
       <!--**********************************
               Sidebar start
        ***********************************-->
       <div class="nk-sidebar">           
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="nk-nav-scroll active" style="overflow: hidden; width: auto; height: 100%;">
                <ul class="metismenu in" id="menu">
                    <li>
                        <a href="index2.jsp" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">메인</span>
                        </a>
                    </li>
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false" class="active">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">카테고리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="./layout-blank.html">카테고리1</a></li>
                            <li><a href="./layout-one-column.html">카테고리2</a></li>
                            <li><a href="./layout-two-column.html">카테고리3</a></li>
                            <li><a href="./layout-compact-nav.html">카테고리4</a></li>
                            <li><a href="./layout-vertical.html">카테고리5</a></li>
                            <li><a href="./layout-horizontal.html">카테고리6</a></li>
                            <li><a href="./layout-boxed.html">카테고리7</a></li>
                           
                        </ul>
                    </li>
                      <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-heart menu-icon"></i><span class="nav-text">즐겨찾는 게시판</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                        <!-- 나중에 코드로 구현할 부분 -->
                            <li><a href="./layout-blank.html">카테고리1</a></li>
                            <li><a href="./layout-one-column.html">카테고리2</a></li>
                     
                        </ul>
                    </li>
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-people menu-icon"></i> <span class="nav-text">팔로잉</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%= request.getContextPath() %>/followMain.fl">추천 친구</a></li>
                            <li><a href="<%= request.getContextPath() %>/MyFollow.fl">나의 친구</a></li>
                   
                        </ul>
                    </li>
                    <% if(loginUser == null) {%>  
                    <li class="mega-menu-sm">
                        <a class="has-arrow" aria-expanded="false" onclick="msgLoginerror();">
                            <i class="icon-envelope menu-icon" ></i><span class="nav-text">쪽지</span>
                        </a>
                    </li>
                    <%}else{ %>
                     <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i><span class="nav-text">쪽지</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%= request.getContextPath() %>/list.ms">쪽지함</a></li>
                            <li><a href="<%= request.getContextPath() %>/writeForm.ms">쪽지 보내기</a></li>
                        </ul>
                    </li>
                    <%} %> 
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">챌린지</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%= request.getContextPath() %>/challengeMain.ch">진행중인 챌린지</a></li>
                            <li><a href="./app-calender.html">챌린지2</a></li>
                        </ul>
                    </li>
               		<li>
                        <a href="<%= request.getContextPath() %>/noticeView.no" aria-expanded="false">
                            <i class="mdi mdi-bell-outline menu-icon"></i><span class="nav-text">공지사항</span>
                        </a>
                    </li>
                </ul>
            </div><div class="slimScrollBar" style="background: transparent; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 5533.32px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
        </div>
        
		<script src="plugins/common/common.min.js"></script>
	    <script src="js/custom.min.js"></script>
	    <script src="js/settings.js"></script>
	    <script src="js/gleek.js"></script>
	    <script src="js/styleSwitcher.js"></script>
</body>
</html>