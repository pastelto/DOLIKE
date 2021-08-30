<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.ArrayList, com.kh.challenge.model.vo.*"%>
<%
	ArrayList<ChallengeVote> list = (ArrayList<ChallengeVote>)request.getAttribute("list"); 

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DO LIKE - 챌린지</title>
<!-- Favicon icon -->
<link rel="icon" type="image/png" sizes="16x16"
	href="./images/do_32.png">
<style>
	* {
	box-sizing: border-box;
}
	#voteBtn{
		padding: 5px;
   		width: 100%;
	}
	#robster{
		font-family: 'Lobster', cursive;
		color:#ffce67;	
	}
	#inline-vote_common{
		display:inline-block; !important
	}
	.container, .container-fluid{
		display: block;
	}

	#borderPink{
		border:1px;
		border-color:#f3969a;
	}

	#voteBtn {
		vertical-align: middle;
		border-radius: 0.25rem;
		background-color : #f3969a;
		border-color:#f3969a;
		color: #fff;
		width:100px;
	}
	#voteBtn:hover{
		background-color:#fff;
		color: #f3969a;
		border-color:#f3969a;
	}
	#card-vt{
		background-color:#fff;
		border-color:#f3969a;
	}
	#header-vt, #body-vt, #footer-vt{
		background-color:#fff;
		border: none;
	}
	#footer-vt{
		text-align :center;
	}
	
</style>
</head>
<body>
	<div id="main-wrapper">
		<%@include file="../common/menuSideBar.jsp"%>
		<div class="content-body">
			<div class="row page-titles mx-0">
                <div class="col p-md-0">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">챌린지</li>
                        <li class="breadcrumb-item active">챌린지 투표</li>
                    </ol>
                </div>
            </div>
            <div class="col-1"></div>
             <div class="container-fluid">
				<div class="row">	
				<div class="col-12 m-b-30">				
				<div class="votingBanner" style="text-align:center">
					<img src="./resources/challenge_upfiles/투표진행중.png" alt="vote banner" class="voting" align="center" width="1350px"><br><br>				
					</div>					
					<div class="row" style="margin-left:130px; margin-right:130px; margin-top:30px;" width="100%">						
						<%if(!list.isEmpty()){%>
							<% for(int i = 0; i < list.size(); i++) { %>
							<div class="col-lg-4" id="inline-vote">
								<form action="<%=contextPath%>/upVote.ch" method="post" id="voteMe">
									<div class="card" id="card-vt">
										<div class="card-header bg-white" id="header-vt">
											<img src="./resources/challenge_upfiles/check.png" alt="null-my" class="null-my" width="30px" height="30px">
											<h5 align="center"><input type="hidden" class="card-title" style="text-align:center" name="chTitle" value="<%= list.get(i).getChTitle()%>"/><%= list.get(i).getChTitle()%></h5><!-- 챌린지 타이틀 -->
										</div>
										<div class="card-body" id="body-vt">
											<p class="card-text"><%= list.get(i).getContent()%></p><!-- 챌린지 설명 -->
										</div>
										<div class="card-footer" id="footer-vt">									
											<button class="btn btn-dark m-b-30 m-t-15 f-s-14 p-l-20 p-r-20" type="button" id="voteBtn" onclick="voteMe()";>
													<i class="fa fa-paper-plane m-r-5"></i> Vote ME!
											</button>
																			
										</div>
									</div>
								</form>
								</div>
							 <%}%>
						<%} %>										
					</div>
				</div>
			</div>
			</div>
		</div>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>

<script>
	function voteMe(){			
			Swal.fire({
				 text: '투표하시겠습니까?',  
	             icon: 'question',                              
	             confirmButtonText: '확인',               
	             showCancelButton: true,                 
	             cancelButtonText: '취소',                
	             cancelButtonColor: "#f3969a",
	             confirmButtonColor: "#78c2ad",
            }).then((result) =>{ 
               if(result.value) {                              
                	$("#voteMe").submit();
                	$("#voteBtn").attr("disabled",true);
	            } else if(result.dismiss === 'cancel') {    
	            	Swal.fire({
						 text: '취소되었습니다',
						 icon: 'error',
						 confirmButtonColor: "#78c2ad"
					});
   				} 
            });
       	          	  
		}	
	
</script>	
</html>