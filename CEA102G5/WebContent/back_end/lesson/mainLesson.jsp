<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%-- <c:if test="${empty sessionScope.account}"> --%>
<%-- 	<%session.setAttribute("location", request.getRequestURI());%> --%>
<%-- 	<%response.sendRedirect(request.getContextPath()+"/back_end/back_end_login.jsp");%> --%>
<%-- </c:if> --%>
<meta charset="UTF-8">
<title>Manage Lesson</title>
</head>
<body>

		
<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.css">
<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.js"></script>



		<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
<div>
<fieldset>
<legend>複合查詢</legend>
<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do">
<label for="coaVO">教練</label><br>
	<select name=COA_ID id=coaVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="coaVO" items="${coaSvc.normal}">
			<option value = "${coaVO.coaID}">${coaVO.coaName}</option>
		</c:forEach>
</select><br>
<label for="talVO">專長</label><br>
	<select name=TAL_ID id=talVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="talVO" items="${talSvc.all}">
			<option value = "${talVO.talID}">${talVO.talName}</option>
		</c:forEach>
</select><br>
<label for="LES_Name">課程名稱</label><br>
<input type=text id=LES_Name name=LES_NAME><br><br>
<fieldset style="width:400px;">
<legend style=font-size:15px>課程日期</legend>
<input placeholder="ex:2020-09-02" autocomplete="off" type=text id=LESDATE1 name=LES_DATE> - 
<input type=text id=LESDATE2 autocomplete="off" name=LES_DATE><br>
</fieldset><span style="color:red">${errorMsgs.LES_DATE}</span><br><br>
<fieldset style="width:400px;">
<legend style=font-size:15px>課程價格</legend>
<input placeholder="最低" type=number id=LES_Price name=LES_PRICE> - 
<input placeholder="最高" type=number id=LES_Price name=LES_PRICE><br>
</fieldset>
<input type="hidden" name="action" value="search"> 
<input id="add" type=submit value=查詢>
</form>
</fieldset>
</div>
		






<script type="text/javascript">

var servletPathName ="${pageContext.request.requestURI}";


$("#LESDATE1").datepicker({
	changeMonth : true,
	changeYear : true,
	dateFormat: "yy-mm-dd",
	maxDate:$("#lesDate").val(),
	onClose: function(selectedDate, inst) { 
		let endDate = new Date(Date.parse(selectedDate));
        endDate.setDate(endDate.getDate() + 1); 
        $("#LESDATE2").datepicker("option", "minDate", endDate); 
	     } 
});
$("#LESDATE2").datepicker({
	changeMonth : true,
	dateFormat: "yy-mm-dd",
	changeYear : true
});

</script>

</body>
</html>