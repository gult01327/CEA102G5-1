<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Coach Info</title>
</head>
<body>
<div style='display:none;'>

<form id=lessonQueryFront METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/lesson/les.do">

<div style="display:inline-block;">
<label for="coaVO">教練</label><br>
	<select name=COA_ID id=coaVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="coaVO" items="${coaSvc.normal}">
			<option value = "${coaVO.coaID}">${coaVO.coaName}</option>
		</c:forEach>
</select>
</div>
<div style="display:inline-block;">
<label for="talVO">專長</label><br>
	<select name=TAL_ID id=talVO style=width:130px;>
		<option selected="selected" value=''></option>
		<c:forEach var="talVO" items="${talSvc.all}">
			<option value = "${talVO.talID}">${talVO.talName}</option>
		</c:forEach>
</select>
</div>
<div style="display:inline-block;">
	<label for="LES_Name">課程名稱</label><br>
	<input type=text id=LES_Name name=LES_NAME>
</div>
<div style="display:inline-block;">
	<input type="hidden" name="reqUrl" value="/front_end/lesson/listQueryLesson.jsp"> 
	<input type="hidden" name="action" value="search"> 
	<input type=submit value=查詢>
</div>


<hr>
<div style="display:inline-block;">
<fieldset style="width:420px;height:40px;">
<legend>日期</legend>
<div style="display:inline-block;">
	<input placeholder="ex:2020-09-02" autocomplete="off" type=text id=LESDATE1 name=LES_DATE> - <input autocomplete="off" type=text id=LESDATE2 name=LES_DATE>
</div>
<div style="display:inline-block;">
	<input type=submit value=查詢>
</div>
</fieldset><span style="color:red">${errorMsgs.LES_DATE}</span>
</div>
<div style="display:inline-block;">
<fieldset style="width:420px;height:40px;">
<legend>價格</legend>
<div style="display:inline-block;">
	<input placeholder="最低" type=number id=LES_Price1 name=LES_PRICE> - 
	<input placeholder="最高" type=number id=LES_Price2 name=LES_PRICE>
</div>
<div style="display:inline-block;">
	<input type=submit value=查詢>
</div>
</fieldset>
</div>
</form>

</div>
<jsp:useBean id="memSvc" class="com.member.model.MemService"/>
<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<jsp:useBean id="coatSvc" class="com.coach_talent.model.CoatService"/>
<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
<jsp:useBean id="expSvc" class="com.exp.model.ExpService"/>
<jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/>
<jsp:useBean id="lesrSvc" class="com.lesson_reservation.model.LesrService"/>
<!--${coaVO=coaSvc.getOneCoach(param.coaID)}-->
<div class=row>
	<div class="col-md-6">
		<img src="<%=request.getContextPath()%>${coaVO.pic}" width = 180>
	</div>
	<div class="col-md-6">
	</div>
</div>


<div id="tabs">
  <ul>
    <li><a href="#tabs-1">基本資訊</a></li>
    <li><a href="#tabs-2">專長</a></li>
    <li><a href="#tabs-3">資歷</a></li>
    <li><a href="#tabs-4">課程</a></li>
    <li><a href="#tabs-5">評價</a></li>
  </ul>
  <div id="tabs-1">
    <p>姓名 : ${coaVO.coaName}</p>
    <p>性別 : ${coaVO.coaSex}</p>
  </div>
  <div id="tabs-2">
  <c:forEach var="coatVO" items="${coatSvc.getByCoach(coaVO.coaID)}">
    <p>${talSvc.getTalent(coatVO.talID).talName}</p>
  </c:forEach>
  </div>
  <div id="tabs-3">
    <c:forEach var="expVO" items="${expSvc.getByCoach(coaVO.coaID)}">
    <p>${expVO.expContent}</p>
  </c:forEach>
  </div>
  <div id="tabs-4">
  <c:forEach var="lesVO" items="${lesSvc.getByCoachFront(coaVO.coaID)}">
    <p><a href="<%=request.getContextPath()%>/front_end/lesson/les.do?action=searchOneLesson&lesID=${lesVO.lesID}">${lesVO.lesEnd}--${lesVO.lesName}</a></p>
  </c:forEach>
  </div>
  <div id="tabs-5">
  <c:forEach var="lesVO" items="${lesSvc.getByCoach(coaVO.coaID)}">
 	 <c:forEach var="lesrVO" items="${lesrSvc.getMemByLes(lesVO.lesID)}">
    	<p>${memSvc.getOneMem(lesrVO.memID).memName}:${lesrVO.lesrComments}</p>
	  </c:forEach>
	</c:forEach>
  </div>
</div>


<script>
$( function() {
    $( "#tabs" ).tabs({
      event: "mouseover"
    });
  } );
  </script>


</body>
</html>