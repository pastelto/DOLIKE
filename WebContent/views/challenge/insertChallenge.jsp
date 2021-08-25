<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*"%>
<%
	Challenge c = new Challenge();	
	ChallengeAttachment at = new ChallengeAttachment();
	ArrayList<ChallengeVote> list = (ArrayList<ChallengeVote>)request.getAttribute("list");
	System.out.println(list);
	int voteCount = 0;
	
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
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="email-left-box">
									<a href="email-compose.html" class="btn btn-primary btn-block">Compose</a>
									<div class="mail-list mt-4">
										<a href="email-inbox.html"
											class="list-group-item border-0 text-primary p-r-0"><i
											class="fa fa-inbox font-18 align-middle mr-2"></i> <b>Inbox</b>
											<span class="badge badge-primary badge-sm float-right m-t-5">198</span>
										</a> <a href="#" class="list-group-item border-0 p-r-0"><i
											class="fa fa-paper-plane font-18 align-middle mr-2"></i>Sent</a>
										<a href="#" class="list-group-item border-0 p-r-0"><i
											class="fa fa-star-o font-18 align-middle mr-2"></i>Important
											<span class="badge badge-danger badge-sm float-right m-t-5">47</span>
										</a> <a href="#" class="list-group-item border-0 p-r-0"><i
											class="mdi mdi-file-document-box font-18 align-middle mr-2"></i>Draft</a><a
											href="#" class="list-group-item border-0 p-r-0"><i
											class="fa fa-trash font-18 align-middle mr-2"></i>Trash</a>
									</div>
								</div>
								<div class="email-right-box">									
									<div class="compose-content mt-5">
										<form action="<%=request.getContextPath()%>/challengeInsert.ch" method="post" enctype="multipart/form-data">
											<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">챌린지 타이틀</label> 
													<select class="form-select" id="category"  name="chTitle">
														<%for(int i = 0; i <list.size(); i++) {%>
														<option value="<%=list.get(i).getChTitle()%>"><%=list.get(i).getChTitle()%></option>														
														<%} %>
													</select>
											</div>
											<div class="compose-content mt-5">
												<div class="form-group">
													<textarea class="textarea_editor form-control bg-light"
														rows="15" placeholder="챌린지 설명 작성...." name="content"></textarea>
												</div>												
												<div class="form-group"> 카테고리 번호													
													<label for="exampleSelect1" class="form-label mt-4">카테고리 번호	</label> 
													<select class="form-select" id="categoryNo"  name="categoryNo">
														<%for(int i = 0; i <list.size(); i++) {%>
														<option value="<%=list.get(i).getCategoryNo()%>"><%=list.get(i).getCategoryNo()%></option>	
														<%System.out.println(list.get(i).getCategoryNo()); %>													
														<%} %>
													</select>
												</div>
												<div class="card">
													<div class="card-body">
														<div class="row form-material">
															<div class="col-md-6" >
																<label class="m-t-20">투표 시작 날짜</label> 
																<input type="date" name="start" class="form-control" placeholder="2017-06-04" id="mdate">
															</div>
														</div>
														<div class="row form-material">
															<div class="col-md-6">
																<label class="m-t-20">투표 마감 날짜</label> <input type="date"
																	name="end" class="form-control" placeholder="2017-06-04" id="mdate">
															</div>														
														</div>
													</div>
												</div>
												<h6 class="m-b-20"><i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일</h6>
												<div class="form-group">
													<div class="fallback">
														<input class="l-border-1" name="file" type="file"
															multiple="multiple">
													</div>
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
			<%@ include file="../common/footer.jsp"%>
		</div>
	</div>
</body>
</html>