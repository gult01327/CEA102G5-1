<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.admin_info.model.*"%>

<%
  AdmiVO admiVO = (AdmiVO) request.getAttribute("admiVO");
%>
<html>
<head>
<meta charset="UTF-8">
<title>update admin</title>
</head>
<body>

<style>
	.tittle{
	background-color:#rgb(179, 217, 217) !important;
	text-align:center;
	margin-bottom:10px;
	}

</style>


		<h4 class="tittle">修改後台帳號</h4>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
	
		<fieldset>
		
		<label for=admName>姓名</label><span style="color:red">${errorMsgs.admName}</span><br>
		<input id=admName type="text" class="form-control" placeholder="Text input" name=admName value="${admiVO.admName}" required="required"><br>
		<label for=admAccount>帳號</label><span style="color:red">${errorMsgs.admAccount}</span><br>
		<input id=admAccount type="text" class="form-control" placeholder="Text input" name=admAccount value="${admiVO.admAccount}" required="required"><br>
		<label for=admPassword>密碼</label><span style="color:red">${errorMsgs.admPassword}</span><br>
		<input id=admPassword type="text" class="form-control" placeholder="Text input" name=admPassword value="${admiVO.admPassword}" required="required"><br>
		</fieldset>
		<fieldset>
		<legend>權限:</legend><span style="color:red">${errorMsgs.funIDs}</span><br>
		<jsp:useBean id="funiSvc" class="com.function_info.model.FuniService"></jsp:useBean>
		<jsp:useBean id="autSvc" class="com.authority.model.AutService"></jsp:useBean>
		<c:forEach var="funiVO" items="${funiSvc.all}">
		<input name=funID id="${funiVO.funID}" type=checkbox value="${funiVO.funID}" ${autSvc.check(admiVO.admID,funiVO.funID) ? "checked":""} />

		<label for=${funiVO.funID}>${funiVO.funName}</label><br>
		</c:forEach>
		</fieldset>
		<br>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="admID" value="<%=admiVO.getAdmID()%>">
		<input type="submit" value="送出修改">
	</form>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>


</body>
</html>