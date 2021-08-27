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
	#iconfl{
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
			   
			   
			   
			   <!-- 1번 -->
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="followId1"><%= flist.get(0).getFollowId()  %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="followerCount1">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p id="boardCount1">게시글 수</p>
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
			   
			   	<!-- 2번 -->
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="followId2"><%= flist.get(1).getFollowId()  %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="followerCount2">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p id="boardCount2">게시글 수</p>
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
			   
			   	<!-- 3번 -->
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="followId3"><%= flist.get(2).getFollowId()  %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="followerCount3">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p id="boardCount3">게시글 수</p>
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
			   
			   	<!-- 4번 -->
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="followId1"><%= flist.get(3).getFollowId()  %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="followerCount3">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p id="boardCount3">게시글 수</p>
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
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
			   
<%-- 			   <% for(Follow fl : flist){ %>
			   
			   	<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p id="followId"><%= fl.getFollowId()  %></p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p id="followerCount">팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p id="boardCount">게시글 수</p>
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
			   
			   <%} %> --%>
			   
			   
			   
			   </div>
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
		var followId1 = $("#followId1").text();
		
		console.log(followId1);
		
		$.ajax({
			url:"userInfo.fl",
			data:{followId:followId1},
			type:"get",
			dataType: "json",
			success:function(result){
				var followerCount1 = 0
				var boardCount1 = 0
				$.each(result, function(i){

					followerCount1 = result[i].followerCount 
					boardCount1 = result[i].boardCount
					
				})
				$("#followerCount1").text(followerCount1)
				$("#boardCount1").text(boardCount1)
			},
			error:function(){
				console.log("추천 친구 통신오류!")
			}
		})
	}
window.onload = function(){
		var followId2 = $("#followId2").text();
		
		console.log(followId2);
		
		$.ajax({
			url:"userInfo.fl",
			data:{followId:followId2},
			type:"get",
			dataType: "json",
			success:function(result){
				var followerCount2 = 0
				var boardCount2 = 0
				$.each(result, function(i){

					followerCount2 = result[i].followerCount 
					boardCount2 = result[i].boardCount
					
				})
				$("#followerCount2").text(followerCount2)
				$("#boardCount2").text(boardCount2)
			},
			error:function(){
				console.log("추천 친구 통신오류!")
			}
		})
	}
/* 	window.onload = function(){
		var followId3 = $("#followId3").text();
		
		console.log(followId3);
		
		$.ajax({
			url:"userInfo.fl",
			data:{followId:followId3},
			type:"get",
			dataType: "json",
			success:function(result){
				var followerCount3 = 0
				var boardCount3 = 0
				$.each(result, function(i){

					followerCount3 = result[i].followerCount 
					boardCount3 = result[i].boardCount
					
				})
				$("#followerCount3").text(followerCount)
				$("#boardCount3").text(boardCount)
			},
			error:function(){
				console.log("추천 친구 통신오류!")
			}
		})
	}
	window.onload = function(){
		var followId4 = $("#followId4").text();
		
		console.log(followId4);
		
		$.ajax({
			url:"userInfo.fl",
			data:{followId:followId4},
			type:"get",
			dataType: "json",
			success:function(result){
				var followerCount4 = 0
				var boardCount4 = 0
				$.each(result, function(i){

					followerCount4 = result[i].followerCount 
					boardCount4 = result[i].boardCount
					
				})
				$("#followerCount4").text(followerCount)
				$("#boardCount4").text(boardCount)
			},
			error:function(){
				console.log("추천 친구 통신오류!")
			}
		})
	}  */
</script>


</body>
</html>