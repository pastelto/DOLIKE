<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*, com.kh.follow.model.vo.*"%>
	
<%
	ArrayList<Follow> flist = (ArrayList<Follow>)request.getAttribute("flist");
	System.out.println(flist);
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 추천친구</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">


<style>
	#interestDiv {
		display: table;
		text-align: center;
	}
	
	#interestLabel {
		background: #78c2ad;
	}
	#addfr{
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#addfr:hover{
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}
	#dia{
		color: #78c2ad;
	}
	#iconflF, #iconflB{
		color: #f3969a;
	}
</style>
</head>
<body>
<!-- 확인용! -->
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>


	<div class="content-body">

            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">팔로잉</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">추천 친구</a></li>
                    </ol>
                </div>
            </div>

<br> <br> <br> <br>



			<div class="col-lg-10" style="margin: 0 auto;">

				<div id="interestDiv" style="margin: 0 auto;">
					<span id="interestLabel" class="label label-pill label-primary"># 팔로워 TOP4</span>
				</div>
				<br>
			
			   <div class="row">
			   
			   
			   
			   
			   
			   
			<% for(int i=0;i<flist.size();i++){ %>
			   
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span id="idspan" class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="<%=i%>id"><%= flist.get(i).getFollowId() %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span id="flspan"><i id ="iconflF" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="<%=i%>fl">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span id="bospan"> <i id ="iconflB" class="fa fa-pencil gradient-3-text"></i>
												<p id="<%=i%>bo">게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>
			   
			   <%} %>     
			   
			   
			   
			   </div>
			</div>
			   


						<div id="demo" class="carousel slide" data-ride="carousel">
						
						  <!-- Indicators -->
						  <ul class="carousel-indicators">
						    <li data-target="#demo" data-slide-to="0" class="active"></li>
						    <li data-target="#demo" data-slide-to="1"></li>
						    <li data-target="#demo" data-slide-to="2"></li>
						  </ul>
						  
						  <!-- The slideshow -->
						  <div class="carousel-inner">
						    <div class="carousel-item active">
						      <img src="la.jpg" alt="Los Angeles" width="1100" height="500">
						    </div>
						    <div class="carousel-item">
						      <img src="chicago.jpg" alt="Chicago" width="1100" height="500">
						    </div>
						    <div class="carousel-item">
						      <img src="ny.jpg" alt="New York" width="1100" height="500">
						    </div>
						  </div>
						  
						  <!-- Left and right controls -->
						  <a class="carousel-control-prev" href="#demo" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
						  </a>
						  <a class="carousel-control-next" href="#demo" data-slide="next">
						    <span class="carousel-control-next-icon"></span>
						  </a>
						</div>




		
			
<!-- 			<div class="col-lg-10" style="margin: 0 auto;">

				<div id="interestDiv" style="margin: 0 auto;">
					<span id="interestLabel" class="label label-pill label-primary"># 팔로워 TOP4</span>
				</div>
				<br>
			
			   <div class="row">
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>

                <div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div> -->
		
		
		
		
		</div>
			
	</div>
<%@ include file="../common/footer.jsp" %> 

<script>
 	
 	window.onload = function(){
 		
		var followId = $("#0id").text();
		var followId1 = $("#1id").text();
		var followId2 = $("#2id").text();
		var followId3 = $("#3id").text();
		
		if(followId == ""||followId1 ==""||followId2 ==""||followId3 ==""){
			var con = confirm("아직 TOP4 정산 전입니다! 친구를 추가해보세요~")
			if(con==true){
				location.href="<%= contextPath %>/MyFollow.fl";
			}else{
				location.href="<%= contextPath %>/index2.jsp";
			}
		}else{
			console.log(followId);
			console.log(followId1);
			console.log(followId2);
			console.log(followId3);
			
			$.ajax({
				url:"followTop4.fl",
				data:{followId:followId,
					followId1:followId1,
					followId2:followId2,
					followId3:followId3},
				type:"get",
				dataType: "json",
				success:function(result){
					var followerCount = 0
					var boardCount = 0
					
					var followerCount1 = 0
					var boardCount1 = 0
					
					var followerCount2 = 0
					var boardCount2 = 0
					
					var followerCount3 = 0
					var boardCount3 = 0
					$.each(result, function(i){

						followerCount = result[i].followerCount 
						boardCount = result[i].boardCount
						
						followerCount1 = result[i].followerCount1
						boardCount1 = result[i].boardCount1
						
						followerCount2 = result[i].followerCount2
						boardCount2 = result[i].boardCount2
						
						followerCount3 = result[i].followerCount3 
						boardCount3 = result[i].boardCount3
					})
					
					$("#0fl").text(followerCount)
					$("#0bo").text(boardCount)
					
					$("#1fl").text(followerCount1)
					$("#1bo").text(boardCount1)
					
					$("#2fl").text(followerCount2)
					$("#2bo").text(boardCount2)
					
					$("#3fl").text(followerCount3)
					$("#3bo").text(boardCount3)
				},
				error:function(){
					console.log("추천 친구1 통신오류!")
				}
			})
		}
		

		
	}


</script>


</body>
</html>