<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<html>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //MemServlet.java(Controller), �s�Jreq��comVO����
%>

<head>
<title>�|�����</title>



</head>
<body bgcolor=#E8FFE8>
<!-- <!-- <style> --> 
<!-- /*   table#table-1 { */ -->
<!-- /* 	background-color: #CCCCFF; */ -->
<!-- /*     border: 2px solid black; */ -->
<!-- /*     text-align: center; */ -->
<!-- /*   } */ -->
<!-- /*   table#table-1 h4 { */ -->
<!-- /*     color: red; */ -->
<!-- /*     display: block; */ -->
<!-- /*     margin-bottom: 1px; */ -->
<!-- /*   } */ -->
<!-- /*   h4 { */ -->
<!-- /*     color: blue; */ -->
<!-- /*     display: inline; */ -->
<!-- /*   } */ -->
<!-- <!-- </style> --> 

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

<!-- <h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4> -->
<table id="table-1">
	<tr><td>
		 <h4 id="title" class="page-title text-center" style='color:black;'>One Member List</h4><br>
		 <h4><a href="<%=request.getContextPath() %>/back_end/member/memSelect.jsp"><img src="<%=request.getContextPath() %>/resource/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�|���s��</th>
		<th>�|���W��</th>
		<th>�|���Ϥ�</th>
		<th>�|���b��</th>
		<th>�|���K�X</th>
		<th>�|���q��</th>
		<th>�|��EMAIL</th>
		<th>�|���n��</th>
		<th>�|�����A</th>
		<th>���v�z��</th>
		<th>�|���Ыؤ��</th>
	</tr>
	<tr>
			<td>${memVO.memID}</td>
			<td>${memVO.memName}</td>
			<td><img src="<%=request.getContextPath() %>/ComPicReader<%=memVO.getMemPicSrc() %>&pic=1" height="100" width="100"></td>
			<td>${memVO.memAccount}</td>
			<td>${memVO.memPassword}</td>
			<td>${memVO.memPhone}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memBonus}</td>
			<td>${memVO.memStatus == 1 ? "�w�Ұ�" : (memVO.memStatus == 2 ? "�w���v" : "���Ұ�")}</td>
			<td>${memVO.memStatusR}</td>
			<td>${memVO.memTime}</td>
	</tr>
</table>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>