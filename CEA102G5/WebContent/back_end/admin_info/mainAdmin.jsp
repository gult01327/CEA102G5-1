<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<title>Manage Admin</title>
</head>
<body>
<c:if test="${empty sessionScope.account}">
	<%session.setAttribute("location", request.getRequestURI());%>
	<%response.sendRedirect(request.getContextPath()+"/back_end/back_end_login.jsp");%>
</c:if>
<h1>後台管理</h1>
	<a href='<%=request.getContextPath()%>/back_end/back_end_index.jsp'>後台首頁</a>
	<a href='<%=request.getContextPath()%>/back_end/function_info/mainFun.jsp'>功能管理</a>
	<a href='<%=request.getContextPath()%>/back_end/admin_info/addAdmin.jsp'>新增後臺管理員帳號</a>
	<a href='<%=request.getContextPath()%>/back_end/admin_info/listAllAdmin.jsp'>後臺管理員列表</a>
</body>
</html>