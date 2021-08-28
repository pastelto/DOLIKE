<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 상세 보기</title>
<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<style>

#iconMsg, #StatusBtn1 {
	color: #fff;
	background-color: #78c2ad;
	border-color: #78c2ad;
}

#byefr , #StatusBtn2, #StatusBtn3, #StatusBtn4, #StatusBtn5{
	color: #fff;
	background-color: #f3969a;
	border-color: #f3969a;
}

</style>

</head>
<body>
<div id="main-wrapper">
		<%@ include file="../common/menuSideBar.jsp"%>

		        <!--**********************************
            Sidebar end
        ***********************************-->

        <!--**********************************
            Content body start
        ***********************************-->
        <div class="content-body">

            <div class="row page-titles mx-0" >
                <div class="col p-md-0" >
                    <ol class="breadcrumb" >
                        <li class="breadcrumb-item"><a href="javascript:void(0)">회원 관리</a></li>
                        <li class="breadcrumb-item active"><a href="javascript:void(0)">회원 목록</a></li>
                    </ol>
                </div>
            </div>
            <!-- row -->

            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4 col-xl-3">
                        <div class="card">
                            <div class="card-body">
                                <div class="media align-items-center mb-4">                                   
                                    <div class="media-body">
                                        <h3 class="mb-0">클릭한 유저 이름</h3>
                                        <p class="text-muted mb-0">닉네임 표시</p>
                                    </div>
                                </div>
                                
                                <h4>계정 정보</h4>
                                
                                <ul class="card-profile__info">
                                    <li class="mb-1"><strong class="text-dark mr-4">생년월일</strong> <span>00-00-00</span></li>
                                    <li class="mb-1"><strong class="text-dark mr-4">Mobile</strong> <span>01793931609</span></li>                             	
                                    <li><strong class="text-dark mr-4">Email</strong> <span>name@domain.com</span></li>
                                    <li class="mb-1"><strong class="text-dark mr-4">생성일</strong> <span>0000-00-00</span></li>                                
                                </ul>
                                
                               
                                <div class="row mb-5">
                                    <div class="col">
                                        <div class="card card-profile text-center">
                                            <span class="mb-1 text-primary"><i class="icon-people"></i></span>
                                            <h3 class="mb-0">정상(상태)</h3>
                                            <p class="text-muted px-4">상태 정보</p>
                                        </div>
                                    </div>
                                    
                                    <table>
                                    
                                    <tr>
                                    	<td>
	                                    	<div class="col-12 text-center" id="StatusBtn1">
	                                        <button class="btn">복구하기</button>
	                                    	</div>
                                    	</td>
                                    	
                                    	<td>
	                                    	<div class="col-12 text-center" id="StatusBtn2">
	                                        <button class="btn">탈퇴하기</button>
	                                    	</div>
                                    	</td>
                                    </tr>
                                    <tr>
                                    	<td>
                                    		<div class="col-12 text-center" id="StatusBtn3">
                                        <button class="btn">댓글X</button>
                                    </div>
                                    	</td>
                                    		
                                    	<td>
	                                    	<div class="col-12 text-center" id="StatusBtn4">
	                                        <button class="btn">게시글X</button>
	                                   		 </div>
                                    	</td>
                                   	</tr>
                                    <tr>
                                    	<td colspan="2">
	                                    	<div class="col-12 text-center" id="StatusBtn5">
	                                        <button class="btn">댓,게시글X</button>
	                                    	</div> 
                                    	</td>                                    
                                    </tr>
                                                                                                                                                                       
                                    </table> 
                                                                     
                                    
                                </div>

                                
                            </div>
                        </div>  
                    </div>
                    <div class="col-lg-8 col-xl-9">
                        <div class="card">
                            <div class="card-body">
                                <form action="#" class="form-profile">
								
								<div class="card-body" style="text-align: center;">
									<div id="up">
										<div id="down" class="input-group-prepend">
											<form id="searchForm" class="form-inline" action="insert.fl"
												method="post">

												<div class="input-group text-center mb-3">
													<input type="text" class="form-control"
														placeholder="검색할 게시글 작성" name="followId" size="35%">
													<div class="input-group-append">
														<button id="iconMsg" class="btn" type="button"
															onclick="searchId();">검색</button>
														<button id="byefr" class="btn" type="reset">취소</button>
													</div>
												</div>
											</form>
										</div>
									</div>                                   
									 </div>
                                    <div class="d-flex align-items-center">
                                        <ul class="mb-0 form-profile__icons">
                                            <li class="d-inline-block">
                                                <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-user"></i></button>
                                            </li>
                                            <li class="d-inline-block">
                                                <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-paper-plane"></i></button>
                                            </li>
                                            <li class="d-inline-block">
                                                <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-camera"></i></button>
                                            </li>
                                            <li class="d-inline-block">
                                                <button class="btn btn-transparent p-0 mr-3"><i class="fa fa-smile"></i></button>
                                            </li>
                                        </ul>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <div class="card">
                            <div class="card-body">
                                <div class="container-fluid" >
                <div class="row">
                    <div class="col-lg-6" style="margin-left: auto; margin-right: auto;">
                        <div class="card" >
                            <div class="card-body">
                                <div class="card-title">
                                    <h4>카테고리 목록</h4>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>번호</th>
                                                <th>카테고리</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        	<%-- <%if(list.isEmpty()){ %> --%>
                                            <tr>
                                                <td colspan="2">조회된 리스트가 없습니다.</td>                                                
                                            </tr>
                                            <%-- <%}else{ %>
												<% for(Category c : list){ %> --%>
                                            <tr>
                                                <td>1<%-- <%= c.getCategoryNo() %> --%></td>
                                                <td>1<%-- <%= c.getCategoryName() %> --%></td>                                             
                                            </tr>
                                            	<%-- <%} %>
											<%} %> --%>
                                        </tbody>
                                    </table>
                                </div>
                             	<div class="general-button" align="right">
                             		<%--<% if(loginUser != null){ --%>
									<%--<% } --%>
								</div>
                            </div>
                        </div>
                    </div>
                 </div>
               </div> 
                                </div>
                            </div>
                            
             
            <!-- #/ container -->
        </div>
        </div>
        <!--**********************************
            Content body end
        ***********************************-->
	<%@ include file="../common/footer.jsp"%>
</body>
</html>