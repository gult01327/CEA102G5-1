<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.commodity.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO"); //ComServlet.java(Controller), �s�Jreq��comVO����
%>

<html>
<head>
<title>�ӫ~���</title>

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
	width: 1400px;
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

</head>
<body bgcolor=#E8FFE8>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�ӫ~���</h3>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/	comSelectPage.jsp">
		 <img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
	<tr>
			<td>${comVO.comID}</td>
			<td>${comVO.comName}</td>
			<td>${comVO.comcID}</td>
			<td><img src="<%=request.getContextPath()%>/ComPicReader<%=comVO.getComPicSrc()%>&pic=1" height="100" width="100"></td>
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
	</tr>
</table>

</body>
</html>