<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.ChallengeApply, com.kh.challenge.model.vo.ChallengeVote"%>
<%
	ArrayList<ChallengeApply> list = (ArrayList<ChallengeApply>)request.getAttribute("list"); 
	ChallengeVote cv = new ChallengeVote();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<body>
	<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="email-left-box">
									<a href="<%= request.getContextPath() %>/challengeMain.ch"
										id="backBtn" class="btn btn-primary btn-block">뒤로가기</a>
									<div class="mail-list mt-4">
										<a href="<%= request.getContextPath() %>/applyList.ch"
											class="list-group-item border-0 text-primary p-r-0"><i
											class="fa fa-inbox font-18 align-middle mr-2"></i>신청함</a>
									</div>
								</div>
								<div class="email-right-box">
									<form action="<%=contextPath%>/voteInsert.ch" method="post">
										<div class="toolbar" role="toolbar">
											<div class="btn-group m-b-20">

												<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">챌린지
														선택</label> <select class="form-select" id="category" name="apNo">
														<%for(int i = 0; i <list.size(); i++) {%>
														<option value=<%=list.get(i).getApNo()%>><%=list.get(i).getApNo()%></option>
														<%} %>
													</select>
												</div>
												<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">카테고리
														선택</label> <select class="form-select" id="category" name="categoryNo">
														<option value='1'>카테고리1</option>
														<option value='2'>2</option>
														<option value='3'>3</option>
														<option value='4'>4</option>
														<option value='5'>5</option>
													</select>
												</div>
											</div>
										</div>
										<div class="compose-content mt-5">
											<div class="form-group">
												<input type="text" name="chTitle"
													class="form-control bg-transparent" placeholder="제목">
											</div>
											<div class="form-group">
												<textarea class="textarea_editor form-control bg-light"
													rows="15" placeholder="챌린지 설명 작성...." name="content"></textarea>
											</div>
											<div class="col-md-6">
												<label class="m-t-20">투표 시작 날짜</label> <input type="text"
													class="form-control" name="start" placeholder="2021-08-01"
													id="mdate">
											</div>
											<div class="col-md-6">
												<label class="m-t-20">투표 마감 날짜</label> <input type="text"
													class="form-control" name="end" placeholder="2021-08-01"
													id="mdate">
											</div>
											<div class="text-left m-t-15">
												<button
													class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
													type="submit" id="applyBtn">
													<i class="fa fa-paper-plane m-r-5"></i> 작성완료
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
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
</body>
</html>