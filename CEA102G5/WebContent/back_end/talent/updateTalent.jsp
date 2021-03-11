<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
    Object talVO = request.getAttribute("talVO");                  
    if (talVO == null) {                                           
      response.sendRedirect(request.getContextPath()+"/back_end/talent/mainTalent.jsp");
      return;
    }
%>
<html>
<head>

<meta charset="UTF-8">
<title>Update Talent</title>
</head>
<body>

		
		<H1>編輯專長</H1>

	<c:if test="${!empty errorMsgs}">
		<ul>
			<c:forEach var="error" items="${errorMsgs}">
				<li style="color:red">${error.key} : ${error.value}</li>
			</c:forEach>
		</ul>
	</c:if>

<c:if test="${!empty talVO}">
<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
<table>
		<tr><th>ID</th><th>名稱</th><th>儲存</th></tr>
<tr>
		<td>${talVO.talID}</td>
		<td><input type = text name=talName value = ${talVO.talName} ></td>
		<td>
		<input type=hidden name=talID value=${talVO.talID}>
		<input type=hidden name=action value=save>
		<input type=submit value=儲存>
		</td>
</tr>
</table>
</form>
</c:if>


<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>