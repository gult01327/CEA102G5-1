<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO"); //EmpServlet.java (Concroller) 存入req的empVO物件 (包括幫忙取出的empVO, 也包括輸入資料錯誤時的empVO物件)
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>updateMem</title>



</head>
<body bgcolor='white'>
<h1 id="title" class="page-title text-center" style='color:black;'>Update Member</h1><br>
<style>
/*   table#table-1 { */
/* 	background-color: #CCCCFF; */
/*     border: 2px solid black; */
/*     text-align: center; */
/*   } */
/*   table#table-1 h4 { */
/*     color: red; */
/*     display: block; */
/*     margin-bottom: 1px; */
/*   } */
/*   h4 { */
/*     color: blue; */
/*     display: inline; */
/*   } */
</style>

<style>
  table {
	width: auto;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;		
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
  }
</style>
<center>
<table id="table-1">
	<tr><td>		
		 <h4><a href="<%=request.getContextPath()%>/back_end/member/listAllMem.jsp"><img src="<%=request.getContextPath()%>/resource/images/logo1.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=memVO.getMemID()%></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memName" size="45" value="<%=memVO.getMemName()%>" /></td>
	</tr>
	<tr>
		<td>會員圖片</td>
		<td><label style="cursor: pointer;">
		<input type="file" name="memUpfile" id="imgINP" style="display: none;">
		<img id="blah" alt="" src="<%=request.getContextPath()%>/resource/images/upload.png" 
		style="width:100px; height:100px; border:0; "/>       
        </label></td>			
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="memPassword" size="45"	value="<%=memVO.getMemPassword()%>" /></td>
	</tr>
	<tr>
		<td>會員電話</td>
		<td><input type="TEXT" name="memPhone" size="45" value="<%=memVO.getMemPhone()%>" /></td>
	</tr>
	<tr>
		<td>會員Email</td>
		<td><input type="TEXT" name="memEmail" size="45" value="<%=memVO.getMemEmail()%>" /></td>
	</tr>
	<tr>
		<td>停權原因</td>
		<td><input type="TEXT" name="memStatusR" size="45" value="<%=memVO.getMemStatusR()%>" /></td>
	</tr>

	

</table>
<br>
<input type="hidden" name="action" value="updateMemStatus">
<input type="hidden" name="memID"  value="<%=memVO.getMemID()%>">
<input type="submit" value="送出修改"></FORM>

</center>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

$("#imgINP").change(function(){
	  readURL(this);
	});

function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    
	    reader.onload = function(e) {
	      $('#blah').attr('src', e.target.result);
	    }
	    
	    reader.readAsDataURL(input.files[0]); // convert to base64 string
	  }
	}
	$("#imgINP").change(function() {
	  readURL(this);
	});
</script>
</body>

</html>