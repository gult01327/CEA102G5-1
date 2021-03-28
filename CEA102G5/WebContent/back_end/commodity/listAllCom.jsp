<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>    

<%
	ComService comSvc = new ComService();
	List<ComVO> list = comSvc.getAll();
	pageContext.setAttribute("list",list);//�N�Ҧ������bpageContext��
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">

<title>�Ҧ��ӫ~��� </title>
</head>
<body bgcolor=#E8FFE8>
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
	width: 100%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	
  }
 .scrolltable{
 	display: block;
    overflow-x: auto;
    white-space: nowrap;
    width:900px;
    box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:0px 0px 5px 5px;
	margin-left:40px;
	padding:20px;
	}
 	td,th{
 	max-width:150px;
 	font-size:18px;
 	height:80px;
 	overflow: hidden;
 	
 	}
  hr{
  border-top:0px solid;
  }
  #tittle{
  margin-left:40px;
  background-color:#a1bd93;
  width:900px;
  margin-bottom:-43px;
  padding:15px;
  border-radius:5px 5px 0 0;
  }
</style>
<h5 class="page-title text-center" id="tittle" style='color:#fff;font-size:50px;'>All Commodity</h5>
<hr><p>
<div class="scrolltable">
<table class="table table-hover">
	<tr>
		<th>�s��</th>
		<th>�W��</th>
		<th>����</th>
		<th>�Ϥ�</th>
		<th>²��</th>
		<th>���A</th>
		<th>���q</th>
		<th>���</th>
		<th>���q(cal)</th>
		<th>�Ҥ�(g)</th>
		<th>�J�ս�(g)</th>
		<th>�ת�(g)</th>
		<th>�S��</th>
		
		<th>�Ыخɶ�</th>
		<th>�s��</th>
		<th></th>
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1"style="height:80%;width:100%"></td>
			<td>${comVO.comContent}</td>
			<td>${comVO.comStatus}</td>
			<td>${comVO.comWeight}</td>
			<td>${comVO.comUnit}</td>
			<td>${comVO.comCal}</td>
			<td>${comVO.comCarb}</td>
			<td>${comVO.comPro}</td>
			<td>${comVO.comFat}</td>
			<td>${comVO.comProp}</td>
			
			<td>${comVO.comTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
<div style="margin-bottom:50px;">
<%@ include file="page2.file" %>
</div>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>