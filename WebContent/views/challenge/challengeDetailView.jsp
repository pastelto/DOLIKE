<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
    		com.kh.challenge.model.vo.ChallengeReply, com.kh.challenge.model.vo.PageInfo "%>
<%
Challenge c = (Challenge) request.getAttribute("c");
int chno = Integer.parseInt(request.getParameter("chno"));
ChallengeAttachment at = (ChallengeAttachment) request.getAttribute("at");
ArrayList<ChallengeReply> rpList = (ArrayList<ChallengeReply>) request.getAttribute("rpList");
PageInfo pi = (PageInfo) request.getAttribute("pi");

int listCount = pi.getListCount();
int currentPage = pi.getCurrentPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
int startPage = pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
#reply-list {
	height: 100%;
}

#addReply {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#addReply:hover {
	color: #78c2ad;
	background-color: #fff;
	border-color: #78c2ad;
}

#updBtn, #deleteBtn {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#updBtn:hover {
	color: #f3969a;
	background-color: #fff;
	border-color: #f3969a;
}

#pageTag {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#pageTag:hover {
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

#pageDisable {
	color: gray;
	background-color: #ced4da;
	border-color: #ced4da;
}

#rpbody{
	overflow-y : scroll;
	height : 750px;
}
#rpbody::-webkit-scrollbar{
	width:10px;
}
#rpbody::-webkit-scrollbar-thumb{
	background-color: #78c2ad;
	border-radius:10px;
}

#rpbody::-webkit-scrollbar-track{
	background-color: #ffe6f2;
	border-radius:10px;
	box-shadow : inset 0px 0px 5px white;
}

.hidden {
	display: none;
}


