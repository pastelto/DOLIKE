<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
    		com.kh.challenge.model.vo.ChallengeReply, com.kh.challenge.model.vo.PageInfo "%>
<%
Challenge c = (Challenge)request.getAttribute("c");
ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>) request.getAttribute("fileList");
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
<style>
.content-body {
	flex: 0 0 auto;
	width: 80%;
	max-width: 100%;
	padding-right: calc(1.5rem * .5);
	padding-left: calc(1.5rem * .5);
	margin-top: 0;
	display: flex;
	align-items: center;
	flex-direction: row;
	justify-content: center;
}

.ch-body {
	margin-right: 3rem;
}

.list-group-item {
	pointer-events: none;
}

.logo {
	margin-right: 1rem;
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
</style>
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
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
						</div>
					</div>
					<!-- 페이지 처리 -->
					<div>
						<ul class="pagination justify-content-center">
							<!-- 맨앞으로 -->
							<li><a id="pageTag" class="page-link"
								href="<%=contextPath%>/challengedetail.ch?currentPage=1">
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
								href="<%=contextPath%>/challengedetail.ch?currentPage=<%=currentPage - 1%>">
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
								href="<%=contextPath%>/challengedetail.ch?currentPage=<%=p%>"><%=p%>
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
								href="<%=contextPath%>/challengedetail.ch?currentPage=<%=currentPage + 1%>">
									&gt; </a></li>
							<%
							}
							%>

							<!-- 맨뒤로 -->
							<li><a id="pageTag" class="page-link"
								href="<%=contextPath%>/challengedetail.ch?currentPage=<%=maxPage%>">
									&raquo; </a></li>
						</ul>
					</div>
				</div>
				<!-- 댓글 작성 -->
				<div class="card-body">
					<%--<%if(loginUser != null){ --%>
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
					<%--<%} else { --%>
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
					<%--<%} --%>
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

						var writerTd = $(".mb-sm-0").text(obj.rpWriter).attr();
						var contentTd = $("<p>").text(obj.content).attr();
						var dateTd = $(".text-muted ml-3").text(obj.writeDate).attr();

						var reply = $(".media-body").append(writerTd, contentTd, dateTd);

						$("#replyList").append(reply);

					});
				},
				error : function() {
					console.log("ajax통신 실패 - 댓글조회")
				}
			})
		}
	</script>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>