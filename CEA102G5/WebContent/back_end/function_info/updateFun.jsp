<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
    Object funVO = request.getAttribute("funVO");                  
    if (funVO == null) {                                           
      response.sendRedirect(request.getContextPath()+"/back_end/function_info/listAllFun.jsp");
      return;
    }
%>

<html>
<head>

<meta charset="UTF-8">
<title>Function Update</title>
</head>
<body>

		
		<h1>修改功能</h1>
	<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/function_info/funi.do">
		<p>名稱:</p><input type=text name=funName required="required" value="${funiVO.funName}"><span style="color:red">${errorMsgs.funName}</span>
		<input type=hidden name=funID value=${funiVO.funID}>
		<input type=hidden name=action value=update>
		<input type=submit value=更新>
	</form>


<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>


</body>
</html>