<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>    

<%
	ComService comSvc = new ComService();
	List<ComVO> list = comSvc.getAll();
	pageContext.setAttribute("list",list);//將所有物件放在pageContext中
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
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
<title>所有商品資料 </title>
</head>
<body bgcolor=#E8FFE8>
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">所有商品資料列表</font>
<hr><p>

		<h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>	
		<br><br>


<table>
	<tr>
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品圖片</th>
		<th>商品圖片2</th>
		<th>商品簡介</th>
		<th>商品狀態</th>
		<th>商品重量</th>
		<th>商品單位</th>
		<th>商品熱量(cal)</th>
		<th>商品碳水(g)</th>
		<th>商品蛋白質(g)</th>
		<th>商品脂肪(g)</th>
		<th>商品特性</th>
		
		<th>商品創建時間</th>
		
		
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100"></td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=2" height="100" width="100"></td>
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
			     <input type="submit" value="修改">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>