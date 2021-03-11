<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Manage Talent</title>
</head>
<body>

		
<div id=view>
	<H1>專長管理</H1>
	<c:if test="${!empty errorMsgs}">
		<p style="color:red">Error Need Fix</p>
		<ul>
			<c:forEach var="error" items="${errorMsgs}">
				<li style="color:red">${error.key} : ${error.value}</li>
			</c:forEach>
		</ul>
	</c:if>
	<p class=toggleChange>查詢</p>
	<div  id=searchBlock>
		<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
			<p>編號</p>
			<input type=text name=talID>
			<input type="hidden" name="action" value="searchOneByID">
			<input type=submit value=搜尋>
		</form>
	<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
		<form METHOD="post" ACTION="<%=request.getContextPath()%>/talent/tal.do">
			<p>編號</p>
			<select name=talID>
			<c:forEach var="talVO" items="${talSvc.all}">
			<option value="${talVO.talID}">${talVO.talID}</option>
			</c:forEach>
			</select>
			<input type="hidden" name="action" value="searchOneByID"> 
			<input type=submit value=搜尋>
		</form>
		
		<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/talent/tal.do">
			<p>名稱</p>
			<select name=talID>
			<c:forEach var="talVO" items="${talSvc.all}">
			<option value="${talVO.talID}">${talVO.talName}</option>
			</c:forEach>
			</select>
			<input type="hidden" name="action" value="searchOneByID"> 
			<input type=submit value=搜尋>
		</form>
	</div>
	<br>
</div>	
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>