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
<title>게시판</title>
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
 		<div class="row" >
 			<table class="table table-striped" style="text-align:center; border:1px solid #dddddd">
 				<thread>
 					<tr> <!-- 게시글리스트 테이블의 헤더  -->
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">이미지 </th>
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">번호 </th>
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">제목 </th>
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성자 </th>
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">작성일 </th>
 						<th style="background-color:rgb(228, 243, 240); text-align:center;">조회수 </th>
 					</tr>
 				</thread>
 				<tbody>
 					<tr> <!-- 게시글리스트 테이블의 바디 -->
 						<td>image</td>
 						<td>1</td>
 						<td>제목칸입니다</td>
 						<td>운영자</td>
 						<td>2021-08-12</td>
 						<td>99</td>
 				</tbody>
 			</table>	
 			<a href="boardWrite.jsp" class="btn btn-primary pull-right">글쓰기</a>
 		</div>
 		
 	</div>
 
 
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="resources/js/bootstrap.js"></script>
</body>
</html>