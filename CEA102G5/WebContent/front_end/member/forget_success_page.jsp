<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>signup_success_page</title>


</head>
<body>
　<p align="center" valign="center"><font style="color:red" size="5" text-align:center>${success}</font></p>
<!--  <form action="updateStatus" method="post"> -->
<!-- 	<input type="hidden" name="action" value="updateStatus"> -->

	<script language=javascript>
		setTimeout('window.location="<%=request.getContextPath()%>/front_end/member/login.jsp"', 2000)
	</script>

</body>
</html>