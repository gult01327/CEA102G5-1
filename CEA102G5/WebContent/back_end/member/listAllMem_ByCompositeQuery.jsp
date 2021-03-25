<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="BIG5"%>
<%@ page import="com.member.model.*"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<jsp:useBean id="listmem_ByCompositeQuery" scope="request" type="java.util.List<MemVO>" /> <!-- 於EL此行可省略 -->


<head>
<title>會員資料</title>



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

<table id="table-1">
	<tr><td>
		 <h4 id="title" class="page-title text-center" style='color:black;'>Member Serch</h4><br>
		 <h4><a href="<%=request.getContextPath()%>/back_end/member/memSelect.jsp"><img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>會員編號</th>
		<th>會員名稱</th>
		<th>會員圖片</th>
		<th>會員帳號</th>
		<th>會員密碼</th>
		<th>會員電話</th>
		<th>會員EMAIL</th>
		<th>會員積分</th>
		<th>會員狀態</th>
		<th>會員創建日期</th>
		<th>修改</th>
		<th>狀態更改</th>
		
	</tr>
		<%@ include file="page1_ByCompositeQuery.file" %>
	<c:forEach var="memVO" items="${listmem_ByCompositeQuery}"  begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1 %>">
	<tr>
			<td>${memVO.memID}</td>
			<td>${memVO.memName}</td>
			<td><img src="<%=request.getContextPath() %>/ComPicReader${memVO.memPicSrc}&pic=1" height="100" width="100"></td>
			<td>${memVO.memAccount}</td>
			<td>${memVO.memPassword}</td>
			<td>${memVO.memPhone}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memBonus}</td>
			<td>${memVO.memStatus == 1 ? "已啟動" : (memVO.memStatus == 2 ? "已停權" : "未啟動")}</td>
			<td>${memVO.memTime}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改" style="padding:5px 5px;">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
				 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="啟動" style="padding:5px 5px;">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action"	value="updateStatus1"></FORM>
			     <br>
			     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" style="margin-bottom: 0px;">
			      <input type="submit" value="停權" style="padding:5px 5px;">
			     <input type="hidden" name="memID"  value="${memVO.memID}">
			     <input type="hidden" name="action"	value="stopStatus"></FORM>					
			</td>	
		
	</tr>
	</c:forEach>
</table>
<%@ include file="page2_ByCompositeQuery.file" %>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>
</html>