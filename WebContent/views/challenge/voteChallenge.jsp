<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
    		com.kh.challenge.model.vo.ChallengeReply, com.kh.challenge.model.vo.PageInfo "%>
<%
	//Challenge c = (Challenge)request.getAttribute("c");
	/* ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>)request.getAttribute("fileList");
	ArrayList<ChallengeReply> rpList = (ArrayList<ChallengeReply>)request.getAttribute("rpList");	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	 
	int listCount = pi.getRpCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage(); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row">
				<div class="col-12 m-b-30">
					<h4 class="d-inline">새롭게 참여하고싶은 챌린지를 선택해주세요</h4>
					<p class="text-muted">1개의 챌린지만 선택 가능</p>
					<div class="row">
						<div class="col-md-6 col-lg-3">
							<div class="card">
								<div class="card-header bg-white">
									<h5 class="card-title"></h5><!-- 챌린지 타이틀 -->
								</div>
								<img class="img-fluid" src="" alt=""><!-- 챌린지 배너 -->
								<div class="card-body">
									<p class="card-text"></p><!-- 챌린지 설명 -->
								</div>
								<div class="card-footer">									
										<!-- form 태그 라디오버튼 넣기 -->									
								</div>
							</div>
						</div>				
					</div>
				</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>