<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kh.board.model.vo.Board, com.kh.board.model.dao.BoardDao" %>
<% //String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - Do Whatever You Like, Community</title>
<style>
	.nk-sidebar{
		padding:30px;
	}
	.content-body{
		padding:5px 0px 0px 30px;
	}
	.tag-class{
		width:10%;
	}
	.title-class{
		width:100%;
	}
</style>
<link href="../../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
</head>

<body>
	<%@ include file="../common/menuSideBar.jsp" %> 
        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">
        <div class="container-fluid">
	 		<div class="row" style="margin:20px">
	 			<form id="insertForm" method="post" action="<%= contextPath %>/insert.bo" enctype="multipart/form-data" style="width:100%; max-width:1000px">
		 			<%--<input type="hidden" name="writer" value="<%= loginUser.getNickName %>"> --%>
		 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
		 				<thread>
		 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
		 						<th colspan="2" style="background-color:rgb(228, 243, 240); text-align:center;">글쓰기 양식 </th>
		 					</tr>
		 				</thread>
		 				<tbody>
		 					<tr> <!-- 게시글리스트 테이블의 바디 -->
		 						<td class="tag-class">
		 							<select name="tag">
		 								<option value="1">옵션1</option>
		 								<option value="2">옵션2</option>
		 								<option value="3">옵션3</option>
		 								<option value="4">옵션4</option>
		 							</select>
		 						</td>
		 						<td class="title-class"><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
		 					</tr>
		 					<tr>
		 						<td style="text-align:center">내용</td>
		 						<td colspan="2"><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height:350px"></textarea></td>
		 					</tr>
		 					<tr>
			 					<th>대표 이미지</th>
			 					<td colspan="3"><img id="titleImg" width="150" height="120"></td>
		 					</tr>
		 					<tr>
		 						<th>일반 이미지</th>
			 					<td><img id="contentImg1" width="150" height="120"></td>
			 					<td><img id="contentImg2" width="150" height="120"></td>
			 					<td><img id="contentImg3" width="150" height="120"></td>
		 					</tr>
		 				</tbody>
		 				
		 			</table>
		 			<input type="submit" class="btn btn-primary pull-right" value="글쓰기"/>
		 			<div class="form-row float-right" id="fileArea">
		 				<!--  <input type="file" class="btn" name="upFile" value="첨부파일"/>-->
		 				<input type="file" name="file1" id="file1" onchange="loadImg(this, 1);" >
		 				<input type="file" name="file2" id="file2" onchange="loadImg(this, 2)">
		 				<input type="file" name="file3" id="file3" onchange="loadImg(this, 2)">
		 				<input type="file" name="file4" id="file4" onchange="loadImg(this, 2)">
		 			</div>
		 			<input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.back();"/>
	 			</form>	
	 		</div>
        </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
 	<%@ include file="../common/footer.jsp" %> 
 	<script>
 		
	 	$(function(){
	 		$("#fileArea").hide();
	 		
	 		$("#titleImg").click(function(){
				$("#file1").click();
			});	
	 		$("#contentImg1").click(function(){
				$("#file2").click();
			});	
	 		$("#contentImg2").click(function(){
				$("#file3").click();
			});	
	 		$("#contentImg3").click(function(){
				$("#file4").click();
			});	
	 	});
	 	function loadImg(inputFile, num){
	 		if(inputFile.files.length == 1){
	 			var reader = new FileReader();
	 			reader.readAsDataURL(inputFile.files[0]);
	 			reader.onload = function(e){
	 				switch(num){
	 				case 1: $("titleImg").attr("src", e.target.result); break;
	 				case 2: $("contentImg1").attr("src", e.target.result); break;
	 				case 3: $("contentImg2").attr("src", e.target.result); break;
	 				case 4: $("contentImg3").attr("src", e.target.result); break;
	 				default: break;
	 				}
	 			}
	 		}
	 	}
 	
 	</script>
</body>
</html> 