
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>

<%
  ComVO comVO = (ComVO) request.getAttribute("comVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�ӫ~��Ʒs�W</title>
</head>
<body>


<h3>�ӫ~��Ʒs�W:</h3>
<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
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
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" name="form1" enctype="multipart/form-data">
<table>

<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService" />
	<tr>
		<td>�����W��<font color=red><b>*</b></font></td>
		<td><select size="1" name="comcID">
			<c:forEach var="comcVO" items="${comcSvc.all}">
				<option value="${comcVO.comcID}" ${(comVO.comcID==comcVO.comcID)? 'selected':'' } >${comcVO.comcName}
			</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>�ӫ~�W��:</td>
		<td><input type="TEXT" name="comName" size="45" 
			 value="<%= (comVO==null)? "" : comVO.getComName() %>" /></td>
	</tr>
	<tr>
		<td>�ӫ~����:</td>
		<td><input type="TEXT" name="comPrice" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPrice()%>" /></td>
	</tr>
	<tr>
		<td>�ӫ~�Ϥ�</td>
		<td><input type="file" name="upfile1" id="myFile"></td>
	</tr>
	<tr>
		<td>�ӫ~²��</td>
		<td><input type="TEXT" name="comContent" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComContent()%>" /></td>
	</tr>
	<tr>
		<td>�ӫ~���A</td>
		<td><input type="TEXT" name="comStatus" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComStatus() %>" /></td>
	</tr>
	<tr>
		<td>�ӫ~���q</td>
		<td><input type="TEXT" name="comWeight" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComWeight() %>" /></td>
	</tr>
	<tr>
		<td>�ӫ~���</td>
		<td><input type="TEXT" name="comUnit" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComUnit()%>" /></td>
	</tr>
	<tr>
		<td>�ӫ~���q</td>
		<td><input type="TEXT" name="comCal" size="45"
			 value="<%= (comVO==null)? "" :comVO.getComCal() %>" /></td>
	</tr>
	<tr>
		<td>�Ҥ��ƦX��</td>
		<td><input type="TEXT" name="comCarb" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComCarb() %>" /></td>
	</tr>
	<tr>
		<td>�J�ս�</td>
		<td><input type="TEXT" name="comPro" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComPro() %>" /></td>
	</tr>
	<tr>
		<td>�׽�</td>
		<td><input type="TEXT" name="comFat" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComFat() %>" /></td>
	</tr>
	<tr>
		<td>�ʽ�</td>
		<td><input type="TEXT" name="comProp" size="45"
			 value="<%= (comVO==null)? "" : comVO.getComProp()%>" /></td>
	</tr>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W">
</FORM>


<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<% 
  java.sql.Date hiredate = null;
  try {
	    hiredate = comVO.getComTime();
   } catch (Exception e) {
	    hiredate = new java.sql.Date(System.currentTimeMillis());
   }
%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
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
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>