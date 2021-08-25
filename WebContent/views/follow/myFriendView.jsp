<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList, com.kh.follow.model.vo.*"%> 
<%
	ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");
	FollowPageInfo pi = (FollowPageInfo)request.getAttribute("pi");
	
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
<title>DO LIKE - 나의 친구</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
	
<style>
	#fList{
		height: 100%;
		
	}
	
	#iconMsg{
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#iconMsg:hover{
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}
	#byefr{
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#byefr:hover{
		color: #f3969a;
    	background-color: #fff;
    	border-color: #f3969a;
	}
	#jum{
		padding:1rem 0.5rem;
		margin-bottom:1rem;
		background: #78c2ad;
		color: #fff;
		border-radius:.3rem;
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

			<%
			if (loginUser == null) {
			%>
			<div class="container-fluid">
				<div class="col-10" style="margin: 0 auto;">
					<img src="./resources/images/DOLIKE_LOGO.png" width="50%"
						height="50%" title="임시용">


				</div>
			</div>
			<%
			} else {
			%>

			<div class="container-fluid">
				<div class="col-10" style="margin: 0 auto;">

					<div class="row">
						<div class="col-1"></div>
						<div class="col-5">
							<!-- 오른 쪽 친구 선택시 보여지는 부분 -->
							<%@ include file="../follow/followDetail.jsp"%>

						</div>




						<!-- 친구추가 검색창 및 리스트 -->

						<div class="col-5">

							<div id="fList" class="card ">
								<div id="jum" class="jumbotron text-center">
									<b>나의 친구 (N명)</b>
								</div>
								<div class="card-body" style="margin: 0 auto;">

									<div class="input-group-prepend">
										<form id="searchForm" class="form-inline" action="insert.fl"
											method="post">

											<div class="input-group text-center mb-3">
												<input type="text" class="form-control"
													placeholder="친구를 찾아보세요!" name="followId">
												<div class="input-group-append">
													<button id="iconMsg" class="btn" type="button"
														onclick="searchId();">검색</button>
													<button id="byefr" class="btn" type="reset">취소</button>
												</div>
											</div>
										</form>
									</div>

									<br>
									<!-- 친구 목록 페이지 불러오기 -->
									<div>
										<table class="table table-hover table-borderless"
											style="text-align: center;">
											<%if (list.isEmpty()) {%>
											<tr>
												<td colspan="2">친구가 없습니다.</td>
											</tr>
											<% } else {%>
											
											
												<% for (Follow fl : list) {%>
												<tr>
													<td><%=fl.getFollowId()%></td>
													<td>버튼</td>
												</tr>
												<%}%>
											<%}%>
										</table>
									</div>
											<!-- 페이지 처리 -->
		<div>
			<ul class="pagination justify-content-center">
				<!-- 맨앞으로 -->
				<li><a id="pageTag" class="page-link" href="<%=contextPath%>/MyFollow.fl?currentPage=1"> &laquo; </a></li>
				
				<!-- 이전페이지 -->
				<% if(currentPage == 1) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/MyFollow.fl?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
				<%} %>
				
				
				<!-- 페이지 목록 -->
				<%for(int p=startPage; p<=endPage; p++){ %>
				
					<%if(p == currentPage){ %>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
					<%}else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/MyFollow.fl?currentPage=<%= p %>"><%= p %> </a></li>
					<%} %>
					
				<%} %>
				
				
				<!-- 다음페이지 -->
				<% if(currentPage == maxPage) {%>
				<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
				<% }else{ %>
				<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/MyFollow.fl?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
				<%} %>
				
				<!-- 맨뒤로 -->
				<li><a id="pageTag" class="page-link" href="<%= contextPath %>/MyFollow.fl?currentPage=<%= maxPage %>"> &raquo; </a></li>
			</ul>
		</div>

									<div class="col-1"></div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<% } %>


		</div>

			<%@ include file="../common/footer.jsp" %> 
	</div>
	
	<script>
		function searchId(){
			console.log("찍히나?")
			var followId = $("#searchForm input[name=followId]");
			if(followId.val() == ""){
				
				alert("친구 아이디를 입력하세요!");
				return false;
			}
			$.ajax({
				url:"search.fl",
				type:"post",
				data:{followId:followId.val()},
				success:function(result){
					if(result == "success"){
						var check = confirm(followId.val()+"님을 친구 추가하겠습니까?");
						if(check == true){
							$("#searchForm").submit();
							alert("등록되었습니다.");
						}else{
							alert("취소되었습니다.");
						}
						
						
					}else{
						alert(followId.val()+"님은 존재하지 않는 유저입니다.");
					}
				},
				error:function(){
					console.log("통신오류!")
				}
			})
			
			
		}
	</script>

</body>
</html>