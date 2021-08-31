<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*, com.kh.follow.model.vo.*, com.kh.category.model.vo.*, com.kh.dlmain.model.vo.*, com.kh.board.model.vo.*"%>
<% 
	ArrayList<DLMain> topList = (ArrayList<DLMain>)request.getAttribute("topList");
	ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("cList");
	HashMap<String, ArrayList<Board>> hashmap = (HashMap<String, ArrayList<Board>>)request.getAttribute("hashmap");
	HashMap<String, ArrayList<Board>> hashmapCat = (HashMap<String, ArrayList<Board>>)request.getAttribute("hashmap");
	
	
	System.out.println("전체 인기 게시글 :" + topList);
	System.out.println("카테고리 리스트 :" + cList);
	System.out.println("카테고리 별 인기게시글 : " + hashmap);
	
	Set<String> keySet = hashmap.keySet();
	Iterator<String> keyInteger = keySet.iterator();
	
	
	Set<String> keySetCat = hashmapCat.keySet();
	Iterator<String> keyIntegerCat = keySetCat.iterator();
	
	
	String first = hashmap.keySet().iterator().next();
	
	System.out.println("first : " + first);

%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>DO LIKE - Do Whatever You Like, Community</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<!-- Pignose Calender -->
<link href="./plugins/pg-calendar/css/pignose.calendar.min.css"
	rel="stylesheet">
<!-- Chartist -->
<link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
<link rel="stylesheet"
	href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
</head>
<script>

	var popOnce = false;
	var targetTitle = "_DoChanlleng";
	var popupWidth = 900;
	var popupHeight = 860;
	var top = (screen.availHeight - popupHeight) / 2 - 10;
	// 듀얼 모니터 기준
	var left = (screen.availWidth - popupWidth) / 2;
	if( window.screenLeft < 0){
	left += window.screen.width*-1;
	}
	else if ( window.screenLeft > window.screen.width ){
	left += window.screen.width;
	}
	var options = 'resizable=no, left=' + left + ',top=' + top +', width=' + popupWidth+ ',height=' + popupHeight +',menubar=no, status=no, toolbar=no, location=no, scrollbars=yes';

	$(document).ready(function(){
	if(!popOnce){

	window.open("www.naver.com",targetTitle,options);
	
	}

})

</script>
<style>
.carousel-inner {
	height: 15rem;
}
/* 
.card-body {
	flex: 0 0 auto;
	padding:50em;
	border: none;
	height: 30px;
} */

 #allBoardTop{
	flex: 0 0 auto;
	padding: 150px;
	border: none;
	height: 50px;
}

.carousel-inner {
	width: 10rem;
	height: 15rem;
}

.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #f3969a !important;
	background-color: #fff;
	border-color: #dee2e6 #dee2e6 #fff;
}

.nav-link {
	color: #78c2ad !important;
	text-decoration: none;
	background-color: transparent;
}

.col-10 {
	margin: 0 auto;
}

