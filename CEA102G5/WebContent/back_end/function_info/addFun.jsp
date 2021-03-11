<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Function Add</title>
</head>
<body>



		
		<h1>新增權限</h1>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/function_info/funi.do">
		<p>名稱:</p><input type=text name=funName required="required"><span style="color:red">${errorMsgs.funName}</span>
		<input type=hidden name=action value=add>
		<input type=submit value=新增>
	</form>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>