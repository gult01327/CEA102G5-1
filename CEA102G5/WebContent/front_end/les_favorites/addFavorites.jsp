<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_favorites.model.*"%>

<%
	LesfVO lesfVO = (LesfVO) request.getAttribute("LesfVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���ýҵ{ </title>

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
<body bgcolor='white'>

	

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"	ACTION="<%=request.getContextPath()%>/front_end/lesson.favorites/lesf.do"	name="form1">
		<table>
			<tr>
				<td>�ҵ{ID</td>
				<td><input type="TEXT" name="les_ID" size="45"></td>
			</tr>
			<tr>
				<td>�|��ID</td>
				<td><input type="TEXT" name="mem_ID" size="45"></td>
			</tr>			
		</table>
		<br> <input type="hidden" name="action" value="insert"> 		     
		     <input	type="submit" value="�e�X�s�W">
		      <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
	</FORM>
	<script type="text/javascript">
		var servletPathName = "${pageContext.request.requestURI}";
	</script>
</body>

</html>