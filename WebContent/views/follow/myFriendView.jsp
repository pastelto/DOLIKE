<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String contextPath = (String)request.getContextPath();
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
<link href="../../css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
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
	crossorigin="anonymous"></script>
	
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
	.jumbotron{
		padding:1rem 0.5rem;
		margin-bottom:1rem;
		background: #78c2ad;
		color: #fff;
		border-radius:.3rem;
	}
	
</style>	
	
</head>
<body>
	<%-- <div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%> --%>

	<div class="content-body">


		<div class="container-fluid">
			<div class="col-lg-8" style="margin: 0 auto;">
				<div class="row">
					<div class="col-lg-6 col-sm-6">

						<!-- 친구추가한 유저 정보 보여주는 부분 -->
						<div class="card">
							<div class="card-body">
								<div class="media align-items-center mb-4">
									<img class="mr-3" src="../../resources/images/do_100.png"
										width="80" height="80" alt="">
									<div class="media-body">
										<h3 class="mb-0">유저 닉네임</h3>
										<p class="text-muted mb-0">(유저 아이디)</p>
									</div>
									<button id="iconMsg" class="btn btn-sm px-2"
										onclick="location.href='<%=request.getContextPath()%>/writeForm.ms'">
										<i class="icon-envelope menu-icon"></i> 쪽지
									</button>
								</div>

								<hr>
								<div class="card mt-4">
									<div class="media align-items-center">

										<div class="card-body text-center">
											<p class="text-muted">등록된 관심사가 없습니다.</p>
										</div>

									</div>

								</div>

								<hr>

								<div class="col-12 text-center">
									<button id="byefr" class="btn px-4">친구 삭제하기</button>
								</div>
							</div>
						</div>


						<!-- 친구 추가한 유저가 작성한 게시글 리스트  -->

						<div class="card">
							<div class="card-body text-center">
							<%@ include file="../follow/followBoardList.jsp" %>
							</div>
						</div>

					</div>

					<!-- 친구추가 검색창 및 리스트 -->

					<div class="col-lg-6 col-sm-6">

						<div id="fList" class="card ">
							<div class="jumbotron text-center"><b>나의 친구 (N명)</b></div>
							<div class="card-body" style="margin: 0 auto;">
							
								<div class="input-group-prepend" >
									<form class="form-inline" action="#" method="get">
										
										<div class="input-group text-center mb-3">
										  <input type="text" class="form-control" placeholder="친구를 찾아보세요!" name="followId">
										  <div class="input-group-append">
										    <button id="iconMsg" class="btn" type="submit">검색</button>
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
				</div>
			</div>
		</div>
	</div>

	<%-- 		<%@ include file="../common/footer.jsp" %> 
	</div> --%>

</body>
</html>