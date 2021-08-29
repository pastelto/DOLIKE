<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member" %>
<% 	
 	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg"); 
	String sadMsg = (String)session.getAttribute("sadMsg"); 
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    
    <!-- Custom Stylesheet -->
		
	<link href="./css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	//기쁜일 했을 때 gif 팝업
	   $(function(){
		      var msg = "<%=msg%>";
				if (msg != "null") {
					Swal.fire({
				        icon: "success",
				        text: msg,
				        confirmButtonColor: "#78c2ad",
						confirmButtonBorder: "none",
						imageUrl: 'https://media.giphy.com/media/26FL4fdR9oRs2tdEA/giphy-downsized-large.gif?cid=ecf05e4727y1nhruedl90s1awfthl8e9kc0dcjl2oju92fhv&rid=giphy-downsized-large.gif&ct=g',
						imageWidth: 400,
						imageHeight: 400,
						backdrop: `
							rgba(243,150,154,0.4)
						`
				}).then(() => {
					
				});
			<%session.removeAttribute("msg");%>
			} else{
				console.log("Hi");
			}
		})
		
	//슬픈일 했을 때 gif 팝업
		$(function(){
		      var sadMsg = "<%=sadMsg%>";
				if (sadMsg != "null") {
					Swal.fire({
				        icon: "success",
				        text: sadMsg,
				        confirmButtonColor: "#78c2ad",
						confirmButtonBorder: "none",
						imageUrl: 'https://media.giphy.com/media/OPU6wzx8JrHna/giphy.gif?cid=ecf05e47bhioavjtu6amhxcthxywlke8lxhkffjeou5rth55&rid=giphy.gif&ct=g',
						imageWidth: 400,
						imageHeight: 400,
						backdrop: `
							rgba(0,0,123,0.4)
						`
				}).then(() => {
					
				});
			<%session.removeAttribute("sadMsg");%>
			} else{
				console.log("Sad");
			}
		})
	</script>
	<style>
	#loginBtn, #loginBtnModal, #EnrollBtnModal {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
  	#loginBtnModal:hover, #EnrollBtnModal:hover {
     	background-color: #f3969a;
     	border-color: #f3969a;
    }
	
	#doLikeLogo{
	 	background: white;
	}
	 
	.favBoard {
	  	background-color: #fff;
	  	border: 2px none #2199e8;
	  	padding: 5px 5px;
	  	border-radius: 2px;
	  	color: #2199e8;
	  	background:rgba(0, 0, 0, 0.0);
	} 
	
	#mailIcon:hover{
		color: #78c2ad;
	}
	
	.btn-like {
        color: transparent;
        text-shadow: 0 0 10px rgba(255,255,255,.7), 0 0 0 rgb(172, 170, 170);
        border: none;
        background-color: rgba(0, 0, 0, 0);
        margin-left: 20px;
        margin-right: 20px;
    } 
    
    .btn-like:hover {
        text-shadow: 0 0 0 #f3969a;
    }
    
    .btn-like.done {
        text-shadow:  0 0 0 #f3969a;
    }
    
    .btn-like.done:hover {
        color: transparent;
        text-shadow: 0 0 0 #777;
    }
      
    .boardMargin{
      	padding-left: 20px !important;
    }
    
	#searchBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
	
	#searchBtn:hover, #loginBtn:hover {
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}	
	
	.header-left .input-group {
		margin-top:11px;
	}	
	</style>
