<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*, com.kh.follow.model.vo.*, com.kh.category.model.vo.*"%>
	
<%
	ArrayList<Follow> flist = (ArrayList<Follow>)request.getAttribute("flist");
	System.out.println("나의친구 top4 유저 리스트 불러오기: "+flist);
	ArrayList<Category> catList = (ArrayList<Category>)request.getAttribute("catList");
	System.out.println("나의친구 카테고리 리스트 불러오기: "+catList);
	HashMap<String, ArrayList<Follow>> hashmap = (HashMap<String, ArrayList<Follow>>)request.getAttribute("hashmap");
	System.out.println("jsp hashmap 확인: "+hashmap);
	
	
	Set<String> keySet = hashmap.keySet();
	Iterator<String> keyInteger = keySet.iterator();

	
	System.out.println("jsp: "+hashmap.keySet().iterator().next());
	
	
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
	
	#interestLabel, #catLabel{
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

<br> <br>

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
								<span id="idspan" class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i><b><h5 id="<%=i%>nick"></h5></b></span>
								<p id="<%=i%>id" style="margin-bottom: 0px"><%= flist.get(i).getFollowId() %></p>

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
								
								
								<% if(loginUser == null){%>
							 			<button id="addfr" onclick="plusFl();" class="btn btn-sm btn-rounded" disabled="disabled">친구추가</button>
							 		<%}else{%>
							 			<form action="insert.fl" method="get">
											<input id="insertFl" type="hidden" name="followId" value="<%= flist.get(i).getFollowId() %>">
											<button id="addfr" type="submit" class="btn btn-sm btn-rounded">친구추가</button>
										</form>
							 		<%}%>
								
							</div>
						</div>
					</div>
				</div>
			   
			   <%} %>     
			   
			   
			   
			   </div>
			</div>
			   

