<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
  MemVO memVO = null;
  if(request.getAttribute("memVO")==null){
		memVO = (MemVO) session.getAttribute("memVO");
  }else{
	    memVO = (MemVO) request.getAttribute("memVO");
  }
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�|����ƭק� - updateMem.jsp</title>
</head>
<body>
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
	width: 500px;
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


<h3>��ƭק�:</h3>

<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member/mem.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>�|���s��:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemID()%></td>
	</tr>
	<tr>
		<td>�|���m�W:</td>
		<td><input type="TEXT" name="memName" size="45" value="<%=memVO.getMemName()%>" /></td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�</td>
		<td><input type="file" name="memUpfile" id="myFile" /></td>
	</tr>

	<tr>
		<td>�|���K�X:</td>
		<td><input type="TEXT" name="memPassword" size="45"	value="<%=memVO.getMemPassword()%>" /></td>
	</tr>
	<tr>
		<td>�|���q��</td>
		<td><input type="TEXT" name="memPhone" size="45" value="<%=memVO.getMemPhone()%>" /></td>
	</tr>
	<tr>
		<td>�|��Email</td>
		<td><input type="TEXT" name="memEmail" size="45" value="<%=memVO.getMemEmail()%>" /></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memID"  value="<%=memVO.getMemID()%>">
<input type="hidden" name="where" value="front">
<input type="submit" value="�e�X�ק�"></FORM>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>

</html>