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
#margin-delete{
	margin-top:0 !important;
}
#category {
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
#apList{
	color:gray !important;
}
#apList:hover{
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
                        <li class="breadcrumb-item">챌린지</li>
                        <li class="breadcrumb-item active">챌린지 신청</li>
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
											class="list-group-item border-0 text-primary p-r-0" id="apList"><i
											class="fa fa-inbox font-18 align-middle mr-2" ></i>신청함</a>
									</div>
								</div>
								<div class="email-right-box">
									<form action="<%=contextPath%>/challengeApply.ch" method="post" id="apForm">
										<div class="toolbar" role="toolbar">
											<div class="btn-group m-b-20">
												<div class="form-group">
													<label for="exampleSelect1" class="form-label mt-4">카테고리 선택</label> 
													<select class="form-select" id="category" name="categoryNo">
													<%for(int i = 0; i<List.size(); i++) {%>
														<option value="<%=List.get(i).getCategoryNo()%>"><%=List.get(i).getCategoryName() %></option>
													<%} %>
													</select>
												</div>
											</div>
										</div>
										<div class="compose-content mt-5" id="margin-delete">
											<div class="form-group">
												<textarea class="textarea_editor form-control bg-light"
													rows="15" placeholder="챌린지 설명 작성...." name="content" id="apContent"></textarea>
											</div>
											<div class="text-left m-t-15">
												<button
													class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10"
													type="button" id="applyBtn" onclick="apChallenge();">
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
	</div>
	<%@ include file="../common/footer.jsp"%>

<script>
	function apChallenge(){
			var content = document.getElementById("apContent").value;
			var category = document.getElementById("cateogry");
			var caNo = category.options[category.selectedIndex].value;
					
			 if(content == "" || caNo == ""){
				Swal.fire({
					text: '내용을 입력해주세요.',
					icon: 'warning',
					confirmButtonColor:"#78c2ad",
					confirmButtonText: '확인'
				}).then((result)=>{

				});
			} else {			
			Swal.fire({
				 text: '챌린지를 신청하시겠습니까?',  
	             icon: 'question',                              
	             confirmButtonText: '신청',               
	             showCancelButton: true,                 
	             cancelButtonText: '취소',                
	             cancelButtonColor: "#f3969a",
	             confirmButtonColor: "#78c2ad",
            }).then((result) =>{ 
               if(result.value) {                              
                	$("#apForm").submit();         
	            } else if(result.dismiss === 'cancel') {    
	            	Swal.fire({
						 text: '취소되었습니다',
						 icon: 'error',
						 confirmButtonColor: "#78c2ad"
					});
   				} 
            });
       	  }        	  
		}	
	
</script>	
</body>
</html>