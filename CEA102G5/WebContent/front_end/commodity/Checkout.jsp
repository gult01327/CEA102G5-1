<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity.controller.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.member_recipient.model.*"%>

<html>
<head>
<title>訂單確認 - Checkout.jsp</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/checkOut.css">

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
	width: 800px;
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

</head>

   
<body bgcolor=#E8FFE8>


	<tr>
		<td>
			 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">訂單確認</font><br>
			 <h4><a href="<%=request.getContextPath()%>/front_end/commodity/comindex.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">回商城首頁</a></h4>
		</td>
	</tr>



<table>
	<tr>
		<th>會員ID</th>
		<th>食材ID</th>
		<th>食材名稱</th>
		<th>食材圖片</th>
		<th>數量(份)</th>
		<th>單價</th>
		
	</tr>
	<%MemVO memVO = (MemVO)session.getAttribute("memVO"); %>
	<%List<CartVO> checkOutList =  (List<CartVO>) session.getAttribute("checkOutList");%>
	<%ComService comSvc = new ComService(); %>
	<%Iterator it = checkOutList.iterator(); %>
	<%while(it.hasNext()){ %>
		<% CartVO cartVO = (CartVO)it.next(); %>	
		<% ComVO comVO = comSvc.getOneCom(cartVO.getComID()); %>
		<tr>
			<td><%=cartVO.getMemID() %></td>
			<td><%=cartVO.getComID() %></td>
			<td><%=comVO.getComName() %></td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader<%=comVO.getComPicSrc()%>&pic=1" height="100" width="100"></td>
			<td><%=cartVO.getCardCount() %></td>
			<td>$<%=comVO.getComPrice()%></td>
		</tr>
<%} %>

<%String amount = (String)session.getAttribute("amount");%>
<tr>
		<td colspan="6" style="text-align:right;"> 
		   <font size="+2" color="red">總金額： <h4>$<%=amount%></h4> </font>
	    </td>
	</tr>

</table>
<form name="buyForm" id="buyForm" action="<%=request.getContextPath()%>/front_end/ordermaster/om.do" method="POST">

<br><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
   請選擇常用地址
  </button><br><br><br>

<%MemrVO memrVO = (MemrVO)request.getAttribute("memrVO"); %>
<%if(memrVO!=null){ %>
<tr>
		<td>收貨人姓名:</td>
		<td><input type="hidden" name="omrName" value="${memrVO.memrName}" />${memrVO.memrName}</td>
</tr><br>
<tr>
		<td>收貨人電話:</td>
		<td><input type="hidden" name="omrPhone" value="${memrVO.memrPhone}" />${memrVO.memrPhone}</td>
</tr><br>
<tr>
		<td>收貨人地址:</td>
		<td><input type="hidden" name="omrAdd" value="${memrVO.memrAddress}" />${memrVO.memrAddress}<br>
</tr><br><br>
<%} %>

              <input type="hidden" name="action"  value="BUY"> 
              <input type="hidden" name="amount"  value="<%=amount%>">               
              <input type="hidden" name="memrID"  value="${memrVO.memrID}"> 
              <input type="hidden" name="memID"  value="<%=memVO.getMemID()%>"> 
              <input type="hidden" id ="add" name="omrAdd"  value="">
              <input type="submit" value="付款結帳">
 </form>
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:1000px">
      <div class="modal-content" background-color="red">
        <div class="modal-header">
          <h2 class="modal-title" id="exampleModalLabel">請選擇常用收貨人資訊</h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <jsp:include page="/front_end/member/listAllMemRec.jsp" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>


</body>

</html>