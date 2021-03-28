<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />

<html>
<head><title>�Ҧ��������� - listAllComc.jsp</title>



</head>
<body>
<h3>�Ҧ��ӫ~�������:</h3>
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
</style>


<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table class="table table-striped">
	<tr>
		<th>���������W��</th>
		<th>�d�ߤ����U���Ҧ�����</th>
	</tr>
	
	<c:forEach var="comcVO" items="${comcSvc.all}">
		<tr>
			<td>${comcVO.comcName}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�e�X�d��"> 
			    <input type="hidden" name="comcID" value="${comcVO.comcID}">
			    <input type="hidden" name="action" value="listCom_ByComcID_B"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>

<%if (request.getAttribute("listCom_ByComcID")!=null){%>
       <jsp:include page="/back_end/commodity/listCom_ByComcID.jsp" />
<%} %>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>