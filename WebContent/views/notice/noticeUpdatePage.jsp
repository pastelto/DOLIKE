<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
    
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 공지사항 수정</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<style>
	#updateBtn{
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#updateBtn:hover{
		color: #f3969a;
    	background-color: #fff;
    	border-color: #f3969a;
	}
	
	#returnBtn{
		color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#returnBtn:hover{
		color: #78c2ad;
    	background-color: #fff;
    	border-color: #78c2ad;
	}
</style>
</head>
<body>
 <div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>

	
	<div class="content-body">
		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-10" style="margin: 0 auto;">
					<h1 style="text-align: center; color: #78c2ad">
						<b>공지사항-수정</b>
					</h1>
					<br>
					<div class="card">
						<div class="card-body">
							<div class="compose-content mt-3">
								<form action="<%=contextPath%>/update.no" method="post">
									<input type="hidden" name="nno" value="<%= n.getNoticeNo() %>">
									<div class="form-group">
										<input type="text" class="form-control bg-transparent" name="title" value="<%= n.getNoticeTitle() %>">
									</div>
									<div class="form-group">
										<textarea class="textarea_editor form-control bg-light"
											rows="15" style="resize: none;"
											name="content"> <%= n.getNoticeContent() %> </textarea>
									</div>
									<div class="text-center m-t-15">
										<button id="updateBtn" type="submit" class="btn btn-sm">수정하기</button>
										<button id="returnBtn" type="reset" class="btn btn-sm" onclick="location.href='<%=contextPath%>/noticeView.no'">돌아가기</button>
									
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@ include file="../common/footer.jsp"%>
	</div>

</body>
</html>