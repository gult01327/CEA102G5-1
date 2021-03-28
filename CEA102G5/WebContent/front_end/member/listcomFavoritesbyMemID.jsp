<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.member.model.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); 
int memID = memVO.getMemID();
ComService comSvc =new ComService();
List list = comSvc.getFavorite(memID);
pageContext.setAttribute("list",list);
%>

<html>
<head><title>訂單明細 - listOd_ByOmID.jsp</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/lightbox.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>



<body bgcolor=#E8FFE8>
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

	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
  }
  textarea{
  	resize:none;
  }
</style>
<h2 class="page-title text-center" style='color:black;'>Favorite Commodity</h2>

	


<table style="border-right:0px #FFD382 solid;border-bottom:0px #FFD382 solid;" class="table table-hover">
	<tr>
		<th>商品名稱</th>
		<th>商品價格</th>
		<th>商品圖片</th>
<!-- 		<th>商品圖片2</th> -->
		<th>商品簡介</th>
		<th>商品銷量</th>
	</tr>

	<c:forEach var="comVO" items="${list}">
		
		<tr>
			<td ><a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}" style="color:blue">${comVO.comName}</a></td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100"></td>
<%-- 			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=2" height="100" width="100"></td> --%>
			<td>${comVO.comContent}</td>
			<td align="center">${comVO.comSales}</td>
			<td align="center" style="border-top:0px #FFD382 solid;border-right:0px #FFD382 solid;border-bottom:0px #FFD382 solid;">
				<img alt="" src="<%=request.getContextPath()%>/resource/images/trash.png" id="dele">
				<input type="hidden" id="memID" value="${sessionScope.memVO.memID}">
                <input type="hidden" id="comID" value="${comVO.comID}">
                <input type='hidden' id='location' value='<%=request.getServletPath()%>'>
			</td>
		</tr>
	</c:forEach>
</table>


<script type="text/javascript">

$(document).on('click','#dele',function(){
	let del=$(this);
	let comID =del.next().next().val();
	let memID =del.next().val();
	let location = del.next().next().next().val();
	$.ajax({
		url:"<%=request.getContextPath()%>/front_end/commodity/comf.do",
		type:"post",
		data:{
			action:"insertByRedis",
			comID:comID,
			memID:memID,
		},
		cache:false,
		ifModified :true,
		success : function(date){
			del.parent().parent().empty();	
		}
	});
	
 });
</script>


</body>
</html>