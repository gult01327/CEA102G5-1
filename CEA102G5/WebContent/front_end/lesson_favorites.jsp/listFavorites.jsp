<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.lesson_favorites.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
	LesfVO lesfVO = (LesfVO) request.getAttribute("lesfVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>收藏課程</title>

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
	width: 600px;
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
<body bgcolor='white'>


	<table id="table-1">
		
	   <h3>收藏課程</h3>				

	</table>

	<table border="1" width="750">
		<tr>
		    <th>會員ID</th>
			<th>課程編號</th>
		</tr>
		<tr>
		    <td>${lesrVO.memID}</td>
			<td>${lesrVO.lesID}</td>			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/lesson.favorites/lesf.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="les_ID"  value="${lesfVO.lesID}">
			     <input type="hidden" name="mem_ID"  value="${lesfVO.memID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</table>
	<script type="text/javascript">
		var servletPathName = "${pageContext.request.requestURI}";
	</script>
</body>
</html>