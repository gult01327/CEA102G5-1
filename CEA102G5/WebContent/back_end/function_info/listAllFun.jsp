<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Function List</title>
</head>
<body>

		
		<h1>權限列表</h1>
		<jsp:useBean id="funiSvc" class="com.function_info.model.FuniService"/>
<table>
			<tr>
				<th>ID</th>
				<th>名稱</th>
				<th>編輯</th>
			</tr>

			<c:forEach var="funiVO" items="${funiSvc.all}">
				<tr>
					<td>${funiVO.funID}</td>
					<td>${funiVO.funName}</td>
					<td>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/function_info/funi.do">
						<input type=hidden name=funID value=${funiVO.funID}>
						<input type=hidden name=action value=forUpdate>
						<input type=submit value=修改>
					</form>
					
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/function_info/funi.do">
						<input type=hidden name=funID value=${funiVO.funID}>
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