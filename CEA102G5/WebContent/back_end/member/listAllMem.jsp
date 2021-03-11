<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	MemService memSvc = new MemService();
	List<MemVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>


<head>
<title>�|�����</title>

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
	width: 1400px;
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
<body bgcolor=#E8FFE8>

<table id="table-1">
	<tr><td>
		 <h3>�|�����</h3>
		 <h4><a href="<%=request.getContextPath()%>/back_end/member/memSelect.jsp"><img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>�|���Ыؤ��</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
	<tr>
			<td>${memVO.memID}</td>
			<td>${memVO.memName}</td>
			<td><img src="<%=request.getContextPath() %>/ComPicReader${memVO.memPicSrc}&pic=1" height="100" width="100"></td>
			<td>${memVO.memAccount}</td>
			<td>${memVO.memPassword}</td>
			<td>${memVO.memPhone}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memBonus}</td>
			<td>${memVO.memStatus}</td>
			<td>${memVO.memTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action" value="delete"></FORM>
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