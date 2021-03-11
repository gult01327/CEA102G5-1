<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin List</title>
</head>
<body>
	
		<h1>功能列表</h1>
<jsp:useBean id="admiSvc" class="com.admin_info.model.AdmiService"/>
<table>
			<tr>
				<th>ID</th>
				<th>名稱</th>
				<th>編輯</th>
			</tr>

			<c:forEach var="admiVO" items="${admiSvc.all}">
				<tr>
					<td>${admiVO.admID}</td>
					<td>${admiVO.admName}</td>
					<td>${admiVO.admAccount}</td>
					<td>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
						<input type=hidden name=admID value=${admiVO.admID}>
						<input type=hidden name=action value=forUpdate>
						<input type=submit value=修改>
					</form>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
						<input type=hidden name=admID value=${admiVO.admID}>
						<input type=hidden name=action value=del>
						<input type=submit value=刪除>
					</form>
					</td>
				</tr>
			</c:forEach>
		</table>
		
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>



</body>
</html>