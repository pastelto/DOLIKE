<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.member.model.vo.*, com.kh.common.searchMember.model.vo.*, java.text.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list"); 
	SearchListPageInfo mpi = (SearchListPageInfo)request.getAttribute("pi");
	String contextPath = request.getContextPath();
	
	int listCount = mpi.getListCount();
	int currentPage = mpi.getCurrentPage();
	int endPage = mpi.getEndPage();
	int maxPage = mpi.getMaxPage();
	int startPage = mpi.getStartPage();
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 회원 검색</title>
<link href="./css/style.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
	#choiceBtn{
		background-color: #78c2ad;
		color: white;
		width: 10rem;
	}
	
	#closeBtn{
		background-color: #f3969a;
		color: white;
		width: 10rem;
		}
	
	.down{
			position: absolute;
			top:80%;
			left:45%;
			transform: translate(-50%,-50%);
		}
		
	.left{
			position: absolute;
			top:80%;
			left:55%;
			transform: translate(-50%,-50%);
		}
</style>
<script>
    $(document).ready(function() {
        //검색 진행 후 상태값 유지를 위한 설정 필요
        //<select> 태그에 대한 상태값 설정
        $("#key option[value='${key}']").attr("selected", "selected");
        //<input type="text"> 태그에 대한 상태값 설정
        $("#value").val("${value}");
 
        //수정 진행을 위한 버튼 click 이벤트 추가
        //->on() 메소드
        $(".btnUp").on("click", function() {
            //입력폼을 수정폼으로 변경
            //기존 입력폼에 자료 저장
            //hidden 태그에 고유번호 저장
            //action="" 속성 변경
 
            //하위에 존재하는 유일한 엘리먼트라면 엘리먼트명 탐색
            //하위에 존재하는 여러개의 엘리먼트라면 식별자 탐색
            $("#input .panel-heading").text("회원 수정");
            
            $("#input button").text("회원정보 수정");
            //$("#input").find("button").text("회원정보 수정");
            
            //수정 버튼의 조상 태그(td)의 형제들 탐색
            var siblings = $(this).parents("td").siblings("td");
            
            //특정 번째 형제 태그의 텍스트 탐색
            var mid_ = $(this).val();
            var name_ = $(siblings).eq(1).text();
            var phone = $(siblings).eq(2).text();
            
            //수정 폼의 특정 항목에 값 변경
            $("#input #mid_").val(mid_);
            $("#input #name_").val(name_);
            $("#input #phone").val(phone);
            
            //수정 폼의 action 속성의 값 변경
            $("#input form").attr("action", "${pageContext.request.contextPath}/member/update");
            
        });    
        
    });
    

