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
<style>
	#tittle{
	text-align:center;
	margin-bottom:10px;
	}
	#inputHelpBlock{
	width:400px;
	}
	.addadmin{
	height:70%;
	margin-left:200px;
	margin-right:200px;
	padding:20px;
	box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:5px;
	
	}
	.getfun{
	margin-left:40px;
	margin-top:-10px;
	margin-bottom:10px;
	display:flex;
	}
	.onefun{
	margin-right:10px;
	}
	.addbtn{
	margin-left:380px;
	margin-bottom:10px;
	}
	.h5{
	text-align:center;
	margin-bottom:20px;
	}
	.abc{
	margin-left:30px;
	}
	.zxc{
	margin-left:30px;
	margin-bottom:20px;
	font-size:17px;
	}
</style>

		
		<h4 id="tittle" class="page-title text-center" style='color:black;'>Add Addministrator</h4>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
	
		<fieldset class="addadmin">
		<h5 class="h5">基本資訊</h5>
		<div class="abc">
		<label for=admName>姓名</label><span style="color:red">${errorMsgs.admName}</span><br>
		<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock" id=admName type=text name=admName value="${requestScope.admiVO.admName}" required="required"><br>
		</div>
		<div class="abc">
		<label  for=admAccount>帳號</label><span style="color:red">${errorMsgs.admAccount}</span><br>
		<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock" id=admAccount type=text name=admAccount value="${requestScope.admiVO.admAccount}" required="required"><br>
		</div>
		<div class="abc">
		<label  for=admPassword>密碼</label><span style="color:red">${errorMsgs.admPassword}</span><br>
		<input type="text" id="inputHelpBlock" class="form-control" aria-describedby="helpBlock" id=admPassword type=text name=admPassword value="${requestScope.admiVO.admPassword}" required="required"><br>
		</div>
		<label class="zxc">權限</label><span style="color:red">${errorMsgs.funIDs}</span><br>
		<div class="getfun">
		<jsp:useBean id="funiSvc" class="com.function_info.model.FuniService"></jsp:useBean>
		<c:forEach var="funiVO" items="${funiSvc.all}">
		<div class="onefun">
		<input name=funID id=${funiVO.funID} value=${funiVO.funID} type=checkbox>
		<label for=${funiVO.funID}>${funiVO.funName}</label>
		</div>
		</c:forEach>
		</div>
		<div class="addbtn">
		<input type=hidden name=action value=add>
		<input type=submit value=新增>
		</div>
		</fieldset>
		
	</form>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>



</body>
</html>