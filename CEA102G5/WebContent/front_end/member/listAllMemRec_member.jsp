<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member_recipient.model.*"%>
<%@ page import="com.member.model.*"%>
<% MemVO memVO = (MemVO)session.getAttribute("memVO"); %>
<jsp:useBean id="memrSvc" scope="page" class="com.member_recipient.model.MemrService" />

<html>
<head><title>�|���`�Φa�}�C�� - listAllMemRec.jsp</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>


</head>
<style>
  table#table-1 {
	background-color:#E8FFE8;
    border: 2px solid black;
    text-align: ;
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
	width: 900px;
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


<table>
	<tr>
		<th>���f�H�W��</th>
		<th>���f�H�q��</th>
		<th>���f�H�a�}</th>
		<th></th>
		<th></th>
	</tr>
	
	<c:forEach var="memrVO" items="${memrSvc.getAllByMemID(memVO.getMemID())}">
		<tr>
			<td>${memrVO.memrName}</td>
			<td>${memrVO.memrPhone}</td>
			<td>${memrVO.memrAddress}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member_recipient/memr.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="memrID"  value="${memrVO.memrID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/member_recipient/memr.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="memrID"  value="${memrVO.memrID}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			
		</tr>
	</c:forEach>
	
			  
	
</table>

			    <input id="newAdd" type="button" value="�s�W�a�}"> 

<script type="text/javascript">
$("#newAdd").click(function(){
	window.location.href = "<%=request.getContextPath()%>/front_end/member/addMemRec.jsp";
});

</script>
			   
<script type = "text/javascript">
	$(document).ready(function(){
		$('#test').click(function(){
			console.log(window.opener);
// 			debugger;
// 			window.close();
		});
		$("input[name=checkmemrID]").click( function () {
		var Selected = $(this).val();
		$("#checked").attr("value",Selected);
		console.log(Selected);
		$("input[name=checkmemrID]").each(function(i){
		if($(this).val() == Selected) $(this).prop("checked", true);
		else $(this).prop("checked", false);
		});
		});
	
	});
	
	 function show() {
	        
	        console.log(Selected);
	    }
</script>

</html>