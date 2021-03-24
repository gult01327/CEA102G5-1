<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admin_info.model.*"%>
<!DOCTYPE html>



<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="author" content="Kodinger">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>My Login Page</title>
	
	
	<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/my-login.css">
</head>

<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="brand">
						<img src="<%=request.getContextPath()%>/resource/images/logo.png" alt="logo">
					</div>
					
					
					
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">後臺登入</h4>
							<form method="POST" class="my-login-validation" ACTION="<%=request.getContextPath()%>/admin_info/admi.do">
							
					<div class="form-check">
  						<input class="form-check-input" type=radio name="identity" id="admin" required="required" value= >
  							<label class="form-check-label" for="admin">
   								 管理員
 									 </label>
											</div>
					<div class="form-check">
 						 <input class="form-check-input" type=radio name="identity" id="couch" value="coach"${(param.identity == "coach")?'checked':''}>
  								<label class="form-check-label" for="couch">
    									教練
  											</label>
										</div>
							
								<div class="form-group">
									<label for=account>帳號</label>
									<input id="account" type="test" class="form-control" name="account" value="${param.account}" 
									required="required" autofocus="autofocus" placeholder="請輸入帳號" >
									<span style="color:red">${errorMsgs.account}</span>
									
								</div>

								<div class="form-group">
									<label for="password">密碼
<!-- 										<a href="newforgot.jsp" class="float-right"> -->
<!-- 											忘記密碼? -->
										</a>
									</label>
									<input id="password" type="password" class="form-control" name="password"  value="${param.password}" 
									required="required" autofocus="autofocus" placeholder="請輸入密碼" data-eye>
									<span style="color:red">${errorMsgs.password}</span>		
									<span style="color:red">${errorMsgs.status}</span>					    
								</div>								
								
								<br>

								<div class="form-group m-0">
									<input type="hidden" name="action" value="login"> 
									<button type="submit" class="btn btn-primary btn-block">
										登入
									</button>
								</div>
<!-- 								<div class="mt-4 text-center"> -->
<!-- 									Don't have an account? <a href="newregister.jsp">Create One</a> -->
<!-- 								</div> -->
							</form>
						</div>
					</div>
					<div class="footer">
						Copyright &copy; 2021 &mdash; EATTING
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<script src="<%=request.getContextPath()%>/resource/jquery/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/popper/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resource/js/my-login.js"></script> 

</body>
</html>
