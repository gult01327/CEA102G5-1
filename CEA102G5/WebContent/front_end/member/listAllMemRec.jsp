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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>
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
	width: 850px;
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

	<a class="organik-btn small" href="<%=request.getContextPath()%>/front_end/member/addMemRec.jsp">�s�W�`�Φa�}</a>
<table>
	<tr>
		<th>�Ŀ�`�Φa�}</th>
		<th>���f�H�W��</th>
		<th>���f�H�q��</th>
		<th>���f�H�a�}</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	
	<c:forEach var="memrVO" items="${memrSvc.getAllByMemID(memVO.getMemID())}">
		<tr>
			<td><input type="checkbox"  name="checkmemrID" value="${memrVO.memrID}"></td>
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
<FORM METHOD="post" id='formID'ACTION="<%=request.getContextPath()%>/front_end/member_recipient/memr.do" style="margin-bottom: 0px;">
			    <input id="checkBtn" type="submit" value="�T�{�a�}"> 
				<input type="hidden" id="checked" name="checkedAdd" value="">
			    <input type="hidden" name="action" value="confirmADD">
			   </FORM>
			   
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
	 
	 $("#checkBtn").click(function(e){
		 e.preventDefault();
		 let check = $("#checked").val();
		 if(check == ''){
			 swal('���~�I', '�п�ܤ@���a�}�I', 'error');
		 }else{
			 document.getElementById("formID").submit();
		 }
	 });
</script>

</html>