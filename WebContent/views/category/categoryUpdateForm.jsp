<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.category.model.vo.*" %>
<%
	Category category = (Category)request.getAttribute("category");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>DO LIKE - 카테고리 수정</title>

<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<style>
	#formSizeUpdate {
		height: 1000px;
		
	}
	

	#updateCategoryForm {		
		
	 	display: grid;
 	 	place-items: center;
 	 	min-height: 70vh;
		
	}
	
	#caFormUpdate {
		height: 200px;
		width: 600px;
	}
	
	
	#categoryUpdateBtn2 {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
		
	#categoryListBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
</style>

</head>
<body>
	<div id="main-wrapper">
<%@ include file="../common/menuSideBar.jsp" %> 
<div class="container-fluid" id="formSizeUpdate">
	<div class="row">
<div id="updateCategoryForm" style="margin-left: auto; margin-right: auto;">
<div class="col-lg-12" >
                        <div class="card" >
                            <div class="card-body"id="caFormUpdate">
                                <h4 class="card-title">카테고리 수정하기</h4>
                                <form id="updateForm" action="<%= contextPath %>/update.ca" method="post" >
                                <input type="hidden" name="cno" value="<%= category.getCategoryNo() %>">
                                <div class="basic-form">
                                        <div class="form-group">
                                            <label>카테고리를 수정해주세요.</label>
                                            <input type="text" class="form-control bg-transparent"  id="comment" name="caName" value="<%= category.getCategoryName() %>"></input>
                                        </div>
                                    <div class="general-button" align="right">
                                    <button type="reset" id="categoryListBtn" class="btn mb-1 btn-primary" onclick="location.href='<%=contextPath%>/categoryList.ca'" >돌아가기</button>
                                   	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<%--<% if(loginUser != null && loginUser.getUserId().equals(b.getCategoryCreater())){ --%>
                            		<button id="categoryUpdateBtn2"  type="submit" class="btn mb-1 btn-primary">수정하기</button>									
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