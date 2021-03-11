<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>


<%
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>�Ҧ����ХD�� - listAllRec.jsp</title>

<style>
  table#table-1 {
	background-color:#E8FFE8;
    border: 2px solid black;
    text-align: ;
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



	<tr><td>
		 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">�Ҧ����ХD�ɦC��</font><br>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
	
<table>
	<tr>
		<th>���ХD��ID</th>
		<th>�|��ID</th>
		<th>���м��D</th>
		<th>���йϤ�</th>
		<th>����²��</th>
		<th>�f�֭���</th>
		<th>�d�ݭ��Щ���</th>
	</tr>  
<%-- 	<%@ include file="page1.file" %>   --%>
	<c:forEach var="recVO" items="${list}" >
		<tr>
			<td>${recVO.recID}</td>
			<td>${recVO.memID}</td>
			<td>$ ${recVO.recName}</td>
			<td></td>
			<td>${recVO.recContent}</td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�f�֭���">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="action" value="Cancel_om"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�d�ݭ��Щ���">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="action" value="ListOd_ByOmID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%-- <%@ include file="page2.file" %> --%>

<%-- <%if (request.getAttribute("list")!=null){%> --%>
<%--        <jsp:include page="listOd_ByOmID.jsp" /> --%>
<%-- <%} %> --%>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>