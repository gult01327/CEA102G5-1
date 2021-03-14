<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="com.member.model.*"%>


<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getRecByMemID(memVO.getMemID());
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>個人食譜主檔 - listAllRec.jsp</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
		 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">個人食譜主檔列表</font><br>
		 <h4><a href="<%=request.getContextPath()%>/back_end/commodity/comSelectPage.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
	
<table>
	<tr>
		<th>食譜主檔ID</th>
		<th>會員ID</th>
		<th>食譜標題</th>
		<th>食譜圖片</th>
		<th>食譜簡介</th>
		<th>食譜狀態</th>
		<th>修改食譜</th>
		<th>查看食譜明細</th>
	</tr>  
	<%@ include file="page1.file" %>  
	<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr class='tabletr'>
			<td>${recVO.recID}</td>
			<td>${recVO.memID}</td>
			<td>${recVO.recName}</td>
			<td><img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" height="100" width="100"></td>
			<td>${recVO.recContent}</td>
			<td class='status' value='${recVO.recStatus}'>${(recVO.recStatus==1)?'審核中':'已生效'}</td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" id='update' value="修改食譜">
			    <input type="hidden" id="recID" name="recID" value="${recVO.recID}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="action" value="GetOneForUpdateRec">
			    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" value="查看食譜明細">
			    <input type="hidden" name="recID"	value="${recVO.recID}">
			    <input type="hidden" name="action" value="GetRecDetail_ByrecID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<script type="text/javascript">
	

	
	
</script>


</body>
</html>