<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	String contextPath = request.getContextPath();
%>  
<%
	String loginUser = "admin";
	//Member loginUser = (Member)session.getAttribute("loginUser");
	String msg = (String)session.getAttribute("msg");
%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
    <link href="../../css/style.css" rel="stylesheet">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
	<style>
		.nk-sidebar{
			padding:30px;
		}
		.content-body{
			padding:5px 0px 0px 30px;
		}
	</style>
</head>
<body>
	<%@ include file="../common/menuSideBar.jsp" %> 
	<%--
	
		String nickName = null;
		if(session.getAttribute("nickName") != null){
			nickName = (String)session.getAttribute("nickName"); //로그인한 유저의 정보 저장 
		}
		int boardNo = 0;
		if(request.getParameter("boardNo") != null){
			boardNo = Integer.parseInt(request.getParameter("boardNo"));
		}
		if(boardNo == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'boardView.jsp'");
			script.println("</script>");
		}
		Board board = new BoardDao().getBoard(boardNo);
	--%>
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
	 		<div class="row" style="margin:20px">
		 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		 				<thread>
		 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
		 						<th colspan="3" style="background-color:rgb(228, 243, 240); text-align:center;">게시판 글보기 </th>
		 					</tr>
		 				</thread>
		 				<tbody>
		 					<tr> 
		 						<td style="width:20%;">글 제목</td>
		 						<td colspan="2"><%= b.getBoardTitle().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성자</td>
		 						<td colspan="2"><%= b.getNickName() %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성일자</td>
		 						<td colspan="2"><%= b.getBoardDate() %></td>
		 					</tr>
		 					<tr> 
		 						<td>내용</td>
		 						<td colspan="2" style="min-height:200px; text-align:left;"><%= b.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<% if(at != null){ %>
									<a download="<%= at.getOriginName() %>" href="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>"><%= at.getOriginName() %></a>
									<% }else{ %>
									첨부파일이 없습니다.
									<% } %>
								</td> 
							</tr>
		 				</tbody>
		 			</table>
		 			<br>
		 			<div class="bottom-btns" align="center">
		 				<button type="button" onclick="location.href='<%= contextPath %>/list.bo?currentPage=1';">목록으로</button>
		 				<% if (loginUser != null && loginUser.getUserId().equals(b.getNickName())){ %>
		 					<button type="button" onclick="updateForm();">수정 </button>
		 					<button type="button" onclick="deleteBoard();">삭제 </button>
		 				<% } %>
		 			</div>		
		 			<form action="" id="postForm" method="post">
		 				<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
		 			</form>
		 			<script>
						function updateForm(){
							$("#postForm").attr("action", "<%=contextPath%>/updateForm.bo");
							$("#postForm").submit();
						}
						
						function deleteBoard(){
							$("#postForm").attr("action", "<%=contextPath%>/deleteB.bo");
							$("#postForm").submit();
						}
					</script>
		 			<%--
		 			<a href="boardView.jsp" class="btn btn-primary">목록</a>
		 			<% if(nickName != null && nickName.equals(board.getNickName())){ %>
		 				<a onclick="return confirm('수정하시겠습니까?')" href="boardUpdate.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">수정</a>
		 				<a onclick="return confirm('삭제하시겠습니까?')" href="boardDelete.jsp?boardNo=<%= boardNo %>" class="btn btn-primary">삭제</a>
		 			<% } %>
		 			--%> 			
	 		</div>
	 	<!-- ************ 댓글 에어리어 **************** -->
	 		<div class="replyArea">
	 			<table border="1" align="center">
	 				<tr>
	 					<th>댓글작성</th>
	 					<% if(loginUser != null) {%>
	 					<td><textarea rows="3" cols="60" id="replyContent" style="resize:none;"></textarea></td>
	 					<td><button id="addReply">댓글등록</button></td>
	 					<% } else{ %>
	 					<td><textarea readonly rows="3" cols="60" id="replyContent" style="resize:none;">로그인한 사용자만 가능합니다.</textarea></td>
	 					<td><button disabled>댓글등록</button></td>
	 					<% } %>
	 				</tr>
	 			</table>
	 			<!-- 댓글리스트  -->
	 			<div id="replyListArea">
	 				<table id="replyList" border="1" align="center"></table>
	 			</div>
	 		</div>
	 		<script>
		$(function(){
			selectReplyList(); //온로드되는 시점에 댓글 달린게 있으면 보여야 함
			$('#addReply').click(function(){
				var content = $('#replyContent').val();
				var bId = <%= b.getBoardNo()%>;
				
				$.ajax({
					url:"rinsert.bo",
					type:"post",
					data:{
						content:content,
						bId:bId
					},
					success:function(status){
						if(status == "success"){
							selectReplyList(); //성공하면 댓글 달고 바로 보여야 함
							$('#replyContent').val("");//댓글칸에 적은 내용 비워져야 함(다시 작성 가능하도록)
						}
					},
					error:function(){
						console.log("ajax 통신 실패 - 댓글등록");
					}
				})
			})
		})
		function selectReplyList(){
			$("#replyList").empty(); //먼저 테이블을 지우고 새로 뿌림(??)
			$.ajax({
				url:"rList.bo",
				data:{bId:<%= b.getBoardNo()%>}, //해당되는 게시판번호의 게시글 가져옴
				type:"get",
				success:function(list){ //한사람이 아니기때문에 list로 가져옴
					console.log(list)
					var value = "";
					for(var i in list){
						value += '<tr>'+
									'<td width="100px">'+list[i].replyWriter+'</td>'+
									'<td width="330px">'+list[i].replyContent+'</td>'+
									'<td width="150px">'+list[i].createDate+'</td>'+
								 '</tr>';
					}
					$("#replyList").html(value);
				},
				error:function(){
					console.log("ajax 통신 실패 - 댓글조회");
				}
			})
		}
	</script> 
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp" %> 
</body>
</html>