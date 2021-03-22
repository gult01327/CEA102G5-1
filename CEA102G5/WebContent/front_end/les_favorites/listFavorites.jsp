<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_favorites.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />
<jsp:useBean id="coaSvc" scope="page"	class="com.coach.model.CoaService" />


<html>
<head>
<title>���ýҵ{</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	text-align: center;
}

#showID {
	color: green;
}
</style>

</head>
<body bgcolor='white'>


	<table id="table-2">
		<tr>
			<td>
				<h3>���ýҵ{</h3>
			</td>
		</tr>
	</table>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<table border="1" width="750">
		<tr>
			
			<th>�ҵ{�W��</th>
			<th>�нm�m�W</th>
			<th>�R������</th>
		</tr>


		
		<c:forEach var="lesfVO" items="${lesfVO}">
			<tr ${(lesfVO.memID==param.memID) ? 'bgcolor=#CCCCFF':''}>
				<!--�N�ק諸���@���[�J����-->

				
				<td>${lesSvc.searchOneByID(lesfVO.lesID).lesName}</td>
				<td>${coaSvc.getOneCoach(lesSvc.searchOneByID(lesfVO.lesID).coaID).coaName}</td>
				<input type='hidden' id='memID' value='${lesfVO.memID}' />
				<input type='hidden' id='lesID' value='${lesfVO.lesID}' />
				
				<td>
		           <FORM METHOD="post"	 ACTION="<%=request.getContextPath()%>/front_end/lesson.favorites/lesf.do" style="margin-bottom: 0px;">		            
		             <input type="submit" value="�R��"> 
		             <input type="hidden" name="les_ID" value="${lesfVO.lesID}"> 
		             <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
		             <input type="hidden" name="mem_ID" value="${lesfVO.memID}"> 
		             <input type="hidden" name="action" value="delete">
					</FORM>
				</td>

			</tr>
		</c:forEach>
	</table>

	<script type='text/javascript'>		
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>
</html>