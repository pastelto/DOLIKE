<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import = "java.util.*, com.kh.follow.model.vo.*, com.kh.category.model.vo.*, com.kh.dlmain.model.vo.*"%>
<% 
	ArrayList<DLMain> topList = (ArrayList<DLMain>)request.getAttribute("topList");
	ArrayList<Category> cList = (ArrayList<Category>)request.getAttribute("cList");
	HashMap<String, ArrayList<DLMain>> hashmap = (HashMap<String, ArrayList<DLMain>>)request.getAttribute("hashmap");
	
	
	System.out.println("전체 인기 게시글 :" + topList);
	System.out.println("카테고리 리스트 :" + cList);
	System.out.println("카테고리 별 인기게시글 : " + hashmap);
	
	Set<String> keySet = hashmap.keySet();
	Iterator<String> keyInteger = keySet.iterator();

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
					
					
					
						<div class="card">
			   		
			   		
			   		
			   		
			   <!-- 메인 전체 인기게시글  상단 게시글 카드 2분할 -->
			   	<div class="row">
			   		
			   		
				   	<% for(int i=0;i < 2;i++){ %>
				   	<div class="col-6">
						<div class="card">
						
							<div class="card-body"  style="margin-bottom: 0; padding:0;">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="<%=contextPath%>/resources/board_upfiles/<%=topList.get(i).getnFileName()%>" class="Thum" ></span>
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
						
							<div class="card-body"  style="margin-bottom: 0; padding:0;">
								<div class="text-center" style="padding: 10px;">
									<span id="idspan" class="display-5"><img src="<%=contextPath%>/resources/board_upfiles/<%=topList.get(i).getnFileName()%>" class="Thum" ></span>
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
						<!-- <div class="card" style="width: 90%;">
							<img class="d-block w-100" style="width: 10%; height: 15rem;" 
							src="resources/images/submit.png" alt="Third slide">
						</div> -->

												<div class="card">
							<div class="card-body">
								<h4 class="card-title" style="color: #f3969a">
									<b>카테고리별 인기 게시글</b>
								</h4>
								<!-- Nav tabs -->
								<div class="custom-tab-2">
									<ul class="nav nav-tabs mb-3">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#1"><%= cList.get(0).getCategoryName() %></a></li>
										<% for(int i = 1; i < cList.size(); i++){ %>
										<li class="nav-item"><a class="nav-link" data-toggle="tab" href="#<%= cList.get(i).getCategoryNo() %>">
										<%= cList.get(i).getCategoryName() %></a>
										</li>
										<% } %>
									</ul>
									<div class="tab-content">
									<% while(keyInteger.hasNext()){ %>  
									<% String key = keyInteger.next();%>
									<% ArrayList<Board> eList = hashmap.get(key); %>
										 <div class="tab-pane fade show active" id="<%= key %>">
										<div class="tab-pane fade show active" id="home1" role="tabpanel">
											<div class="p-t-15">
												<h4>This is profile title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
											</div>
										</div>
										
									<%} %>
										<div class="tab-pane fade" id="profile1">
											<div class="p-t-15">
												<h4>This is profile title</h4>
												<p>Raw denim you probably haven't heard of them jean
													shorts Austin. Nesciunt tofu stumptown aliqua, retro synth
													master cleanse. Mustache cliche tempor.</p>
												<p>Raw denim you probably haven't heard of them jean
													shorts Austin. Nesciunt tofu stumptown aliqua, retro synth
													master cleanse. Mustache cliche tempor.</p>
											</div>
										</div>
										<div class="tab-pane fade" id="contact1">
											<div class="p-t-15">
												<h4>This is contact title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
											</div>
										</div>
										<div class="tab-pane fade" id="message1">
											<div class="p-t-15">
												<h4>This is message title</h4>
												<p>Raw denim you probably haven't heard of them jean
													shorts Austin. Nesciunt tofu stumptown aliqua, retro synth
													master cleanse. Mustache cliche tempor.</p>
												<p>Raw denim you probably haven't heard of them jean
													shorts Austin. Nesciunt tofu stumptown aliqua, retro synth
													master cleanse. Mustache cliche tempor.</p>
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