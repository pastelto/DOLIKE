<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<% 
	Board b = (Board)request.getAttribute("board");
	Attachment at = (Attachment)request.getAttribute("at");
	String tag = b.getTagName();
	String[] selected = new String[7];
	switch(tag){
	case "옵션1": selected[0] = "selected"; break;
	case "옵션2": selected[1] = "selected"; break;
	case "옵션3": selected[2] = "selected"; break;
	case "옵션4": selected[3] = "selected"; break;
	case "옵션5": selected[4] = "selected"; break;
	case "옵션6": selected[5] = "selected"; break;
	case "옵션7": selected[6] = "selected"; break; 
	}
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>DO LIKE - 게시글 수정 </title>
	<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	<style>
		
		.tag-class{
			width:10%;
		}
		.title-class{
			width:100%;
		}
	</style>
</head>
<body>
<%@ include file="../common/menuSideBar.jsp" %> 
	<div class="content-body">
		<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">카테고리</li>
                        <li class="breadcrumb-item">게시판</li>
                        <li class="breadcrumb-item">게시글</li>
                        <li class="breadcrumb-item active">수정</li>
                    </ol>
                </div>
            </div>
        <div class="container-fluid">
	 		<div class="row">
		 		<form id="updateForm" method="post" action="<%= contextPath %>/update.bo" style="width:100%; max-width:1000px" enctype="multipart/form-data">
		 		<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
		 		<div class="col-lg-10" style="margin: 0 auto; max-width:800px;">
	 				<h1 style="text-align: center; color: #78c2ad">
	 					<b>게시글 수정</b>
	 				</h1>
	 				<br>
	 				<div class="card">
	 					<div class="card-body" style="background: rgb(248, 249, 250)">
		 						<input type="hidden" name="bno" value="<%= b.getBoardNo() %>">
		 						<input type="hidden" name="writer" value="<%= loginUser.getNickName() %>">
		 						<div class="toolbar" role="toolbar">  
		 							<select name="tag" class="btn btn-light dropdown-toggle">
		 								<option class="dropdown-item" value="1" <%= selected[0] %>>옵션1</option>
		 								<option class="dropdown-item" value="2" <%= selected[0] %>>옵션2</option>
		 								<option class="dropdown-item" value="3" <%= selected[0] %>>옵션3</option>
		 								<option class="dropdown-item" value="4" <%= selected[0] %>>옵션4</option>
		 							</select>
		 						
			 						<div class="media pt-1">
			 							<div class="media-body">
			 								<span class="m-0" style="text-align:center">
			 									<b><input type="text" class="form-control" value="<%= b.getBoardTitle() %>" name="title" maxlength="50"></b>
			 								</span>
			 							</div>
			 						</div>
			 					</div>	
			 					<div class="compose-content mt-5">
			 							<div class="form-group">
			 								<textarea name="content" class="textarea_editor form-control bg-light" rows="15"><%= b.getBoardContent() %></textarea>
			 							</div>
			 						<h5 class="m-b-20">
			 						<% if(at != null){ %>
			 							<i class="fa fa-paperclip m-r-5 f-s-18"></i>
			 							첨부파일
			 							 <img id="titleImg" width="150" height="120" class="pull-right">
			 						</h5>
			 							<div class="form-group" id="fileArea">
			 								<div class="fallback">
			 									<%= at.getOriginName() %>
			 									<input type="hidden" name="originFile" value='<%= at.getChangeName() %>'>
						 						<input type="hidden" name="originFileNo" value='<%= at.getFileNo() %>'>
						 						<% } else { %>
						 						<p>등록된 첨부파일이 없습니다.</p>	
							 					<% } %>
			 									<input class="l-border-1" name="upfile" type="file" id="file1" onchange="loadImg(this, 1);" multiple="multiple">
			 								</div>
			 							</div>
			 					</div>
			 					<div class="text-left m-t-15">
			 					
			 						<button id="subBtn" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit">
			 							<i class="bi bi-pencil"></i>
			 							수정
			 						</button>
			 						<button id="clBtn" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button" onclick="history.back();">
			 							<i class="ti-close m-r-5 f-s-12"></i>
			 							취소
			 						</button>
				 				</div>
		 					</div>
		 				</div> 
		 			</div>
		 		</form>
	 		</div>
		</div>
	</div>
<%@ include file="../common/footer.jsp" %> 
</body>
</html>