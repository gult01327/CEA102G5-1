<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>    

<%
	ComService comSvc = new ComService();
	List<ComVO> list = comSvc.getAll();
	pageContext.setAttribute("list",list);//將所有物件放在pageContext中
%>
<!DOCTYPE html  PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=BIG5">

<title>所有商品資料 </title>
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
			<td style="width:70px;">商品編號</td>
			<td style="width:70px;">商品名稱</td>
			<td style="width:70px;">商品價格</td>
			<td style="width:100px;">商品圖片</td>
			<td style="width:300px;">商品簡介</td>
			<td style="width:70px;">商品狀態</td>
			<td style="width:70px;">商品重量</td>
			<td style="width:70px;">商品單位</td>
			<td style="width:100px;">商品熱量(cal)</td>
			<td style="width:100px;">商品碳水(g)</td>
			<td style="width:100px;">商品蛋白質(g)</td>
			<td style="width:100px;">商品脂肪(g)</td>
			<td style="width:70px;">商品特性</td>
			
			<td style="width:100px;">商品創建時間</td>
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
				<font color='blue'>下架</font>
			</c:if>
			<c:if test="${comVO.comStatus==1}">
				<font color='blue'>上架</font>
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
			     <input type="submit" value="修改">
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
            "lengthMenu": "顯示 _MENU_ 筆資料",
            "sProcessing": "處理中...",
            "sZeroRecords": "?有匹配?果",
            "sInfo": "目前有 _MAX_ 筆資料",
            "sInfoEmpty": "目前共有 0 筆紀錄",
            "sInfoFiltered": " ",
            "sInfoPostFix": "",
            "sSearch": "尋找:",
            "sUrl": "",
            "sEmptyTable": "尚未有資料紀錄存在",
            "sLoadingRecords": "載入資料中...",
            "sInfoThousands": ",",
            "oPaginate": {
                "sFirst": "首頁",
                "sPrevious": "上一頁",
                "sNext": "下一頁",
                "sLast": "末頁"
             },
             "order": [[0, "desc"]],
             "oAria": {
                 "sSortAscending": ": 以升序排列此列",
                 "sSortDescending": ": 以降序排列此列"
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
				status.children().text("上架");
				status.next().next().val("1");
			}else{
				status.children().text("下架");
				status.next().next().val("0");
			}
		}
	});
	
 });
</script>
</body>
</html>