<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>    

<%
	ComService comSvc = new ComService();
	List<ComVO> list = comSvc.getAll();
	pageContext.setAttribute("list",list);//���F����
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 1600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
<title>�Ҧ��ӫ~��� </title>
</head>
<body bgcolor=#E8FFE8>
<img src="images/food.jpg" height="100" width="100"><font size="+3">�Ҧ��ӫ~��ƦC��</font>
<hr><p>

		<h4><a href="comSelectPage.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>	
		<br><br>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~�W��</th>
		<th>�����s��</th>
		<th>�ӫ~�Ϥ�</th>
		<th>�ӫ~²��</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~���q</th>
		<th>�ӫ~���</th>
		<th>�ӫ~���q(cal)</th>
		<th>�ӫ~�Ҥ�(g)</th>
		<th>�ӫ~�J�ս�(g)</th>
		<th>�ӫ~�ת�(g)</th>
		<th>�ӫ~�S��</th>
		<th>�ӫ~�P�q</th>
		<th>�ӫ~�Ыخɶ�</th>
		
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader?id=${comVO.comID}" height="100" width="100"></td>
			<td>${comVO.comContent}</td>
			<td>${comVO.comStatus}</td>
			<td>${comVO.comWeight}</td>
			<td>${comVO.comUnit}</td>
			<td>${comVO.comCal}</td>
			<td>${comVO.comCarb}</td>
			<td>${comVO.comPro}</td>
			<td>${comVO.comFat}</td>
			<td>${comVO.comProp}</td>
			<td>${comVO.comSales}</td>
			<td>${comVO.comTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/com/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/com/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>


</body>
</html>