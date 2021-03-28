<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>    

<%
	ComService comSvc = new ComService();
	List<ComVO> list = comSvc.getAll();
	pageContext.setAttribute("list",list);//�N�Ҧ������bpageContext��
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">

<title>�Ҧ��ӫ~��� </title>
</head>
<body bgcolor=#E8FFE8>
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
	width: auto;
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
<h2 class="page-title text-center" style='color:black;'>All Commodity</h2>
<hr><p>

<table id="table_id" class="display" style="border:0px #FFD382 solid;">
	<thead>
		<tr>
			<td style="width:70px;">�ӫ~�s��</td>
			<td style="width:70px;">�ӫ~�W��</td>
			<td style="width:70px;">�ӫ~����</td>
			<td style="width:100px;">�ӫ~�Ϥ�</td>
			<td style="width:300px;">�ӫ~²��</td>
			<td style="width:70px;">�ӫ~���A</td>
			<td style="width:70px;">�ӫ~���q</td>
			<td style="width:70px;">�ӫ~���</td>
			<td style="width:100px;">�ӫ~���q(cal)</td>
			<td style="width:100px;">�ӫ~�Ҥ�(g)</td>
			<td style="width:100px;">�ӫ~�J�ս�(g)</td>
			<td style="width:100px;">�ӫ~�ת�(g)</td>
			<td style="width:70px;">�ӫ~�S��</td>
			
			<td style="width:100px;">�ӫ~�Ыخɶ�</td>
			<td style="width:50px;border-top:0px #FFD382 solid;border-right:0px #FFD382 solid;border-bottom:0px #FFD382 solid;"></td>
			
			
		</tr>
	</thead>	
	<tbody>
 
	<c:forEach var="comVO" items="${list}">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100"></td>
			<td>${comVO.comContent}</td>

			<td class="status" style="color:biue;cursor: pointer;">
			<c:if test="${comVO.comStatus==0}">
				<font color='blue'>�U�[</font>
			</c:if>
			<c:if test="${comVO.comStatus==1}">
				<font color='blue'>�W�[</font>
			</c:if>
	</td>
	<input type="hidden" name="comID" value="${comVO.comID}">
	<input type="hidden" name="comStatus" value="${comVO.comStatus}">
			<td>${comVO.comWeight}</td>
			<td>${comVO.comUnit}</td>
			<td>${comVO.comCal}</td>
			<td>${comVO.comCarb}</td>
			<td>${comVO.comPro}</td>
			<td>${comVO.comFat}</td>
			<td>${comVO.comProp}</td>
			
			<td>${comVO.comTime}</td>
			<td style="border-top:0px #FFD382 solid;border-right:0px #FFD382 solid;border-bottom:0px #FFD382 solid;">
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="comID"  value="${comVO.comID}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
	</c:forEach>
		</tbody>
</table>


<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.css"/>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.24/datatables.min.js"></script>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

$(document).ready( function () {
	
    $('#table_id').DataTable({
    	"autoWidth": true,
    	"lengthMenu": [5,10,15],
    	"pageLength": 5,
    	"scrollX": true,
    	"order": [0, 'desc'],
        "language": {
            "lengthMenu": "��� _MENU_ �����",
            "sProcessing": "�B�z��...",
            "sZeroRecords": "?���ǰt?�G",
            "sInfo": "�ثe�� _MAX_ �����",
            "sInfoEmpty": "�ثe�@�� 0 ������",
            "sInfoFiltered": " ",
            "sInfoPostFix": "",
            "sSearch": "�M��:",
            "sUrl": "",
            "sEmptyTable": "�|������Ƭ����s�b",
            "sLoadingRecords": "���J��Ƥ�...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "����",
                "sPrevious": "�W�@��",
                "sNext": "�U�@��",
                "sLast": "����"
             },
             "order": [[0, "desc"]],
             "oAria": {
                 "sSortAscending": ": �H�ɧǱƦC���C",
                 "sSortDescending": ": �H���ǱƦC���C"
             }
            }
    });
    
});
$(".status").click(function(){
	let status=$(this);
	let comID = status.next().val();
	let comStatus = status.next().next().val();
	

	$.ajax({
		url:"<%=request.getContextPath()%>/front_end/commodity/com.do",
		type:"post",
		data:{
			action:"comStatusChangeajax",
			comID:comID,
			comStatus:comStatus,
		},
		cache:false,
		ifModified :true,
		success : function(date){
			console.log(date);
			if(date==="1"){
				status.children().text("�W�[");
				status.next().next().val("1");
			}else{
				status.children().text("�U�[");
				status.next().next().val("0");
			}
		}
	});
	
 });
</script>
</body>
</html>