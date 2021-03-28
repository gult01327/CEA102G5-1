<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.lesson_reservation.model.*"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="lesSvc" scope="page"	class="com.lesson.model.LesService" />
<jsp:useBean id="lesrSvc" class="com.lesson_reservation.model.LesrService"></jsp:useBean>

<% 
    List<LesrVO> list = lesrSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>報名資料</title>

	
	
<style>
table#table-2 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-2 h4 {
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
	margin-top: 5px;
	margin-bottom: 5px;
	text-align: center;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th, td {
	padding: 5px;
	text-align: center;
}

#showID {
	color: green;
}

</style>

</head>
<body bgcolor='white'>

<style>
table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	text-align: center;
}
th{
    text-align: center;
}
tr{
	line-height: 50px;
}
</style>

	<table id="table-2">
		<tr>
			<td>
				<h3>報名資料</h3>
			</td>
		</tr>
	</table>

	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	

	<table border="1" width="900" >
		<tr >
			<th>課程編號</th>
			<th>課程名稱<i class="fas fa-running"></i></th>
			<th>報名狀態</th>
			<th>上課日期</th>
			<th>課後評價</th>
			<th>課後回覆</th>
			<th>評價</th>
			<th>課程狀態</th>

		</tr>

<%@ include file="page1.file" %>  
		<h4 id='showID'></h4>
		
		<c:forEach var="lesrVO" items="${lesrSvc.getLesByMem(sessionScope.memVO.memID)}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		    
			<tr ${(lesrVO.memID==param.memID) ? 'bgcolor=#CCCCFF':''}>
				<!--將修改的那一筆加入對比色-->
				<td class ="lesID">${lesrVO.lesID}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesName}</td>
				<input type='hidden' id='memID' value='${lesrVO.memID}' />
				<td>${(lesrVO.lesrStatus=="true"?"成功":"已取消")}</td>
				<td>${lesSvc.searchOne(lesrVO.lesID).lesDate}</td>
				<td>${lesrVO.lesrComments}</td>
				<td>${lesrVO.lesrAnswer}</td>
				
				<c:if test="${lesrVO.statusNow==true}">
				<c:if test="${empty lesrVO.lesrComments}">
				<td>
				    <input class ='one' type='button' value='寫評價'>
				    <input type="hidden" name="mem_ID" value="${lesrVO.memID}">
				    <input type="hidden" name="les_ID" value="${lesrVO.lesID}"> 
				</td>
				 </c:if> 
				 <c:if test="${not empty lesrVO.lesrComments}">
				 <td ><font color="red">填寫完畢</font></td>
				  </c:if> 
				 
				  
				  <c:if test="${lesrVO.lesrStatus==true}">
				    <td>課程已結束</td>
				  </c:if>
				  <c:if test="${lesrVO.lesrStatus==false}">
				    <td>已成功取消</td>
				  </c:if>
				</c:if>
				
				
				<c:if test="${lesrVO.statusNow==false}">
				<c:if test="${empty lesrVO.lesrReason}">
					<td>上課後可填寫</td>
					<td>
				    <input class ='two' type='button' value='取消'>
				    <input type="hidden" name="mem_ID" value="${lesrVO.memID}">
				    <input type="hidden" name="les_ID" value="${lesrVO.lesID}"> 
				    </td>
				</c:if>
				 <c:if test="${not empty lesrVO.lesrReason}">
				    <td>無</td>
				    <td>已成功取消</td>
				  </c:if>
				</c:if>
			</tr>
		</c:forEach>
	</table>
<%@ include file="page2.file" %>
	
<div class="modal fade" id="msgLesrDiv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">課程評價</h3>
        
      </div>
      <div class="modal-body">
        <textarea id='msgText' cols="60" rows="10" placeholder="請輸入評價"></textarea>
      </div>
      <div class="modal-footer">
        <button id='submitbtn' type="button" class="btn btn-primary" style="background: #5fbd74;">送出回覆</button>
        <input type='hidden' id='lesIDforMsg' value=''>
        <input type='hidden' id='memIDforMsg' value=''>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
        
      </div>
    </div>
  </div>
</div>

<div class="modal fade" id="msgLesrDiv2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">退課原因</h3>
        
      </div>
      <div class="modal-body">
        <textarea id='msgText2' cols="60" rows="10" placeholder="請輸入30字以內 " maxlength="30"></textarea>
      </div>
      <div class="modal-footer">
        <button id='submitbtn2' type="button" class="btn btn-primary" style="background: #5fbd74;">送出回覆</button>
        <input type='hidden' id='lesIDforMsg2' value=''>
        <input type='hidden' id='memIDforMsg2' value=''>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">返回</button>
       
      </div>
    </div>
  </div>
</div>
	<script type='text/javascript'>
		$(document).ready(function() {

			var memID = $("#memID").val();
			if (typeof (memID) == "undefined") {
				var str = "您尚無報名課程";
			} else {
				var str = "以下為您的報名資料";
			}
			$("#showID").text(str);

		});
		var servletPathName = "${pageContext.request.requestURI}";
		
		$("#submitbtn").click(function(){
			var lesID = $("#lesIDforMsg").val();
			var memID = $("#memIDforMsg").val();
			var msgText = $("#msgText").val();
			console.log(msgText);
			if(msgText.trim()==''){
				return;
			}
		
			$.ajax({
				url:"<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do",
				type:"post",
				data:{
					action:"updateOne",	
					lesID:lesID,
					memID:memID,
					lesrComments:msgText,
				},
				dataType:"text",
				cache:false,
				ifModified :true,
				success : function(data){
					$("#msgLesrDiv").modal("hide");		
					window.location.reload();
				}				
			});
			
		});
		
		$("#submitbtn2").click(function(){
			var lesID = $("#lesIDforMsg2").val();
			var memID = $("#memIDforMsg2").val();
			var msgText = $("#msgText2").val();
			console.log(msgText);
			if(msgText.trim()==''){
				return;
			}
		
			$.ajax({
				url:"<%=request.getContextPath()%>/front_end/lesson.reservation/lesr.do",
				type:"post",
				data:{
					action:"updateTwo",	
					lesID:lesID,
					memID:memID,
					lesrReason:msgText,
				},
				dataType:"text",
				cache:false,
				ifModified :true,
				success : function(data){
					$("#msgLesrDiv2").modal("hide");		
					window.location.reload();
				}				
			});
			
		});
		
		$(".one").click(function(){
			var lesIDstr = $(this).parents("tr").children("td.lesID").text();
			var memIDstr = $(this).next().val();
			$("#lesIDforMsg").val(lesIDstr);
			$("#memIDforMsg").val(memIDstr);
			$("#msgLesrDiv").modal("show");
		});
		
		$(".two").click(function(){
			var lesIDstr = $(this).parents("tr").children("td.lesID").text();
			var memIDstr = $(this).next().val();
			$("#lesIDforMsg2").val(lesIDstr);
			$("#memIDforMsg2").val(memIDstr);
			$("#msgLesrDiv2").modal("show");
		});
	</script>

</body>
</html>
</html>