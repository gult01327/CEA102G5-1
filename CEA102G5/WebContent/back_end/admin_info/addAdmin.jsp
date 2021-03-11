<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Admin</title>
</head>
<body>


		
		<h1>新增後台帳號</h1>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
	
		<fieldset>
		<legend>基本資訊:</legend>
		<label for=admName>姓名</label><span style="color:red">${errorMsgs.admName}</span><br>
		<input id=admName type=text name=admName value="${admiVO.admName}" required="required"><br>
		<label for=admAccount>帳號</label><span style="color:red">${errorMsgs.admAccount}</span><br>
		<input id=admAccount type=text name=admAccount value="${admiVO.admAccount}" required="required"><br>
		<label for=admPassword>密碼</label><span style="color:red">${errorMsgs.admPassword}</span><br>
		<input id=admPassword type=text name=admPassword value="${admiVO.admPassword}" required="required"><br>
		</fieldset>
		<fieldset>
		<legend>權限:</legend><span style="color:red">${errorMsgs.funIDs}</span><br>
		<jsp:useBean id="funiSvc" class="com.function_info.model.FuniService"></jsp:useBean>
		<c:forEach var="funiVO" items="${funiSvc.all}">
		<input name=funID id=${funiVO.funID} value=${funiVO.funID} type=checkbox>
		<label for=${funiVO.funID}>${funiVO.funName}</label><br>
		</c:forEach>
		</fieldset>
		<input type=hidden name=action value=add>
		<input type=submit value=新增>
	</form>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>



</body>
</html>