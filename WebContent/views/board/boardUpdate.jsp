<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.*, com.kh.board.model.dao.BoardDao" %>
<% 
	Board b = (Board)request.getAttribute("board");
	Attachment at = (Attachment)request.getAttribute("at");
	String tag = b.getTagName();
	int cno = b.getCategoryNo();
	System.out.println("cno update page : " + cno);
	String[] selected = new String[22];
	switch(tag){
	case "프로그래밍": selected[0] = "selected"; break;
	case "외국어": selected[1] = "selected"; break;
	case "학교": selected[2] = "selected"; break;
	case "자기계발": selected[3] = "selected"; break;
	case "운동": selected[4] = "selected"; break;
	case "다이어트": selected[5] = "selected"; break;
	case "생활": selected[6] = "selected"; break; 
	case "국내여행": selected[7] = "selected"; break; 
	case "해외여행": selected[8] = "selected"; break; 
	case "여행팁": selected[9] = "selected"; break; 
	case "한식": selected[10] = "selected"; break; 
	case "일식": selected[11] = "selected"; break; 
	case "양식": selected[12] = "selected"; break; 
	case "중식": selected[13] = "selected"; break; 
	case "동물건강": selected[14] = "selected"; break; 
	case "반려문화": selected[15] = "selected"; break; 
	case "교육/훈련": selected[16] = "selected"; break; 
	case "반려용품": selected[17] = "selected"; break; 
	case "도메스틱": selected[18] = "selected"; break; 
	case "디자이너브랜드": selected[19] = "selected"; break; 
	case "SPA브랜드": selected[20] = "selected"; break; 
	case "명품": selected[21] = "selected"; break; 
	case "기타": selected[22] = "selected"; break; 
	
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
		#formDiv{
			display: flex;
    		justify-content: center;
		}
		#subBtn, #clBtn{
			color: #fff;
	    	background-color: #78c2ad;
	    	border-color: #78c2ad;
		}
		#subBtn:hover, #clBtn:hover{
			color: #78c2ad;
	    	background-color: #fff;
	    	border-color: #78c2ad;
		}
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
	 		<div id="formDiv" class="row">
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
		 						<input type="hidden" name="writer" value="<%= loginUser.getUserId() %>">
		 						<div class="toolbar" role="toolbar">  
		 							<select name="tag" class="btn btn-light dropdown-toggle">
		 							<% if(cno == 1){ %>
		 								<option class="dropdown-item" value="프로그래밍"<%= selected[0] %>>프로그래밍</option>
		 								<option class="dropdown-item" value="외국어"<%= selected[1] %>>외국어</option>
		 								<option class="dropdown-item" value="학교"<%= selected[2] %>>학교</option>
		 								<option class="dropdown-item" value="자기계발"<%= selected[3] %>>자기계발</option>
		 							<% } else if(cno ==2 ){ %>
		 								<option class="dropdown-item" value="운동"<%= selected[4] %>>운동</option>
		 								<option class="dropdown-item" value="다이어트"<%= selected[5] %>>다이어트</option>
		 								<option class="dropdown-item" value="생활"<%= selected[6] %>>생활</option>
		 							<% } else if(cno ==3){ %>
		 								<option class="dropdown-item" value="국내여행"<%= selected[7] %>>국내여행</option>
		 								<option class="dropdown-item" value="해외여행"<%= selected[8] %>>해외여행</option>
		 								<option class="dropdown-item" value="여행팁"<%= selected[9] %>>여행팁</option>
		 							<% } else if(cno ==4 ){ %>
		 								<option class="dropdown-item" value="맛집"<%= selected[10] %>>맛집</option>
		 								<option class="dropdown-item" value="레시피"<%= selected[11] %>>레시피</option>
		 								<option class="dropdown-item" value="음료"<%= selected[12] %>>음료</option>
		 								<option class="dropdown-item" value="주전부리"<%= selected[13] %>>주전부리</option>
		 							<% } else if(cno ==5){ %>
		 								<option class="dropdown-item" value="동물건강"<%= selected[14] %>>동물건강</option>
		 								<option class="dropdown-item" value="반려문화"<%= selected[15] %>>반려문화</option>
		 								<option class="dropdown-item" value="교육/훈련"<%= selected[16] %>>교육/훈련</option>
		 								<option class="dropdown-item" value="반려용품"<%= selected[17] %>>반려용품</option>
		 							<% } else if(cno ==6 ){ %>
		 								<option class="dropdown-item" value="도메스틱"<%= selected[18] %>>도메스틱</option>
		 								<option class="dropdown-item" value="디자이너브랜드"<%= selected[19] %>>디자이너브랜드</option>
		 								<option class="dropdown-item" value="SPA브랜드"<%= selected[20] %>>SPA브랜드</option>
		 								<option class="dropdown-item" value="명품"<%= selected[21] %>>명품</option>
		 							<% } else { %>
		 								<option class="dropdown-item" value="기타"<%= selected[2] %>>기타</option>
		 							<% } %>
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
			 						<% if(at == null){ %>
			 							<i class="fa fa-paperclip m-r-5 f-s-18"></i>
			 							첨부파일
			 							 
			 									<p>등록된 첨부파일이 없습니다.</p>	
			 							<% } %>
			 							</h5>
			 					</div>
			 					<div class="text-left m-t-15">
			 					
			 						<button id="subBtn" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit">
			 							<i class="fa fa-paper-plane m-r-5"></i>
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