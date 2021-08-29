<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
<%
ArrayList<Challenge> list = (ArrayList<Challenge>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<style>
#applyBtn {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#applyBtn:hover {
	color: #78c2ad;
	background-color: #fff;
}

#resetBtn, #backBtn {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#resetBtn:hover, #backBtn:hover {
	color: #f3969a;
	background-color: #fff;
}

#category {
	display: block;
	padding-top: 0.375rem;
	padding-right: 2.25rem;
	padding-bottom: 0.375rem;
	padding-left: 0.75rem;
	fint-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #888;
	border: 1px solid #ced4da;
	border-radius: 0.4rem;
	transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
}
</style>
</head>
<body>
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="javascript:void(0)">챌린지</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">챌린지 신청</a></li>
                    </ol>
                </div>
            </div>	
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="email-left-box">
									<a href="<%=request.getContextPath()%>/challengeMain.ch"
										id="backBtn" class="btn btn-primary btn-block">뒤로가기</a>
									<div class="mail-list mt-4">
										<a href="<%=request.getContextPath()%>/myApList.ch"
											class="list-group-item border-0 text-primary p-r-0"><i
											class="fa fa-inbox font-18 align-middle mr-2"></i>신청함</a>
									</div>
								</div>
								<div class="email-right-box">
									<form action="<%=contextPath%>/challengeApply.ch" method="post">
										<div class="toolbar" role="toolbar">
											<div class="btn-group m-b-20">
												<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">카테고리
														선택</label> <select class="form-select" id="category"
														name="categoryNo">
														<option value="1">카테고리1</option>
														<option value="2">2</option>
														<option value="3">3</option>
														<option value="4">4</option>
														<option value="5">5</option>
													</select>
												</div>
											</div>
										</div>
										<div class="compose-content mt-5">
											<div class="form-group">
												<textarea class="textarea_editor form-control bg-light"
													rows="15" placeholder="챌린지 설명 작성...." name="content"></textarea>
											</div>
											<div class="text-left m-t-15">
												<button
													class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
													type="submit" id="applyBtn">
													<i class="fa fa-paper-plane m-r-5"></i> 신청하기
												</button>
												<button
													class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
													type="reset" id="resetBtn">
													<i class="ti-close m-r-5 f-s-12"></i> 취소하기
												</button>
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
	<%@ include file="../common/footer.jsp"%>
</body>
</html>