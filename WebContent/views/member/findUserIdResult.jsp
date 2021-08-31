<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	<title>DO LIKE - 아이디찾기 결과</title>
	<style>
	#goBackBtn {
		color: #fff;
	}
	
	#goBackBtn:hover {
		color: #fff;
    	background-color: #000000;
    	border-color: #000000;
	}
	</style>
</head>
<body>
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
	<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
		<div class="content-body">
		    <div class="row page-titles mx-0">
		    	<div class="col p-md-0">
		            <ol class="breadcrumb">
		                <li class="breadcrumb-item">메인</li>
		                <li class="breadcrumb-item active">로그인</li>
		                <li class="breadcrumb-item active">아이디찾기</li>
		                <li class="breadcrumb-item active">아이디찾기 결과</li>
		            </ol>
		        </div>
		    </div>
		
		    <div class="container-fluid">
			    <div class="login-form-bg h-100">
			        <div class="container h-100">
			            <div class="row justify-content-center h-100">
			                <div class="col-xl-6">
			                    <div class="form-input-content">
			                        <div class="card login-form mb-0 mt-3">
			                            <div class="card-body pt-5">
			                                <a class="text-center"> <h2>아이디 찾기 결과</h2></a>
			                                <form class="mt-5 mb-5 login-input" action="<%= request.getContextPath() %>/loginForm.me" method="post">
			                                    <div class="form-group">
			                                        <input class="form-control" type="text" value="<%= userId %>" style="text-align: center;" readonly>
			                                    </div>
			                                    <button id="goBackBtn" class="btn login-form__btn submit w-100" type="submit">돌아가기</button>
			                                </form>
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
    <%@ include file="../common/footer.jsp" %>

</body>
</html>