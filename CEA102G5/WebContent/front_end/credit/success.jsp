<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%response.setHeader("Refresh", "3;URL=/CEA102G5/front_end/member/login.jsp"); %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <meta http-equiv="refresh" content="3;url=http://www.google.com"> -->
<title>Insert title here</title>
</head>
<body style="text-align:center; vertical-align:center;">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<div style="margin-top:200px;">
		<img src="<%=request.getContextPath()%>/resource/images/success.png" style="width:100px; height:100px;">
		<span style="font-size:xx-large;">付款成功! </span> 
		<span id='second' style="font-size:xx-large;">5</span> 
		<span style="font-size:xx-large;">秒後跳轉</span>
	</div>
	
	<script type="text/javascript">
		function showSec(i){
			$("#second").text(i);
			--i;
		}
		
		$(document).ready(function(){
			let i = $("#second").text();
			setTimeout(showSec(i),1000);
		});
	
	</script>
</body>
</html>