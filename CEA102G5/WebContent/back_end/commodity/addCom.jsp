
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品資料新增</title>
</head>
<body>

<style>
  
  input[type='text']{
  	width:400px;
  }
  .abc{
  margin-left:30px;
  }
  .addcom{
  	height:70%;
	margin-left:200px;
	margin-right:200px;
	padding:20px;
	box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:0px 0px 5px 5px;
  }
  #tittle{
	text-align:center;
	margin-bottom:-1px;
	background-color:#a1bd93;
	width:515px;
	margin-left:200px;
	padding:10px;
	border-radius:5px 5px 0 0;
	}
	.addbtn{
	margin-left:380px;
	margin-bottom:10px;
	}
</style>

	<h5 id="tittle" class="page-title text-center" style='color:#fff;font-size:50px;'>Add Comodity</h5>
<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1" enctype="multipart/form-data">
<fieldset class="addcom">

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />
	<div class="abc">
		<label>分類名稱:<font color=red><b>*</b></font></label>
		<select  class="form-control" size="1" name="comcID" style="width:auto;">
			<c:forEach var="comcVO" items="${comcSvc.all}">
				<option value="${comcVO.comcID}" ${(comVO.comcID==comcVO.comcID)? 'selected':'' } >${comcVO.comcName}
			</c:forEach>
		</select><br>
	</div>
	<div class="abc">
		<label>商品名稱:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comName}</span><br>
		<input  class="form-control" type="TEXT" name="comName" size="45" 
				value="<%= (comVO==null)? "" : comVO.getComName() %>" required="required" /><br>
	</div>
	<div class="abc">
		<label>商品價格:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPrice}</span><br>
		<input  class="form-control" type="TEXT" name="comPrice" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPrice()%>" required="required"/><br>
	</div>
	<div class="abc">
		<label>商品圖片:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPicture}</span><br>
		<input  type="file" name="upfile1" id="myFile" required="required"><br>
	</div>
	<div class="abc">
		<label>商品簡介:</label>
		<input  class="form-control" type="TEXT" name="comContent" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComContent()%>" required="required" /><br>
	</div>
	<div class="abc">
		<label>商品狀態:</label> <span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comStatus}</span><br>
		<input  class="form-control" type="TEXT" name="comStatus" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComStatus() %>"  required="required"/><br>
	</div>
	<div class="abc">
		<label>商品重量:</label> <span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comWeight}</span><br>
		<input  class="form-control" type="TEXT" name="comWeight" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComWeight() %>" required="required"/><br>
	</div>
	<div class="abc">
		<label>商品單位:</label>
		<input  class="form-control" type="TEXT" name="comUnit" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComUnit()%>" required="required" /><br>
			
	</div>
	<div class="abc">
		<label>商品熱量:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCal}</span><br>
		<input  class="form-control" type="TEXT" name="comCal" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComCal() %>" required="required" /><br>
	</div>
	<div class="abc">
		<label>碳水化合物:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comCarb}</span><br>
		<input  class="form-control" type="TEXT" name="comCarb" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComCarb() %>"  required="required"/><br>
	</div>
		<div class="abc">
		<label>蛋白質:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comPro}</span><br>
		<input class="form-control" type="TEXT" name="comPro" size="45"
			value="<%= (comVO==null)? "" : comVO.getComPro() %>" required="required" /><br>
		</div> 
		
		<div class="abc">
		<label>脂質:</label><span style='margin-top:10px; margin-left:10px; color:#FF0000;'>${errorMsgs.comFat}</span><br>
		<input  class="form-control" type="TEXT" name="comFat" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComFat() %>" required="required"><br>
		</div> 
	<div class="addbtn">
	<input type="hidden" name="action" value="insert">
	<input type="submit" value="新增">
	</div>
</fieldset>	
</FORM>







<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>