</head>
<body>
        <!--**********************************
            Nav header start  
        ***********************************-->
        <div class="nav-header">
            <div class="brand-logo">
                <a href="index2.jsp" style="background:#fff">
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
                    <form id="searchBoardForm" class="form-inline" action="search.bo" method="post">
                        <div class="input-group-prepend">
                            <span class="input-group-text bg-transparent border-0 pr-2 pr-sm-3" id="basic-addon1"><i class="mdi mdi-magnify"></i></span>
                        </div>
                        <div class="input-group text-center mb-3">
                        	<input name="findBoard" type="search" class="form-control" placeholder="전체 게시글 검색하기" aria-label="Search Dashboard">
                        	<div class="input-group-append">
                        		<button id="searchBtn" class="btn" type="button" onclick="searchBoard();">검색</button>
                        	</div>
                        </div>
                        <div class="drop-down animated flipInX d-md-none">
                            <form action="#">
                                <input type="text" class="form-control" placeholder="Search">
                            </form>
                        </div>
                    </form>    
                    </div>
                </div>
                
	            <% if(loginUser == null) {%>  
				<div class="header-right">
					<button class="btn btn-primary px-3 mt-4 mr-3" id="loginBtn" type="button" onclick="location.href='<%=contextPath%>/loginForm.me'">로그인</button>
				</div>
	
	            <%}else{ %>
	            <div class="header-right">
	                 <ul class="clearfix">
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative" data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="images/user/1.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu">
                                <div class="dropdown-content-body">
                                    <ul>
                                        <li>
                                            <a href="<%= request.getContextPath() %>/accessForm.me"><i class="icon-user"></i> <span><%= loginUser.getNickName() %>님</span></a>
                                        </li>
                                        <li>
                                            <a href="<%= request.getContextPath() %>/list.ms">
                                                <i class="icon-envelope-open"></i> <span>쪽지함</span> <div class="badge gradient-3 badge-pill gradient-1">3</div>
                                            </a>
                                        </li>
                                        
                                        <hr class="my-2">
                                        <li>
                                            <a href="<%= request.getContextPath() %>/challengeMain.ch"><i class="icon-lock"></i> <span>진행중인 챌린지</span></a>
                                        </li>
                                        <li><a href="<%= request.getContextPath() %>/logout.me"><i class="icon-key"></i> <span>로그아웃</span></a></li>
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
                    <% if(loginUser == null) {%> 
                      	<li class="mega-menu-sm"  id="allmenu">
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="false" class="active" id="categoryList1" >
	                            <i class="icon-grid menu-icon"></i><span class="nav-text">카테고리</span>
	                        </a>
	                        <ul aria-expanded="false" class="collapse">
	                            <li><a href="list.bo">카테고리1</a></li>
	                            <li><a href="list.bo">카테고리2</a></li>
	                            <li><a href="list.bo">카테고리3</a></li>
	                            <li><a href="list.bo">카테고리4</a></li>
	                            <li><a href="list.bo">카테고리5</a></li>
	                            <li><a href="list.bo">카테고리6</a></li>
	                            <li><a href="list.bo">카테고리7</a></li>                           
	                        </ul>
						</li>
                    <%}else{ %>
                       <li class="mega-menu-sm" id="allmenu">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false" class="active" id="categoryList2">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">카테고리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="list.bo" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리1</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리2</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리3</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리4</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리5</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리6</a></li>
                            <li><a href="../board/boardView.jsp" class="boardMargin"><span><button class="btn-like" name="myFavBoard">⭐</button></span>카테고리7</a></li>
                        </ul>

                    	</li>
                      <%} %> 
                      <% if(loginUser == null) {%> 
                      <li class="mega-menu-sm">
                        <a class="has-arrow" aria-expanded="false" onclick="needLogin();">
                            <i class="icon-heart menu-icon"></i><span class="nav-text">즐겨찾는 게시판</span>
                        </a>
                      <%}else{ %>
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
                    <%} %> 
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
                        <a class="has-arrow sweet-wrong" aria-expanded="false" id="needLogin" onclick="needLogin();">
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
                        <%if(loginUser==null){ %>
                            <li><a href="<%= request.getContextPath() %>/challengeMain.ch">진행중인 챌린지</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">종료된 챌린지</a></li>
                        <%} else {%>
                            <% if(loginUser.getUserId().equals("admin")) {%>
                            <li><a href="<%= request.getContextPath() %>/challengeMain.ch">진행중인 챌린지</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">종료된 챌린지</a></li>
                            <li><a href="<%= request.getContextPath() %>/applyList.ch">신청 리스트</a></li>
                            <li><a href="<%= request.getContextPath() %>/voteInsertForm.ch">투표 만들기</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeInsertForm.ch">챌린지 만들기</a></li>
                            <%} else {%>                            
                        	<li><a href="<%= request.getContextPath() %>/challengeMain.ch">진행중인 챌린지</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">종료된 챌린지</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeApplyForm.ch">챌린지 신청</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeVote.ch">챌린지 투표</a></li>
                            <li><a href="<%= request.getContextPath() %>/myChallenge.ch">마이 챌린지</a></li>
                        <%}}%>                           
                        </ul>
                    </li>
               		<li>
                        <a href="<%= request.getContextPath() %>/noticeView.no" aria-expanded="false">
                            <i class="mdi mdi-bell-outline menu-icon"></i><span class="nav-text">공지사항</span>
                        </a>
                    </li>
                    <% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i> <span class="nav-text">회원 관리</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="categoryList.ca">카테고리 목록</a></li>
                            <li><a href="userAdminList.ua">회원 목록</a></li>
                            <li><a href="userBlackList.bl">블랙리스트</a></li>
                        </ul>
                    </li>
                    <% } %>
                </ul>
            </div><div class="slimScrollBar" style="background: transparent; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 5533.32px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
        </div>
        
                <div class="modal" id="myModal">
                <div class="modal-dialog">
                <div class="modal-content">
            
                    <!-- Modal Header -->
