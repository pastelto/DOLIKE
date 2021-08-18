<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 공지사항</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<!-- Custom Stylesheet -->
<link href="../../css/style.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../common/menuSideBar.jsp"%>

	<div class="content-body" style="height: 600px">
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
											<b>제목 들어가는 부분</b>
										</h2>
									</div>
								</div>
								<hr>
								<div class="media mb-4 mt-1">
									<div class="media-body">
										<small class="float-right" style="color: #888">작성일자 부분</small><br>
										<small class="float-right" style="color: #888">조회수 부분</small>
										<br>
										<p>내용 들어가는 부분</p>
									</div>
								</div>

								<div class="text-right">
									<button class="btn btn-primaryw-md m-b-30" type="button">Send</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>