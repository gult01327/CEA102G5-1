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
<h1 id="title" class="page-title text-center" style='color:black;'>One Member List</h1><br>
<div style="text-align:center;"><h4><a href="<%=request.getContextPath() %>/back_end/member/memSelect.jsp" >
<img src="<%=request.getContextPath() %>/resource/images/back1.gif" width="100" height="32" border="0" >�^����</a></h4></div>

<style> 
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
</style> 

<style>
  table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

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
	<tr class="mem">
			<td class="memID" style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memID}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memName}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" ><img src="<%=request.getContextPath() %>/ComPicReader${memVO.memPicSrc}&pic=1" height="100" width="100"></td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memAccount}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memPassword}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memPhone}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memEmail}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memBonus}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memStatus == 1 ? "�w�Ұ�" : (memVO.memStatus == 2 ? "�w���v" : "���Ұ�")}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memStatusR}</td>
			
			<td style="background-color:${memVO.memStatus == 2 ?"#990000": (memVO.memStatus == 1 ? "#fafad2" : "white" )};
			color:${memVO.memStatus == 2 ? "white" : (memVO.memStatus == 1 ? "#556b2f" : "black" )}" >${memVO.memTime}</td>
	</tr>
</table>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>