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
<link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
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



		<div class="topList" align="center">
			<br>

			<div id="thumbList" style="height: 10%; padding-left: 15%; padding-right: 5%">
				<div class="card" style="width: 80%;">
					<!--                             <div class="card-body"> -->

					<div class="bootstrap-carousel" style="height: 5rem;">
						<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
							</ol>
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img class="d-block w-100" style="width: 10%; height: 15rem;" src="resources/images/bannerAnimal-001.png" alt="First slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" style="width: 10%; height: 15rem;" src="resources/images/bannerAnimal-002.png" alt="Second slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" style="width: 10%; height: 15rem;" src="resources/images/run.png" alt="Third slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" style="width: 10%; height: 15rem;" src="resources/images/water.png" alt="Fourth slide">
								</div>
								<div class="carousel-item">
									<img class="d-block w-100" style="width: 10%; height: 15rem;" src="resources/images/vegan.png" alt="Fifth slide">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" data-slide="prev"><span
								class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span>
							</a><a class="carousel-control-next"
								href="#carouselExampleIndicators" data-slide="next"><span
								class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
						</div>
					</div>
				</div>
			</div>
		<div class="content-body" style="min-height: 1000px; width: 65%; height: 80%; padding-top: 10%; paading-right: 10%; padding-left:1%;"  >

		              <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <h4 class="card-title" style="color: #f3969a"><b>카테고리별 인기 게시글</b></h4>
                                <!-- Nav tabs -->
                                <div class="custom-tab-1">
                                    <ul class="nav nav-tabs mb-3">
                                        <li class="nav-item"><a class="nav-link active" data-toggle="tab" href="#home1">카테고리1</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#profile1">카테고리2</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#contact1">카테고리3</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#message1">카테고리4</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#message1">카테고리5</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#message1">카테고리6</a>
                                        </li>
                                        <li class="nav-item"><a class="nav-link" data-toggle="tab" href="#message1">카테고리7</a>
                                        </li>
                                        
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade show active" id="home1" role="tabpanel">
                                            <div class="p-t-15">
                                                <h4>This is home title</h4>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                            <h4>This is home title</h4>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="profile1">
                                            <div class="p-t-15">
                                                <h4>This is profile title</h4>
                                                <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.</p>
                                                <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="contact1">
                                            <div class="p-t-15">
                                                <h4>This is contact title</h4>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                                <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in Bookmarksgrove.</p>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="message1">
                                            <div class="p-t-15">
                                                <h4>This is message title</h4>
                                                <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.</p>
                                                <p>Raw denim you probably haven't heard of them jean shorts Austin. Nesciunt tofu stumptown aliqua, retro synth master cleanse. Mustache cliche tempor.</p>
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