<hr>
					<div class="col-lg-10" style="margin: 0 auto;">
					<div class="card" style="background: #EFFBF8;">

						<div id="demo" class="carousel slide" data-ride="carousel">
						
						  <!-- Indicators -->
						  <ul class="carousel-indicators">
						    <li data-target="#demo" data-slide-to="0" class="active"></li>
						    <li data-target="#demo" data-slide-to="1"></li>
						    <li data-target="#demo" data-slide-to="2"></li>
						  </ul>
						  
						  <!-- The slideshow -->
						  <div class="carousel-inner">
						   <br>
						   
						   
						   <div class="carousel-item active" style="height: 250px">
						    <img src="./resources/images/followBanner.png" width="1300" height="220" alt="친구추가" title="미리캔버스">
						    </div>
						   
						   
						   
						 <% while(keyInteger.hasNext()){ %>  
						 <% String key = keyInteger.next();%>
						 <% ArrayList<Follow> memList = hashmap.get(key); %>
<%-- 						 <% if(key == hashmap.keySet().iterator().next()){ %>
						    <div class="carousel-item active">
						    	
						    	
						    	<!-- 카테고리별 인기 유저 리스트 불러오기 VERSION -->
				    				<div class="col-lg-10" style="margin: 0 auto;">

										<div id="interestDiv" style="margin: 0 auto;">
											<span id="catLabel" class="label label-pill label-primary"># <%= key %></span>
										</div>
										<br>
									
									   <div class="row">
									   
									   
									<% for(int i=0;i<memList.size();i++){ %>
									
									   
									   	<div class="col-lg-3">
											<div class="card">
												<div class="card-body">
													<div class="text-center">
														<span id="idspan" class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i><b><h5 id="<%=i%>nick"></h5></b></span>
														<p id="categoryUser" style="margin-bottom: 0px"><%= memList.get(i).getFollowId() %></p>
						
														
														<% if(loginUser == null){%>
													 			<button id="addfr" onclick="plusFl();" class="btn btn-sm btn-rounded" disabled="disabled">친구추가</button>
													 		<%}else{%>
													 			<form action="insert.fl" method="get">
																	<input id="insertFl" type="hidden" name="followId" value="<%= memList.get(i).getFollowId() %>">
																	<button id="addfr" type="submit" class="btn btn-sm btn-rounded">친구추가</button>
																</form>
													 		<%}%>
													</div>
												</div>
											</div>
										</div>
									   
									   <%} %>     
									   
									   </div>
									</div>
						    </div>
						    <%}else{ %> --%>
						    <div class="carousel-item" style="height: 250px">
						    	
						    	
						    	<!-- 카테고리별 인기 유저 리스트 불러오기 VERSION -->
				    				<div class="col-lg-10" style="margin: 0 auto;">

										<div id="interestDiv" style="margin: 0 auto;">
											<span id="catLabel" class="label label-pill label-primary"># <%= key %></span>
										</div>
										<br>
									
									   <div class="row">
									   
									   
									<%if(memList.isEmpty()){ %>
									<div>
										<img src="./resources/images/findFollow.png" width="1150" height="210" alt="친구구함" title="미리캔버스" style="margin: 0 auto;" >
									</div>
									<%}else{ %>
									   
									   	<% for(int i=0;i<memList.size();i++){ %>
									   	
									   	<div class="col-lg-3">
											<div class="card">
												<div class="card-body">
													<div class="text-center">
														<span id="idspan" class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i><b><h5 id="<%=i%>nick"></h5></b></span>
														<p id="categoryUser" style="margin-bottom: 0px"><%= memList.get(i).getFollowId() %></p>
						
														
														<% if(loginUser == null){%>
													 			<button id="addfr" onclick="plusFl();" class="btn btn-sm btn-rounded" disabled="disabled">친구추가</button>
													 		<%}else{%>
													 			<form action="insert.fl" method="get">
																	<input id="insertFl" type="hidden" name="followId" value="<%= memList.get(i).getFollowId() %>">
																	<button id="addfr" type="submit" class="btn btn-sm btn-rounded">친구추가</button>
																</form>
													 		<%}%>
													</div>
												</div>
											</div>
										</div>
									    <%} %> 
									<%} %>    
									   
									   </div>
									</div>
						    </div>
						    
						   <%--   <%} %> --%>
						  <%} %>
						  
						  
						  
						  
						  
						    
						 
						 
						 
						  </div>
						  
						  <!-- Left and right controls -->
						  <a class="carousel-control-prev" href="#demo" data-slide="prev">
						    <span class="carousel-control-prev-icon"></span>
						  </a>
						  <a class="carousel-control-next" href="#demo" data-slide="next">
						    <span class="carousel-control-next-icon"></span>
						  </a>
						</div>

					<br>
					</div> <!-- 카드 종료 -->
		</div>
		
		
		
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
					var nickname = 0
					var followerCount = 0
					var boardCount = 0
					
					var nickname1 = 0
					var followerCount1 = 0
					var boardCount1 = 0
					
					var nickname2 = 0
					var followerCount2 = 0
					var boardCount2 = 0
					
					var nickname3 = 0
					var followerCount3 = 0
					var boardCount3 = 0
					$.each(result, function(i){

						nickname = result[i].nickname 
						followerCount = result[i].followerCount 
						boardCount = result[i].boardCount
						
						nickname1 = result[i].nickname1
						followerCount1 = result[i].followerCount1
						boardCount1 = result[i].boardCount1
						
						nickname2 = result[i].nickname2
						followerCount2 = result[i].followerCount2
						boardCount2 = result[i].boardCount2
						
						nickname3 = result[i].nickname3
						followerCount3 = result[i].followerCount3 
						boardCount3 = result[i].boardCount3
					})
					
					$("#0nick").text(nickname)
					$("#0fl").text(followerCount)
					$("#0bo").text(boardCount)
					
					$("#1nick").text(nickname1)
					$("#1fl").text(followerCount1)
					$("#1bo").text(boardCount1)
					
					$("#2nick").text(nickname2)
					$("#2fl").text(followerCount2)
					$("#2bo").text(boardCount2)
					
					$("#3nick").text(nickname3)
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