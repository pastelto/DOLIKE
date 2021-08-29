<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, com.kh.message.model.vo.*, java.text.*"%>
<%

%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>DO LIKE - 받은쪽지함</title>
    <!-- Favicon icon -->
    <link rel="icon" type="image/png" sizes="16x16" href="./images/do_32.png">
    <!-- Custom Stylesheet -->
    <link href="./css/style.css" rel="stylesheet">
<style>
	.text-primary{
		color:#78c2ad;
	}


</style>
</head>

<body>


		<div class="container mt-3">
		  <h2>Activate Modal with JavaScript</h2>
		  <!-- Trigger the modal with a button -->
		  <button type="button" class="btn btn-primary" id="myBtn">Open Modal</button>
		
		  <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">Modal Heading</h4>
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body">
		          <div class="email-list m-t-15">
									<div class="table-responsive">
									<div class="col-mail col-mail-2">
									<table class="table table-hover" style="text-align: center;">
										<thead>
											<tr style="background-color: #78c2ad; color: white;">
												<th style="width:3rem;">아이디</th>
												<th style="width:5rem;">별명</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
										<tr>
										 	<td><input type="checkbox" value=""/></td>
										 	<td>아이디</td>
											<td>별명</td>
											<td><button id="selectBtn" onclick="">선택</button></td>
										 </tr>	
										 		</tbody>
									</table>
		        </div>
		        </div>
		        </div>
		        </div>
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
		        </div>
		        
		      </div>
		    </div>
		  </div>
		  
		</div>
		
		<script>
		$(document).ready(function(){
		  $("#myBtn").click(function(){
		    $("#myModal").modal();
		  });
		});
		</script>

</body>

</html>