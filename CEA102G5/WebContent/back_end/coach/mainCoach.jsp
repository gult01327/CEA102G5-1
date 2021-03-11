<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Manage Coach</title>
</head>
<body>

		<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<h1>教練管理</h1>

	<c:if test="${!empty errorMsgs}">
		<ul>
			<c:forEach var="error" items="${errorMsgs}">
				<li style="color:red">${error.key} : ${error.value}</li>
			</c:forEach>
		</ul>
	</c:if>
	<p>查詢</p>
		<form method=post action="<%=request.getContextPath()%>/back_end/coach/coa.do">
				<input type="number" name="coaID">
				<input type="hidden" name="action" value="search"> 
				<input type=submit value=送出>
			</form>
		
			<form method=post action="<%=request.getContextPath()%>/back_end/coach/coa.do">
				<select name=coaID>
				<c:forEach var="coaVO" items="${coaSvc.all}">
					<option value=${coaVO.coaID}>${coaVO.coaID}</option>
				</c:forEach>
				</select>
				<input type="hidden" name="action" value="search"> 
				<input type=submit value=送出>
			</form>
			<form method=post action="<%=request.getContextPath()%>/back_end/coach/coa.do">
				<select name=coaID>
				<c:forEach var="coaVO" items="${coaSvc.all}">
					<option value=${coaVO.coaID}>${coaVO.coaName}</option>
				</c:forEach>
				</select>
				<input type="hidden" name="action" value="search"> 
				<input type=submit value=送出>
			</form>
		<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>