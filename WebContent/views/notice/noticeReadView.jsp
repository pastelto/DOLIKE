<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.notice.model.vo.Notice"%>
<%
	Notice n = (Notice)request.getAttribute("notice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 공지사항</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
<style>
	#updateBtn, #deleteBtn{
		color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	
	#updateBtn:hover, #deleteBtn:hover{
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
	#bodyScroll::-webkit-scrollbar{
		width:10px;
	}
	#bodyScroll::-webkit-scrollbar-thumb{
		background-color: #78c2ad;
		border-radius:10px;
	}
	
	#bodyScroll::-webkit-scrollbar-track{
		background-color: #ffe6f2;
		border-radius:10px;
		box-shadow : inset 0px 0px 5px white;
	}
</style>


</head>
<body>
    <div id="main-wrapper">
	<%@ include file="../common/menuSideBar.jsp"%>

	<div class="content-body">
		    <div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">공지사항</li>
                        <li class="breadcrumb-item active">공지사항</li>
                    </ol>
                </div>
            </div>
	
		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-10" style="margin: 0 auto;">
					<h1 style="text-align: center; color: #78c2ad">
						<b>공지사항</b>
					</h1>
					<br>
					<div class="card">
						<div class="card-body" style="background: rgb(248, 249, 250)">
							<div class="read-content">
								<div class="media pt-1">
									<div class="media-body">
										<h2 class="m-0" style="text-align: center">
											<b><%= n.getNoticeTitle() %></b>
										</h2>
									</div>
								</div>
								<hr>
								<div class="media mb-4 mt-1">
									<div class="media-body">
										<small class="float-right" style="color: #888">등록일: <%= n.getCreateDate() %>&nbsp;&nbsp;&nbsp;조회수: <%= n.getCount() %></small>
										<br><br>
										<div id="bodyScroll" style="overflow:auto; height:400px;">
										<p style="text-align: center"><%= n.getNoticeContent() %></p>
										</div>
									</div>
								</div>
								<hr>
								<div align="center">
									<button id="returnBtn" class="btn btn-sm" onclick="location.href='<%=contextPath%>/noticeView.no'">돌아가기</button>
									<% if(loginUser != null && loginUser.getUserId().equals("admin")) { %>
										<br>
										<div class="float-right">
										<button id="updateBtn" type="button" class="btn btn-sm" onclick="location.href='updatePage.no?nno=<%=n.getNoticeNo()%>'">수정하기</button>
										<button id="deleteBtn" type="button" class="btn btn-sm" onclick="location.href='delete.no?nno=<%=n.getNoticeNo()%>'">삭제하기</button>
										</div>
									<% }%>
								</div>
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