<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.10.3/sweetalert2.js" type="text/javascript"></script>

</head>
<body>
<style>
	.wishlist-wrap{
	overflow-y:auto;
	max-height:600px;
	padding:10px;
	margin-left:20px;
	}
	#showAmount{
		font-size:25px;
		margin-top:20px;
		display:flex;
	}
	.fontstyle{
	position:absolute;
	font-size:15px;
	margin-top:-100px;
	margin-left:20px;
	}
	#openModal{
	margin-top:-80px;
	margin-left:60px;
	position:absolute;
	}
	#checkBonus{
	width:15px;
	height:15px;
	position:absolute;
	right:170px;
	margin-top:-25px;
	}
	.fontscore{
	font-size:15px;
	position:absolute;
	margin-left:670px;
	margin-top:-30px;
	}
	#submitBtn{
	position:absolute;
	padding:15px 5px;
	margin-top:-100px;
	margin-left:20px;
	
	}
</style>

<h2 class="page-title text-center" style='color:black;font-size:50px;margin-bottom:20px;'>Check Out</h2>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-9">
								<div class="wishlist-wrap">
									<table class="table shop-cart">
										<thead>
											<tr class="cart_item">												
												<td class="product-thumbnail">&nbsp;</td>
												<td class="product-info">Product</td>
												<td class="product-subtotal">Unit Price</td>
												<td class="product-stock">Quantity</td>
												<td class="product">Amount</td>
											</tr>
										</thead>
										<tbody>
<form id="checkoutForm" name="checkoutForm" action="<%=request.getContextPath()%>/front_end/ordermaster/om.do" method="POST">
										 <c:forEach var="cartVO" items="${checkOutList}">
											<tr class="cart_item">
												<td class="product-thumbnail">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">
														<img src="<%=request.getContextPath()%>/ComPicReader${cartVO.comPicSrc}&pic=1" alt="">
													</a>
												</td>
												<td class="product-info">
													<a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${cartVO.comID}">${cartVO.comName}</a>
												</td>
												<td class="product-subtotal">
													<span class="amount">$${cartVO.comPrice}</span>
												</td>
												<td>
                                                     <font size='5' style='margin-left:5px; margin-right:5px;'>${cartVO.cardCount}</font>                                                  
												</td>
												<td>
													 <font size='5' style='margin-left:5px; margin-right:5px;'>$ ${cartVO.cardCount * cartVO.comPrice}</font>
												</td>
											</tr>
											 </c:forEach>
											 
										</tbody>
									</table>
								</div>
								<h3 id='showAmount' style='float:right; margin-right:300px;'>Total Amount :$ ${amount} </h3>
							</div>
						</div>
							<div>
								<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"></jsp:useBean>
								<input id='checkBonus' value='${memSvc.getMemBonus(memVO.memID).memBonus}' type='checkbox'><font class="fontscore">使用積分:${memSvc.getMemBonus(memVO.memID).memBonus}可用積分</font><br><br>
								<img src='<%=request.getContextPath()%>/resource/images/recipient.png' width='30px' height='30px' style="position:absolute;margin-top:-70px;margin-left:15px;">
								<input id='openModal' type='button' value='選擇收貨人地址資訊' >
								<br><br><br>
								<c:if test="${not empty memrVO}">
								<font class="fontstyle">收貨人姓名: ${memrVO.memrName}</font><br><br>
								<font class="fontstyle">收貨人電話: ${memrVO.memrPhone}</font><br><br>
								<font class="fontstyle">收貨人地址: ${memrVO.memrAddress}</font><br><br>
								</c:if>
								<input id='submitBtn' type='submit' value='付款結帳'>
								<input type="hidden" name="action"  value="BUY">
								<input type="hidden" name="memID"  value="${memVO.memID}">
								<input type="hidden" id="memrID" name="memrID"  value="${memrVO.memrID}">
								<input type="hidden" id='totalAmount' name="totalAmount"  value="${amount}">
</form>
							</div>
					</div>
				</div>
 
 
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:1000px">
      <div class="modal-content" background-color="red">
        <div class="modal-header">
          <h2 class="modal-title" id="exampleModalLabel" style="font-size:20px;">請選擇常用收貨人資訊</h2>
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
<script type="text/javascript">
	$("#openModal").click(function(){
		$("#exampleModal").modal("show");
	});
	
	$("#checkBonus").change(function(){
		var bonus = $(this).val();
		var totalAmount = ${amount};
		//checkbox用prop
		if($(this).is(':checked')){
			
			var newAmount = totalAmount - bonus;
			$("#showAmount").text("Total Amount: $"+newAmount);
			$("#totalAmount").val(newAmount);
			
		}else{
			$("#showAmount").text("Total Amount: $"+totalAmount);
			$("#totalAmount").val(totalAmount);
		}
		
	});
	
	$("#submitBtn").click(function(e){
		e.preventDefault();
		let memrID = $("#memrID").val();
		if(memrID == ''){
			swal('錯誤！', '請選擇地址！', 'error');
		}else{
			document.getElementById("checkoutForm").submit();
		}
		
	});
	
</script>

</body>

</html>