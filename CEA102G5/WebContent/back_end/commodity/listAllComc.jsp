<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />

<html>
<head><title>�Ҧ��������� - listAllComc.jsp</title>

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

</head>
<body bgcolor=#E8FFE8>

<h4>�����m�߱ĥ� EL ���g�k����:</h4><br>

	<tr><td>
		 <img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">�Ҧ����������C��</font><br>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath()%>/resource/images/3.jpg" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>


<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
	<tr>
		<th>��������ID</th>
		<th>���������W��</th>
		<th>�ק�</th>
		<th>�R��<font color=red>(���p���ջP���-�p��)</font></th>
		<th>�d�ߤ����U���Ҧ�����</th>
	</tr>
	
	<c:forEach var="comcVO" items="${comcSvc.all}">
		<tr>
			<td>${comcVO.comcID}</td>
			<td>${comcVO.comcName}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�"   disabled="disabled"> 
			    <input type="hidden" name="comcID" value="${comcVO.comcID}">
			    <input type="hidden" name="action" value="getOne_For_Update_Comc"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="comcID" value="${comcVO.comcID}">
			    <input type="hidden" name="action" value="delete_Comc"></FORM>
			</td>
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