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
									<form id="updateForm">
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userId">아이디</label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userId" name="userId" value="<%= userId %>" readonly>
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
                                            <label class="col-lg-4 col-form-label" for="userName">이름 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userName" name="userName" value="<%= userName %>" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nickName" name="nickName" value="<%= nickName %>" required />
                                                <button type="button" class="btn btn-primary" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="birthDate" name="birthDate" placeholder="<%= birthDate %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 </label>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                        <label class="col-lg-4 col-form-label" for="interests">관심사 <span class="text-danger">*</span></label>
                                            <div class="col-lg-6">
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
                                        	<input type="button" class="btn btn-primary" id="updateBtn" onclick="updateMember();" value="회원정보수정"/>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                        	<input type="button" class="btn btn-primary" id="deleteBtn" onclick="deleteMember();" value="탈퇴하기"/>
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
        
		function updateMember(){
			var val = confirm("회원정보를 수정하시겠습니까?");
			
			if(val){
				$("#updateForm").attr("action","<%= request.getContextPath()%>/memberUpdate.me");
				$("#updateForm").submit();
				alert("회원정보가 수정되었습니다!")
			}else{
				alert("취소하였습니다.");
			}
		}
	
		function deleteMember(){
			var val = confirm("정말로 두라이크를 떠나실건가요?");
			
			if(val){
				$("#updateForm").attr("action","<%= request.getContextPath()%>/deleteMember.me");
				$("#updateForm").submit();
				alert("안녕히가세요...");
			}else{
				alert("취소하였습니다.");
			}
		}
    	</script>
	</div>
	<%@ include file = "../common/footer.jsp" %>

</body>
</html>