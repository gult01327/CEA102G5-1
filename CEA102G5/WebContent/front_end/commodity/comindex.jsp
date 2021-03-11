<%@page import="com.cart.model.CartService"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.member.model.*"%>       

<%
 	ComService comSvc = new ComService();
 	List<ComVO> list = comSvc.getAllForComindex();
 	pageContext.setAttribute("list",list);//���F����
%>
<%MemVO memVO = (MemVO) session.getAttribute("memVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">

<title>�Ҧ��ӫ~��� </title>
<style>
		#cf{
			text-align: center;
			width: 80%;
			margin: 20px auto;
		}
		#cf div{
			width: 32%;
			float: left;
			margin-right: 10px;
			margin-top: 10px;
		}
		#cf div img{
			width: 80%;
			height: 150px;
		}
		#cf div p{
			color:#999;
			text-align: center;
		}
</style>
</head>
<body bgcolor=#E8FFE8>
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">�ӫ��D��</font>
<hr><p>

		<h4><a href="<%=request.getContextPath() %>/back_end/commodity/comSelectPage.jsp">�^����</a></h4>
			
	<%CartService cartSvc = new CartService(); %>
	<tr>
		<%if(memVO==null){ %>
		<td><a href="<%=request.getContextPath()%>/front_end/member/login.jsp">�|���n�J</a></td><br>
		<%}else{ %>
		<%List cartlist = cartSvc.getAllByMemID(memVO.getMemID());%>
		<td>
			<font color="red">${memVO.memName}�z�n! �z��<a href="<%=request.getContextPath() %>/front_end/commodity/listAllCart2.jsp">�ʪ���</a>���@��:<%=cartlist.size()%> ���ӫ~</font>
			<br><a href="<%=request.getContextPath() %>/front_end/member/frontMemSelect.jsp">�ӤH�D��</a><br><br>
		</td>
		<td>
		<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/front_end/member/mem.do">
		<input type="submit" value="�|���n�X">
		<input type="hidden" name="action"	value="logout">
		</FORM>
		</td>
		<%} %>
	</tr>
	<%@ include file="page1.file" %> 
<div id="cf">
<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<div style="outline:1px solid black">
		<img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100">
		<p>${comVO.comName}<br><br>$ ${comVO.comPrice}<br><br>���~�P�q:${comVO.comSales}</p>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/cart/comCart.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�d�ݰӫ~����">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action"	value="getOne_For_Cart"></FORM>
	</div>
</c:forEach>
</div>
<%@ include file="page2.file" %>
</body>
</html>