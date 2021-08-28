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
		#updateBtn, #deleteBtn, #addReply, #returnBtn{
			color: #fff;
	    	background-color: #78c2ad;
	    	border-color: #78c2ad;
		}
		#updateBtn:hover, #deleteBtn:hover ,#addReply:hover, #returnBtn:hover{
			color: #78c2ad;
	    	background-color: #fff;
	    	border-color: #78c2ad;
		}
		.replyArea{
			width:100%;
			ailgn:center;
		}
		.replyBorder{
			width:0px;
		 	height:30px;
		 	border-left: 0.1px solid gray;
		}
		.replyUserA{
			width:30%;
		}
		.replyContentA{
			width:70%;
		}
		.table th, .table td{
			outline:none;
			padding: 0.75rem;
			vertical-align:top;
			border-top:1px solid #dee2e6;
			
		}
	</style>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
	
	<div class="content-body">
		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-10" style="margin: 0 auto;">
					<h1 style="text-align: center; color: #78c2ad">
						<b>게시글</b>
					</h1>
					<br>
					<div class="card">
						<div class="card-body" style="background: rgb(248, 249, 250)">
							<div class="read-content">
								<div class="media pt-1">
									<div class="media-body">
										<h2 class="m-0" style="text-align: center">
										<!-- 글 제목 -->
											<b><%= b.getBoardTitle().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></b>
											<h5 class="m-b-3" style="text-align: center"><%= b.getNickName() %></h5>
										</h2>
									</div>
								</div>
								<hr>
								<div class="media mb-4 mt-1">
									<div class="media-body">
										<small class="float-right" style="color: #888">등록일: <%= b.getBoardDate() %>&nbsp;&nbsp;&nbsp;조회수: <%= b.getViews() %></small>
										<br><br>
										<p style="text-align: center"><%= b.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></p>
									</div>
								</div>
								<hr>
								<div align="center">
									<h6 class="p-t-15">
										<i class="fa fa-download mb-2"></i>
										<span>첨부파일</span>
									</h6>
									<% if(at != null){ %>
									<div class="row m-b-30">
										<div class="col-auto"><a href="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>" class="text-muted"><%= at.getOriginName() %></a></div>
									</div>
									<% }else{ %>
									<span>등록된 첨부파일이 없습니다.</span>
									<% } %>
									
								</div>
								<br>
								<hr>
								<br>
								<div name="replyArea" class="table-response">
								<table class="table table-xs mb-0">
									<thead>
										<tr>
											<th class="replyUserA">User</th>
											<th class="replyContentA">Content</th>
										</tr>
									</thead>
									<tbody id="replyList"></tbody> 
									</table>
									<br><br>
									<div id="replyAdd">
									<% if(loginUser != null) {%>
										<textarea placeholder="댓글 내용을 입력해주세요" rows="1" cols="60" id="replyContent" style="resize:none; width:70%; border:none; outline:none;"></textarea>
										<button id="addReply" class="btn btn-sm" >댓글등록</button>
									<% } else{ %>
										<textarea readonly rows="1" cols="60" id="replyContent" style="resize:none; width:70%; border:none; outline:none;">로그인한 사용자만 가능합니다.</textarea>
									<% } %>
									</div>
								</div>
								
								<div class="bottom-btns" >
									
									<% if (loginUser != null && loginUser.getUserId().equals(b.getNickName())){ %>
										<br>
										<div class="float-right">
										<button id="updateBtn" class="btn btn-sm" type="button" onclick="updateForm();">수정 </button>
		 								<button id="deleteBtn" class="btn btn-sm" type="button" onclick="deleteBoard();">삭제 </button>
										</div>
									<% }%>
									<button style="text-align: center" id="returnBtn" class="btn btn-sm" onclick="location.href='<%=contextPath%>/list.bo'">돌아가기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	<script>
	var content = $('#replyContent').val();
	var bId = <%= b.getBoardNo()%>;
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
			
		$(function(){
			selectReplyList(); 
			$('#addReply').click(function(){
				
				
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
					bId : bId
				},
				type:"get",
				success:function(list){
					console.log(list)
					var value = "";
					for(var i in list){
						value +='<tr>'+
									'<td style="width:30%">'+list[i].replyWriter+'</td>'+
									'<td style="width:70%">'+list[i].replyContent+'</td>'+
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
</div>
</body>
</html>