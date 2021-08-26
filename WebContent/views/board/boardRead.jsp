<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	Reply r = (Reply)request.getAttribute("r");
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
		.btns{
			color: #fff;
	    	background-color: #78c2ad;
	    	border-color: #78c2ad;
		}
		.btns:hover{
			color: #78c2ad;
	    	background-color: #fff;
	    	border-color: #78c2ad;
		}
		.replyArea{
			width:100%;
			ailgn:center;
		}
		
	</style>
</head>
<body>
	<%@ include file="../common/menuSideBar.jsp" %> 
	
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
		 						<td colspan="2" ><%= b.getBoardTitle().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성자</td>
		 						<td colspan="2" ><%= b.getNickName() %></td>
		 					</tr>
		 					<tr> 
		 						<td>작성일자</td>
		 						<td colspan="2"><%= b.getBoardDate() %></td>
		 					</tr>
		 					<tr> 
		 						<td>내용</td>
		 						<td colspan="2" style="min-height:200px; "><%= b.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></td>
		 					</tr>
		 					<tr>
								<th>첨부파일</th>
								<td colspan="3">
									<% if(at != null){ %>
									<a download="<%= at.getOriginName() %>" href="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>"><%= at.getOriginName() %></a>
									<% }else{ %>
									등록된 첨부파일이 없습니다.
									<% } %>
								</td> 
							</tr>
		 				</tbody>
		 			</table>
		 			<br><br>
				 			<!-- ************ 댓글 에어리어 **************** -->
			 		<div class="replyArea" style="margin-top:3px">
			 			<!-- 댓글리스트  -->
			 			<div id="replyListArea">
			 				<table id="replyList" border="1" text-align="center" class="table">
			 					
			 				</table>
			 			</div>
			 			<br>
			 			<% if(loginUser != null) {%>
			 				<textarea placeholder="댓글 내용을 입력해주세요" rows="1" cols="60" id="replyContent" style="resize:none; width:70%"></textarea>
			 				<button id="addReply" class="btns">댓글등록</button>
			 			<% } else{ %>
			 				<textarea readonly rows="1" cols="60" id="replyContent">로그인한 사용자만 가능합니다.</textarea>
			 			<% } %>

			 			
			 		</div>
		 			<br><br><br>
		 			<div class="bottom-btns" align="center">
		 				<button class="btns" type="button" onclick="location.href='<%= contextPath %>/list.bo?currentPage=1';">목록으로</button>
		 				<% if (loginUser != null && loginUser.getUserId().equals(b.getNickName())){ %>
		 					<button class="btns" type="button" onclick="updateForm();">수정 </button>
		 					<button class="btns" type="button" onclick="deleteBoard();">삭제 </button>
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
							if(confirm('게시글을 삭제하시겠습니까 ?')){
								$("#postForm").attr("action", "<%=contextPath%>/deleteB.bo");
								$("#postForm").submit();
							} 
							return;
								
							
							
						}
					</script>
		 					
	 		</div>
	 	
	 		<script>
		$(function(){
			selectReplyList(); 
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
							selectReplyList(); 
							$('#replyContent').val("");
						}
					},
					error:function(){
						console.log("ajax 통신 실패 - 댓글등록");
					}
				})
			})
		})
		function selectReplyList(){
			$("#replyList").empty(); 
			$.ajax({
				url:"rList.bo",
				data:{
					bId : <%= b.getBoardNo() %>
				},
				type:"get",
				success:function(list){
					console.log(list)
					var value = "";
					for(var i in list){
						value += '<tr>'+
									'<td width="100px">'+list[i].replyWriter+'</td>'+
									'<td width="330px">'+list[i].replyContent+'</td>'+
									
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