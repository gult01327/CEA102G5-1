<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<% MemVO memVO = (MemVO)session.getAttribute("memVO"); 
	if(memVO==null){
	String location = request.getServletPath();
	session.setAttribute("location", location);
	response.sendRedirect(request.getContextPath()+"/front_end/member/login.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�ӤH�D��</title>
</head>
<body>
<h2 class="page-title text-center" style='color:black;'>Member Page</h2>
<hr><p>
<img src="<%=request.getContextPath()%>/commodity/comPic.do${memVO.memPicSrc}&pic=1" height="100" width="100">
<h3>${memVO.memName} �z�n! �w��^��</h3>


</body>


</html>