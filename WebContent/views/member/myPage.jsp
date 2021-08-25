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
	int interests = m.getInterests();
	
	int [] checkedInterest = new int[6];
	
	for(int i = 0; i < checkedInterest.length; i++) {
		if(m.getInterests() != 0){
			checkedInterest[i] = "checked";
		}
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<title>마이페이지 계정 관리</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
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
	#updateForm{
		/* border:1px solid white; */
		width:100%;
		margin-left:auto;
		margin-right:auto;
	}
	#updateForm td:nth-child(1){text-align:right;}
	#updateForm input{margin:3px;}
	
	#joinBtn{background:yellowgreen;}
	#goMain{background:orangered;}
</style>
</head>
<body>
<div id="main-wrapper">
<%@ include file="../common/menuSidebar.jsp" %>

	<div class="outer">
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
	</script>
	
	
	<%@ include file = "../common/footer.jsp" %>
	</div>

</body>
</html>