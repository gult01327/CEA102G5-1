<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台商品管理</title>
</head>
<body bgcolor=#E8FFE8 onload="load()">

<style>
	#tittle{
	text-align:center;
	margin-top:30px;
	margin-bottom:-1px;
	background-color:#a1bd93;
	width:515px;
	margin-left:200px;
	padding:10px;
	border-radius:5px 5px 0 0;
	}
	.abc{
	display:flex;
	padding:20px;
	margin-left:20px;
	}
	.selectcom{
	height:100%;
	margin-left:200px;
	margin-right:200px;
	padding:20px;
	box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:0px 0px 5px 5px;
	}
	#zxc{
	width:200px;
	
	}
	.zxc{
	padding:10px;
	}
	.selectbtn{
	margin-left:390px;
	margin-bottom:10px;
	}
	.selectcom2{
	height:100%;
	margin-left:200px;
	margin-right:200px;
	padding:20px;
	box-shadow:5px 5px 5px 3px rgba(0, 0, 0, 0.5);
	border-radius:5px;
	margin-top:30px;
	}
	label{
	margin-right:15px;
	}
	.form-control{
	height:30px;
	margin-bottom:10px;
	margin-right:10px;
	}
	
</style>


<h5 id="tittle" class="page-title text-center" style='color:#fff;font-size:50px;'>Select Commodity</h5>
  
  <fieldset class="selectcom">
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
    <div class="abc">
        <label>輸入商品編號 (如1):</label>
        <input class="form-control" type="text" name="comID" style="width:100px;height:30px;margin-bottom:10px;">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出" style="padding:5px 5px;margin-top:-2px;height:35px;">
    </div>
    </FORM>
 

  <jsp:useBean id="comSvc" scope="page" class="com.commodity.model.ComService"/>
   

     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
     <div class="abc">
       <label>選擇商品編號:</label>
       <select class="form-control" size="1" name="comID" style="width:auto;">
         <c:forEach var="comVO" items="${comSvc.all}" > 
          <option value="${comVO.comID}">${comVO.comID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出" style="padding:5px 5px;margin-top:-2px;height:35px;">
       </div>
    </FORM>

  

     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
     <div class="abc">
       <label>選擇商品名稱:</label>
       <select  class="form-control" size="1" name="comID" style="width:auto;">
         <c:forEach var="comVO" items="${comSvc.all}" > 
          <option value="${comVO.comID}">${comVO.comName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出" style="padding:5px 5px;margin-top:-2px;height:35px;">
       </div>
     </FORM>

  
  <jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService"/>
  
  <FORM method="post" action="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" >
  <div class="abc">
  <label >選擇商品分類類別:</label>
  <select  class="form-control" size="1" name="comcID" style="width:auto;">
  <c:forEach var="comcVO" items="${comcSvc.all}">
  	<option value="${comcVO.comcID}">${comcVO.comcName}
  </c:forEach>
  </select>
  <input type="submit" value="送出" style="padding:5px 5px;margin-top:-2px;height:35px;">
  <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
  <input type="hidden" name="action" value="listCom_ByComcID_A">
  </div>
  </FORM>
  <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	
</c:if>
</fieldset>

<fieldset class="selectcom2">
<h5 style='color:#fff;font-size:20px;background-color:#a1bd93;width:100px;text-align:center;border-radius:5px;'><font>複合查詢</font></h5>
  
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1">
        <div class="abc">
        <label>輸入商品ID:</label>
        <input  class="form-control" type="text" name="COM_ID" value="" id="zxc" style="width:100px;height:30px;margin-bottom:10px;"><br>
         </div>
         <div class="abc">
       <label>輸入商品名稱:</label>
       <input class="form-control" type="text" name="COM_NAME" value="" id="zxc" style="width:100px;height:30px;margin-bottom:10px;"><br>
       </div>
       <div class="abc">
       <label>輸入商品簡介:</label>
       <input class="form-control" type="text" name="COM_CONTENT" value="" id="zxc" style="width:100px;height:30px;margin-bottom:10px;"><br>
    	</div>
    	<div style="display:flex;margin-left:30px;margin-bottom:20px;">
       <label>選擇商品分類類別:</label>
       <select class="form-control" size="1" name="COMC_ID" id="COMC" style="width:120px;" >
       
         <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
         <c:forEach var="comcVO" items="${comcSvc.all}"> 
          <option value="${comcVO.comcID}">${comcVO.comcName}
         </c:forEach>   
       </select><br>
       </div>
       <div style="display:flex;margin-left:30px;margin-bottom:20px;">
       <label>價格範圍:</label>
       <input class="form-control" type="text" name="COM_PRICE" value="" autocomplete="off" style="width:100px;height:30px;margin-bottom:10px;"> ~ 
       <input class="form-control" type="text" name="COM_PRICE2" value="" autocomplete="off" style="width:100px;height:30px;margin-bottom:10px;style="margin-right:10px;"><br>
       </div>
        
       <label style="margin-left:30px;">商品創建日期:</label><br>
       <div style="display:flex;margin-left:20px;padding:10px;margin-bottom:20px;">  
       <span style="margin-right:10px;" >起始日期</span>
	   <input  class="form-control" name="COM_TIME" id="f_date2" type="text" autocomplete="off" style="width:100px;height:30px;margin-bottom:10px;">
	   <span style="margin-right:10px;">~ 終止日期</span>
	   <input  class="form-control" name="end" id="f_date1" type="text" autocomplete="off" style="width:100px;height:30px;margin-bottom:10px;">  
		 </div>     
		  <div class="selectbtn">      
        <input type="submit" value="送出">
        <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller-->
        <input type="hidden" name="action" value="listCom_ByCompositeQuery">
        </div>
     </FORM>
     <c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	
</c:if>

</fieldset>






<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<!-- 參考網站: https://xdsoft.net/jqplugins/datetimepicker/ -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
$.datetimepicker.setLocale('zh'); // kr ko ja en
$(function(){
	 $('#f_date2').datetimepicker({
	  theme:"dark",
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    maxDate:$('#f_date1').val()?$('#f_date1').val():false
	   })
	  },
	  timepicker:false
	 });
	 
	 $('#f_date1').datetimepicker({
	  theme:"dark",
	  format:'Y-m-d',
	  onShow:function(){
	   this.setOptions({
	    minDate:$('#f_date2').val()?$('#f_date2').val():false
	   })
	  },
	  timepicker:false
	 });
});
</script>

<script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
	console.log(servletPathName);
</script>
</body>


</html>