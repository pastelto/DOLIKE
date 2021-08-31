<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.message.model.vo.Message"%>
<%
	int newMsgCount = (int)(request.getAttribute("newMsgCount")); 

	System.out.println(request.getContextPath());
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>DO LIKE - 쪽지 보내기</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<!-- Custom Stylesheet -->
<link href="./css/style.css" rel="stylesheet">
<style>
#submitBtn, #resetBtn, #sendBtn {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#sendMsgLink, #resetBtn, #sendBtn, #deleteAllBtn, #submitBtn{
    color: #fff;
    background-color: #78c2ad;
    border-color: #78c2ad;
}
	
#deleteAllBtn:hover, #sendMsgLink:hover, #sendBtn:hover, #resetBtn:hover, #submitBtn:hover{
	color: #78c2ad !important;
    background-color: #fff !important;
    border-color: #78c2ad !important;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
	<div id="main-wrapper">

		<%@ include file="../common/menuSideBar.jsp"%>
		<div class="content-body">

			<div class="row page-titles mx-0">
				<div class="col p-md-0">
					<ol class="breadcrumb">
						<li class="breadcrumb-item">쪽지</li>
						<li class="breadcrumb-item active">쪽지 보내기</li>
					</ol>
				</div>
			</div>
			
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<div class="card">
							<div class="card-body">
								<div class="email-left-box">
									<a href="<%= request.getContextPath() %>/write.ms" id="sendBtn"
										class="btn btn-primary btn-block">쪽지보내기</a>
									<div class="mail-list mt-4">
										<a href="<%= request.getContextPath() %>/list.ms" class="list-group-item border-0 text-primary p-r-0">
										<i class="fa fa-inbox font-18 align-middle mr-2"></i> <b>받은 쪽지함</b> 
										<%if(newMsgCount > 0){ %> 
										<span class="badge badge-primary badge-sm float-none m-t-5" style="background-color: #f3969a; margin-left: 10px;"> <%= newMsgCount %></span> <%} %></a>
										 <a href="<%= request.getContextPath() %>/slist.ms" class="list-group-item border-0 p-r-0">
										 <i class="fa fa-paper-plane font-18 align-middle mr-2"></i>보낸 쪽지함</a>
										 <a href="<%= request.getContextPath() %>/mlist.ms" class="list-group-item border-0 p-r-0">
										 <i class="fa fa-star font-18 align-middle mr-2"></i>내게 쓴 쪽지함</a> 
										 <a href="<%= request.getContextPath() %>/dlist.ms" class="list-group-item border-0 p-r-0">
										 <i class="fa fa-trash font-18 align-middle mr-2"></i>휴지통</a>
									</div>
								</div>

								<div class="email-right-box">
									<div class="toolbar" role="toolbar">
										<h4>쪽지 보내기</h4>
									</div>
									<div class="compose-content mt-5">
										<form id="newMessageInsertForm" action="<%= request.getContextPath() %>/write.ms" method="post" enctype="multipart/form-data" onsubmit="submitMsg();">

											<input type="hidden" name="userId" value="<%= loginUser.getUserId() %>">

											<div class="input-group text-center mb-3">
												<input type="text" class="form-control" placeholder=" 받는 사람 아이디" name="recvId" style="width: 30%;">
												<div class="input-group-append">
												</div>
											</div>
											
											<div class="input-group">
												<input type="text" name="messageTitle" class="form-control bg-transparent" placeholder=" 제목">
											</div>
											<div class="input-group">
												<textarea class="textarea_editor form-control bg-light" id="messageContent" name="messageContent" rows="15" placeholder="메세지를 입력해주세요."></textarea>
											</div>
											<hr>
											<h5 class="m-b-20">
												<i class="fa fa-paperclip m-r-5 f-s-18"></i> 첨부파일
											</h5>
											<div class="input-group">
												<div class="fallback">
													<input class="l-border-1" name="upfile" type="file" multiple="multiple">
												</div>
											</div>
											<hr>
											<div class="text-right m-t-15">
												<button id="submitBtn" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10">
													<i class="fa fa-paper-plane m-r-5"></i> 보내기
												</button>
												<button id="resetBtn" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="reset">
													<i class="ti-close m-r-5 f-s-12"></i> 취소
												</button>
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

	</div>


	<script>
		function submitMsg(){
			
            var recvId = $("#newMessageInsertForm input[name=recvId]");
			var messageTitle = $("#newMessageInsertForm input[name=messageTitle]");
			var messageContent = document.getElementById("messageContent");
			
			var noRecvId = "<%= loginUser.getUserId() %>"
			var noTitle = "<%= "제목이 없습니다."  %>";
			var noContent = "<%= "쪽지 내용이 없습니다." %>";
			
			
			if(recvId.val() == ""){ <%-- 받는 아이디가 비어있을 경우 --%>
				recvId.attr("value",  noRecvId); <%-- 자기 자신에게 전송 --%>
			} 
			
			if(messageTitle.val() == ""){ <%-- 제목 비어있을 경우 --%>
				messageTitle.attr("value" , noTitle);
			}
			
			if(messageContent.value == ""){	<%-- 내용 비어있을 경우 --%>
				messageContent.value = noContent;
			}	
			console.log("recvId?? " + recvId.val)
			console.log("noTitle?? " + noTitle.val)
			console.log("messageContent?? " + messageContent.value) 
	}


		function searchPopUp(){
			
			var searchWord = $("input[name=recvId]").val();
			
			var search = confirm(searchWord);
			
/* 			if(!search){
					swal.fire({
		                title: '확인',
		                text: "쪽지를 보낼 회원의 아이디 또는 별명을 입력해주세요.", 
		                type: 'error',
		                confirmButtonText: '확인',          
		                confirmButtonColor: "#78c2ad",
		            })
				} else if(search){ */
			
			var setting = "toolbar=yes,scrollbars=yes,resizable=yes,top=500,left=500,width=800,height=800"; 
			<%-- var url = "http://localhost:7070/DoLikeProject/findUser.fd?userId=" + <%= loginUser.getUserId() %> + "&searchWord=" + searchWord; --%>
			 var url = "http://localhost:7070/DoLikeProject/findUser.fd?userId=user01&searchWord=user"; 
			<%-- var url = <%= contextPath %> + "/findUser.fd?userId=" + <%= loginUser.getUserId() %> + "&searchWord=" + searchWord; --%>
			var title = "Do Like - 친구 찾기";
			
			window.open(url, title , setting);
			
/* 			} */
		}
		

		</script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

</body>

</html>