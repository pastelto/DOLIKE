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
	<title>DO LIKE - 아이디찾기</title>
	<style>
	#findUserIdBtn {
		color: #fff;
	}
	
	#findUserIdBtn:hover {
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
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
			                                <a class="text-center"> <h2>아이디찾기</h2></a>
			                                <form id="findForm" class="mt-5 mb-5 login-input" action="<%= request.getContextPath() %>/findUserId.me" method="post" onsubmit="return findUserIdValidate();">
			                                    <div class="form-group">
			                                        <input id="userName" name="userName" type="text" class="form-control" placeholder="성명">
			                                    </div>
			                                    <div class="form-group">
			                                        <input id="phone" name="phone" type="text" class="form-control" placeholder="전화번호 (-)없이 입력">
			                                    </div>
			                                    <button id="findUserIdBtn" class="btn login-form__btn submit w-100" type="submit">아이디찾기</button>
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
	    
	    <script>
			function findUserIdValidate(){
				if($("#userName").val().trim().length == 0){
					swal.fire({
						text: '성명을 입력하세요.',
						icon: 'warning',
						confirmButtonColor: "#78c2ad"
					});
					$("#userName").focus();
					return false;
				}
				if($("#phone").val().trim().length == 0){
					swal.fire({
						text: '전화번호를 입력하세요.',
						icon: 'warning',
						confirmButtonColor: "#78c2ad"
					});
					$("#phone").focus();
					return false;
				}
				
				return true;
			}
		</script>
	</div>
	<%@ include file="../common/footer.jsp" %>
</body>
</html>