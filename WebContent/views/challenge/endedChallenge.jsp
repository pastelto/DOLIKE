<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment,
    com.kh.challenge.model.vo.PageInfo"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
	ArrayList<ChallengeAttachment> fileList = (ArrayList<ChallengeAttachment>)request.getAttribute("fileList");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	 
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
%>
<!DOCTYPE html>
<html>
<head>
 <title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<!-- Custom Stylesheet -->
<!-- <link href="../css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script> -->

<style>
	*{
		box-sizing: border-box;
	}
	body{
		display: block;
		width: 100%;
		margin: 0;
		word-break: keep-all;
		word-wrap: breke-word;
		color: #2363747;
		text-align: left;
	}
	.navbar{
		display: flex !important;
		flex-basis: auto;
		flex-grow: 1;
		align-item: center;
		
	}
	.nav{
		justify-content: end;
	}
	.challenge-list .section-header{
		justify-content: space-between;
	}
	.section-header{
		display:flex;
		align-items: center;
		margin-bottom: 1rem;
	}
	.root-content .root-section{
		display: flex;
		padding-top: 0.5rem;
		text-align:center;
		padding-left:85px;
	}
	.challenge-list{
		padding:0 0 2.5rem 0;
	}
	.live-item-list{
		display: block;
		margin-block-start: 1em;
		margin-block-end: 1em;
		margin-inline-start: 0px;
		margin-lnline-end: 0px;
		padding-inline-start: 40px;
	}
	.challenge-list .live-item-list .item-wrap{
		list-style: none;
		list-style-position: initial;
		list-style-image: initial;
		list-style-type: none;
	}
	.item-wrap{
		display: flex;
		width:800px ;
		height: 165px;
		transition-delay: initial;
		transition-duration: 0.1s;
		transition-property: all;
		transition-timing-function: ease-in-out;
		overflow: hidden;
		width: 100%;
		border: 0.0625rem solid #D7E2EB;
	    border-top-color: rgb(215, 226, 235);
	    border-top-style: solid;
	    border-top-width: 0.0625rem;
	    border-right-color: rgb(215, 226, 235);
	    border-right-style: solid;
	    border-right-width: 0.0625rem;
	    border-bottom-color: rgb(215, 226, 235);
	    border-bottom-style: solid;
	    border-bottom-width: 0.0625rem;
	    border-left-color: rgb(215, 226, 235);
	    border-left-style: solid;
	    border-left-width: 0.0625rem;
	    border-image-source: initial;
	    border-image-slice: initial;
	    border-image-width: initial;
	    border-image-outset: initial;
	    border-image-repeat: initial;
	    border-radius: 0.5rem;
		
	}
	.item{
		width:800px ;
		height: 165px;
		overflow: hidden;
		list-style:none;
		margin-bottom: 1.5rem;
		
	}
	.item-info{
		width: 54%;
		padding-left: 1.5rem;
		padding-right: 1rem;
		padding-top: 1rem;
		padding-bottom: 1rem;
	}
	.hide{
	 	display:none;
	}
	li, h5 {
		font-size: 16px;
		letter-spacing: -0.009em;
		line-height: 1.6;
	}
	li {
		display: list-item;
		list-style: none;
		text-align: -webkit-match-parent;
	}
	.item > img {
		position: absolute;
		top: 50%;
		left: 50%;
		width: auto;
		height: 100%
		transform: translate(-50%, -50%);
	}
	img{
		vertical-align: middle;
		border-style: none;
	}
	a{
		cursor: pointer;
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
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">챌린지</li>
                        <li class="breadcrumb-item active">종료된 챌린지</li>
                    </ol>
                </div>
            </div>	
			<div class="container-fluid">
				<div class="row" style="margin-bottom: 13%;padding-left: 70px;">
					<div class="topList col-10" align="center">

						<div id="thumbList"
							style="height: 10%; padding-left: 15%; padding-right: 5%">
							<div class="card" style="width: 80%;">
								<div class="bootstrap-carousel" style="height: 5rem;">
									<div id="carouselExampleIndicators" class="carousel slide"
										data-ride="carousel">
										<ol class="carousel-indicators">
											<li data-target="#carouselExampleIndicators"
												data-slide-to="0" class="active"></li>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="1"></li>
											<li data-target="#carouselExampleIndicators"
												data-slide-to="2"></li>
										</ol>
										<div class="carousel-inner">
											<div class="carousel-item active">
											<a href="<%=request.getContextPath()%>/challengeApplyForm.ch">
												<img class="d-block w-100"
													style="width: 10%; height: 18rem;"
													src="./resources/challenge_upfiles/챌린지신청.png"alt="First slide">
											</a>
											</div>
											<div class="carousel-item">
											<a href="<%=request.getContextPath()%>/challengeVote.ch">
												<img class="d-block w-100"
													style="width: 10%; height: 18rem;"
													src="./resources/challenge_upfiles/챌린지투표.png"alt="Second slide">
											</a>
											</div>
										</div>
										<a class="carousel-control-prev"
											href="#carouselExampleIndicators" data-slide="prev"><span
											class="carousel-control-prev-icon"></span> <span
											class="sr-only">Previous</span> </a><a
											class="carousel-control-next"
											href="#carouselExampleIndicators" data-slide="next"><span
											class="carousel-control-next-icon"></span> <span
											class="sr-only">Next</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="height:40rem;">
				<div class="root-container">
					<%if (!list.isEmpty() && !fileList.isEmpty()) {%>
					<div class="container">
						<div class="root-content">
							<div class="root-section">
								<section class="challenge-list">
									<ul class="live-item-list" id="clickUl">
										<%
										for (int i = 0; i < list.size(); i++) {
										%>
										<li class="item">
											<div class="hide"><%=list.get(i).getChNo()%></div>
											<div class="item-wrap">
											 <img src="./resources/challenge_upfiles/<%=fileList.get(i).getNewName()%>" alt="챌린지이미지" class="img-challenge">
												<div class="item-info">
													<div>
														<h4 class="title" style="float:left">
															<%=list.get(i).getChTitle()%>
														</h4>
													</div> <br>
													<div>									
													<ul class="challenge-period">
														<li>진행일정 : <%=list.get(i).getStart()%> ~ <%=list.get(i).getEnd()%></li>
														<li>카테고리 : <%=list.get(i).getCategoryTitle()%></li>
													</ul>
													</div>
												</div>
											</div>
										</li>
										<%}%>
									</ul>
								</section>
							</div>
						</div>
					</div>
					<%} %>
				</div>
				</div>
				<div>
					<ul class="pagination justify-content-center">
						<!-- 맨앞으로 -->
						<li><a id="pageTag" class="page-link" href="<%=contextPath%>/challengeEnd.ch?currentPage=1"> &laquo; </a></li>
						
						<!-- 이전페이지 -->
						<% if(currentPage == 1) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/challengeEnd.ch?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
						<%} %>
						
						
						<!-- 페이지 목록 -->
						<%for(int p=startPage; p<=endPage; p++){ %>
						
							<%if(p == currentPage){ %>
								<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
							<%}else{ %>
								<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/challengeEnd.ch?currentPage=<%= p %>"><%= p %> </a></li>
							<%} %>
							
						<%} %>
						
						
						<!-- 다음페이지 -->
						<% if(currentPage == maxPage) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/challengeEnd.ch?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
						<%} %>
						
						<!-- 맨뒤로 -->
						<li><a id="pageTag" class="page-link" href="<%= contextPath %>/challengeEnd.ch?currentPage=<%= maxPage %>"> &raquo; </a></li>
					</ul>
				</div>
			</div>
		</div>			
	</div>
<%@ include file="../common/footer.jsp" %>
</div>


<script>
	<% if(!list.isEmpty()){%>
		$(function() {
			$("#clickUl>.item").click(function(){
				var chno = $(this).children().eq(0).text();				
						
						location.href = "<%=request.getContextPath()%>/challengedetail.ch?chno="+chno;
					})					
				})
	<% } %>
</script>

</body>
</html>