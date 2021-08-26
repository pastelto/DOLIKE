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
	#idCheckBtn, #nickCheckBtn, #phoneCheckBtn, #emailCheckBtn, #joinBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#goMain, #resetBtn {
		color: #000000;
		background-color: #fff;
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
        <div class="content-body" style="height:1200px">
            <!-- row -->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-validation">
									<%-- <form id="enrollForm" action="<%=request.getContextPath() %>/memberInsert.me" method="post"> --%>
									<form id="enrollForm" action="<%=request.getContextPath() %>/memberInsert.me" method="post" onsubmit="return joinValidate();">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userId">아이디 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요." required>
                                                <button type="button" class="btn btn-primary" id="idCheckBtn" onclick="checkId();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userPwd">비밀번호 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요." required>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="checkPwd">비밀번호 확인 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호를 한 번 더 입력하세요." required>
                                            	<label id = "pwdResult"></label>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userName">이름 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userName" name="userName" placeholder="실명을 입력하세요." required/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임을 입력하세요." required>
                                            	<button type="button" class="btn btn-primary" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="date" class="form-control" id="birthDate" name="birthDate" placeholder="생년월일을 입력하세요." required/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="phone" name="phone" placeholder="전화번호를 입력하세요." required/>
                                                <button type="button" class="btn btn-primary" id="phoneCheckBtn" onclick="checkPhone();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요." required/>
                                                <button type="button" class="btn btn-primary" id="emailCheckBtn" onclick="checkEmail();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="interests">관심사 <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
		                                        <div class="form-group">
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="공부" required>공부</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="건강">건강</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="여행">여행</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="요리">요리</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="동물">동물</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="패션뷰티">패션뷰티</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="기타">기타</label>
		                                            </div>
		                                        </div>
	                                        </div>
                                        </div>
	                                    <div class="form-group row">
	                                        <div class="col-lg-8 ml-auto">
	                                        	<input type="button" class="btn btn-primary" id="goMain" onclick="history.go(-1)" value="돌아가기"/>
	                                            <input type="reset" class="btn btn-primary" id="resetBtn" value="다시 입력"/>
	                                            <button type="submit" class="btn btn-primary" id="joinBtn" value="회원가입" disabled>회원가입</button>
<!-- 				                            <input type="submit" class="btn btn-primary" id="joinBtn" value="회원가입" disabled /> -->
	                                        </div>
	                                    </div>
                                    </form>
                                    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #/ container -->
        
    <script>
/* 	
 	function joinValidate(){
		//아이디
 		if(!(/^[a-z][a-z\d]{4,10}$/i.test($("#enrollForm input[name=userId]").val()))){
			alert("아이디는 숫자, 영어소문자 조합으로 4~10자리로 입력하세요.");
 			$("#enrollForm input[name=userId]").focus();
	        return false;
		}
		
		//비밀번호
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#pwdResult").text("비밀번호 불일치").css("color", "red");
			return false;			
		}
 		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test($("#enrollForm input[name=userId]").val()))){
			alert("비밀번호는 숫자, 영문자, 특수문자 조합으로 8자리 이상 사용해야 합니다.");
 			$("#enrollForm input[name=userPwd]").focus();
	        return false;
		}
		
		//닉네임
		if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
			alert("닉네임은 한글로 2자 이상 사용해야 합니다.");
			$("#enrollForm input[name=userName]").focus();
	        return false;
		 }
		 
		//전화번호
		 if(!(/^\d{3}-\d{3,4}-\d{4}$/.test($("#enrollForm input[name=phone]").val()))){
			alert("전화번호는 (-)를 포함하여 입력해주세요.");
			 $("#enrollForm input[name=phone]").focus();
	        return false;
		 }
		 
		 //이메일
		 if(!(/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/.test($("#enrollForm input[name=email]").val()))){
			alert("올바른 이메일 형식이 아닙니다.");
			 $("#enrollForm input[name=email]").focus();
	        return false;
		 }
		 
		 return true;
		 
		
	} 
	 */
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
						$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
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
					nickName.focus();
				}else{
					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
						nickName.attr("readonly","true");
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
				} else{
					if(confirm("사용가능한 전화번호입니다. 등록하시겠습니까?")){
						userId.attr("readonly","true");
					}else{
						userId.focus();
					}
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
				} else{
					if(confirm("사용가능한 이메일입니다. 등록하시겠습니까?")){
						userId.attr("readonly","true");
					}else{
						userId.focus();
					}
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