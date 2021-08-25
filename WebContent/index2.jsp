<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<style>
.carousel-inner {
	height: 15rem;
}

.card-body {
	flex: 0 0 auto;
	padding: 1rem;
	border: none;
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

	<!--*******************
        Preloader start
    ********************-->
	<div id="preloader">
		<div class="loader">
			<svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none"
					stroke-width="3" stroke-miterlimit="10" />
            </svg>
		</div>
	</div>
	<!--*******************
	        Preloader end
	    ********************-->
	<div id="main-wrapper">
		<!--**********************************
            Sidebar start
        ***********************************-->
		<%@ include file="../views/common/menuSideBar.jsp"%>
		<!--**********************************
            Sidebar end
        ***********************************-->

		<!--**********************************
            Content body start
        ***********************************-->


		<div class="content-body">
			<!-- style="display: flex; flex: 0 0 auto; felx-direction: row; padding: 50px;" -->
			<div class="container-fluid">
			<div class="row" style="margin-bottom: 13%;">
				<div class="topList col-10" align="center" >

					<div id="thumbList"
						style="height: 10%; padding-left: 15%; padding-right: 5%">
						<div class="card" style="width: 80%;">
							<!--                             <div class="card-body"> -->

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
												src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/db1ccc45-b19c-47ef-a29e-e1f358667700/%EC%A0%9C%EB%AA%A9%EC%9D%84_%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210825T073143Z&X-Amz-Expires=86400&X-Amz-Signature=ac3d557f5fcecf4727866acbe629ccb471588f6f4c0628af19e34c5a5d4c704d&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25EC%25A0%259C%25EB%25AA%25A9%25EC%259D%2584%2520%25EC%259E%2585%25EB%25A0%25A5%25ED%2595%25B4%25EC%25A3%25BC%25EC%2584%25B8%25EC%259A%2594_-001.png%22"
												alt="First slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="width: 10%; height: 15rem;"
												src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/25bb1fd3-937c-4576-b0cc-9a10dd26c8f8/runday.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210825T073217Z&X-Amz-Expires=86400&X-Amz-Signature=9e634719385ecafc99e7cf4153cd7169e8e4dec9102d1bae4524e0d41eb05407&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22runday.png%22"
												alt="Second slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="width: 10%; height: 15rem;"
												src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/d1b52843-f217-4fb6-803e-4a27563dccbd/%EC%A7%80%EB%82%9C-%EC%97%AC%EB%A6%84-_-%EB%B0%B0%EB%84%88%EC%9A%A9-001.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210825T073247Z&X-Amz-Expires=86400&X-Amz-Signature=d125959da56730ae94feba3e755e89f38b9f8409ab38c6aadaba347cba2c93bd&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25EC%25A7%2580%25EB%2582%259C-%25EC%2597%25AC%25EB%25A6%2584-_-%25EB%25B0%25B0%25EB%2584%2588%25EC%259A%25A9-001.png%22" alt="Third slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="width: 10%; height: 15rem;"
												src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/6c26ce99-87e4-4463-bd37-35587041881d/bannerAnimal2.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210825T073315Z&X-Amz-Expires=86400&X-Amz-Signature=2c3eadfbba74ebae00eb0f64172369bf002d8f9089a946d5f0a6cc58deae7586&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22bannerAnimal2.png%22" alt="Fourth slide">
										</div>
										<div class="carousel-item">
											<img class="d-block w-100" style="width: 10%; height: 15rem;"
												src="https://s3.us-west-2.amazonaws.com/secure.notion-static.com/c723f3a1-8d63-437d-9e86-e3cd7d9cd430/%EC%A0%9C%EB%AA%A9%EC%9D%84-%EC%9E%85%EB%A0%A5%ED%95%B4%EC%A3%BC%EC%84%B8%EC%9A%94_-001_%281%29.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAT73L2G45O3KS52Y5%2F20210825%2Fus-west-2%2Fs3%2Faws4_request&X-Amz-Date=20210825T073528Z&X-Amz-Expires=86400&X-Amz-Signature=67d707c2f5f048cd84d3ff1cc9316bec613ea7579066b0304d4503bed248a868&X-Amz-SignedHeaders=host&response-content-disposition=filename%20%3D%22%25EC%25A0%259C%25EB%25AA%25A9%25EC%259D%2584-%25EC%259E%2585%25EB%25A0%25A5%25ED%2595%25B4%25EC%25A3%25BC%25EC%2584%25B8%25EC%259A%2594_-001%2520%281%29.png%22" alt="Fifth slide">
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
					</div>
				</div>
			</div>
			<div class="col-10">
			<div class="row">
				
					<!-- style="min-height: 800px; width: 100%; height: 50%; padding-top: 10%; paading-right: 10%; padding-left: 10%;"> -->


					<div class="col-md-6" style="width: 10%; padding-right: 30px;">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title" style="color: #f3969a">
									<b>전체 인기 게시글</b>
								</h4>
								<!-- Nav tabs -->
								<div class="custom-tab-1">
<!-- 									<ul class="nav nav-tabs mb-3">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#home1">카테고리1</a></li>
									</ul> -->
									<div class="tab-content">
										<div class="tab-pane fade show active" id="home1"
											role="tabpanel">
											<div class="p-t-15">
												<h4>This is home title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<h4>This is home title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
											</div>
										</div>
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

					<div class="col-md-6" id="innerDiv" style="width: 40%">
						<div class="card">
							<div class="card-body">
								<h4 class="card-title" style="color: #f3969a">
									<b>카테고리별 인기 게시글</b>
								</h4>
								<!-- Nav tabs -->
								<div class="custom-tab-1">
									<ul class="nav nav-tabs mb-3">
										<li class="nav-item"><a class="nav-link active"
											data-toggle="tab" href="#home1">카테고리1</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#profile1">카테고리2</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#contact1">카테고리3</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#message1">카테고리4</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#message1">카테고리5</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#message1">카테고리6</a></li>
										<li class="nav-item"><a class="nav-link"
											data-toggle="tab" href="#message1">카테고리7</a></li>

									</ul>
									<div class="tab-content">
										<div class="tab-pane fade show active" id="home1"
											role="tabpanel">
											<div class="p-t-15">
												<h4>This is home title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<h4>This is home title</h4>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
												<p>Far far away, behind the word mountains, far from the
													countries Vokalia and Consonantia, there live the blind
													texts. Separated they live in Bookmarksgrove.</p>
											</div>
										</div>
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
				<div>
			</div>
		</div>
	</div>
	</div>
</div>

</div>



	<!-- #/ container -->
	<!--**********************************
            Content body end 
        ***********************************-->


	<!--**********************************
            Footer start
        ***********************************-->
	<%@ include file="./views/common/footer.jsp"%>
	<!--**********************************
            Footer end
        ***********************************-->

	<!--**********************************
        Main wrapper end
    ***********************************-->


</body>

</html>