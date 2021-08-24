<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.Challenge, com.kh.challenge.model.vo.ChallengeAttachment"%>
<%
	ArrayList<Challenge> list = (ArrayList<Challenge>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">

</head>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>
	<div class="content-body">
		<ul class="nav nav-tabs">
			<li class="nav-item"><a class="nav-link"
				data-bs-toggle="tab" href="<%= request.getContextPath() %>/myChallenge.ch" id="m-challenge">참여중인 챌린지</a></li>
			<li class="nav-item"><a class="nav-link active" data-bs-toggle="tab"
				href="#ch-body-e" id="e-challenge">종료된 챌린지</a></li>			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade" id="ch-body-m" >
				
			</div>
			<div class="tab-pane fade show active" id="ch-body-e">
				<p>Food truck fixie locavore, accusamus mcsweeney's marfa nulla
					single-origin coffee squid. Exercitation +1 labore velit, blog
					sartorial PBR leggings next level wes anderson artisan four loko
					farm-to-table craft beer twee. Qui photo booth letterpress, commodo
					enim craft beer mlkshk aliquip jean shorts ullamco ad vinyl cillum
					PBR. Homo nostrud organic, assumenda labore aesthetic magna
					delectus mollit.</p>
			</div>				
		</div>
	</div>
	<script>
	$(".nav a").click(function(){
		$(this).parent().addClass("active").
				siblings().removeClass("active");
		
		var id=$(this).attr("href");
		$(id).show().siblings().hide();
		
		return false;
	});
	</script>
	<%@ include file="../common/footer.jsp"%>
</div>
</body>
</html>