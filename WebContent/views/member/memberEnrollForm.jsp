<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    
	<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	<title>회원가입</title>
<<<<<<< HEAD

	<style>
		.outer{
			background:black;
			width:600px;
			height:500px;
			margin-top:50px;
			margin-left:auto;
			margin-right:auto;
			color:white;
		}
		#enrollForm{
			/* border:1px solid white; */
			width:100%;
			margin-left:auto;
			margin-right:auto;
=======
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
	    <div class="row page-titles mx-0">
	         <div class="col p-md-0">
	             <ol class="breadcrumb">
	                 <li class="breadcrumb-item">메인</li>
	                 <li class="breadcrumb-item active">회원가입</li>
	             </ol>
	         </div>
	     </div>
        
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
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
		}
		#enrollForm td:nth-child(1){text-align:right;}
		#enrollForm input{margin:3px;}
		
<<<<<<< HEAD
		#joinBtn{background:yellowgreen;}
		#goMain{background:orangered;}
	</style>
</head>
<body>
	<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %>

	<div class="outer">
		<br>
		
		<h2 align="center">회원가입</h2>
		
		<form id="enrollForm" action="<%=request.getContextPath() %>/memberInsert.me" method="post" onsubmit="return joinValidate();">
			<table>
				<tr>
					<td width="200px">아이디</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
					<td width="200px">
						<button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" maxlength="15" name="userPwd" required></td>
					<td></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td><input type="password" maxlength="15" name="checkPwd" required></td>
					<td><label id = "pwdResult"></label></td>
				</tr>	
				<tr>
					<td>이름</td>
					<td><input type="text" maxlength="13" name="userName" required></td>
					<td></td>
				</tr>
				<tr>
					<td width="200px">닉네임</td>
					<td><input type="text" maxlength="13" name="nickName" required></td>
					<td width="200px">
						<button type="button" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" maxlength="15" name="birthDate" required></td>
					<td></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="tel" maxlength="11" name="phone" placeholder="(-없이)01012345678"></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email"></td>
					<td></td>
				</tr>
				<tr>
					<td>관심사</td>
					<td>
						<input type="checkbox" id="study" name="interest" value="공부">
						<label for="study">공부</label>
						
						<input type="checkbox" id="health" name="interest" value="건강">
						<label for="health">건강</label>
						
						<input type="checkbox" id="trip" name="interest" value="여행">
						<label for="trip">여행</label>
						
						<input type="checkbox" id="cooking" name="interest" value="요리">
						<label for="cooking">요리</label>
						
						<input type="checkbox" id="animal" name="interest" value="동물">
						<label for="animal">동물</label>
						
						<input type="checkbox" id="fashion" name="interest" value="패션뷰티">
						<label for="fashion">패션뷰티</label>
						
						<input type="checkbox" id="etc" name="interest" value="기타">
						<label for="etc">기타</label>
					</td>
					<td></td>
				</tr>
			</table>
			<br>
			
			<div class="btns" align="center">
				<button type="button" id="goMain" onclick="history.go(-1)">메인으로</button>
				
				<!-- <button type="submit" id="joinBtn" >가입하기</button> -->
				<button type="submit" id="joinBtn" disabled>가입하기</button>
				
			</div>
		</form>
	
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
<<<<<<< HEAD
		
		 if(!(/^[가-힣]{2,}$/.test($("#enrollForm input[name=userName]").val()))){
			 $("#enrollForm input[name=userName]").focus();
=======
		//이름
		if(!(/^[가-힣]{2,8}$/.test($("#enrollForm input[name=userName]").val()))){
			alert("닉네임은 한글로 2자리 이상 입력해야 합니다.");
			$("#enrollForm input[name=userName]").focus();
=======
 		if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test($("#enrollForm input[name=userId]").val()))){
			alert("비밀번호는 숫자, 영문자, 특수문자 조합으로 8자리 이상 사용해야 합니다.");
 			$("#enrollForm input[name=userPwd]").focus();
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
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
<<<<<<< HEAD
			$("#enrollForm input[name=email]").focus();
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
=======
			 $("#enrollForm input[name=email]").focus();
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
	        return false;
		 }
		 
		 return true;
<<<<<<< HEAD
<<<<<<< HEAD
		
		
	}
	
	function checkId(){
=======
	}  

  	//==============================================
	//중복확인
	//==============================================
	//아이디 중복확인
 	function checkId(){
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
=======
		 
		
	} 
	 */
	function checkId(){
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
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
<<<<<<< HEAD
<<<<<<< HEAD
					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
						userId.attr("readonly","true");
						//$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
					}else{
						userId.focus();
=======
					var check = confirm("사용가능한 아이디입니다. 사용하시겠습니까?");
					if(check == true){
=======
					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
						userId.attr("readonly","true");
						$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
					}else{
						userId.focus();
<<<<<<< HEAD
						userId.attr("readonly", false);
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
=======
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
<<<<<<< HEAD
<<<<<<< HEAD
	
	function checkNick(){
		var userId = $("#enrollForm input[name=nickName]");
		if(userId.val() == ""){
=======

  	//닉네임 중복확인
=======
	
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
	function checkNick(){
		var nickName = $("#enrollForm input[name=nickName]");
		if(nickName.val() == ""){
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
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
<<<<<<< HEAD
					userId.focus();
				}else{
					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
						userId.attr("readonly","true");
						$("#joinBtn").removeAttr("disabled"); //회원가입버튼 활성화!
					}else{
						userId.focus();
=======
					nickName.focus();
				}else{
					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
						nickName.attr("readonly","true");
					}else{
						nickName.focus();
<<<<<<< HEAD
						nickName.attr("readonly", false);
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
=======
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
					}
				}
			},error:function(){
				consloe.log("서버통신 실패");
			}
		})
	}
	
<<<<<<< HEAD
<<<<<<< HEAD
	//======================연락처, 이메일 중복체크 하기
	
	</script>
	<%@ include file="../common/footer.jsp"%>
	</div>
=======
  	//연락처 중복확인
=======
>>>>>>> parent of ad3e5c8 (Merge pull request #110 from pastelto/soyoung)
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

>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
</body>
</html>