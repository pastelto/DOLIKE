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
	<title>회원가입</title>
	<style>
	#idCheckBtn, #nickCheckBtn, #phoneCheckBtn, #emailCheckBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
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
            <!-- row -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
									<form id="enrollForm" action="<%=request.getContextPath() %>/memberInsert.me" method="post" onsubmit="return joinValidate();">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userId">아이디 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요.">
                                                <button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userPwd">비밀번호 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="checkPwd">비밀번호 확인 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호를 한 번 더 입력하세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userName">이름 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userName" name="userName" placeholder="실명을 입력하세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임을 입력하세요."></textarea>
                                            	<button type="button" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="date" class="form-control" id="birthDate" name="birthDate" placeholder="생년월일을 입력하세요."></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요."></textarea>
                                                <button type="button" id="phoneCheckBtn" onclick="checkPhone();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요."></textarea>
                                                <button type="button" id="emailCheckBtn" onclick="checkEmail();">중복확인</button>
                                            </div>
                                        </div>
                                        
                                        <div class="col-lg-12">
				                        <div class="card">
				                            <div class="card-body">
				                                <h4 class="card-title">관심사</h4>
				                                <div class="basic-form">
				                                    <form>
				                                        <div class="form-group">
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">공부</label>
				                                            </div>
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">건강</label>
				                                            </div>
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">여행</label>
				                                            </div>
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">요리</label>
				                                            </div>
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">동물</label>
				                                            </div>
				                                            <div class="form-check mb-3">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">패션뷰티</label>
				                                            </div>
				                                            <div class="form-check disabled">
				                                                <label class="form-check-label">
				                                                    <input type="checkbox" class="form-check-input" value="">기타</label>
				                                            </div>
				                                        </div>
				                                    </form>
				                                </div>
				                            </div>
				                        </div>
				                    </div>
                                        
                                        
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                            <button type="submit" class="btn btn-primary" id="joinBtn" disabled>회원가입</button>
                                        </div>
                                    </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        </div>
        
    <script>
	
	function joinValidate(){
		
		if(!(/^[a-z][a-z\d]{3,11}$/i.test($("#enrollForm input[name=userId]").val()))){
			$("#enrollForm input[name=userId]").focus();
	        return false;
		}
		
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;			
		}
		
		 if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
			 $("#enrollForm input[name=userName]").focus();
	        return false;
		 }
		 
		 return true;
		
		
	}
	
	function checkId(){
		var userId = $("#enrollForm input[name=userId]");
		if(userId.val() == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"idCheck.me",
			type:"post",
			data:{userId:userId.val()},
			success:function(result){
				if(result == "fail"){
					alert("사용할 수 없는 아이디입니다.");
					userId.focus();
				}else{
					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
						userId.attr("readonly","true");
						//$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
					}else{
						userId.focus();
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
	function checkNick(){
		var nickName = $("#enrollForm input[name=nickName]");
		if(nickName.val() == ""){
			alert("닉네임을 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"nickCheck.me",
			type:"post",
			data:{nickName:nickName.val()},
			success:function(result){
				if(result == "fail"){
					alert("이미 사용 중인 닉네임입니다.");
					userId.focus();
				}else{
					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
						nickName.attr("readonly","true");
						$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
					}else{
						nickName.focus();
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
	function checkPhone(){
		var phone = $("#enrollForm input[name=phone]");
		if(phone.val() == ""){
			alert("전화번호를 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"phoneCheck.me",
			type:"post",
			data:{phone:phone.val()},
			success:function(result){
				if(result == "fail"){
					alert("이미 가입된 전화번호입니다.");
					phone.focus();
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
	function checkEmail(){
		var email = $("#enrollForm input[name=email]");
		if(email.val() == ""){
			alert("이메일을 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"emailCheck.me",
			type:"post",
			data:{email:email.val()},
			success:function(result){
				if(result == "fail"){
					alert("이미 가입된 이메일입니다.");
					email.focus();
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}

	
	</script>
        <!--**********************************
            Content body end
        ***********************************-->
        
        
        <!--**********************************
            Footer start
        ***********************************-->
	<%@ include file="../common/footer.jsp"%>
        <!--**********************************
            Footer end
        ***********************************-->
    </div>
    <!--**********************************
        Main wrapper end
    ***********************************-->

    <!--**********************************
        Scripts
    ***********************************-->
    <script src="./plugins/validation/jquery.validate.min.js"></script>
    <script src="./plugins/validation/jquery.validate-init.js"></script>

</body>
</html>