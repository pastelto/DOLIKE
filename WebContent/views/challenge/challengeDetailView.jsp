<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
    		com.kh.challenge.model.vo.ChallengeReply"%>
<%
<<<<<<< HEAD
	Challenge c = (Challenge)request.getAttribute("c");
	ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>)request.getAttribute("fileList");
	ArrayList<ChallengeReply> list = (ArrayList<ChallengeReply>)request.getAttribute("list");
	String loginUser = "user01";
%>    
=======
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
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<<<<<<< HEAD
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<style>
	.content-body{
		flex: 0 0 auto;
		width : 80%;		
	    max-width: 100%;
	    padding-right: calc(1.5rem * .5);
	    padding-left: calc(1.5rem * .5);
	    margin-top: 0;
	   	display: flex;
	   	align-items: center;
	   	flex-direction : row;
	   	justify-content: center;
	}	
	.ch-body{
		margin-right : 3rem;
	}
	.list-group-item  {
		pointer-events: none;
	}

	.logo{
		margin-right: 1rem;
	}
</style>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<div class=ch-body>
			<div class="card mb-3">
				<h3 class="card-header">챌린지타이틀</h3>
				<svg class="d-block user-select-none" width="100%" height="200"
					aria-label="Placeholder: Image cap" focusable="false" role="img"
					preserveAspectRatio="xMidYMid slice" viewBox="0 0 318 180"
					style="font-size: 1.125rem; text-anchor: middle">
			    <rect width="100%" height="100%" fill="#868e96"></rect>
			   <!-- <img src="./resources/challenge_upfiles/<%--<%=fileList.getNewName()%>" alt="챌린지이미지" class="img-challenge">--%> -->	
			  </svg>
				<div class="card-body">
					<h5 class="card-title">챌린지 타이틀</h5>
				</div>
				<div class="card-body">
					<p class="card-text">Some quick example text to build on the
						card title and make up the bulk of the card's content.</p>
				</div>
				<ul class="list-group list-group-flush">
					<li class="list-group-item">진행기간:</li>
					<li class="list-group-item">카테고리:</li>
				</ul>
				<div class="card-body">
					<a href="#" class="card-link">Card link</a> <a href="#"
						class="card-link">Another link</a>
				</div>
				<div class="card-footer text-muted"></div>
			</div>
		</div>
		<!-- 댓글 읽기 -->
		<div class="container-fluid">
			<div class="card-body">
				<div class="media media-reply">
					<img class="logo" src="./images/do_32.png" width="50" height="50"
						margin-right="1rem" alt="Generic placeholder image">
					<div class="media-body">
						<div class="d-sm-flex justify-content-between mb-2">
							<h5 class="mb-sm-0">
								<small class="text-muted ml-3"></small>
							</h5>
							<div class="media-reply__link">
								<button class="btn btn-transparent p-0 mr-3">
									<i class="fa fa-thumbs-up"></i>
								</button>
								<button class="btn btn-transparent p-0 mr-3">
									<i class="fa fa-thumbs-down"></i>
								</button>
								<button
									class="btn btn-transparent text-dark font-weight-bold p-0 ml-2">Reply</button>
							</div>
						</div>

						<p></p>
						<ul>
							<li class="d-inline-block"><img class="rounded" width="60"
								height="60" src="images/blog/2.jpg" alt=""></li>
							<li class="d-inline-block"><img class="rounded" width="60"
								height="60" src="images/blog/3.jpg" alt=""></li>
							<li class="d-inline-block"><img class="rounded" width="60"
								height="60" src="images/blog/4.jpg" alt=""></li>
							<li class="d-inline-block"><img class="rounded" width="60"
								height="60" src="images/blog/1.jpg" alt=""></li>
						</ul>

						<div class="media mt-3">
							<img class="mr-3 circle-rounded circle-rounded"
								src="images/avatar/4.jpg" width="50" height="50"
								alt="Generic placeholder image">
							<div class="media-body">
								<div class="d-sm-flex justify-content-between mb-2">
									<h5 class="mb-sm-0">
										<!-- 작성유저 --> <small class="text-muted ml-3"><!-- 작성일 --></small>
									</h5>
									<div class="media-reply__link">
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-up"></i>
										</button>
										<button class="btn btn-transparent p-0 mr-3">
											<i class="fa fa-thumbs-down"></i>
										</button>
										<button class="btn btn-transparent p-0 ml-3 font-weight-bold">Reply</button>
									</div>
								</div>
								<p><!-- 댓글 내용 --></p>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- 댓글 작성 -->
			<div class="card-body">
				<%if(loginUser != null){ %>
				<form action="#" class="form-profile">
					<div class="form-group">
						<textarea class="form-control" name="textarea" id="replyContent"
							cols="30" rows="2" placeholder="오늘의 챌린지를 인증해주세요"></textarea>
					</div>
					<div class="d-flex align-items-center">
						<ul class="mb-0 form-profile__icons">
							<li class="d-inline-block">
								<button class="btn btn-transparent p-0 mr-3">
									<i class="fa fa-camera"></i>
								</button>
							</li>
						</ul>
						<button class="btn btn-primary px-3 ml-4" id="addReply">작성완료</button>
					</div>
				</form>
				<%} else { %>
				<form action="#" class="form-profile">
					<div class="form-group">
						<textarea readonly class="form-control" name="textarea"
							id="textarea" cols="30" rows="2"
							placeholder="로그인한 사용자만 가능한 서비스입니다. 로그인 후 이용해주세요"></textarea>
					</div>
					<div class="d-flex align-items-center">
						<ul class="mb-0 form-profile__icons">
							<li class="d-inline-block">
								<button class="btn btn-transparent p-0 mr-3">
									<i class="fa fa-camera"></i>
								</button>
							</li>
						</ul>
						<button disabled class="btn btn-primary px-3 ml-4">작성완료</button>
					</div>
				</form>
				<%} %>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			selectReplyList();// 함수호출
			$("#addReply").click(function() {
				var content = $("#replyContent").val();
				var cNo =<%=c.getChNo()%>;

				$.ajax({
					url : "rinsert.ch",
					type : "post",
					data : {
						content : content,
						cNo : cNo
					},
					success : function(status) {
						if (status == "success") {
							selectReplyList();
							$("#replyContent").val(""); // 댓글입력창 비우기
						}
					},
					error : function() {
						console.log("ajax통신 실패 - 댓글등록")
					}
				})
			})
		})
		function selectReplyList() {
			$("#replyList").empty(); // 댓글 테이블을 게시판 온로드 시마다 비우고 내용을 채워준다.
			$.ajax({
				url : "rlist.ch",
				data : {
				cNo :<%=c.getChNo()%>; }, 
				type : "get",
				success : function(list) {
					console.log(list)
					$.each(list, function(index, obj) {
=======
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
			<!-- 댓글 읽기 -->
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
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626

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
<<<<<<< HEAD
	</script>
	<%@ include file="../common/footer.jsp" %>
	</div>
=======
		</script>
>>>>>>> 4f3791dd8df80cd45b02856731c1724c6010d626
</body>
</html>