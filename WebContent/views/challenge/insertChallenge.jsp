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
#margin-delete{
	margin-top:0 !important;
}
#categoryT , #categoryNo{
	margin-left:10px;
	margin-right:30px;
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
#apList, #voteList{
	color:gray !important;
}
#apList:hover, #voteList:hover{
	font-weight: bold;
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
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">챌린지 등록</a></li>
                    </ol>
                </div>
            </div>	
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="email-left-box">
									<a href="<%= request.getContextPath() %>/challengeMain.ch" id="backBtn" class="btn btn-primary btn-block">뒤로가기</a>
									<div class="mail-list mt-4">
										<a href="<%= request.getContextPath() %>/applyList.ch"
											class="list-group-item border-0 text-primary p-r-0" id="apList">
											<i class="fa fa-inbox font-18 align-middle mr-2"></i> 신청리스트
										</a> 
										<a href="<%= request.getContextPath() %>/challengeVote.ch" class="list-group-item border-0 p-r-0" id="voteList"><i
											class="fa fa-paper-plane font-18 align-middle mr-2"></i>챌린지 투표
										</a>
						
									</div>
								</div>
								<div class="email-right-box">									
									<div class="compose-content mt-5" id="margin-delete">
										<form action="<%=request.getContextPath()%>/challengeInsert.ch" method="post" enctype="multipart/form-data" id="inChForm">
											<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">챌린지 타이틀</label> 
													<select class="form-select" id="categoryT"  name="chTitle">
														<%for(int i = 0; i <list.size(); i++) {%>
														<option value="<%=list.get(i).getChTitle()%>"><%=list.get(i).getChTitle()%></option>
														<%System.out.println(list.get(i).getChTitle());%>														
														<%} %>
													</select>
											</div>
											<div class="compose-content mt-5" id="margin-delete">
												<div class="form-group">
													<textarea class="textarea_editor form-control bg-light"
														rows="15" placeholder="챌린지 설명 작성...." name="content"></textarea>
												</div>												
												<div class="form-group"> 												
													<label for="exampleSelect1" class="form-label mt-4">카테고리 번호	</label> 
													<select class="form-select" id="categoryNo"  name="categoryNo">
														<%for(int i = 0; i<List.size(); i++) {%>
															<option value="<%=List.get(i).getCategoryNo()%>"><%=List.get(i).getCategoryName() %></option>
														<%} %>
													</select>
												</div>
												<div class="card">
													<div class="card-body">
														<div class="row form-material">
															<div class="col-md-6" >
																<label class="m-t-20">투표 시작 날짜</label> 
																<input type="date" name="start" class="form-control" placeholder="2017-06-04" id="sdate">
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
														type="button" id="applyBtn" onclick="inChBtn">
														<i class="fa fa-paper-plane m-r-5"></i> 신청하기
													</button>
													<button
														class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20"
														type="reset" id="resetBtn">
														<i class="ti-close m-r-5 f-s-12"></i> 재작성
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
	
<script>
	function inChBtn(){			
			Swal.fire({
				 text: '챌린지를 등록하시겠습니까?',  
	             icon: 'question',                              
	             confirmButtonText: '등록',               
	             showCancelButton: true,                 
	             cancelButtonText: '취소',                
	             cancelButtonColor: "#f3969a",
	             confirmButtonColor: "#78c2ad",
            }).then((result) =>{ 
               if(result.value) {                              
                	$("#inChForm").submit();         
	            } else if(result.dismiss === 'cancel') {    
	            	Swal.fire({
						 text: '취소되었습니다',
						 icon: 'error',
						 confirmButtonColor: "#78c2ad"
					});
   				} 
            });
       	          	  
		}	
	
</script>	
</body>
</html>