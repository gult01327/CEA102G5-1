<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.member.model.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO"); //CartServlet.java(Controller), �s�Jreq��comVO����
%>
<%MemVO memVO = (MemVO) session.getAttribute("memVO"); %>

<html>
<head>
<title>�ӫ~���</title>

<style>
#wrapper {
	width:920px;
	margin:50px auto;
}

#wrapper #left{
	width:520px;
	float:left;
    
}

#wrapper #right{
    
}
</style>

</head>
<body bgcolor=#E8FFE8>


<table id="table-1">
	<tr>
		<td>
			 <h3>�ӫ~���</h3>
			 <h4><a href="<%=request.getContextPath() %>/back_end/commodity/comSelectPage.jsp">�^����</a></h4>
		</td>
	</tr>
	
	<tr>
		<td>
			<font><a href="<%=request.getContextPath() %>/front_end/commodity/comindex.jsp">�^�ӫ�����</a></font>
		</td>
	</tr>
	<%CartService cartSvc = new CartService(); 
	%>
	<tr>
	<%if(memVO==null){ %>
		<td><a href="<%=request.getContextPath()%>/front_end/member/login.jsp">�|���n�J</a></td><br>
		<%session.setAttribute("comVO", comVO); %>
		<%}else{ %>
		<td>
		<%List list = cartSvc.getAllByMemID(memVO.getMemID());%>
			<font color="red">${memVO.memName}�z�n! �z��<a href="<%=request.getContextPath() %>/front_end/commodity/listAllCart2.jsp">�ʪ���</a>���@��:<%=list.size()%> ���ӫ~</font>
		</td>
		<br>
		<td>
		<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/front_end/member/mem.do">
		<br><input type="submit" value="�|���n�X">
		<input type="hidden" name="action"	value="logout">
		</FORM>
		</td>
		<%} %>
	</tr>
</table>


<div id="wrapper">
	<div id="left">
		<img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="350" width="350"><br>
		<font color="blue" size="7">${comVO.comName}</font><br><br>
		<font size="5">${comVO.comWeight}${comVO.comUnit} /��</font><br>
		<font size="5">��� $ ${comVO.comPrice}</font>
	</div>

	<div id="right">
    <font size = "6"><b>�ӫ~²�� :</b><br> ${comVO.comContent}</font><br>
    <font size = "6"><b>�ӫ~���q</b> : ${comVO.comCal}</font><br>
    <font size = "6"><b>�ӫ~�Ҥ��ƦX���t�q</b> : ${comVO.comCarb}</font><br>
    <font size = "6"><b>�ӫ~�J�ս�t�q</b> : ${comVO.comPro}</font><br>
    <font size = "6"><b>�ӫ~�׽�t�q</b> : ${comVO.comFat}</font><br>
    <font size = "6"><b>�ӫ~�S��</b> : ${comVO.comProp}</font><br>
    <br><br><br><br><br><br><br>
    <form method="post" action="<%=request.getContextPath()%>/front_end/cart/comCart.do">
    <img src="<%=request.getContextPath()%>/resource/images/cart.jpg" width="65px" height="45px">
    <input type="submit" class="button" value="��J�ʪ���">
    <input type="text" name="cardCount" size="3" value=1>
      <input type="hidden" name="comID" value="${comVO.comID}">
      <input type="hidden" name="action" value="ADD">
      <input type="hidden" name="memID" value="${memVO.memID}">
      <input type="hidden" name="location" value="<%=request.getServletPath()%>">      
    </form>
	</div>
	
	<script>
<c:if test="${!empty comVO}">
	comID = ${comVO.comID};
</c:if>
</script>
	
</div>

</body>
</html>