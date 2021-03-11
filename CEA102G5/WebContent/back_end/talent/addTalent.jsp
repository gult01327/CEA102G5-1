<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Talent</title>
</head>
<body>

		<H1>新增專長</H1>
<c:if test="${!empty errorMsgs}">
		<ul>
			<c:forEach var="error" items="${errorMsgs}">
				<li style="color:red">${error.key} : ${error.value}</li>
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
		<p>名稱
		<p>
			<input type=text name=talName>
			<input type="hidden"name="action" value="add">
			<input type=submit value=新增>
	</form>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>