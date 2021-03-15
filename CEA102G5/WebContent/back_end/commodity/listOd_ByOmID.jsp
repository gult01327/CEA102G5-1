<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ordermaster.model.*"%>
<%@ page import="com.orderdetail.model.*"%>

<%List<OdVO> list = (List<OdVO>) request.getAttribute("list"); %>

<html>
<head><title>訂單明細 - listOd_ByOmID.jsp</title>
</head>
<body>
<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
  }
</style>
<h2 class="page-title text-center" style='color:black;'>Order Detail</h2>


<table>
	<tr>
		<th>訂單主檔ID</th>
		<th>商品ID</th>
		<th>商品名稱</th>
		<th>商品圖片</th>
		<th>訂購數量</th>
		<th>商品單價</th>
		<th>退貨狀態</th>
		<th>退貨原因</th>
		<th>退貨日期</th>
	</tr>
	
	<c:forEach var="odVO" items="${list}">
		<tr>
			<td>${odVO.omID}</td>
			<td>${odVO.comID}</td>
			<td>${odVO.comName}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${odVO.comPicSrc}&pic=1" height="100" width="100"></td>
			<td>${odVO.odCount}</td>
			<td>$ ${odVO.odPrice}</td>
			<td>${odVO.odReturn==0?"未退貨":"已退貨"}</td>
			<td>${odVO.odReason}</td>
			<td>${odVO.odRtime}</td>
		</tr>
	</c:forEach>
</table>


<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>