<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<%
	//String contextPath = (String)request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 나의 친구</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="../../images/do_32.png">
<!-- Custom Stylesheet -->
<!-- <link href="../../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script> -->
	
<style>
	#fList{
		height: 100%;
		
	}
	
	#iconMsg{
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#iconMsg:hover{
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}
	#byefr{
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#byefr:hover{
		color: #f3969a;
    	background-color: #fff;
    	border-color: #f3969a;
	}
	#jum{
		padding:1rem 0.5rem;
		margin-bottom:1rem;
		background: #78c2ad;
		color: #fff;
		border-radius:.3rem;
	}
	
</style>	
	
</head>
<body>
<!-- 확인용! -->
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>

	<div class="content-body">

<%-- 	<%if(loginUser == null){ %>
		<div class="container-fluid">
			<div class="col-10" style="margin: 0 auto;">
			<img src="../../resources/images/DOLIKE_LOGO.png"
										width="50%" height="50%" title="임시용">
			
			
			</div>
		</div>
	<% }else{ %> --%>
	
		<div class="container-fluid">
			<div class="col-10" style="margin: 0 auto;">
				
				<div class="row">
				<div class="col-1">
				</div>
					<div class="col-5">
						<!-- 오른 쪽 친구 선택시 보여지는 부분 -->
						<%@ include file="../follow/followDetail.jsp" %>

					</div>




					<!-- 친구추가 검색창 및 리스트 -->

					<div class="col-5">

						<div id="fList" class="card ">
							<div id = "jum" class="jumbotron text-center"><b>나의 친구 (N명)</b></div>
							<div class="card-body" style="margin: 0 auto;">
							
								<div class="input-group-prepend" >
									<form id="serarchForm" class="form-inline" action="<%=contextPath%>/search.fl" method="get">
										
										<div class="input-group text-center mb-3">
										  <input type="text" class="form-control" placeholder="친구를 찾아보세요!" name="followId">
										  <div class="input-group-append">
										    <button id="iconMsg" class="btn" type="button" onclick="searchId();">검색</button>
										    <button id="byefr" class="btn" type="reset">취소</button>
										  </div>
										</div>
									</form>
								</div>
								
								<br>
								<!-- 친구 목록 페이지 불러오기 -->
								<div>
								<%@ include file="../follow/followList.jsp" %>								
								</div>
	
                            </div>
						</div>
					</div>
					
					<div class="col-1">
					</div>
					
				</div>
			</div>
		</div>
<%-- 		<% } %> --%>
		
		
	</div>

			<%@ include file="../common/footer.jsp" %> 
	</div>
	
	<script>
		function searchId(){
			console.log("찍히나?")
			var followId = $("#serachForm input[name=followId]");
			if(followId.val() == ""){
				
				alert("친구 아이디를 입력하세요!");
				return false;
			}
			$.ajax({
				url:"search.fl",
				type:"get",
				data:{followId:followId.val()},
				success:function(result){
					if(result == "fail"){
						alert("찾는 친구가 없습니다.");
					}else{
						alert("찾는 친구가 없습니다.");
					}
				},
				error:function(){
					<% System.out.println("에러임!"); %>
				}
			})
		}
	</script>

</body>
</html>