<!--                     <div class="modal-header">
                    <h4 class="modal-title" style="color: #f3969a">로그인 후 이용 가능합니다!</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div> -->
            
                    <!-- Modal body -->
                    <div class="modal-body justify-content-center">
                     <h4 class="modal-title" align="center" style="color: #f3969a">로그인 후 이용 가능합니다!</h4>
                    	<button type="button" class="close" data-dismiss="modal">&times;</button>
                    	<div class="row" style="margin-top: 30px;">
                    	<div class="col-2"></div>
                        <button class="btn btn-primary px-3 ml-4 col-3" id="loginBtnModal" type="button" onclick="location.href='<%=contextPath%>/loginForm.me'">로그인</button>
                        <button class="btn btn-primary px-3 ml-4 col-3" id="EnrollBtnModal" type="button" onclick="location.href='<%=contextPath%>/enrollForm.me'">회원가입</button>
                   		</div>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-danger" style="background-color: #f3969a; border: 0" data-dismiss="modal">닫기</button>
                    </div>
            
                </div>
                </div>
            </div>
        <script>
        	function msgLoginerror(){
        		alert("로그인 후 이용 가능합니다.");
        	}
        	
        	function searchBoard(){
        		var findBoard = $("#searchBoardForm input[name=findBoard]");
        		if(findBoard.val() == ""){
        			alert("검색할 내용을 입력하세요.");
        			return false;
        		}
        		$.ajax({
        			url:"search.bo",
        			type:"post",
        			data:{findBoard:findBoard.val()},
        			success:function(result){
        				if(result == "success"){
        					$("#searchBoardForm").submit();
        				}else{
        					alert(findBoard.val()+" 이라는 검색어와 일치하는 게시글이 없습니다.");
        				}
        			},
        			error:function(){
        				console.log("통신오류.")
        			}
        		})
        		
        		
        	}
				        
			$(function(){
				$("#btn-like").eq(0).click(function(){
				var favB = $("#input2").val();
								
				$.ajax({
									
				url: "myFavBoard.bo",
				data: {input:input},
				type: "post",
				success: function(result){
				$("#output2").val(result);
				},
				error: function(e){ 
					console.log(e);
				}
				})
				})
				})
				
			function needLogin(){
				Swal.fire({
				  title: "로그인이 필요합니다.",
				  icon: 'error',
				  confirmButtonColor: "#78c2ad",
				  confirmButtonBorder: "none",
				  footer: '<a style="color: #78c2ad;" href="<%= contextPath %>/loginForm.me">로그인 바로가기</a> &nbsp; &nbsp; / &nbsp; &nbsp; <a style="color: #78c2ad;" href="<%= contextPath %>/enrollForm.me">회원가입 바로가기</a>'
				})
			}

        </script>
		<script src="plugins/common/common.min.js"></script>
	    <script src="js/custom.min.js"></script>
	    <script src="js/settings.js"></script>
	    <script src="js/gleek.js"></script>
	    <script src="js/styleSwitcher.js"></script>
	    
	    
</body>
</html>