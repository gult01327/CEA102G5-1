<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>

<%
	LesrVO lesrVO = (LesrVO) request.getAttribute("lesrVO"); //EmpServlet.java (Concroller) �s�Jreq��empVO���� (�]�A�������X��empVO, �]�]�A��J��ƿ��~�ɪ�empVO����)
	if (lesrVO == null) {                                           
	      response.sendRedirect(request.getContextPath()+"/back_end/reservation/searchReservation.jsp");
	      return;
	    }
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>�w����ƭק� </title>

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

	<h3>��ƭק�:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post"
		ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do"
		name="form1">
		<table>
			<tr>
				<td>�ҵ{�s��:</td>
				<td><%=lesrVO.getLesID()%></td>
			</tr>
			<tr>
				<td>�|��ID:</td>
				<td><%=lesrVO.getMemID()%></td>
			</tr>
			<tr>
				<td>�ҵ{����:</td>
				<td><input type="TEXT" name="lesr_comments" size="45"
					value="<%=lesrVO.getLesrComments()%>" /></td>
			</tr>

			<tr>
				<td>�w���^��:</td>
				<td><input type="TEXT" name="lesr_answer" size="45"
					value="<%=lesrVO.getLesrAnswer()%>" /></td>
			</tr>
			<tr>

				<td>�w�����A:</td>
				<td><select name="lesr_status"
					value="<%=lesrVO.getLesrStatus()%>">
						<option value="true">�w��</option>
						<option value="false">����</option>
				</select></td>

			</tr>
			<tr>
				<td>������]:</td>
				<td><input type="TEXT" name="lesr_reason" size="45"
					value="<%=lesrVO.getLesrReason()%>" /></td>
			</tr>

			<tr>
				<td>�w���ɶ�:</td>
				<td><%=lesrVO.getLesrTime()%></td>
			</tr>


		</table>
		<br> <input type="hidden" name="action" value="update"> 
		<input	type="hidden" name="les_ID" value="<%=lesrVO.getLesID()%>">  
		<input	type="hidden" name="mem_ID" value="<%=lesrVO.getMemID()%>"> 
		<input	type="hidden" name="lesr_time" value="<%=lesrVO.getLesrTime()%>">
		<input  type="hidden" name="requestURL"	value="<%=request.getParameter("requestURL")%>">
		<!--������e�X�ק諸�ӷ��������|��,�A�e��Controller�ǳ���椧��-->
		<input type="submit" value="�e�X�ק�">
	</FORM>
	<script type="text/javascript">
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>

</html>