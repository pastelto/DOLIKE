<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member, java.sql.Date"%>

<%
	Member m = (Member)request.getAttribute("loginUser");
	String userId = m.getUserId();
	String userName = m.getUserName();
	String userPwd = m.getUserPwd();
	String birthDate = m.getBirthDate();
	String phone = m.getPhone();
	String email = m.getEmail();
	String nickName = m.getNickName();
	
	String[] checkedInterest = new String[7];
	
	if (m.getInterests() != null) {
		String[] interests = m.getInterests().split(",");
		
		for(int i = 0; i < interests.length; i++) {
			switch(interests[i]) {
			case "공부" : checkedInterest[0] = "checked"; break;
			case "건강" : checkedInterest[1] = "checked"; break;
			case "여행" : checkedInterest[2] = "checked"; break;
			case "요리" : checkedInterest[3] = "checked"; break;
			case "동물" : checkedInterest[4] = "checked"; break;
			case "패션뷰티" : checkedInterest[5] = "checked"; break;
			case "기타" : checkedInterest[6] = "checked"; break;
			}
		}
	}
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>마이페이지 계정 관리</title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	
	<style>
	#goMain, #deleteBtn {
		color: #000000;
		background-color: #fff;
		border-color: #78c2ad;
	}
	#updateBtn, #nickCheckBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#nickCheckBtn:hover, #goMain:hover, #updateBtn:hover {
		color: #fff;
		background-color: #f3969a;
		border-color: #f3969a;
	}
	
	#deleteBtn:hover {
		color: #fff;
		background-color: #000000;
    	border-color: #000000;
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
        <div class="content-body">
            <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">마이페이지</li>
                        <li class="breadcrumb-item active">계정 관리</li>
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
									<form id="updateForm" action="<%=request.getContextPath() %>/memberUpdate.me" method="post" onsubmit="return editValidate();">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userId">아이디</label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="userId" name="userId" value="<%= userId %>" readonly>
                                            </div>
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
                                            <label class="col-lg-4 col-form-label" for="userName">이름 </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="userName" name="userName" value="<%= userName %>" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 <span class="text-danger">*</span></label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="nickName" name="nickName" value="<%= nickName %>" required />
                                            </div>
                                            <div class="form-inline">
                                                <button type="button" class="btn btn-primary" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                            <div class="checkFont" id="nickCheck"></div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="birthDate" name="birthDate" placeholder="<%= birthDate %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 </label>
                                            <div class="form-inline">
                                                <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 </label>
                                            <div class="form-inline">
                                                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="interests">관심사 <span class="text-danger">*</span></label>
                                            <!-- <div class="col-lg-6"> -->
                                            <div class="form-inline">
		                                        <div class="form-group">
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="공부"<%= checkedInterest[0] %> required>공부</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="건강"<%= checkedInterest[1] %>>건강</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="여행"<%= checkedInterest[2] %>>여행</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="요리"<%= checkedInterest[3] %>>요리</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="동물"<%= checkedInterest[4] %>>동물</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="패션뷰티"<%= checkedInterest[5] %>>패션뷰티</label>
		                                            </div>
		                                            <div class="form-check mb-3">
		                                                <label class="radio-inline mr-3">
		                                                    <input type="radio" class="form-check-input" name="interests" value="기타"<%= checkedInterest[6] %>>기타</label>
		                                            </div>
		                                        </div>
	                                        </div>
                                        </div>
                                        
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                        	<input type="button" class="btn btn-primary" id="goMain" onclick="history.go(-1)" value="돌아가기"/>
                                        	<input type="submit" class="btn btn-primary" id="updateBtn" value="회원정보수정"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                        	<input type="button" class="btn btn-primary" id="deleteBtn" onclick="location.href='<%=contextPath%>/memberDeleteForm.me'" value="탈퇴하기"/>
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
    	//==============================================
    	// 회원정보수정 양식 입력시 focus 잃었을 때, 빨간 글자로 유효성 검사
    	//==============================================
    	// 비밀번호 정규식
		var pwReg = /^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{4,12}$/; 	
    		
    	// 닉네임 정규식
		var nickReg = /^[가-힣a-zA-Z0-9]{3,12}$/;	
    		
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
    		if ($("#updateForm input[name=userPwd]").val() != $("#updateForm input[name=checkPwd]").val()) {
    			$("#pwdCkCheck").text('비밀번호 불일치').css('color', 'red');
    		} else {
    			$("#pwdCkCheck").text('');
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
        
    	//==============================================
    	// 회원정보수정버튼 클릭시 팝업으로 재검증
    	//==============================================
       	function editValidate(){
     		//비밀번호
    		if(!(/^(?=.*[a-zA-Z0-9])(?=.*[!@#$%^*+=-]).{4,12}$/.test($("#updateForm input[name=userPwd]").val()))){
    			alert("비밀번호는 특수문자를 반드시 포함하여 숫자, 영문자 조합으로 8자리 이상 입력");
     			$("#updateForm input[name=userPwd]").focus();
    	        return false;
    		} 
    		
    		//비밀번호 확인
    		if($("#updateForm input[name=userPwd]").val() != $("#updateForm input[name=checkPwd]").val()){
    			alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
    			$("#updateForm input[name=checkPwd]").focus();
    			return false;			
    		}
    		
    		//닉네임
    		if(!(/^[가-힣a-zA-Z0-9]{3,12}$/.test($("#enrollForm input[name=nickName]").val()))){
    			alert("닉네임은 한글, 영어, 숫자 사용하여 3~12자리 입력");
    			$("#enrollForm input[name=nickName]").focus();
    	        return false;
    		 }
    		
    		return true;
    	}
        
        
    	function checkNick(){
    		var nickName = $("#updateForm input[name=nickName]");
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
<%-- 	
		function deleteMember(){
			var val = confirm("정말로 두라이크를 떠나실건가요?");
			
			if(val){
				$("#updateForm").attr("action","<%= request.getContextPath()%>/deleteMember.me");
				$("#updateForm").submit();
				alert("안녕히가세요...");
			}else{
				alert("취소하였습니다.");
			}
		} --%>
		
<%-- 		function deleteMember(){
			var val = confirm("정말로 두라이크를 떠나실건가요?");
			
			if(val){
				location.href = "<%= request.getContextPath()%>/deleteMember.me";
				alert("안녕히가세요...");
			}else{
				alert("취소하였습니다.");
			}
		} --%>
		
    	</script>
	</div>
	<%@ include file = "../common/footer.jsp" %>

</body>
</html>