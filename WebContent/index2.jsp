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
		<h2>인기글</h2>

		<div id="thumbList">


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

    
    <!--**********************************
         인기글 Scripts
    ***********************************  -->
	    <script src="./plugins/sweetalert/js/sweetalert.min.js"></script>
    	<script src="./plugins/sweetalert/js/sweetalert.init.js"></script>

</body>

</html>