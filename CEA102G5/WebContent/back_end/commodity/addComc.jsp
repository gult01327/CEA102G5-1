
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity_category.model.*"%>

<%
  ComcVO comcVO = (ComcVO) request.getAttribute("comcVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�ӫ~�����s�W</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor=#E8FFE8>

<table id="table-1">
	<tr><td>
		 <h3>�ӫ~�����s�W - addCom.jsp</h3></td><td>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath()%>/resource/images/food.jpg" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>



<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" name="form1">
<table>


	<tr>
		<td>�����W��:</td>
		<td><input type="TEXT" name="comcName" size="45" 
			 value="<%=(comcVO == null)? "": comcVO.getComcName()%>" /></td>
	</tr>
	

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>




</html>