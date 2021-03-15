<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lesson_reservation.model.*"%>

<%
    LesrService lesrSvc = new LesrService();
    List<LesrVO> list = lesrSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>�Ҧ��w���W�� </title>

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
    text-align: center;
  }
  #name{
  color:green;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>�Ҧ��w���W�� </h3>		
	</td></tr>
</table>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table border="1" width="750">
	<tr>
		<th>�ҵ{�s��</th>
		<th>�|��ID</th>
		<th>�ҫ����</th>
		<th>�w���^��</th>
		<th>�w�����A</th>
		<th>������]</th>
		<th>�w���ɶ�</th>
		<th>�ק�</th>
		
		
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="lesrVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${lesrVO.lesID}</td>
			<td>${lesrVO.memID}</td>
			<td>${lesrVO.lesrComments}</td>
			<td>${lesrVO.lesrAnswer}</td>
			<td>${lesrVO.lesrStatus}</td>
			<td>${lesrVO.lesrReason}</td>
			<td>${lesrVO.lesrTime}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="les_ID"  value="${lesrVO.lesID}">
			      <input type="hidden" name="mem_ID"  value="${lesrVO.memID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
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