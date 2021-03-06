<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.commodity.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO"); //ComServlet.java(Controller), 存入req的comVO物件
%>

<html>
<head>
<title>商品資料</title>

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
<style>
 table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	display: block;
    overflow-x: auto;
    white-space: nowrap;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>
<table id="table-1" style="border:0px #cccccc solid;" class="table table-hover">
	<tr><td style="border:0px #cccccc solid;">
		 <h3>商品資料</h3>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/	comSelectPage.jsp">
		 <img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0"></a></h4>
	</td></tr>
</table>

<table>
	<tr>
		
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>分類編號</th>
		<th>商品圖片</th>
		<th>商品簡介</th>
		<th>商品狀態</th>
		<th>商品重量</th>
		<th>商品單位</th>
		<th>商品熱量(cal)</th>
		<th>商品碳水(g)</th>
		<th>商品蛋白質(g)</th>
		<th>商品脂肪(g)</th>
		<th>商品特性</th>
		<th>商品銷量</th>
		<th>商品創建時間</th>
		
	
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
<script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
	console.log(servletPathName);
</script>
</body>
</html>