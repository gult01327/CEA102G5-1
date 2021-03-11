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
<head><title>�Ҧ��q��D�� - listAllOm.jsp</title>

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



	<tr><td>
		 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">�Ҧ��q��D�ɦC��</font><br>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
	
<table>
	<tr>
		<th>�q��D��ID</th>
		<th>�|��ID</th>
		<th>�q���`���B</th>
		<th>�q�檬�A</th>
		<th>�X�f���A</th>
		<th>�ϥοn�����A</th>
		<th>���f�H</th>
		<th>���f�H�q��</th>
		<th>���f�H�a�}</th>
		<th>�q��Х߮ɶ�</th>
		<th>�d�ݭq�����</th>
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="omVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr ${(omVO.omID == param.omID)?'bgcolor=#CCCCFF':''}>
			<td>${omVO.omID}</td>
			<td>${omVO.memID}</td>
			<td>$ ${omVO.omPrice}</td>
			<td>${omVO.omPay==1?"�w�I��":"�w����"}</td>
			<td>${omVO.omShip==1?"�w�X�f":"���X�f"}</td>
			<td>${omVO.omDiscount==1?"���ϥ�":"�w�ϥ�"}</td>
			<td>${omVO.omrName}</td>
			<td>${omVO.omrPhone}</td>
			<td>${omVO.omrAddress}</td>
			<td>${omVO.omTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�d�ݭq�����">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">  
			    <input type="hidden" name="omID" value="${omVO.omID}">
			    <input type="hidden" name="action" value="ListOd_ByOmID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<%if (request.getAttribute("list")!=null){%>
       <jsp:include page="/back_end/commodity/listOd_ByOmID.jsp" />
<%} %>

</body>
</html>