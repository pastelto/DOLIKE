<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<%
	Board b = (Board)request.getAttribute("b");
	Attachment at = (Attachment)request.getAttribute("at");
	Reply r = (Reply)request.getAttribute("r");
	int cno = b.getCategoryNo();
	System.out.println("cno read : " + cno);
%>  


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 게시글 </title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<style>
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
		#contentArea{
			min-height: 200px;
		}
		.Thum{
			width:200px; height:auto;
		}
		#deleteBtnAM {
			color: #fff;
			background-color: #f3969a;
			border-color: #f3969a;
		}
	</style>
</head>
<body>
<div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp" %> 
	
	<div class="content-body">
	<div id="bodyScroll" style="overflow:auto; min-height:1200px;">
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">카테고리</li>
                        <li class="breadcrumb-item">게시판</li>
                        <li class="breadcrumb-item active">게시글</li>
                    </ol>
                </div>
            </div>
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
											<%= b.getBoardTitle() %>
										</h2>
										<small class="float-left" style="text-align: center">태그 : <%= b.getTagName() %></small>
									</div>
								</div>
								<hr>
								<div class="media mb-4 mt-1">
									<div class="media-body">
										<small class="float-left" style="text-align: center">작성자 : <%= b.getNickName() %></small>
										<small class="float-right" style="color: #888">등록일: <%= b.getBoardDate() %>&nbsp;&nbsp;&nbsp;조회수: <%= b.getViews() %></small>
										<br><br>
											<p style="text-align: center" id="contentArea"><%= b.getBoardContent().replace(" ", "&nbsp;").replace("<","&lt;").replace(">","&gt;").replace("\n","<br>") %></p>
									</div>
								</div>
								<hr>
								<div align="center">
									<h6 class="p-t-15">
										<i class="fa fa-download mb-2"></i>
										<label for="titleImg">이미지</label>
									</h6>
									<% if(at != null){ %>
									<div class="row m-b-30">
										<div class="col-auto">
											<img src="<%=contextPath%>/resources/board_upfiles/<%=at.getChangeName()%>" class="Thum" >
										</div>
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
										<textarea placeholder="댓글 내용을 입력해주세요" rows="1" cols="60" id="replyContent" style="resize:none; width:93%; border:none; outline:none;"></textarea>
										<button id="addReply" class="btn btn-sm" >댓글등록</button>
									<% } else{ %>
										<textarea readonly rows="1" cols="60" id="replyContent" style="resize:none; width:70%; border:none; outline:none;">로그인한 사용자만 가능합니다.</textarea>
									<% } %>
									</div>
								</div>
								<div class="bottom-btns" >
									<form id="postForm">
									<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
									<input type="hidden" name="cno" value="<%= b.getCategoryNo() %>">
									
									<% if (loginUser == null) { %>
									
									<% } else if (loginUser != null && loginUser.getUserId().equals(b.getNickName())){ %>
										<br>
										<div class="float-right">
										<button id="updateBtn" class="btn btn-sm" type="button" onclick="updateForm();">수정 </button>
		 								<button id="deleteBtn" class="btn btn-sm" type="button" onclick="deleteBoard();">삭제 </button>
										</div>
									<% } else if(loginUser.getUserId().equals("admin")) {%>
									 <br><br>
									<div class="float-right">
		 								<button id="deleteBtnAM" class="btn btn-sm" type="button" onclick="deleteBoard();" style="margin-top: 25px">삭제 </button>
										</div>
									<% } %>
									
									</form>
									<br>
									<button style="text-align: center" id="returnBtn" class="btn btn-sm" onclick="history.back();">돌아가기</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<script>
		$("#titleImg").change(function(){
	 		if(this.files && this.files[0]){
	 			var reader = new FileReader;
	 			reader.onload = function(data){
	 				$(".select_img img").attr("src", data.target.result);
	 			}
	 			reader.readAsDataURL(this.files[0]);
	 		}
	 	})
	 	function updateForm(){
			$("#postForm").attr("action", "<%=contextPath%>/updateForm.bo");
			$("#postForm").submit();
		}
			
		function deleteBoard(){
			  swal.fire({
	                title: '확인', 
	                text: "정말 쪽지를 삭제하시겠습니까?", 
	                type: 'warning', 
	                confirmButtonText: '삭제', 
	                showCancelButton: true,     
	                cancelButtonText: '취소', 
	                cancelButtonColor: "#f3969a",
	                confirmButtonColor: "#78c2ad"
	            }).then(function(result) { 
	                if(result.value) {             
	                
	                $("#postForm").attr("action", "<%=contextPath%>/deleteB.bo");
					swal.fire(
							{title: '삭제',
							 text: '성공적으로 삭제되었습니다.',
							 type: 'success',
							 confirmButtonColor: "#78c2ad"}).then(function(result){
			
						$("#postForm").submit();
					});
	                
	            } else if(result.dismiss === 'cancel') { 
	                swal.fire('취소', '삭제가 취소되었습니다.', 'error');
	         
	            }
	        });
			}
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
				data:{bId : <%= b.getBoardNo()%>},
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
</div> 
	<%@ include file="../common/footer.jsp" %>
</div>
</body>
</html>