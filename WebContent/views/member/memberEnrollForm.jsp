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
	
	#goMain:hover, #resetBtn:hover, #idCheckBtn:hover, #nickCheckBtn:hover, #phoneCheckBtn:hover, #emailCheckBtn:hover {
		color: #fff;
		background-color: #f3969a;
		border-color: #f3969a;
	}
	
	#userId, #userPwd, #checkPwd, #userName, #nickName, #birthDate, #phone, #email {
		width: 350px;
	}
	
	.checkFont {
		margin-left: 300px;
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
									<form id="enrollForm" action="<%=request.getContextPath() %>/memberInsert.me" method="post" onsubmit="return joinValidate();">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userId">아이디 <span class="text-danger">*</span></label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디를 입력하세요." required>
                                            </div>
                                            <div class="form-inline">
                                                <button type="button" class="btn btn-primary" id="idCheckBtn" onclick="checkId();">중복확인</button>
                                            </div>
                                            <div class="checkFont" id="idCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userPwd">비밀번호 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요." required>
                                            </div>
                                            <div class="checkFont" id="pwdCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="checkPwd">비밀번호 확인 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호를 한 번 더 입력하세요." required>
                                            </div>
											<div class="checkFont" id="pwdCkCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userName">이름 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="userName" name="userName" placeholder="실명을 입력하세요." required/>
                                            </div>
                                            <div class="checkFont" id="nameCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임을 입력하세요." required>
                                            	<button type="button" class="btn btn-primary" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                            <div class="checkFont" id="nickCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="date" class="form-control" id="birthDate" name="birthDate" placeholder="생년월일을 입력하세요." required/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="phone" name="phone" placeholder="(-)없이 입력하세요.   ex) 01011112222" required/>
                                                <button type="button" class="btn btn-primary" id="phoneCheckBtn" onclick="checkPhone();">중복확인</button>
                                            </div>
                                            <div class="checkFont" id="phoneCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 <span class="text-danger">*</span>
                                            </label>
                                            <div class="form-inline">
                                                <input type="email" class="form-control" id="email" name="email" placeholder="이메일을 입력하세요.   ex)abc@dolike.com" required/>
                                                <button type="button" class="btn btn-primary" id="emailCheckBtn" onclick="checkEmail();">중복확인</button>
                                            </div>
                                            <div class="checkFont" id="emailCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="interests1">관심사1 <span class="text-danger">*</span></label>
<!--                                             <div class="col-lg-6"> -->
                                            <div class="form-inline">
		                                        <div class="form-group">
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="공부" required>공부</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="건강">건강</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="여행">여행</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="요리">요리</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="동물">동물</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="패션뷰티">패션뷰티</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests1" value="기타">기타</label>
		                                            </div>
		                                        </div>
	                                        </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="interests2">관심사2 <span class="text-danger">*</span></label>
<!--                                             <div class="col-lg-6"> -->
                                            <div class="form-inline">
		                                        <div class="form-group">
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="공부" required>공부</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="건강">건강</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="여행">여행</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="요리">요리</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="동물">동물</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="패션뷰티">패션뷰티</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests2" value="기타">기타</label>
		                                            </div>
		                                        </div>
	                                        </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="interests3">관심사3 <span class="text-danger">*</span></label>
