<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    
<!--     Custom Stylesheet
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<link href="./css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	 -->
	
	<title>로그인</title>
	<script>
		$(function(){
			if(msg != "null"){
				alert(msg);
				<%session.removeAttribute("msg");%>
			}
		})
		function loginValidate(){
			if($("#userId").val().trim().length == 0){
				alert("아이디를 입력하세요.");
				$("#userId").focus();
				return false;
			}
			if($("#userPwd").val().trim().length == 0){
				alert("비밀번호를 입력하세요.");
				$("#userPwd").focus();
				return false;
			}
			
			return true;
		}
	
	</script>
</head>

<body class="h-100">
	<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
    
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

    
    <div class="login-form-bg h-100">
        <div class="container h-100">
            <div class="row justify-content-center h-100">
                <div class="col-xl-6">
                    <div class="form-input-content">
                        <div class="card login-form mb-0">
                            <div class="card-body pt-5">
                                <a class="text-center"> <h4>로그인</h4></a>
                                <form class="mt-5 mb-5 login-input" action="<%= request.getContextPath() %>/login.me" method="post" onsubmit="return loginValidate();">
                                    <div class="form-group">
                                        <input id="userId" name="userId" type="text" class="form-control" placeholder="아이디">
                                    </div>
                                    <div class="form-group">
                                        <input id="userPwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호">
                                    </div>
                                    <button class="btn login-form__btn submit w-100" type="submit">로그인</button>
                                </form>
                                <p class="mt-5 login-form__footer">계정이 없으신가요? <a href="<%= request.getContextPath()%>/enrollForm.me" class="text-primary">회원가입</a> 하러가기</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
	</div>


    <!--**********************************
        Scripts
    ***********************************-->
    <script src="plugins/common/common.min.js"></script>
    <script src="js/custom.min.js"></script>
    <script src="js/settings.js"></script>
    <script src="js/gleek.js"></script>
    <script src="js/styleSwitcher.js"></script>
</body>
</html>