</style>
<body>
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<div id="main-wrapper">
		<%@ include file="../views/common/menuSideBar.jsp"%>


		<div class="content-body">
			<!-- style="display: flex; flex: 0 0 auto; felx-direction: row; padding: 50px;" -->
			<!-- <div class="container-fluid"> -->
			<!-- 가장 상단 캐러셀 -->
			<div class="row">
			<div class="container-fluid" style="height: 50%;">
			<!-- 상단 캐로셀 -->
			<div class="col-12">
				<div class="row">
					<div class="col-md-8" style="width: 10%; padding-right: 30px; padding-left: 30px;">
						<div class="bootstrap-carousel" style="height: 5rem;">
							<div id="carouselExampleIndicators" class="carousel slide"
								data-ride="carousel">
								<ol class="carousel-indicators">
									<li data-target="#carouselExampleIndicators" data-slide-to="0"
										class="active"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
									<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
								</ol>
								<div class="carousel-inner">
									<div class="carousel-item active">
										<img class="d-block w-100" style="width: 10%; height: 15rem;"
											src="resources/images/summer.png"
											alt="First slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="width: 10%; height: 15rem;"
											src="resources/images/runday.png"
											alt="Second slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="width: 10%; height: 15rem;"
											src="resources/images/submit.png" alt="Third slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="width: 10%; height: 15rem;"
											src="resources/images/vege.png" alt="Fourth slide">
									</div>
									<div class="carousel-item">
										<img class="d-block w-100" style="width: 10%; height: 15rem;"
											src="resources/images/animal.png" alt="Fifth slide">
									</div>
								</div>
								<a class="carousel-control-prev"
									href="#carouselExampleIndicators" data-slide="prev"><span
									class="carousel-control-prev-icon"></span> <span
									class="sr-only">Previous</span> </a><a
									class="carousel-control-next"
									href="#carouselExampleIndicators" data-slide="next"><span
									class="carousel-control-next-icon"></span> <span
									class="sr-only">Next</span></a>
							</div>
						</div>
					</div>
		
					<div class="col-md-4" id="innerDiv" style="width: 40%">
						<div class="card" style="width: 90%;">
							<img class="d-block w-100" style="width: 10%; height: 15rem;" 
							src="resources/images/submit.png" alt="Third slide">
						</div>
					</div>
				</div>
			</div>
			</div>
			
			</div>
	
	<!-- ----------------------------------------------------------------------------------------------------------  -->
	
	<div class="row">
		<div class="container-fluid">
			<!-- 상단 캐로셀 -->
			<div class="col-12">
    <!-- -----------------------------------------------------------------------------------  -->
			
			<div class="row">
			<div class="container-fluid" style="height: 50%;">
			<!-- 상단 캐로셀 -->
			<div class="col-12">
				<div class="row">
					
				<div class="col-6">	
					
					
					
						<div style="height: 750px">
			   		
			   		
			   		
			   		
			   <!-- 메인 전체 인기게시글  상단 게시글 카드 2분할 -->
			   	<div class="row">
			   		
			   		
				   	<% for(int i=0;i < 2;i++){ %>
				   	<div class="col-6">
						<div class="card">
						
						
						<% if (topList.get(i).getnFileName() == null) { %>
							<div class="card-body"  style="margin-bottom: 0; padding:0;"   onclick="location.href='<%= contextPath %>/detail.bo?bno=<%= topList.get(i).getBoardNo() %>'">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="./resources/images/do_100.png" alt="사진" class="Thum" style="width: 250px; height: 250px;" ></span>
						<% } else { %>	
						<div class="card-body"  style="margin-bottom: 0; padding:0;"   onclick="location.href='<%= contextPath %>/detail.bo?bno=<%= topList.get(i).getBoardNo() %>'">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="<%=contextPath%>/resources/board_upfiles/<%=topList.get(i).getnFileName()%>" alt="사진" class="Thum" style="width: 250px; height: 250px;" ></span>
						<% } %>		
									<p id="<%=i%>id" style="margin-bottom: 0px"><%= topList.get(i).getBoardTitle() %></p>
										<div class="card-footer border-0 bg-transparent" style="margin: 0; padding:0;">
											<div class="row">
												<div class="col-6 border-right-1">
													<span id="flspan"><i id ="iconflF" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
													<p id="<%=i%>fl"><%= topList.get(i).getWriter() %> </p>
												</span>
											</div>
											<div class="col-6">
												<span id="bospan"> <i id ="iconflB" class="fa fa-eye gradient-3-text"></i>
												<p id="<%=i %>bp"><%= topList.get(i).getViews() %></p>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</div>
					</div>
					<%}%>

			   </div>
		
			  	 <!-- 메인 하단 게시글 카드 2분할 -->
				<div class="row">
				   	<% for(int i=2;i < 4;i++){ %>
				   	<div class="col-6" style="margin-right: 0;">
						<div class="card">
						
						<% if (topList.get(i).getnFileName() == null) { %>
							<div class="card-body"  style="margin-bottom: 0; padding:0;"   onclick="location.href='<%= contextPath %>/detail.bo?bno=<%= topList.get(i).getBoardNo() %>'">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="./resources/images/do_100.png" alt="사진" class="Thum" style="width: 250px; height: 250px;" ></span>
						<% } else { %>	
						<div class="card-body"  style="margin-bottom: 0; padding:0;"   onclick="location.href='<%= contextPath %>/detail.bo?bno=<%= topList.get(i).getBoardNo() %>'">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="<%=contextPath%>/resources/board_upfiles/<%=topList.get(i).getnFileName()%>" alt="사진" class="Thum" style="width: 250px; height: 250px;" ></span>
						<% } %>	
									<p id="<%=i%>id" style="margin-bottom: 0px"><%= topList.get(i).getBoardTitle() %></p>
										<div class="card-footer border-0 bg-transparent" style="margin: 0; padding:0;">
											<div class="row">
												<div class="col-6 border-right-1">
													<span id="flspan"><i id ="iconflF" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
													<p id="<%=i%>fl"><%= topList.get(i).getWriter() %> </p>
												</span>
											</div>
											<div class="col-6">
												<span id="bospan"> <i id ="iconflB" class="fa fa-eye gradient-3-text"></i>
												<p id="<%=i %>bp"><%= topList.get(i).getViews() %></p>
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						
						</div>
					</div>
					<%}%>
			  	 </div>
			</div>
		</div>				
					
			
					
					
					
					
					
		
					<div class="col-6" id="innerDiv" style="width: 40%">
					
					<div class="card" style="height: 750px">
						<div class="card-body">
							<h4 class="card-title" style="color: #f3969a">
								<h4  style="color: #f3969a"><b>카테고리별 인기 게시글</b></h4>
							</h4>
							<br>
							
							<ul class="nav nav-tabs">
							    <li class="nav-item">
							      <a class="nav-link active" href="#mainTab">DoLike</a>
							    </li>
							  <% while(keyIntegerCat.hasNext()){ %>  
								<% String keyCat = keyIntegerCat.next();%>
								<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#<%= keyCat %>"><%= keyCat %></a>
								</li>
								<% } %>
							 </ul>
							
							<div class="tab-content">
							
							<div id="mainTab" role="tablist" class="container tab-pane active"><br>
								<div align="center">
									<img src ="./resources/images/mainLogo.png">
							    </div>
						    </div>
							
							<% while(keyInteger.hasNext()){ %>  
							<% String key = keyInteger.next();%>
							<% ArrayList<Board> eList = hashmap.get(key); %>
							
							    	<div id="<%= key %>" class="container tab-pane fade"><br>
									<div class="p-t-15">
												<% for(int i = 0 ; i< eList.size() ;i++){ %>
													<div class="p-t-15">
														<br>
														<h5><%= eList.get(i).getBoardTitle() %></h5> 
														<p> <%= eList.get(i).getNickName() %></p>
														<%-- <p><%= eList.get(i).getBoardContent() %></p> --%>
														<hr>
												</div>
												<%} %>
										</div>
								    </div>
						   
						   
						    <% } %>
							    
							    
							
							</div>
							
						</div>
					</div>
							
					
					
					
					
					
					
				</div>
			
			
			
			
			
			
			
			
			</div>
			</div>
			
			</div>
			
			
			
			
		</div>
		</div>
		
		</div>
		
		

				
			</div>
			
			</div>
	
	
		<!-- ----------------------------------------------------------------------------------------------------------  -->
	</div>
</div>

</div>
	<%@ include file="./views/common/footer.jsp"%>



</body>

</html>