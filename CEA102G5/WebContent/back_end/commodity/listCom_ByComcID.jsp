<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashSet"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity_category.model.*"%>

<jsp:useBean id="listCom_ByComcID" scope="request" type="java.util.Set<ComVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="ComcSvc" scope="page" class="com.commodity_category.model.ComcService" />
<% LinkedHashSet<ComVO> set = (LinkedHashSet)request.getAttribute("listCom_ByComcID");
	Iterator itSet = set.iterator();
%>
	<%ComcService comcSvc = new ComcService();
	List list = comcSvc.getAll();
	Iterator itList = list.iterator();
	%>
<html>
<head><title>�����ӫ~ - listcom_ByComcID.jsp</title>



</head>
<body bgcolor='white'>
<h3>�Ҧ��ӫ~���:</h3>
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


<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~�W��</th>
		<th>�����W��</th>
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
		<th>�ӫ~�Ыخɶ�</th>
		<th></th>
		<th></th>
	</tr>
	
	
	<%while(itSet.hasNext()){ //�j�A���٨S�[
		ComVO comVO = (ComVO)itSet.next();
		
	%>
	<tr>
	<td><%=comVO.getComID()%></td>
	<td><%=comVO.getComName()%></td>
	<td><% while(itList.hasNext()){//�٨S�[
		 		ComcVO comcVO = (ComcVO)itList.next();
				if(comVO.getComcID() == comcVO.getComcID()){%>
	<font color=orange> <%=comcVO.getComcID()%> - <%=comcVO.getComcName()%></font>
	<%}%>  <%}%>
	</td>
	<td><img src="<%=request.getContextPath()%>/ComPicReader<%=comVO.getComPicSrc()%>&pic=1" height="100" width="100"></td>
	<td><%=comVO.getComContent()%></td>
	<td><%=comVO.getComStatus()%></td>
	<td><%=comVO.getComWeight()%></td>
	<td><%=comVO.getComUnit()%></td>
	<td><%=comVO.getComCal()%></td>
	<td><%=comVO.getComCarb()%></td>
	<td><%=comVO.getComPro()%></td>
	<td><%=comVO.getComFat()%></td>
	<td><%=comVO.getComProp()%></td>
	<td><%=comVO.getComTime() %></td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"> 
			    <input type="hidden" name="comID"      value="<%=comVO.getComID()%>">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  -->
			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="comID"      value="<%=comVO.getComID()%>">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    <input type="hidden" name="action"     value="delete"></FORM>
			</td>
		
	</tr>
	<%}%>
</table>


<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>

</html>