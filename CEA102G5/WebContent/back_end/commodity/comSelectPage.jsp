<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>��x�ӫ~�޲z</title>
</head>
<body bgcolor=#E8FFE8 onload="load()">
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">��x�ӫ~�޲z</font>
<hr><p>
<h3>This is the Home page for Commodity: Home</h3>
<h4><a href="<%=request.getContextPath()%>/front_end/commodity/comindex.jsp"><img src="<%=request.getContextPath()%>/resource/images/3.jpg" width="70" height="70" border="0">�ӫ�����</a></h4>
<a href="<%=request.getContextPath()%>/back_end/member/memSelect.jsp">�|���޲z</a>

<h4>�ӫ~�d��:</h4>
<%-- ���~���C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href="<%=request.getContextPath()%>/back_end/commodity/listAllCom.jsp">�Ҧ��ӫ~�C��</a>   <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
        <b>��J�ӫ~�s�� (�p1):</b>
        <input type="text" name="comID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="comSvc" scope="page" class="com.commodity.model.ComService"/>
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
       <b>��ܰӫ~�s��:</b>
       <select size="1" name="comID">
         <c:forEach var="comVO" items="${comSvc.all}" > 
          <option value="${comVO.comID}">${comVO.comID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" >
       <b>��ܰӫ~�W��:</b>
       <select size="1" name="comID">
         <c:forEach var="comVO" items="${comSvc.all}" > 
          <option value="${comVO.comID}">${comVO.comName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
  <jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService"/>
  <li>
  <FORM method="post" action="<%=request.getContextPath()%>/back_end/commodity_category/comc.do" >
  <b><font color = "blue">��ܰӫ~�������O</font></b>
  <select size="1" name="comcID">
  <c:forEach var="comcVO" items="${comcSvc.all}">
  	<option value="${comcVO.comcID}">${comcVO.comcName}
  </c:forEach>
  </select>
  <input type="submit" value="�e�X">
  <input type="hidden" name="action" value="listCom_ByComcID_A">
  </FORM>
  
  </li>
</ul>


<h4><font color="red">�ƦX�d��:</font></h4>
<ul>  
  <li>   
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1">
        <b><font color="red">�U�νƦX�d��:</font></b> <br>
        <b>��J�ӫ~ID:</b>
        <input type="text" name="COM_ID" value=""><br>
           
       <b>��J�ӫ~�W��:</b>
       <input type="text" name="COM_NAME" value=""><br>
       
       <b>��J�ӫ~²��:</b>
       <input type="text" name="COM_CONTENT" value=""><br>
    
       <b>��ܰӫ~�������O:</b>
       <select size="1" name="COMC_ID" id="COMC" >
       
         <option selected="selected" disabled="disabled"  style='display: none' value=''></option>
         <c:forEach var="comcVO" items="${comcSvc.all}"> 
          <option value="${comcVO.comcID}">${comcVO.comcName}
         </c:forEach>   
       </select><br>
       
       <b>����d��:</b>
       <input type="text" name="COM_PRICE" value="" autocomplete="off"> ~ 
       <input type="text" name="COM_PRICE2" value="" autocomplete="off"><br>
       
           
       <b>�ӫ~�Ыؤ��:</b>  �_�l���
	   <input name="COM_TIME" id="f_date2" type="text" autocomplete="off"> ~ �פ���
	   <input name="end" id="f_date1" type="text" autocomplete="off">  
		        
		        
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listCom_ByCompositeQuery">
     </FORM>
  </li>
</ul>



<h4><font>�s�W�ӫ~:</font></h4>
<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/commodity/addCom.jsp'>ADD COMMODITY</a> </li>
</ul>

<h4><font color="blue">�s�W�ӫ~����:</font></h4>
<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/commodity/addComc.jsp'>ADD COMMODITY</a> </li>
</ul>

<h4><font color="blue">�ӫ~�����޲z:</font></h4>
<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/commodity/listAllComc.jsp'>MANAGE COMMODITY_CATEGORY</a> </li>
</ul>

<h4><font color="blue">�q��D�ɦC���޲z:</font></h4>
<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/commodity/listAllOm.jsp'>MANAGE ORDER_MASTER</a> </li>
</ul>

<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<!-- �ѦҺ���: https://xdsoft.net/jqplugins/datetimepicker/ -->
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
</script>
</body>


</html>