</script>
</head>
<body>

	<div class="container">

		<div class="panel page-header" style="text-align: center;">
			<h3 style="color: #78c2ad">
				<!-- 주의) 상대경로 대신 절대경로 표기를 권장한다. -->
				<a> <img
					src="${pageContext.request.contextPath}/resources/images/do_32.png"
					alt=""></a> <b>회원 검색</b>
			</h3>
		</div>

		<%-- 성공 실패 메시지 출력 위치 --%>
		<%-- <c:if test="${param.result=='success'}">
			<div class="alert alert-success alert-dismissible fade in"
				style="padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Success!</strong> 요청한 작업이 처리되었습니다.
			</div>
		</c:if>
		<c:if test="${param.result=='fail'}">
			<div class="alert alert-danger alert-dismissible fade in"
				style="padding-top: 5px; padding-bottom: 5px; margin-top: 5px; margin-bottom: 5px;">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<strong>Fail!</strong> 요청한 작업이 처리되지 못했습니다.
			</div>
		</c:if> --%>

		<!-- action="" 속성 생략시 자기자신에게 폼 전송 -->


		<%--         <div class="panel panel-default" id="input">
            <div class="panel-heading">회원 검색</div>
            <div class="panel-body">
                
                <!-- 주의)상대경로 대신 절대경로 표기를 권장한다. -->
                <!-- 주의) action="" 속성 주소 지정시 서블릿 주소로만 지정 가능 -->
                <!-- 폼 전송시 action="", method="" 속성 필수 -->
                <!-- DML 액션시 폼 페이지, 액션 페이지 분리 필요(새로고침 문제점 해결) -->
                <form action="${pageContext.request.contextPath}/member/insert" method="post">
                
                    <!-- 수정 액션 진행시 필요 -->
                    <!-- hidden 태그는 프로그램 진행상 필요로 하는 값을 임시 저장할 때 사용 -->
                    <!-- 주의) form 엘리먼트 안쪽에 위치해야 한다 -->    
                    <input type="hidden" id="mid_" name="mid_" value="값">
                    
                    <div class="form-group">
                        <!-- 폼 전송시 name="" 속성 필수 -->
                        <!-- 동일 자료, 동일 식별자 사용 -->
                        <!-- required 속성 추가시 내용을 채워야 submit 가능 -->
                        <input type="text" class="form-control" 
                            id="name_" name="name_"
                            placeholder="Name(max 20)" required  value="">
                    </div>
                    <div class="form-group">
                        <input type="text" class="form-control" id="phone" name="phone"
                            placeholder="Phone(max 15)" required value="">
                    </div>
 
                    <!-- 폼 전송시 type="submit" 속성 필수 -->
                    <button type="submit" class="btn btn-default">회원 검색</button>
                </form>
 
            </div>
        </div> --%>

		<div class="row">
			<div class="col-lg-12">
				<div class="card">
					<div class="card-body" style="height: 50rem;">
						<form class="form-inline" method="POST">
							<div class="form-group">
								<%--                         <!-- 전체 자료 갯수 -->
                        <button type="button" class="btn btn-default">
                           조회된 회원 수  <span class="badge" id="totalcount">${totalcount} </span> 명입니다.
                        </button> --%>
								<span style="margin-left: 5rem; margin-right: 1rem;"> <!-- 검색 기준 선택 항목 -->




									<img
									src="${pageContext.request.contextPath}/resources/images/do_32.png"
									alt=""> <select class="form-control"
									style="width: 100px;" id="key" name="key">
										<option value="all">아이디</option>
										<option value="mid_">닉네임</option>
								</select>
								</span>

							</div>

							<div class="input-group">
								<!-- 검색 단어 입력 폼 -->
								<input type="text" class="form-control" id="value" name="value"
									placeholder="아이디 또는 별명을 입력해주세요." style="width: 35rem;">
								<div class="input-group-btn">
									<!-- 검색 진행 버튼 -->
									<button type="submit" class="btn btn-default" id="searchId">
										<i class="glyphicon glyphicon-search"> 검색하기 </i>
									</button>
								</div>

							</div>
							<br>

						</form>
						<hr>
						<div class="panel panel-default" id="output">
							<div>
								<!-- 검색 결과 자료 갯수 -->
								<button type="button" class="btn btn-default"
									style="border: none;">
									조회된 회원 수 <span class="badge" id="count">${count}</span> 명입니다.
								</button>
							</div>
							<div class="panel-body">

								<table id="members" class="table">
									<tr>
										<th></th>
										<th>아이디</th>
										<th>닉네임</th>
									</tr>
									<%-- JSTL를 이용한 반복문 처리 --%>
									<c:forEach var="m" items="${list}">
										<tr>
											<td>${m.mid_}</td>
											<td>${m.name_}</td>
											<td></td>
										</tr>
									</c:forEach>

								</table>


							</div>


						</div>

					</div>

				</div>

			</div>
			
			<div class="btn-group down">
				<button type="button" class="btn" value="${m.mid_}" id="choiceBtn">선택</button>
			</div>
			<div class="btn-group left">
				<button type="button" class="btn" value="${m.mid_}"
				id="closeBtn">닫기</button>
			</div>
			<div>
					<ul class="pagination justify-content-center">
						<!-- 맨앞으로 -->
						<li><a id="pageTag" class="page-link" href="<%=contextPath%>/findUser.fd?currentPage=1"> &laquo; </a></li>
						
						<!-- 이전페이지 -->
						<% if(currentPage == 1) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &lt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/findUser.fd?currentPage=<%= currentPage-1 %>"> &lt; </a></li>
						<%} %>
						
						
						<!-- 페이지 목록 -->
						<%for(int p=startPage; p<=endPage; p++){ %>
						
							<%if(p == currentPage){ %>
								<li class="page-item disabled"><a id="pageDisable" class="page-link"> <%= p %> </a></li>
							<%}else{ %>
								<li class="page-item"><a id="pageTag" class="page-link" href="<%=contextPath %>/findUser.fd?currentPage=<%= p %>"><%= p %> </a></li>
							<%} %>
							
						<%} %>
						
						
						<!-- 다음페이지 -->
						<% if(currentPage == maxPage) {%>
						<li class="page-item disabled"><a id="pageDisable" class="page-link"> &gt; </a></li>
						<% }else{ %>
						<li class="page-item"><a id="pageTag" class="page-link" href="<%= contextPath %>/findUser.fd?currentPage=<%= currentPage+1 %>"> &gt; </a></li>
						<%} %>
						
						<!-- 맨뒤로 -->
						<li><a id="pageTag" class="page-link" href="<%= contextPath %>/findUser.fd?currentPage=<%= maxPage %>"> &raquo; </a></li>
					</ul>
				</div>
		</div>
		
		
	<script>
		function searchPopUp11(){
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
		<script src="plugins/common/common.min.js"></script>
		<script src="js/custom.min.js"></script>
		<script src="js/settings.js"></script>
		<script src="js/gleek.js"></script>
		<script src="js/styleSwitcher.js"></script>
</body>
</html>