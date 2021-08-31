<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.dao.BoardDao" %>
<% 
	int cno = (int)request.getAttribute("cno"); 
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 게시글 작성 </title>
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<style>
	
	.tag-class{
		width:10%;
	}
	.title-class{
		width:100%;
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
	.Thum{
		width:200px; height:auto;
	}
</style>
</head>
<body>
<div id="main-wrapper">
<%@ include file="../common/menuSideBar.jsp" %> 
	<div class="content-body">
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">카테고리</li>
                        <li class="breadcrumb-item">게시판</li>
                        <li class="breadcrumb-item">게시글</li>
                        <li class="breadcrumb-item active">게시글 생성</li>
                    </ol>
                </div>
            </div>
        <div class="container-fluid">
	 		<div class="row">
	 			<div class="col-lg-10" style="margin: 0 auto; max-width:800px;">
	 				<h1 style="text-align: center; color: #78c2ad">
	 					<b>게시글 작성</b>
	 				</h1>
	 				<br>
	 				<div class="card">
	 					<div class="card-body" style="background: rgb(248, 249, 250)">
		 					<form id="insertForm" method="post" action="<%= contextPath %>/insert.bo?cno=<%= cno %>" enctype="multipart/form-data" style="width:100%; max-width:1000px" >
		 						<input type="hidden" name="writer" value="<%= loginUser.getUserId() %>">
		 						<div class="toolbar" role="toolbar">  
		 							<select name="tag" class="btn btn-light dropdown-toggle">
		 							<% if(cno == 1){ %>
		 								<option class="dropdown-item" value="프로그래밍">프로그래밍</option>
		 								<option class="dropdown-item" value="외국어">외국어</option>
		 								<option class="dropdown-item" value="학교">학교</option>
		 								<option class="dropdown-item" value="자기계발">자기계발</option>
		 							<% } else if(cno ==2 ){ %>
		 								<option class="dropdown-item" value="운동">운동</option>
		 								<option class="dropdown-item" value="다이어트">다이어트</option>
		 								<option class="dropdown-item" value="생활">생활</option>
		 							<% } else if(cno ==3){ %>
		 								<option class="dropdown-item" value="국내여행">국내여행</option>
		 								<option class="dropdown-item" value="해외여행">해외여행</option>
		 								<option class="dropdown-item" value="여행팁">여행팁</option>
		 							<% } else if(cno ==4 ){ %>
		 								<option class="dropdown-item" value="맛집">맛집</option>
		 								<option class="dropdown-item" value="레시피">레시피</option>
		 								<option class="dropdown-item" value="음료">음료</option>
		 								<option class="dropdown-item" value="주전부리">주전부리</option>
		 							<% } else if(cno ==5){ %>
		 								<option class="dropdown-item" value="동물건강">동물건강</option>
		 								<option class="dropdown-item" value="반려문화">반려문화</option>
		 								<option class="dropdown-item" value="교육/훈련">교육/훈련</option>
		 								<option class="dropdown-item" value="반려용품">반려용품</option>
		 							<% } else if(cno ==6 ){ %>
		 								<option class="dropdown-item" value="도메스틱">도메스틱</option>
		 								<option class="dropdown-item" value="디자이너브랜드">디자이너브랜드</option>
		 								<option class="dropdown-item" value="SPA브랜드">SPA브랜드</option>
		 								<option class="dropdown-item" value="명품">명품</option>
		 							<% } else { %>
		 								<option class="dropdown-item" value="기타">기타</option>
		 							<% } %>
		 							</select>
		 						
			 						<div class="media pt-1">
			 							<div class="media-body">
			 								<h2 class="m-0" style="text-align:center">
			 									<b><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="100"></b>
			 							</div>
			 						</div>
			 					</div>	
			 					<div class="compose-content mt-5">
			 							<div class="form-group">
			 								<textarea name="boardContent" class="textarea_editor form-control bg-light" rows="15" placeholder="글 내용을 입력하세요."></textarea>
			 							</div>
			 						<h5 class="m-b-20">
			 							<i class="fa fa-paperclip m-r-5 f-s-18 float-left"></i>
			 							<label for="titleImg">이미지 업로드</label>
			 						</h5>
			 						<div class="select_img">
			 							<img src="" class="Thum"/>
			 						</div>
			 							<div class="form-group" id="fileArea">
			 								<div class="fallback">
			 									<input name="upfile" type="file" id="titleImg">
			 								</div>
			 							</div>
			 					</div>
			 					<div class="text-right m-t-15">
			 						<input type="hidden" value="<%= cno %>">
			 						<button id="subBtn" class="btn btn-primary m-b-30 m-t-15 f-s-14 p-l-20 p-r-20 m-r-10" type="submit">
			 							<i class="fa fa-paper-plane m-r-5"></i>
			 							글쓰기
			 						</button>
			 						<button id="clBtn" class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button" onclick="history.back();">
			 							<i class="ti-close m-r-5 f-s-12"></i>
			 							취소
			 						</button>
			 					</div>
			 				</form>
	 					</div>
	 				</div> 
	 			</div>
	 		</div>
        </div>
	</div>
</div>
 	<%@ include file="../common/footer.jsp" %> 
 	<script>
	 	$(function(){
	 		$("#fileArea").hide();
	 	});
	 	$("#titleImg").change(function(){
	 		if(this.files && this.files[0]){
	 			var reader = new FileReader;
	 			reader.onload = function(data){
	 				$(".select_img img").attr("src", data.target.result);
	 			}
	 			reader.readAsDataURL(this.files[0]);
	 		}
	 	})
 	</script>
</body>
</html> 