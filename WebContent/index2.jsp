<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Pignose Calender -->
    <link href="./plugins/pg-calendar/css/pignose.calendar.min.css" rel="stylesheet">
    <!-- Chartist -->
    <link rel="stylesheet" href="./plugins/chartist/css/chartist.min.css">
    <link rel="stylesheet" href="./plugins/chartist-plugin-tooltips/css/chartist-plugin-tooltip.css">
</head>
<style>
	.carousel-control-prev, .carousel-control-next{

	}
	
	.carousel-inner{
		height: 15rem;
	}
	
	.card-body {
	  flex: 0 0 auto;
	  padding: 1rem; 
	  border: none;
	  }
	
	.carousel-inner{
		width: 10rem;
    	height: 15rem;
	}
/* 	
	.carousel-inner {
  	height: 382px;
  	width: 162px; } */
  	
	
	  .card-action a {
    display: inline-block;
    color: #fff;
    border-radius: 50%;
    border: none; }
</style>
<body>

    <!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
       	<%@ include file="../views/common/menuSideBar.jsp" %>
        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body" style="min-height: 2000px;">

				
     	<div class="topList" align="center">
		<br>

		<div id="thumbList">
		<div class="col-lg-6 col-md-6">
             <div class="card" style="width: 1000px; color: #fff;">
                <div class="card-body" style="color: white;">
                       <div style="width: 800px;">
                        <div id="carouselExampleControls"  style="height: 230px; width: 800px;" class="carousel slide" data-ride="carousel">
                         <div class="carousel-inner">
                            <div class="carousel-item active">
                                    <img class="d-block w-100 banner" style="height: 230px; width: 160px;" name="banner" src="resources/images/bannerAnimal-001.png" alt=" ">
                             </div>
                              <div class="carousel-item">
                                     <img class="d-block w-100 banner" style="height: 230px; width: 160px;" name="banner" src="resources/images/bannerAnimal-002.png" alt=" ">
                              </div>
                               <div class="carousel-item">
                                     <img class="d-block w-100 banner" style="height: 230px; width: 160px;" name="banner" src="resources/images/run.png" alt=" ">
                               </div>
                               </div><a class="carousel-control-prev" href="#carouselExampleControls" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span> </a><a class="carousel-control-next" href="#carouselExampleControls"
                                 data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

		</div>

		</div>
	
            <!-- #/ container -->
        </div>
        <!--**********************************
            Content body end 
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
		<%@ include file="./views/common/footer.jsp" %>
        <!--**********************************
            Footer end
        ***********************************-->
</div>
    <!--**********************************
        Main wrapper end
    ***********************************-->


</body>

</html>