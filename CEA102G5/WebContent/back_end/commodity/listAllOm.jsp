<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.ordermaster.model.*"%>

<%
	OmService omSvc = new OmService();
	List<OmVO> list = omSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>�Ҧ��q��D�� - listAllOm.jsp</title>

</head>
<body>

<style>

  h4 {
    color: blue;
    display: inline;
  }
table {
    width: 950px;
    display: block;
    overflow-x: auto;
    white-space: nowrap;
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
  
	input[type="submit"]{
	padding:8px 8px;
	}
</style>

<h2 class="page-title text-center" style='color:black;'>Order Master</h2>	
<table >
	<tr>
		<th>�q��D��ID</th>
		<th>�|��ID</th>
		<th>�q���`���B</th>
		<th>�q�檬�A</th>
		<th>�X�f���A</th>
		<th>�ϥοn�����A</th>
		<th>���f�H</th>
		<th>���f�H�q��</th>
		<th>���f�H�a�}</th>
		<th>�q��Х߮ɶ�</th>
		<th>�ק�X�f���A</th>
		<th>�����q��</th>
		<th>�q�����</th>
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="omVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr ${(omVO.omID == param.omID)?'bgcolor=#CCCCFF':''}>
			<td>${omVO.omID}</td>
			<td>${omVO.memID}</td>
			<td>$ ${omVO.omPrice}</td>
			<td>${omVO.omPay==1?"�w�I��":"�w����"}</td>
			<td>${omVO.omShip==1?"�w�X�f":"���X�f"}</td>
			<td>${omVO.omDiscount==0?"���ϥ�":"�w�ϥ�"}</td>
			<td>${omVO.omrName}</td>
			<td>${omVO.omrPhone}</td>
			<td>${omVO.omrAddress}</td>
			<td>${omVO.omTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�ק�X�f���A"> 
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			    <input type="hidden" name="omID" value="${omVO.omID}">
			    <input type="hidden" name="check" value="${omVO.omShip}">
			    <input type="hidden" name="action" value="Update_omShip"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�����q��">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			    <input type="hidden" name="omID" value="${omVO.omID}">
			    <input type="hidden" name="check" value="${omVO.omPay}">
			    <input type="hidden" name="action" value="Cancel_om"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/ordermaster/om.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�q�����">
			    <input type="hidden" name="omID" value="${omVO.omID}">
			    <input type="hidden" name="action" value="ListOd_ByOmID_ForBack"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<%if (request.getAttribute("list")!=null){%>
       <jsp:include page="listOd_ByOmID.jsp" />
<%} %>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>