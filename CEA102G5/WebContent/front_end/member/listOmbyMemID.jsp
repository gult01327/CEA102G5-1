<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.ordermaster.model.*"%>
<%@ page import="com.member.model.*"%>

<%
	OmService omSvc = new OmService();
	MemVO memVO = (MemVO)session.getAttribute("memVO");
	List<OmVO> list = omSvc.getAllbyMemID(memVO.getMemID());
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>所有訂單主檔 - listAllOm.jsp</title>
</head>
<body>
<style>
  table#table-1 {
	background-color:#E8FFE8;
    border: 2px solid black;
    text-align: ;
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
	width: 1000px;
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
<h2 class="page-title text-center" style='color:black;'>Order Master</h2>
	
<table class="table">
	<tr style='border: 1px solid #CCCCFF;'>
		<th >訂單主檔ID</th>
		<th>訂單總金額</th>
		<th>訂單狀態</th>
		<th>出貨狀態</th>
		<th>使用積分狀態</th>
		<th>訂單創立時間</th>
		<th>查看訂單明細</th>
	</tr>
	<%@ include file="page1.file" %>   
	<c:forEach var="omVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr}>
			<td>${omVO.omID}</td>
			<td>$ ${omVO.omPrice}</td>
			<td>${omVO.omPay==1?"已付款":"已取消"}</td>
			<td>${omVO.omShip==1?"已出貨":"未出貨"}</td>
			<td>${omVO.omDiscount==1?"未使用":"已使用"}</td>
			<td>${omVO.omTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="查看訂單明細">  
			    <input type="hidden" name="omID" value="${omVO.omID}">
			    <input type="hidden" name="action" value="ListOd_ByOmID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>



</body>
</html>