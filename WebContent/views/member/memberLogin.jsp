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
	<title>DO LIKE - 로그인</title>
	<style>
	#loginBtn1 {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#loginBtn1:hover {
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#loginTitle {
		color: #ffce67;
		font-family: 'Lobster', cursive;
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
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
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
		                <li class="breadcrumb-item">메인</li>
		                <li class="breadcrumb-item active">로그인</li>
		            </ol>
		        </div>
		    </div>
		
		    <div class="container-fluid">
			    <div class="login-form-bg h-100">
			        <div class="container h-100">
			            <div class="row justify-content-center h-100">
			                <div class="col-xl-6">
			                    <div class="form-input-content">
			                        <div class="card login-form mb-0 mt-5">
			                            <div class="card-body pt-5">
			                                <a class="text-center"> <h2 id="loginTitle">Login</h2></a>
			                                <form class="mt-5 mb-5 login-input" action="<%= request.getContextPath() %>/login.me" method="post" onsubmit="return loginValidate();">
			                                    <div class="form-group">
			                                        <input id="userId" name="userId" type="text" class="form-control" placeholder="아이디">
			                                    </div>
			                                    <div class="form-group">
			                                        <input id="userPwd" name="userPwd" type="password" class="form-control" placeholder="비밀번호">
			                                    </div>
			                                    <button id="loginBtn1" class="btn login-form__btn submit w-100" type="submit">로그인</button>
			                                </form>
			                                <p class="mt-5 login-form__footer" style="text-align: center;">계정이 없으신가요? <a href="<%= request.getContextPath()%>/enrollForm.me" class="text-primary"> 회원가입</a> 하러가기</p>
			                                <p class="mt-2 login-form__footer" style="text-align: center;">로그인이 안되시나요? <a href="<%= request.getContextPath()%>/read.no?nno=3" class="text-primary"> 공지사항</a> 보러가기</p>
			                            	<p class="mt-5 login-form__footer" style="text-align: center;"><a href="<%= request.getContextPath()%>/findUserIdForm.me" class="text-primary">아이디찾기</a> /
			                            	<a href="<%= request.getContextPath()%>/findPwdForm.me" class="text-primary">비밀번호찾기</a></p>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		    </div>
	    </div>
	
		<script>
			function loginValidate(){
				if($("#userId").val().trim().length == 0){
					swal.fire({
						text: '아이디를 입력하세요.',
						icon: 'warning',
						confirmButtonColor: "#78c2ad"
					});
					$("#userId").focus();
					return false;
				}
				if($("#userPwd").val().trim().length == 0){
					swal.fire({
						text: '비밀번호를 입력하세요.',
						icon: 'warning',
						confirmButtonColor: "#78c2ad"
					});
					$("#userPwd").focus();
					return false;
				}
				
				return true;
			}
		
		</script>
	</div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>