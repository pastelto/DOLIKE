<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
	<title>DO LIKE - 회원 탈퇴</title>
	<!-- Favicon icon -->
	<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
	
	<style>
	#goBack {
		color: #000000;
		background-color: #fff;
		border-color: #78c2ad;
	}
	#deleteMemBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	
	#goBack:hover {
		color: #fff;
		background-color: #f3969a;
		border-color: #f3969a;
	}
	
	#deleteMemBtn:hover {
		color: #fff;
		background-color: #000000;
    	border-color: #000000;
	}
	
	.deleteMessage {
		text-align: center;
	}
	</style>
</head>
<body>
	<div id="main-wrapper">
    <%@ include file="../common/menuSideBar.jsp" %> 
    
    <div id="preloader">
        <div class="loader">
            <svg class="circular" viewBox="25 25 50 50">
                <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="3" stroke-miterlimit="10" />
            </svg>
        </div>
    </div>
    
    <div class="content-body">
     <div class="row page-titles mx-0">
         <div class="col p-md-0">
             <ol class="breadcrumb">
                 <li class="breadcrumb-item">마이페이지</li>
                 <li class="breadcrumb-item active">회원 탈퇴</li>
             </ol>
         </div>
     </div>
    <div class="container-fluid">
   	<div class="login-form-bg h-100">
       <div class="container h-100">
           <div class="row justify-content-center h-100">
               <div class="col-xl-6">
                   <div class="form-input-content">
                       <div class="card login-form mb-0">
                           <div class="card-body pt-5">
                               <a class="text-center"> <h4 id="deleteTitle"><b>회원 탈퇴</b></h4></a>
                               <form class="mt-5 mb-3 login-input" id="accessMyPage" action="<%=request.getContextPath() %>/deleteMember.me">
                                   <div class="form-group">
                                   		<input type="hidden" id="userId" name="userId" value=<%= loginUser.getUserId() %>>
                                   			<h5 class="deleteMessage">탈퇴시 모든 친구를 잃을 수 있습니다.</h5>
                                   			<h5 class="deleteMessage">정말로 두라이크를 떠나실건가요...?</h5>
                                   </div>
                                   <input type="button" class="btn login-form__btn submit w-100 mb-2 mt-3" id="goBack" onclick="location.href='<%=contextPath%>/main.do'" value="돌아가기">
                                   <input type="submit" class="btn login-form__btn submit w-100" id="deleteMemBtn" value="두라이크 떠나기" />
                               </form>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
    </div>
    </div>
	</div>   
   	<%@ include file = "../common/footer.jsp" %>
</body>
</html>