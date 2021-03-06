
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<%
  MemVO memVO = (MemVO) request.getAttribute("memVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增</title>
</head>
<body bgcolor=#E8FFE8>
<div style="text-align:center;">
<h1 id="title" class="page-title text-center" style='color:black;'>Add Member</h1><br>
 <h4><a href="<%=request.getContextPath() %>/back_end/member/memSelect.jsp">
 <img src="<%=request.getContextPath() %>/resource/images/logo1.png" width="100" height="100" border="0">回首頁</a></h4>
 </div>
 <br>
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



<!-- <h3>資料新增:</h3> -->

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<center>
<FORM METHOD="post" ACTION="<%=request.getContextPath() %>/front_end/member/mem.do" name="form1" enctype="multipart/form-data">
<table>
	<tr>
		<td>會員名稱:</td>
		<td><input type="TEXT" name="memName" size="45" 
			 value="<%=(memVO==null)?"":memVO.getMemName() %>" /></td>
	</tr>
	<tr>
		<td>會員帳號</td>
		<td><input type="TEXT" name="memAccount" size="45"
			 value="<%=(memVO==null)?"":memVO.getMemAccount() %>" /></td>
	</tr>
		<tr>
		<td>會員密碼</td>
		<td><input type="password" name="memPassword" size="45"
			 value="<%=(memVO==null)?"":memVO.getMemPassword() %>" /></td>
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
		<td>會員電話</td>
		<td><input type="TEXT" name="memPhone" size="45"
			 value="<%=(memVO==null)?"":memVO.getMemPhone() %>" /></td>
	</tr>
	<tr>
		<td>會員EMAIL</td>
		<td><input type="TEXT" name="memEmail" size="45"
			 value="<%=(memVO==null)?"":memVO.getMemEmail() %>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>

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