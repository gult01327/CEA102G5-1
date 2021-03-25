<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />



<html>
<head>
<title>預約資料</title>
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
				<h3>報名資料</h3>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do">
		<b>查詢會員編號 :</b> <br>
		<input type="text" name="mem_ID" size="1" width="100" style="width:100px"><br>
		<input type="hidden" name="action" value="getByMember">
		<input type="submit" value="送出" >
	</FORM>

	<table border="1" width="750">
		<tr>
			<th>課程編號</th>
			<th>課程名稱</th>
			<th>課後評價</th>
			<th>課後回覆</th>
			<th>報名狀態</th>
			<th>取消原因</th>
			<th>上課日期</th>
			<th>回覆</th>

		</tr>


		<h4 id='showID'></h4>
		<c:forEach var="lesrVO" items="${listByMember}">
			<tr ${(lesrVO.memID==param.memID) ? 'bgcolor=#CCCCFF':''}>
				<!--將修改的那一筆加入對比色-->

				<td>${lesrVO.lesID}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesName}</td>
				<input type='hidden' id='memID' value='${lesrVO.memID}' />
				<td>${lesrVO.lesrComments}</td>
				<td>${lesrVO.lesrAnswer}</td>
				<td>${(lesrVO.lesrStatus=="true"?"正常":"已取消")}</td>
				<td>${lesrVO.lesrReason}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesDate}</td>
				<c:if test="${empty lesrVO.lesrAnswer}">
				<c:if test="${empty lesrVO.lesrReason}">
				<td>
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do"
						style="margin-bottom: 0px;">
						<input type="submit" value="填寫"> <input type="hidden"
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
               <td>已回覆</td>
               </c:if>
			</tr>
		</c:forEach>
	</table>

	<script type='text/javascript'>
		$(document).ready(function() {

			var memID = $("#memID").val();
			if (typeof (memID) == "undefined") {
				var str = "此會員尚無報名課程";
			} else {
				var str = "以下為會員ID:" + memID + "的報名資料";
			}
			$("#showID").text(str);

		});
		var servletPathName = "${pageContext.request.requestURI}";
	</script>

</body>
</html>