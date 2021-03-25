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
	#tittle{
	text-align:center;
	margin-bottom:10px;
	}
	.form-control{
	width:400px;
	}
	.upadmin{
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
	.upbtn{
	margin-left:380px;
	margin-bottom:10px;
	}
	.h5{
	text-align:center;
	margin-bottom:20px;
	}
	.abc{
	margin-left:30px;
	width:400px;
	}
	
</style>


		<h4 id="tittle" class="page-title text-center" style='color:black;'>Update Addministrator</h4>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/admin_info/admi.do">
	
		<fieldset class="upadmin">
		<h5 class="h5">基本資訊</h5>
		<div class="abc">
		<label for=admName>姓名</label><span style="color:red">${errorMsgs.admName}</span><br>
		<input id=admName type="text" class="form-control" placeholder="Text input" name=admName value="${admiVO.admName}" required="required"><br>
		</div>
		<div class="abc">
		<label for=admAccount>帳號</label><span style="color:red">${errorMsgs.admAccount}</span><br>
		<input id=admAccount type="text" class="form-control" placeholder="Text input" name=admAccount value="${admiVO.admAccount}" required="required"><br>
		</div>
		<div class="abc">
		<label for=admPassword>密碼</label><span style="color:red">${errorMsgs.admPassword}</span><br>
		<input id=admPassword type="text" class="form-control" placeholder="Text input" name=admPassword value="${admiVO.admPassword}" required="required"><br>
		</div>
		<h6 class="abc">權限</h6>
		<span style="color:red">${errorMsgs.funIDs}</span><br>
		<div class="getfun">
		<jsp:useBean id="funiSvc" class="com.function_info.model.FuniService"></jsp:useBean>
		<jsp:useBean id="autSvc" class="com.authority.model.AutService"></jsp:useBean>
		<c:forEach var="funiVO" items="${funiSvc.all}">
		<div class="onefun">
		<input name=funID id="${funiVO.funID}" type=checkbox value="${funiVO.funID}" ${autSvc.check(admiVO.admID,funiVO.funID) ? "checked":""} />
		<label for=${funiVO.funID}>${funiVO.funName}</label>
		</div>
		</c:forEach>
		</div>
		<div class="upbtn">
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="admID" value="<%=admiVO.getAdmID()%>">
		<input type="submit" value="修改">
		</div>
		</fieldset>
		
	</form>
		
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>


</body>
</html>