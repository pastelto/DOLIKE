<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member, com.kh.category.model.vo.Category, java.util.ArrayList"%>
<% 	
 	Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg"); 
	String sadMsg = (String)session.getAttribute("sadMsg"); 
	String flMsg = (String)session.getAttribute("flMsg"); 
	String adMsg = (String)session.getAttribute("adMsg"); 
	String contextPath = request.getContextPath();
	
	ArrayList<Category> List = (ArrayList<Category>)request.getAttribute("List");
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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link href="./css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap&family=Chakra+Petch:wght@300&family=Lobster&display=swap" rel="stylesheet">
	
	<script>
	
	//????????? ?????? ??? gif ??????
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
		
	//????????? ?????? ??? gif ??????
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

	//?????? ???????????? gif ??????
		$(function(){
		      var flMsg = "<%=flMsg%>";
				if (flMsg != "null") {
					Swal.fire({
				        icon: "success",
				        text: flMsg,
				        confirmButtonColor: "#78c2ad",
						confirmButtonBorder: "none",
						imageUrl: 'https://media.giphy.com/media/gRkJb7UhnzlHpWDSKc/giphy.gif?cid=ecf05e47jpp708i3cfgdagyqovto8t918v0r08ql9yikf7b5&rid=giphy.gif&ct=g',
						imageWidth: 400,
						imageHeight: 200,
						backdrop: `
							rgba(217,229,255,0.4)
						`
				}).then(() => {
					
				});
			<%session.removeAttribute("flMsg");%>
			} else{
				console.log("Hello, My Friend!");
			}
		})
	
	//???????????? ?????? ?????????
		$(function(){
		      var adMsg = "<%=adMsg%>";
				if (adMsg != "null") {
					Swal.fire({
				        icon: "success",
				        text: adMsg,
				        confirmButtonColor: "#78c2ad",
						confirmButtonBorder: "none",
						backdrop: `
							rgba(217,229,255,0.4)
						`
				}).then(() => {
					
				});
			<%session.removeAttribute("adMsg");%>
			} else{
				console.log("LoveYourself");
			}
		})
	</script>
	<style>
	#loginBtn, #loginBtnModal, #EnrollBtnModal {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
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
	
	* {
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	.cursor {
 	cursor:pointer;
	}
	</style>
</head>
<body>

        <div class="nav-header">
            <div class="brand-logo">
                <a href="<%= contextPath %>/main.do" style="background:#fff">
                    <b class="logo-abbr"><img src="images/do_32.png" alt=""> </b>
                    <span class="logo-compact"><img src="./images/mainLogo_text.png" alt=""></span>
                    <span class="brand-title">
                        <img src="./images/mainLogo_text.png" alt="">
                    </span>
                </a>
            </div>
        </div>

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
                        	<input name="findBoard" type="search" class="form-control" placeholder="?????? ????????? ????????????" aria-label="Search Dashboard">
                        	<div class="input-group-append">
                        		<button id="searchBtn" class="btn" type="submit" onclick="search.bo">??????</button>
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
					<button class="btn btn-primary px-3 mt-4 mr-3" id="loginBtn" type="button" onclick="location.href='<%=contextPath%>/loginForm.me'">?????????</button>
				</div>
	
	            <%}else{ %>
	            <div class="header-right">
	                 <ul class="clearfix">
                        <li class="icons dropdown">
                            <div class="user-img c-pointer position-relative mt-2 mr-3" data-toggle="dropdown">
                                <span class="activity active"></span>
                                <img src="resources/images/profile.png" height="40" width="40" alt="">
                            </div>
                            <div class="drop-down dropdown-profile animated fadeIn dropdown-menu mr-3">
                                <div class="dropdown-content-body">
                                    <ul id="myPageDrop">
                                        <li>
                                            <a href="<%= request.getContextPath() %>/accessForm.me"><i class="icon-lock"></i> <span><%= loginUser.getNickName() %>???</span></a>
                                        </li>
                                        <li>
                                            <a href="<%= request.getContextPath() %>/list.ms">
                                                <i class="icon-envelope-open"></i> <span>?????????</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="<%= request.getContextPath() %>/myChallenge.ch"><i class="icon-user"></i> <span>?????? ?????????</span></a>
                                        </li>
                                        <hr class="my-2">
                                        <li><a href="<%= request.getContextPath() %>/logout.me"><i class="icon-key"></i> <span>????????????</span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
               	<%} %> 
            </div>
        </div>

       <div class="nk-sidebar">           
            <div class="slimScrollDiv" style="position: relative; overflow: hidden; width: auto; height: 100%;"><div class="nk-nav-scroll active" style="overflow: hidden; width: auto; height: 100%;">
                <ul class="metismenu in" id="menu">
                    <li>
                        <a href="<%= contextPath %>/main.do" aria-expanded="false">
                            <i class="icon-menu menu-icon"></i><span class="nav-text">??????</span>
                        </a>
                    </li>
                    <% if(loginUser == null) {%> 
                      	<li class="mega-menu-sm"  id="allmenu">
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="false" class="active" id="categoryList1" >
	                            <i class="icon-grid menu-icon"></i><span class="nav-text">????????????</span>
	                        </a>                 
							
	                        <ul aria-expanded="false" class="collapse">
	                        
	                                              
	                        </ul>

						</li>
                    <%}else{ %>
                       <li class="mega-menu-sm" id="allmenu">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false" class="active" id="categoryList2">
                            <i class="icon-grid menu-icon"></i><span class="nav-text">????????????</span>
                        </a>
                        <ul aria-expanded="false" class="collapse" >

                        </ul>

                    	</li>
                      <%} %> 
                      
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-people menu-icon"></i> <span class="nav-text">?????????</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%= request.getContextPath() %>/followMain.fl">?????? ??????</a></li>
                            <% if(loginUser == null) {%>  
                           
                   			<%}else{ %> 
                   				 <li><a href="<%= request.getContextPath() %>/MyFollow.fl">?????? ??????</a></li>
                   			<%} %> 
                        </ul>
                    </li>
                    <% if(loginUser == null) {%>  
                    <li class="mega-menu-sm">
                        <a class="has-arrow sweet-wrong" aria-expanded="false" id="needLogin" onclick="needLogin();">
                            <i class="icon-envelope menu-icon" ></i><span class="nav-text">??????</span>
                        </a>
                    </li>
                    
                    <%}else{ %>
                     <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-envelope menu-icon"></i><span class="nav-text">??????</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="<%= request.getContextPath() %>/list.ms">?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/writeForm.ms">?????? ?????????</a></li>
                        </ul>
                    </li>
                    <%} %> 
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-note menu-icon"></i><span class="nav-text">?????????</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                        <%if(loginUser==null){ %>
                            <li><a href="<%= request.getContextPath() %>/challengeMain.ch">???????????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">????????? ?????????</a></li>
                        <%} else {%>
                            <% if(loginUser.getUserId().equals("admin")) {%>
                            <li><a href="<%= request.getContextPath() %>/challengeMain.ch">???????????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">????????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/applyList.ch">?????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/voteInsertForm.ch">?????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeInsertForm.ch">????????? ?????????</a></li>
                            <%} else {%>                            
                        	<li><a href="<%= request.getContextPath() %>/challengeMain.ch">???????????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeEnd.ch">????????? ?????????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeApplyForm.ch">????????? ??????</a></li>
                            <li><a href="<%= request.getContextPath() %>/challengeVote.ch">????????? ??????</a></li>
                            <li><a href="<%= request.getContextPath() %>/myChallenge.ch">?????? ?????????</a></li>
                        <%}}%>                           
                        </ul>
                    </li>
               		<li>
                        <a href="<%= request.getContextPath() %>/noticeView.no" aria-expanded="false">
                            <i class="mdi mdi-bell-outline menu-icon"></i><span class="nav-text">????????????</span>
                        </a>
                    </li>
                     <% if(loginUser != null && loginUser.getUserId().equals("admin")) { %> 
                    <li class="mega-menu-sm">
                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
                            <i class="icon-notebook menu-icon"></i> <span class="nav-text">?????? ??????</span>
                        </a>
                        <ul aria-expanded="false" class="collapse">
                            <li><a href="categoryList.ca">???????????? ??????</a></li>
                            <li><a href="adminMemberList.am">?????? ??????</a></li>
                            <li><a href="blackList.am">???????????????</a></li>
                        </ul>
                    </li>
                     <% } %> 
                </ul>
                
                               
            </div><div class="slimScrollBar" style="background: transparent; width: 5px; position: absolute; top: 0px; opacity: 0.4; display: none; border-radius: 7px; z-index: 99; right: 1px; height: 5533.32px;"></div><div class="slimScrollRail" style="width: 5px; height: 100%; position: absolute; top: 0px; display: none; border-radius: 7px; background: rgb(51, 51, 51); opacity: 0.2; z-index: 90; right: 1px;"></div></div>
        </div>
        
        <script>
        // ????????? ??? ?????? ?????? ?????????
			function needLogin(){
				Swal.fire({
				  title: "???????????? ???????????????.",
				  icon: 'error',
				  confirmButtonColor: "#78c2ad",
				  confirmButtonBorder: "none",
				  footer: '<a style="color: #78c2ad;" href="<%= contextPath %>/loginForm.me">????????? ????????????</a> &nbsp; &nbsp; / &nbsp; &nbsp; <a style="color: #78c2ad;" href="<%= contextPath %>/enrollForm.me">???????????? ????????????</a>'
				})
			}
        				
              				  $(function(){
              					 $("#categoryList1").click(function(){     				       			                 			        
   				       				console.log("aaaaaaaaaaaaa")
   				       				$.ajax({
   				       					url:"CategoryMenuBar.ca",
   				       					
   				       					type:"get",
   				       					success:function(list){
   				       						console.log(list)
   				       						console.log("ajax ??????!!")
   				       						
   				       						var result = ""
   				       						var $liBody = $("#allmenu ul")
   				       						
   				       					 	
   				       						$liBody.html(""); 
   				       						console.log("@@@@@@@") 
   				       						$.each(list, function(i){

   				       							result = "<li><a href='list.bo?cno="+list[i].categoryNo+"'>" +list[i].categoryName +"</a></li>"
   				       							
   				       							$liBody.append(result)
   				       							
   				       							console.log(result)
   				       							
   				       							
   				       						})
   				       					 
   				       					},
   				       					error:function(e){
   				       						console.log("ajax ?????? ?????????")
   				       					}               			       			       			  
   				       			  })  
                		         }) 
              				  })
             			       	
	
              				  $(function(){
              					 $("#categoryList2").click(function(){     				       			                 			        
              						 
   				       				$.ajax({
   				       					url:"CategoryMenuBar.ca",
   				       					
   				       					type:"get",
   				       					success:function(list){
   				       						console.log(list)
   				       						console.log("ajax ??????!!")
   				       						
   				       						var result = ""
   				       						var $liBody = $("#allmenu ul")
   				       						
   				       						
   				       						$liBody.html(""); 
   				       	 					
   				       	 					$.each(list, function(i){
   				       																														
    				       						result = "<li><table><tr><th><button class='btn-like done' id='myFavBtn' onclick='addFB();' value='"+list[i].categoryNo+"' style='padding-left: 30px;'>???</button></th><td><a href='list.bo?cno="+list[i].categoryNo+"' style='padding-left:10px;'>" + list[i].categoryName +"</a></td></tr></table></li>"
    				       					
   				       							$liBody.append(result)
   				       							
   				       							console.log(result)
   				       							console.log("2")
												
   				       						
   				       	 				})
   				       					},
   				       					error:function(e){
   				       						console.log("ajax ?????? ?????????")
   				       					}               			       			       			  
   				       			  })  
                		         }) 
              				  })
             			       		                	
        </script>
        
		<script src="plugins/common/common.min.js"></script>
	    <script src="js/custom.min.js"></script>
	    <script src="js/settings.js"></script>
	    <script src="js/gleek.js"></script>
	    <script src="js/styleSwitcher.js"></script>
	    
	    
</body>
</html>