<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String message = (String)request.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>오류페이지</title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	
	<link href="https://fonts.googleapis.com/css2?family=Chakra+Petch:wght@300&family=Lobster&display=swap&family=Gowun+Dodum&display=swap" rel="stylesheet">
	
	<style>
	#errorTitle {
		color: #ffce67;
		font-family: 'Lobster', cursive;
	}
	
	#goMain {
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#goMain:hover {
		color: #fff;
		background-color: #f3969a;
		border-color: #f3969a;
	}
	
	#badMessage, #detailMessage {
		font-family: 'Gowun Dodum', sans-serif;
	}
	
	#footMessage {
		font-family: 'Chakra Petch', sans-serif;
	}
	
	</style>
</head>
<body>
	<!--*******************
        Preloader start
    ********************-->
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10"/>
            </svg>
        </div>
    </div>
    <!--*******************
        Preloader end
    ********************-->
    
	<!--**********************************
        Main wrapper start
    ***********************************-->
	<div id="main-wrapper">
    <%@ include file="../common/menuSideBar.jsp" %> 
    
       <!--**********************************
           Content body start
       ***********************************-->
       <div class="content-body">
           <div class="row page-titles mx-0">
               <div class="col p-md-0">
                   <ol class="breadcrumb">
                       <li class="breadcrumb-item"></li>
                       <li class="breadcrumb-item active">오류페이지</li>
                   </ol>
               </div>
           </div>
           
	        <div class="container-fluid"> 
		        <div class="login-form-bg h-100">
			        <div class="container h-100">
			            <div class="row justify-content-center h-100">
			                <div class="col-xl-6">
			                    <div class="error-content">
			                        <div class="card mb-0">
			                            <div class="card-body text-center pt-5">
			                                <h3 class="error-text" id="errorTitle"><b>ERROR</b></h3>
			                                <h4 class="mt-4" id="badMessage"><i class="fa fa-thumbs-down text-danger"></i> 잘못된 접근입니다</h4>
			                                <p id="detailMessage"><%= message %></p>
			                                <form class="mt-5 mb-5">
			                                    <div class="text-center mb-4 mt-4">
			                                    	<a href="<%=request.getContextPath()%>/index2.jsp" class="btn btn-primary" id="goMain">메인으로</a>
			                                    </div>
			                                </form>
			                                <div class="text-center" id="footMessage">
			                                    <p>© TEAM DOLIKE 2021</p>
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
	<%@ include file = "../common/footer.jsp" %>
	
</body>
</html>