</style>
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="container-fluid">
				<div class="col-10" style="margin: 0 auto;">
					<div class="row">
						<div class="col-1"></div>
						<div class="col-5">
							<div class="card">
								<div class="card-body">
									<div class="media align-items-center">
										<img width="100%" height="200"
											src="./resources/challenge_upfiles/<%=at.getNewName()%>"
											alt="챌린지이미지" class="img-challenge" />
									</div>								
									<hr>
									<div class="card mt-4">
										<div class="media align-items-center">
											<div class="card-body text-center">
												<p class="card-text"><%=c.getContent()%></p>
											</div>
										</div>
									</div>
									<hr>
									<div class="col-12 text-center">
										<ul class="list-group list-group-flush">
											<li class="list-group-item">진행기간: <%=c.getStart()%> ~ <%=c.getEnd()%></li>
											<li class="list-group-item">카테고리: <%=c.getCategoryTitle()%></li>
											<li class="list-group-item">
											<form action="<%=request.getContextPath()%>/enroll.ch" method="post">
												<input type="hidden" value="<%=loginUser.getUserId()%>" name="userId" class="none"/>
												<input type="hidden" value="<%=c.getChNo()%>" name="chno" class="none"/>
												<button class="btn btn-primary px-3 ml-4" type="submit" id="enroll">신청</button>
											</form>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-body text-center">
									<%
									if (loginUser != null) {
									%>
									<form action="<%=request.getContextPath()%>/rplyInsert.ch"
										class="form-profile" method="post"
										enctype="multipart/form-data">
										<div class="form-group">
											<input type="text" class="hidden" name="chno"
												value="<%=chno%>" />
											<textarea class="form-control" name="content"
												id="replyContent" cols="30" rows="2"
												placeholder="오늘의 챌린지를 인증해주세요"></textarea>
										</div>
										<div class="d-flex align-items-center">
											<ul class="mb-0 form-profile__icons">
												<li class="d-inline-block">
													<div class="fallback">
														<input class="l-border-1" name="file" type="file"
															multiple="multiple">
													</div>
												</li>
											</ul>
											<button class="btn btn-primary px-3 ml-4" id="addReply" onclick="submit();">작성</button>
										</div>
									</form>
									<%
									} else {
									%>
									<form action="#" class="form-profile">
										<div class="form-group">
											<textarea readonly class="form-control" name="textarea"
												id="textarea" cols="30" rows="2"
												placeholder="로그인한 사용자만 댓글 입력이 가능합니다.. 로그인 후 이용해주세요"></textarea>
										</div>
									</form>
									<%
									}
									%>
								</div>
							</div>
						</div>

						<!-- 댓글 읽기 -->

						<div class="col-5">
							<div id="reply-list" class="card">
								<div class="card-body" id="rpbody">
									<%if (rpList.isEmpty()) {%>
									<div class="media align-items-center">
										<img class="mr-3" src="./images/do_32.png" width="50"
											height="50" margin-right="1rem" alt="dolike">
										<div class=media-body>
											<p class="mb-0">댓글이 없습니다. 댓글을 작성해주세요
											<p>
										</div>
									</div>
									<%} else {%>
									<%for (int i = 0; i < rpList.size(); i++) {%>
									<div class="media align-items-center">
										<img class="mr-3" src="./images/do_32.png" width="50"
											height="50" margin-right="1rem" alt="dolike">
										<div class=media-body>
											<p class="mb-0">
												<%=rpList.get(i).getRpWriter()%>
												<small class="text-muted ml-3"><%=rpList.get(i).getWriteDate()%></small>
											<p>
										</div>
									<%--<%if(loginUser.getUserId().equals(rpList.get(i).getRpWriter())) {%>
										<button id="updBtn" class="btn btn-sm px2" onclick="update();">수정</button>&nbsp;
										<button id="deleteBtn" class="btn btn-sm px2" onclick="delete();">삭제</button>	
									<%} %>--%>									
									</div>
									<div class="card-mt4' style="text-align:left;">
										<div class="media align-items-center">
											<div class="card-body">
												<p class="text-muted"><%=rpList.get(i).getContent()%></p>
											</div>
											<img class="rounded" width="80px" height="80px"
												src="./resources/challenge_upfiles/<%=rpList.get(i).getNewName()%>"
												alt="ch_rp_img">
										</div>
										<hr>
										<%}}%>
									</div>					
								<!-- 페이지 처리 -->
								<%
										if (!rpList.isEmpty()){
										%>
								<div id="paging">
									<ul class="pagination justify-content-center">
										<!-- 맨앞으로 -->
										<li><a id="pageTag" class="page-link"
											href="<%=request.getContextPath()%>/challengedetail.ch?chno=<%=chno+"&currentPage=1"%>">
												&laquo; </a></li>

										<!-- 이전페이지 -->
										<%
												if (currentPage == 1) {
												%>
										<li class="page-item disabled"><a id="pageDisable"
											class="page-link"> &lt; </a></li>
										<%
												} else {
												%>
										<li class="page-item"><a id="pageTag" class="page-link"
											href="<%=request.getContextPath()%>/challengedetail.ch?chno=<%=chno+"&currentPage="%><%=currentPage-1%>">
												&lt; </a></li>
										<%
												}
												%>


										<!-- 페이지 목록 -->
										<%
												for (int p = startPage; p <= endPage; p++) {
												%>

										<%
												if (p == currentPage) {
												%>
										<li class="page-item disabled"><a id="pageDisable"
											class="page-link"> <%=p%>
										</a></li>
										<%
												} else {
												%>
										<li class="page-item"><a id="pageTag" class="page-link"
											href="<%=request.getContextPath()%>/challengedetail.ch?chno=<%=chno+"&currentPage="%><%=p%>"><%=p%>
										</a></li>
										<%
												}
												%>

										<%
												}
												%>

										<!-- 다음페이지 -->
										<%
												if (currentPage == maxPage) {
												%>
										<li class="page-item disabled"><a id="pageDisable"
											class="page-link"> &gt; </a></li>
										<%
												} else {
												%>
										<li class="page-item"><a id="pageTag" class="page-link"
											href="<%=request.getContextPath()%>/challengedetail.ch?chno=<%=chno+"&currentPage="%><%=currentPage + 1%>">
												&gt; </a></li>
										<%
												}}
												%>

										<!-- 맨뒤로 -->
										<li><a id="pageTag" class="page-link"
											href="<%=request.getContextPath()%>/challengedetail.ch?chno=<%=chno+"&currentPage="%><%=maxPage%>">
												&raquo; </a></li>
									</ul>
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
		function update(){
			swal.fire({
                title: '수정',        // 제목
                text: "댓글을 수정하시겠습니까?",  // 내용
                type: 'question',                              // 종류
                confirmButtonText: '수정',               // 확인버튼 표시 문구
                showCancelButton: true,                 // 취소버튼 표시 문구
                cancelButtonText: '취소',                 // 취소버튼 표시 문구
                cancelButtonColor: "#f3969a",
                confirmButtonColor: "#78c2ad"
            }).then(function(result) { 
                if(result.value) {                 // 확인 버튼이 눌러진 경우               
                	$("#addReply").attr("action", "<%=request.getContextPath()%>/challengedetail.ch?chno="+chno");
                    $("#replyContent").val("");
				swal.fire(
						{title: '등록',
						 text: '성공적으로 등록되었습니다.',
						 type: 'success',
						 confirmButtonColor: "#78c2ad"}).then(function(result){
		
					$("#addReply").submit();
				});
                
            } else if(result.dismiss === 'cancel') {     // 취소버튼이 눌러진 경우
                swal.fire(
                	{title: '취소',
					 text: '취소되었습니다',
					 type: 'error',
					 confirmButtonColor: "#78c2ad"});
                
            }
        });
		}
		function submit(){
            // 확인, 취소버튼에 따른 후속 처리 구현
            swal.fire({
                title: '등록',        // 제목
                text: "댓글을 등록하시겠습니까?",  // 내용
                type: 'question',                              // 종류
                confirmButtonText: '등록',               // 확인버튼 표시 문구
                showCancelButton: true,                 // 취소버튼 표시 문구
                cancelButtonText: '취소',                 // 취소버튼 표시 문구
                cancelButtonColor: "#f3969a",
                confirmButtonColor: "#78c2ad"
            }).then(function(result) { 
                if(result.value) {                 // 확인 버튼이 눌러진 경우               
                	$("#addReply").attr("action", "<%=request.getContextPath()%>/challengedetail.ch?chno="+chno");
                    $("#replyContent").val("");
				swal.fire(
						{title: '등록',
						 text: '성공적으로 등록되었습니다.',
						 type: 'success',
						 confirmButtonColor: "#78c2ad"}).then(function(result){
		
					$("#addReply").submit();
				});
                
            } else if(result.dismiss === 'cancel') {     // 취소버튼이 눌러진 경우
                swal.fire(
                	{title: '취소',
					 text: '취소되었습니다',
					 type: 'error',
					 confirmButtonColor: "#78c2ad"});
                
            }
        });
		}
		</script>
</body>
</html>