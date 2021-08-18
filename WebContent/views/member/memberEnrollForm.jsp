<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	}
	#enrollForm td:nth-child(1){text-align:right;}
	#enrollForm input{margin:3px;}
	
	#joinBtn{background:yellowgreen;}
	#goMain{background:orangered;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

	<div class="outer">
		<br>
		
		<h2 align="center">회원가입</h2>
		
		<form id="enrollForm" action="<%=request.getContextPath() %>/insert.me" method="post" onsubmit="return joinValidate();">
			<table>
				<tr>
					<td width="200px">아이디</td>
					<td><input type="text" maxlength="13" name="userId" required></td>
					<td width="200px">
						<button type="button" id="idCheckBtn" onclick="checkId();">중복확인</button>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" maxlength="13" name="userName" required></td>
					<td></td>
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
					<td width="200px">닉네임</td>
					<td><input type="text" maxlength="13" name="nickName" required></td>
					<td width="200px">
						<button type="button" id="nickCheckBtn" onclick="checkNick();">중복확인</button>
					</td>
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
			url:"idCheck",
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
		var userId = $("#enrollForm input[name=nickName]");
		if(userId.val() == ""){
			alert("아이디를 입력해주세요.");
			return false;
		}
		$.ajax({
			url:"nickCheck",
			type:"post",
			data:{nickName:nickName.val()},
			success:function(result){
				if(result == "fail"){
					alert("이미 사용 중인 닉네임입니다.");
					userId.focus();
				}else{
					if(confirm("사용가능한 닉네임입니다. 사용하시겠습니까?")){
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
	</script>
	<%@ include file="../common/footer.jsp"%>

</body>
</html>