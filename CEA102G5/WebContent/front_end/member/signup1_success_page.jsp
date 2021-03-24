<%@ page language="java" contentType="text/html; charset=BIG5"
	pageEncoding="BIG5"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>login_success_page</title>

　

</head>
<body>
<p align="center" valign="center"><font style="color:red" size="5">註冊已成功,請至信箱收取驗證信.</font></p>
	<script language=javascript>
		setTimeout('window.location="<%=request.getContextPath()%>/front_end/front_end_index.jsp"', 2000)
	</script>

</body>
</html>