<!--                                             <div class="col-lg-6"> -->
                                            <div class="form-inline">
		                                        <div class="form-group">
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="공부" required>공부</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="건강">건강</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="여행">여행</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="요리">요리</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="동물">동물</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="패션뷰티">패션뷰티</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests3" value="기타">기타</label>
		                                            </div>
		                                        </div>
	                                        </div>
                                        </div>
	                                    <div class="form-group row">
	                                        <div class="col-lg-8 ml-auto">
	                                        	<input type="button" class="btn btn-primary" id="goMain" onclick="history.go(-1)" value="돌아가기"/>
	                                            <input type="reset" class="btn btn-primary" id="resetBtn" value="다시 입력" onclick="readAttrReset();"/>
	                                            <button type="submit" class="btn btn-primary" id="joinBtn" value="회원가입" disabled>회원가입</button>
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
    <!--**********************************
        Main wrapper end
    ***********************************-->
            <!-- #/ container -->
        
    <script>
  	//==============================================
  	// 유효성 검사 정규표현식
  	//==============================================
	//모든 공백 체크 정규식
	var empReg = /\s/g;
	// 아이디 정규식
	var idReg = /^[a-z0-9]{4,10}$/;
	// 비밀번호 정규식
	var pwReg = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{4,12}$/; 
	// 이름 정규식
	var nameReg = /^[가-힣]{2,8}$/;
	// 닉네임 정규식
	var nickReg = /^[가-힣a-zA-Z0-9]{3,12}$/;
	// 연락처 정규식
	var phoneReg = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	// 이메일 정규식
	var emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	
	//==============================================
	// 회원가입 양식 입력시 focus 잃었을 때, 빨간 글자로 유효성 검사
	//==============================================
	// 아이디 체크
	$("#userId").blur(function() {
		if (idReg.test($(this).val())) {
			console.log(idReg.test($(this).val()));
			$("#idCheck").text('');
			
		} else {
			$('#idCheck').text('영어소문자, 숫자 조합으로 4~10자리 입력');
			$('#idCheck').css('color', 'red');
		}
	});
	
	// 비밀번호 체크
	$("#userPwd").blur(function() {
		if (pwReg.test($(this).val())) {
			console.log(pwReg.test($(this).val()));
			$("#pwdCheck").text('');
		} else {
			$('#pwdCheck').text('특수문자를 반드시 포함하여 숫자, 영문자 조합으로 8자리 이상 입력');
			$('#pwdCheck').css('color', 'red');
		}
	});
	
	// 비밀번호 확인 체크
	$("#checkPwd").blur(function() {
		if ($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()) {
			$("#pwdCkCheck").text('비밀번호 불일치').css('color', 'red');
		} else {
			$("#pwdCkCheck").text('');
		}
	});
	
	// 이름 체크
	$("#userName").blur(function() {
		if (nameReg.test($(this).val())) {
			console.log(nameReg.test($(this).val()));
			$("#nameCheck").text('');
		} else {
			$('#nameCheck').text('한글로 2~8자리 입력');
			$('#nameCheck').css('color', 'red');
		}
	});
	
	// 닉네임 체크
	$("#nickName").blur(function() {
		if (nickReg.test($(this).val())) {
			console.log(nickReg.test($(this).val()));
			$("#nickCheck").text('');
		} else {
			$('#nickCheck').text('한글, 영어, 숫자 사용하여 2~12자리 입력');
			$('#nickCheck').css('color', 'red');
		}
	});
	
	// 연락처 체크
	$('#phone').blur(function(){
		if(phoneReg.test($(this).val())){
			console.log(phoneReg.test($(this).val()));
			$("#phoneCheck").text('');
		} else {
			$('#phoneCheck').text('(-)없이 입력');
			$('#phoneCheck').css('color', 'red');
		}
	});
	
	//이메일 체크
	$('#email').blur(function(){
		if(emailReg.test($(this).val())){
			console.log(emailReg.test($(this).val()));
			$("#emailCheck").text('');
		} else {
			$('#emailCheck').text('이메일 형식을 확인해주세요');
			$('#emailCheck').css('color', 'red');
		}
	});

	
	//==============================================
	//회원가입버튼 클릭시 팝업으로 재검증
	//==============================================
   	function joinValidate(){
 		//아이디
 		if(!(/^[a-z0-9]{4,10}$/.test($("#enrollForm input[name=userId]").val()))){
			alert("아이디는 숫자, 영어소문자 조합으로 4~10자리로 입력하세요.");
 			$("#enrollForm input[name=userId]").focus();
	        return false;
		}

 		//비밀번호
		if(!(/^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{4,12}$/.test($("#enrollForm input[name=userPwd]").val()))){
			alert("비밀번호는 특수문자를 반드시 포함하여 숫자, 영문자 조합으로 8자리 이상 입력");
 			$("#enrollForm input[name=userPwd]").focus();
	        return false;
		} 
		
		//비밀번호 확인
		if($("#enrollForm input[name=userPwd]").val() != $("#enrollForm input[name=checkPwd]").val()){
			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
			$("#enrollForm input[name=checkPwd]").focus();
			return false;			
		}
		
		//이름
		if(!(/^[가-힣]{2,8}$/.test($("#enrollForm input[name=userName]").val()))){
			alert("닉네임은 한글로 2자리 이상 입력해야 합니다.");
			$("#enrollForm input[name=userName]").focus();
	        return false;
		 }
		
		//닉네임
		if(!(/^[가-힣a-zA-Z0-9]{3,12}$/.test($("#enrollForm input[name=nickName]").val()))){
			alert("닉네임은 한글, 영어, 숫자 사용하여 3~12자리 입력");
			$("#enrollForm input[name=nickName]").focus();
	        return false;
		 }
		 
		//전화번호
		 if(!(/^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/.test($("#enrollForm input[name=phone]").val()))){
			alert("전화번호는 (-)없이 입력해주세요.");
			$("#enrollForm input[name=phone]").focus();
	        return false;
		 }
		 
		 //이메일
		 if(!(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i.test($("#enrollForm input[name=email]").val()))){
			alert("올바른 이메일 형식이 아닙니다.");
			$("#enrollForm input[name=email]").focus();
	        return false;
		 }
		 
		 return true;
	}  

  	//==============================================
	//중복확인
	//==============================================
	//아이디 중복확인
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
					var check = confirm("사용가능한 아이디입니다. 사용하시겠습니까?");
					if(check == true){
						userId.attr("readonly","true");
						$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화
					}else{
						userId.focus();
						userId.attr("readonly", false);
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}

  	//닉네임 중복확인
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
					var check = confirm("사용가능한 닉네임입니다. 사용하시겠습니까?");
					if(check == true){
						nickName.attr("readonly","true");
					}else{
						nickName.focus();
						nickName.attr("readonly", false);
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
  	//연락처 중복확인
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
					var check = confirm("사용가능한 전화번호입니다. 등록하시겠습니까?");
					if(check == true){
						phone.attr("readonly","true");
					}else{
						phone.focus();
						phone.attr("readonly", false);
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
  	//이메일 중복확인
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
					var check = confirm("사용가능한 이메일입니다. 등록하시겠습니까?");
					if(check == true){
						email.attr("readonly","true");
					}else{
						email.focus();
						email.attr("readonly", false);
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
  	
  	
	//==============================================
  	// readonly reset
  	//==============================================
  	function readAttrReset() {
  		var userId = $("#enrollForm input[name=userId]");
  		var nickName = $("#enrollForm input[name=nickName]");
  		var phone = $("#enrollForm input[name=phone]");
  		var email = $("#enrollForm input[name=email]");
  		
  		userId.attr("readonly", false);
  		nickName.attr("readonly", false);
  		phone.attr("readonly", false);
  		email.attr("readonly", false);
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


    <!--**********************************
        Scripts
    ***********************************-->
    <script src="./plugins/validation/jquery.validate.min.js"></script>
    <script src="./plugins/validation/jquery.validate-init.js"></script>

</body>
</html>