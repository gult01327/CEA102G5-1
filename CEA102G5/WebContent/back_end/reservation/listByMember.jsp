<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />



<html>
<head>
<title>�w�����</title>
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
<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	text-align: center;
}
th{
    text-align: center;
}
tr{
	line-height: 50px;
}

</style>
	<table id="table-2">
		<tr>
			<td>
				<h3>���W���</h3>
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
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do">
		<b>�d�߷|���s�� :</b> <br>
		<input type="text" name="mem_ID" size="1" width="100" style="width:100px"><br>
		<input type="hidden" name="action" value="getByMember">
		<input type="submit" value="�e�X" >
	</FORM>

	<table border="1" width="750">
		<tr>
			<th>�ҵ{�s��</th>
			<th>�ҵ{�W��</th>
			<th>�ҫ����</th>
			<th>�ҫ�^��</th>
			<th>���W���A</th>
			<th>������]</th>
			<th>�W�Ҥ��</th>
			<th>�^��</th>

		</tr>


		<h4 id='showID'></h4>
		<c:forEach var="lesrVO" items="${listByMember}">
			<tr ${(lesrVO.memID==param.memID) ? 'bgcolor=#CCCCFF':''}>
				<!--�N�ק諸���@���[�J����-->

				<td>${lesrVO.lesID}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesName}</td>
				<input type='hidden' id='memID' value='${lesrVO.memID}' />
				<td>${lesrVO.lesrComments}</td>
				<td>${lesrVO.lesrAnswer}</td>
				<td>${(lesrVO.lesrStatus=="true"?"���`":"�w����")}</td>
				<td>${lesrVO.lesrReason}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesDate}</td>
				<c:if test="${empty lesrVO.lesrAnswer}">
				<c:if test="${empty lesrVO.lesrReason}">
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="��g"> <input type="hidden"
							name="les_ID" value="${lesrVO.lesID}"> 
							<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
							<input
							type="hidden" name="mem_ID" value="${lesrVO.memID}"> <input
							type="hidden" name="action" value="getOne_For_Update">
					</FORM>
				</td>
				</c:if>
				<td></td>
				
               </c:if>
               <c:if test="${not empty lesrVO.lesrAnswer}">
               <td>�w�^��</td>
               </c:if>
			</tr>
		</c:forEach>
	</table>

	<script type='text/javascript'>
		$(document).ready(function() {

			var memID = $("#memID").val();
			if (typeof (memID) == "undefined") {
				var str = "���|���|�L���W�ҵ{";
			} else {
				var str = "�H�U���|��ID:" + memID + "�����W���";
			}
			$("#showID").text(str);

		});
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>
</html>