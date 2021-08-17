<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" >
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="resources/css/bootstrap.css">
<link rel="stylesheet" href="resources/css/style.css">
<title>게시판 글쓰기 </title>
</head>
<body>
		<!-- HEADER LOGO  -->
		<div class="w-50" >
			<div class="nav-header"  >
		            <a href="main.jsp">
		             <img src="resources/images/DOLIKE_LOGO.png" alt="" style="width:100%; height:60px;" >
		            </a>
		           
		    </div>
			<!-- HEADER LOGO  -->
		 	<!--  ******************* 슬라이더 시작 ********************
	         ************************ 슬라이더 시작 *************** -->
	        <div class="nk-sidebar">           
	            <div class="nk-nav-scroll">
	                <ul class="metismenu" id="menu">
	                   
	                    <li>
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="false">
	                            <i class="icon-speedometer menu-icon"></i><span class="nav-text">메인</span>
	                        </a>
	                      
	                    </li>
	                    <li class="mega-menu mega-menu-sm">
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="true">
	                            <i class="icon-globe-alt menu-icon"></i><span class="nav-text">게시판</span>
	                        </a>
	                        <ul aria-expanded="false">
	                            <li><a href="#">공부</a></li>
	                            <li><a href="#">건강</a></li>
	                            <li><a href="#">여행</a></li>
	                            <li><a href="#">요리</a></li>
	                            <li><a href="#">동물</a></li>
	                            <li><a href="#">패션&뷰티</a></li>
	                            <li><a href="#">기타</a></li>
	                        </ul>
	                    </li>
	                    <li>
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="true">
	                            <i class="icon-envelope menu-icon"></i> <span class="nav-text">팔로잉</span>
	                        </a>
	                        
	                    </li>
	                    <li>
	                        <a class="has-arrow" href="javascript:void()" aria-expanded="true">
	                            <i class="icon-screen-tablet menu-icon"></i><span class="nav-text">챌린지</span>
	                        </a>
	                     
	                    </li>
	                   <li>
	                   		 <a class="#" href="javascript:void()" >
	                   		  	<i class="icon-screen-tablet menu-icon"></i><span class="nav-text">공지사항</span>
	                        </a>
	                   </li>
	                </ul>
	            </div>
        	</div>
       </div>
        <!--  ******************* 슬라이더 종료 ********************
         ************************ 슬라이더 종료 *************** -->
 	<div class="container">
 		<div class="row" style="margin:20px">
 			<form method="post" action="writeAction.jsp" style="width:720px">
	 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
	 				<thread>
	 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
	 						<th colspan="2" style="background-color:rgb(228, 243, 240); text-align:center;">글쓰기 양식 </th>
	 					</tr>
	 				</thread>
	 				<tbody>
	 					<tr> <!-- 게시글리스트 테이블의 바디 -->
	 						<td><input type="text" class="form-control" placeholder="글 제목" name="boardTitle" maxlength="50"></td>
	 					</tr>
	 					<tr>
	 						<td><textarea class="form-control" placeholder="글 내용" name="boardContent" maxlength="2048" style="height:350px"></textarea></td>
	 					</tr>
	 				</tbody>
	 				
	 			</table>
	 			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
 			</form>	
 		</div>
 	</div>
 
 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
</body>
</html>