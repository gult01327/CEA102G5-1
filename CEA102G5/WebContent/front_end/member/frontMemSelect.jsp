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
<body bgcolor="#E8FFE8">
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">�ӤH�D��</font>
<hr><p>
<img src="<%=request.getContextPath()%>/commodity/comPic.do${memVO.memPicSrc}&pic=1" height="100" width="100">
<h3>${memVO.memName} �z�n! �w��^��</h3>
<h4><a href="<%=request.getContextPath() %>/front_end/commodity/comindex.jsp">�ӫ�����</a></h4>

<ul>
  <li><a href='<%=request.getContextPath()%>/member/mem.do?action=getOne_For_Update&memID=${memVO.memID}'>�ק�|�����</a> </li>
</ul>


<ul>
  <li><a href='<%=request.getContextPath()%>/front_end/commodity/listAllCart2.jsp'>�d���ʪ���</a> </li>
</ul>

<ul>
  <li><a href='<%=request.getContextPath()%>/front_end/commodity/listOmbyMemID.jsp'>�d�ݭq��C��</a> </li>
</ul>

<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/member/addMem.jsp'>�d�ݰӫ~����</a> </li>
</ul>

<ul>
  <li><a href='<%=request.getContextPath()%>/front_end/recipe/recMemFavorite.jsp'>�d�ݭ��Ц���</a> </li>
</ul>

<ul>
  <li><a href='<%=request.getContextPath()%>/front_end/recipe/listRecbyMemID.jsp'>�d�ݭ��ЦC��</a> </li>
</ul>
</body>


</html>