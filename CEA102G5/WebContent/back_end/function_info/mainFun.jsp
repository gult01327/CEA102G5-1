<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manage Function</title>
</head>
<body>

<a href='<%=request.getContextPath()%>/back_end/back_end_index.jsp'>後台首頁</a>
	<a href='<%=request.getContextPath()%>/back_end/function_info/listAllFun.jsp'>功能列表</a>
	<a href='<%=request.getContextPath()%>/back_end/function_info/addFun.jsp'>新增功能</a>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>