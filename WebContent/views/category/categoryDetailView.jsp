<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.category.model.vo.*"%>
<%
	Category c = (Category)request.getAttribute("c");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>Insert title here</title>

<!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>

<!-- Custom Stylesheet -->
    <link href="../../css/style.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

<style>
	#formSizeDetail {
		height: 1000px;
		
	}
	

	#detailCategoryForm {		
		
	 	display: grid;
 	 	place-items: center;
 	 	min-height: 70vh;
		
	}
	
	#caFormDetail {
		height: 200px;
		width: 600px;
	}
	
	
	#categoryUpdateBtn {
		color: #fff;
		background-color: #78c2ad;
		border-color: #78c2ad;
	}
	
	#categoryDeleteBtn {
		color: #fff;
		background-color: #FF0033;
		border-color: #FF0033;
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
<div class="container-fluid" id="formSizeDetail">
	<div class="row">
<div id="detailCategoryForm" style="margin-left: auto; margin-right: auto;">
<div class="col-lg-12" >
                        <div class="card" >
                            <div class="card-body"id="caFormDetail">
                                <h4 class="card-title">카테고리 확인</h4>
                                <form action="<%= contextPath %>/insert.ca" method="post" >
                                <div class="basic-form">
                                        <div class="form-group">
                                            <label>카테고리를 확인하세요.</label>
                                            <input type="text" class="form-control bg-transparent"  id="comment" name="caTitleDetail" value="<%= c.getCategoryName() %>"></input>
                                        </div>
                                    <div class="general-button" align="right">
                                    <button type="reset" id="categoryListBtn" class="btn mb-1 btn-primary" onclick="location.href='<%=contextPath%>/categoryList.ca'" >돌아가기</button>
                                   	&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
									<%--<% if(loginUser != null && loginUser.getUserId().equals(b.getCategoryCreater())){ --%>
                            		<button id="categoryUpdateBtn"  type="button" class="btn mb-1 btn-primary"  >수정하기</button>
									<button id="categoryDeleteBtn"  type="button" class="btn mb-1 btn-primary" >삭제하기</button>									
									<%--<% } --%>
								</div>
                                </div>
                                 </form>
                                 
                                 <form action="" id="postForm" method="post">
								<input type="hidden" name="cno" value="<%= c.getCategoryNo() %>">
								</form>
								<script>
									function updateForm(){
										$("#postForm").attr("action", "<%=contextPath%>/updateForm.ca");
										$("#postForm").submit();
									}
									
									function deleteBoard(){
										$("#postForm").attr("action", "<%=contextPath%>/deleteC.ca");
										$("#postForm").submit();
									}
								</script>
                                 
                            </div>
                        </div>
                    </div>
                  </div>
				</div>
			</div>
		</div>
</body>
</html>