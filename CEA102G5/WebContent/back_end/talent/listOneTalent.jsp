<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>One Result</title>
</head>
<body>
		
				<table border = 1 width = 200>
			<tr>
				<th>ID</th>
				<th>名稱</th>
				<th>編輯</th>
			</tr>
				<tr>
					<td>${talVO.talID}</td>
					<td>${talVO.talName}</td>
					<td>
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
						<input type=hidden name=talID value=${talVO.talID}>
						<input type=hidden name=action value=change>
						<input type=submit value=修改>
					</form>
					
					<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
						<input type=hidden name=talID value=${talVO.talID}>
						<input type=hidden name=action value=del>
						<input type=submit value=刪除>
					</form>
					</td>
				</tr>
		</table>
	
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

		

</body>
</html>