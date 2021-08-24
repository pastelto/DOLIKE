<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 추천친구</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<!-- Custom Stylesheet -->
<!-- <link href="../../css/style.css" rel="stylesheet">
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
	crossorigin="anonymous"></script> -->


<style>
	#interestDiv {
		display: table;
		text-align: center;
	}
	
	#interestLabel {
		background: #78c2ad;
	}
	#addfr{
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#addfr:hover{
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}
	#dia{
		color: #78c2ad;
	}
	#iconfl{
		color: #f3969a;
	}
</style>
</head>
<body>
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>


	<div class="content-body">

		<br> 
			
			<div class="col-lg-10" style="margin: 0 auto;">

				<div id="interestDiv" style="margin: 0 auto;">
					<span id="interestLabel" class="label label-pill label-primary">여기에 로그인 유저 관심사 </span>
				</div>
				<br>
			
			   <div class="row">
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>
				
				<div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>

                <div class="col-lg-3">
					<div class="card">
						<div class="card-body">
							<div class="text-center">
								<span class="display-5"><i id="dia" class="icon-diamond gradient-4-text"></i></span>
								<p>유저 아이디</p>

								<div class="card-footer border-0 bg-transparent">
									<div class="row">
										<div class="col-6 border-right-1">
											<span><i id ="iconfl" class="fa fa-user gradient-1-text" aria-hidden="true"></i>
												<p>팔로워 수</p>
											</span>
										</div>
										<div class="col-6">
											<span> <i id ="iconfl" class="fa fa-pencil gradient-3-text"></i>
												<p>게시글 수</p>
											</span>
										</div>
									</div>
								</div>

								<button id="addfr" onclick="javascript:void()"
									class="btn btn-sm btn-rounded ">친구추가</button>

							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
		</div>
			<%@ include file="../common/footer.jsp" %> 
	</div>

</body>
</html>