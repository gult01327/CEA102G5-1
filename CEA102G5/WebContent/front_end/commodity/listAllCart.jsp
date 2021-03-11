<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity.controller.*"%>
<%@ page import="com.member.model.*"%>

<html>
<head><title>�ʪ����C�� - listAllCart.jsp</title>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
  
  #form1{
  	display:inline;
  }
</style>

</head>
<body bgcolor=#E8FFE8>

<h4>�����m�߱ĥ� EL ���g�k����:</h4><br>

	<tr>
		<td>
			 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">�ʪ����C��</font><br>
			 <h4><a href="<%=request.getContextPath()%>/front_end/commodity/comindex.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">�^�ӫ�����</a></h4>
		</td>
	</tr><br><br>
	<%MemVO memVO = (MemVO)session.getAttribute("memVO"); %>
	<%CartService cartSvc = new CartService(); %>
	<%ComService comSvc = new ComService(); %>
	<%List list = cartSvc.getAllByMemID(memVO.getMemID()); %>
	<tr>
		<td>
			<font color="red">�ʪ������@��:<%=list.size()%> ���ӫ~</font>
		</td>
	</tr>


<table>
	<tr>
		<th>�Ŀ�����b�ӫ~</th>
		<th>�|��ID</th>
		<th>����ID</th>
		<th>�����W��</th>
		<th>�����Ϥ�</th>
		<th>�ƶq(��)</th>
		<th>���</th>
		<th>�s�W�ɶ�</th>
		<th>�R��</th>
	</tr>

	<%Iterator it = list.iterator(); %>
	<%while(it.hasNext()){ %>
		<% CartVO cartVO = (CartVO)it.next(); %>	
		<% ComVO comVO = comSvc.getOneCom(cartVO.getComID()); %>
		<tr>
			<td><input type="checkbox"  name="checkComID" value="<%=cartVO.getComID()%>"></td>
			<td></td>
			<td></td>
			<td><%=comVO.getComName() %></td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader<%=comVO.getComPicSrc()%>&pic=1" height="100" width="100"></td>
			
			<td>
			 
			<button id ="minus">-</button>
			<input type="hidden" name="action" id="action" value="minusCount">
			<input type="hidden" name="comID" id="comID" value="<%=cartVO.getComID()%>">
			<input type="hidden" name="cardCount" id="cardCount" value="<%=cartVO.getCardCount()%>">
			
			<%=cartVO.getCardCount() %>
			
			<button id = "plus">+</button>
			<input type="hidden" name="action" value="plusCount">
			<input type="hidden" name="comID" id="comID" value="<%=cartVO.getComID()%>">
			<input type="hidden" name="cardCount" id="cardCount" value="<%=cartVO.getCardCount()%>">
			
			</td>
			
			<td>$<%=comVO.getComPrice()%></td>
			<td><%=cartVO.getCardTime() %></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/cart/comCart.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�R��">
			    <input type="hidden" name="comID" value="<%=cartVO.getComID()%>">
			    <input type="hidden" name="action" value="delete_Cart">
			  </FORM>
			</td>
		</tr>
<%} %>
</table>

 <form name="checkoutForm" action="<%=request.getContextPath()%>/front_end/cart/comCart.do" method="POST">
              <input type="hidden" name="action"  value="CHECKOUT">
              <input type="submit" value="�T�{�q��" class="button">
          </form>


<script>

var memID=${vo.id}
getCart();

	$("#minus").click(function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/cart/comCart.do",
			type: "POST",
			data:{
				action: $("#action").val(),
				comID: $("#comID").val(),
				cardCount: $("#cardCount").val()
				
			},
			
		});
	});
</script>

</body>
</html>