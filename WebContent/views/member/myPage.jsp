<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.member.model.vo.Member, java.sql.Date"%>

<%
	Member m = (Member)request.getAttribute("loginUser");
	String userId = m.getUserId();
	String userName = m.getUserName();
	String userPwd = m.getUserPwd();
	Date birthDate = m.getBirthDate();
	String phone = m.getPhone();
	String email = m.getEmail();
	String nickName = m.getNickName();
	
	String[] checkedInterest = new String[7];
	
	if(m.getInterests() != null){
		String[] interests = m.getInterests().split(",");
		
		for(int i = 0; i < interests.length; i++) {
			switch(interests[i]){
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

    Custom Stylesheet
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<link href="./css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>


<style>
	#goMain, #editBtn {
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
									<form id="updateForm" action="<%=request.getContextPath() %>/memberUpdate.me" method="post" onsubmit="return updateMem();">
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
                                                <input type="password" class="form-control" id="userPwd" name="userPwd" placeholder="비밀번호를 입력하세요.">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="checkPwd">비밀번호 확인 <span class="text-danger">*</span>
                                            </label>
                                            <div class="col-lg-6">
                                                <input type="password" class="form-control" id="checkPwd" name="checkPwd" placeholder="비밀번호를 한 번 더 입력하세요.">
                                            </div>
                                            <label id = "pwdResult"></label>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="userName">이름 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="userName" name="userName" value="<%= userName %>" readonly>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="nickName">닉네임 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="nickName" name="nickName" placeholder="<%= nickName %>"/>
                                            	<button type="button" class="btn btn-primary" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="birthDate">생년월일 </label>
                                            <div class="col-lg-6">
                                                <input type="date" class="form-control" id="birthDate" name="birthDate" value="<%= birthDate %>" readonly/>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="phone">연락처 </label>
                                            <div class="col-lg-6">
                                                <input type="text" class="form-control" id="phone" name="phone" value="<%= phone %>" readonly/>
                                                <button type="button" class="btn btn-primary" id="phoneCheckBtn" onclick="checkPhone();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="email">이메일 </label>
                                            <div class="col-lg-6">
                                                <input type="email" class="form-control" id="email" name="email" value="<%= email %>" readonly/>
                                                <button type="button" class="btn btn-primary" id="emailCheckBtn" onclick="checkEmail();">중복확인</button>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-lg-4 col-form-label" for="interests">관심사</label>
                                            <div class="col-lg-6">
												<form>
			                                        <div class="form-group">
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="공부" <%= checkedInterest[0] %>>공부</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="건강">건강</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="여행">여행</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="요리">요리</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="동물">동물</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="패션뷰티">패션뷰티</label>
			                                            </div>
			                                            <div class="form-check mb-3">
			                                                <label class="form-check-label">
			                                                    <input type="checkbox" class="form-check-input" name="interests" value="기타">기타</label>
			                                            </div>
			                                        </div>
			                                    </form>
                                            </div>
                                        </div>
                                        
                                        
                                    <div class="form-group row">
                                        <div class="col-lg-8 ml-auto">
                                        	<input type="button" class="btn btn-primary" id="goMain" onclick="history.go(-1)" value="돌아가기"/>
                                            <input type="submit" class="btn btn-primary" id="editBtn" onclick="updateMember();" value="회원정보수정" disabled />
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
		function updateMember(){
			window.open("<%= request.getContextPath() %>/memberUpdate.me");
			var pwd = prompt("현재 비밀번호를 입력하세요.");
			
			if("<%= userPwd %>" == pwd){
				var val = confirm("회원정보를 수정하시겠습니까?");
				
				if(val){
					$("#updateForm").attr("action","<%= request.getContextPath()%>/memberUpdate.me");
					$("#updateForm").submit();
				}else{
					alert("취소하였습니다.");
				}
			}else{
				alert("비밀번호를 잘못입력하였습니다.");
			}
		}
	
		function deleteMember(){
			
			var pwd = prompt("현재 비밀번호를 입력하세요.");
			
			if("<%= userPwd %>" == pwd){
				var val = confirm("정말로 탈퇴하시겠습니까?");
				
				if(val){
					$("#updateForm").attr("action","<%= request.getContextPath()%>/deleteMember.me");
					$("#updateForm").submit();
				}else{
					alert("취소하였습니다.");
				}
			}else{
				alert("비밀번호를 잘못입력하였습니다.");
			}
		}
    	</script>
    
    
    
    
    
    
    
    

	<%-- <div class="outer">
		<br>
		
		<h2 align="center">마이페이지</h2>
		
		<form id="updateForm" action="<%=request.getContextPath() %>/memberUpdate.me" method="post">
			<table>
				<tr>
					<td width="200px">아이디</td>
					<td><input type="text" maxlength="13" name="userId" value = "<%= userId %>" readonly></td>
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
					<td width="200px">닉네임</td>
					<td><input type="text" maxlength="13" name="nickName" required></td>
					<td width="200px">
						<button type="button" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" maxlength="10" name="userName" value = "<%= userName %>" readonly></td>
					<td></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="text" maxlength="15" name="birthDate" value = "<%= birthDate %>" readonly></td>
					<td></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td><input type="tel" maxlength="15" name="phone" value = "<%= phone %>" readonly></td>
					<td></td>
				</tr>
				<tr>
					<td>이메일</td>
					<td><input type="email" name="email" value = "<%= email %>" readonly></td>
					<td></td>
				</tr>
				<tr>
					<td>관심사</td>
					<td>
						<input type="checkbox" id="study" name="interest" value="공부" <%= checkedInterest[0] %>>
						<label for="study">공부</label>
						
						<input type="checkbox" id="health" name="interest" value="건강" <%= checkedInterest[1] %>>
						<label for="health">건강</label>
						
						<input type="checkbox" id="trip" name="interest" value="여행" <%= checkedInterest[2] %>>
						<label for="trip">여행</label>
						
						<input type="checkbox" id="cooking" name="interest" value="요리" <%= checkedInterest[3] %>>
						<label for="cooking">요리</label>
						
						<input type="checkbox" id="animal" name="interest" value="동물" <%= checkedInterest[4] %>>
						<label for="animal">동물</label>
						
						<input type="checkbox" id="fashion" name="interest" value="패션뷰티" <%= checkedInterest[5] %>>
						<label for="fashion">패션뷰티</label>
						
						<input type="checkbox" id="etc" name="interest" value="기타" <%= checkedInterest[6] %>>
						<label for="etc">기타</label>
					</td>
					<td></td>
				</tr>
			</table>
			<br>
			
			<div class="btns" align="center">
				<button type="submit" id="updateBtn" onclick="updateMember();">수정하기</button>
				
				<button type="button" id = "deleteBtn" onclick="deleteMember();">탈퇴하기</button>
			</div>
		</form>
	</div>
	<script>
		function updateMember(){
			window.open("<%= request.getContextPath() %>/updatePwdForm.me");
			var pwd = prompt("현재 비밀번호를 입력하세요.");
			
			if("<%= userPwd %>" == pwd){
				var val = confirm("회원정보를 수정하시겠습니까?");
				
				if(val){
					$("#updateForm").attr("action","<%= request.getContextPath()%>/memberUpdate.me");
					$("#updateForm").submit();
				}else{
					alert("취소하였습니다.");
				}
			}else{
				alert("비밀번호를 잘못입력하였습니다.");
			}
		}
	
		function deleteMember(){
			
			var pwd = prompt("현재 비밀번호를 입력하세요.");
			
			if("<%= userPwd %>" == pwd){
				var val = confirm("정말로 탈퇴하시겠습니까?");
				
				if(val){
					$("#updateForm").attr("action","<%= request.getContextPath()%>/deleteMember.me");
					$("#updateForm").submit();
				}else{
					alert("취소하였습니다.");
				}
			}else{
				alert("비밀번호를 잘못입력하였습니다.");
			}
		}
	</script> --%>
	
	
	<%@ include file = "../common/footer.jsp" %>
	</div>

</body>
</html>