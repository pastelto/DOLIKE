<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.Date, java.text.SimpleDateFormat"%>
<%
	Date date = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	String today = sdf.format(date);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 공지사항 등록</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">

<!-- Custom Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">
<style>
	#returnBtn {
    	color: #fff;
    	background-color: #78c2ad;
    	border-color: #78c2ad;
	}
	#returnBtn:hover {
		color: #78c2ad;
		background-color: #fff;
	}
	#enrollBtn, #resetBtn {
    	color: #fff;
    	background-color: #f3969a;
    	border-color: #f3969a;
	}
	#enrollBtn:hover, #resetBtn:hover {
		color: #f3969a;
		background-color: #fff;
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
                        <li class="breadcrumb-item active">공지사항 등록</li>
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
							<div class="card-body">
								<div class="compose-content mt-3">
									<form action="<%=contextPath%>/noticeInsert.no" method="post">
										<div class="row">
											<div class="col-8">
												<div class="form-group">
													<input type="text" class="form-control bg-transparent"
														placeholder="제목을 입력하세요." name="title">
												</div>
											</div>
											<div class="col-4">
												<div class="form-group">
												<table style="text-align: center; width: 100%">
													<tr>
													<th>타입 설정: </th>
													
													<td><input type="radio" name="topView" value="A"> 상단노출</td>
													<td><input type="radio" name="topView" checked="checked" value="B"> 일반노출</td>
													<tr>
													</table>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-12">
												<div class="form-group">
													<textarea class="textarea_editor form-control bg-light"
														rows="15" placeholder="내용을 입력하세요." style="resize: none;"
														name="content"></textarea>
												</div>
											</div>
										</div>
										<div class="text-center m-t-15">
											<div>
												<button type="submit" id="enrollBtn" class="btn btn-sm">등록하기</button>
												<button type="reset" id="resetBtn" class="btn btn-sm">취소하기</button>
											</div>
											<br>
											<button id="returnBtn" type="reset" class="btn btn-sm float-right" onclick="location.href='<%=contextPath%>/noticeView.no'">돌아가기</button>
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