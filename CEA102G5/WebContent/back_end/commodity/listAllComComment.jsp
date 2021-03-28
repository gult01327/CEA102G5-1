<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.util.model.*"%>

<%
	ComCommentService ComCommentSvc = new ComCommentService();
	List<ComCommentVO> list = ComCommentSvc.getAll();
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>所有訂單主檔 - listAllOm.jsp</title>

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
<body>
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



<h2 class="page-title text-center" style='color:black;'>Order Response</h2>
<%String allBlank = (String)session.getAttribute("allBlank");
  if (allBlank!=null&&allBlank!=""){%>
    <h2 style='color:red;'><%=allBlank %></h2>	
<%	session.removeAttribute("allBlank");
  }%>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/ComComment.do" style="margin-bottom: 0px;">
<table>
	<tr>
		
		<th>會員ID</th>
		<th>會員名稱</th>
		<th>商品ID</th>
		<th>訂單ID</th>
		<th>會員留言</th>
		<th>評分</th>
		<th>管理員回覆</th>
	</tr>
	<%@ include file="page1.file" %>  
	<c:forEach var="ComCommentVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
<%-- 		<tr ${(ComCommentVO.omID == param.omID)?'bgcolor=#CCCCFF':''}> --%>
			<td>${ComCommentVO.memID}</td>
			<td>${ComCommentVO.memName}</td>
			<td>${ComCommentVO.comID}</td>
			<td>${ComCommentVO.ordmID}</td>
			<td>${ComCommentVO.odMessage}</td>
			<td>${ComCommentVO.odPoint}</td>
			<td><input type="text" name="odResponse"></td>
			
			    <input type="hidden" name="comID" value="${ComCommentVO.comID}">
			    <input type="hidden" name="ordmID" value="${ComCommentVO.ordmID}">
			    <input type="hidden" name="action" value="UpdateComComment">
			
		</tr>
	</c:forEach>
</table>
<input type="submit" value="確認回覆">
</FORM> 		  
<%@ include file="page2.file" %>

<%if (request.getAttribute("list")!=null){%>
       <jsp:include page="listOd_ByOmID.jsp" />
<%} %>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>