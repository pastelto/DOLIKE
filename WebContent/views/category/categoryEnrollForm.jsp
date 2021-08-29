<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//String contextPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>
	#formSize {
		height: 1000px;
		
	}
	

	#insertCategoryForm {		
		
	 	display: grid;
 	 	place-items: center;
 	 	min-height: 70vh;
		
	}
	
	#caForm {
		height: 200px;
		width: 600px;
	}
	
	
	#categoryCreateBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
</style>

</head>
<body>
<div id="main-wrapper">
<%@ include file="../common/menuSideBar.jsp" %> 
<div class="container-fluid" id="formSize">
	<div class="row">
<div id="insertCategoryForm" style="margin-left: auto; margin-right: auto;">
<div class="col-lg-12" >
                        <div class="card" >
                            <div class="card-body"id="caForm">
                                <h4 class="card-title">게시판 생성하기</h4>
                                <form action="<%= contextPath %>/insert.ca" method="post" >
                                <div class="basic-form">
                                        <div class="form-group">
                                            <label>생성할 게시판의 이름을 작성해주세요.</label>
                                            <input type="text" class="form-control bg-transparent"  id="comment" name="caTitle"></input>
                                        </div>
                                    <div class="general-button" align="center">
                             		<%--<% if(loginUser != null){ --%>
                            		<button id="categoryCreateBtn"  type="submit" class="btn mb-1 btn-primary">게시판 생성하기</button>
									<%--<% } --%>
								</div>
                                </div>
                                 </form>
                            </div>
                        </div>
                    </div>
                  </div>
				</div>
			</div>
			<%@ include file="../common/footer.jsp" %>
		</div>
</body>
</html>