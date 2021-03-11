<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity.controller.*"%>
<%@ page import="com.member.model.*"%>

<html>
<head><title>購物車列表 - listAllCart.jsp</title>
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

<h4>此頁練習採用 EL 的寫法取值:</h4><br>

	<tr>
		<td>
			 <img src="<%=request.getContextPath() %>/resource/images/food.jpg" height="100" width="100"><font size="+3">購物車列表</font><br>
			 <h4><a href="<%=request.getContextPath()%>/front_end/commodity/comindex.jsp"><img src="<%=request.getContextPath() %>/resource/images/3.jpg" width="100" height="100" border="0">回商城首頁</a></h4>
		</td>
	</tr><br><br>
	<%MemVO memVO = (MemVO)session.getAttribute("memVO"); %>

	<tr>
		<td>
			<font class = "font1" id = "font" color="red"></font>
		</td>
	</tr>


	
 <form class = "form1" id="form" name="checkoutForm" action="<%=request.getContextPath()%>/front_end/cart/comCart.do" method="POST">
	<table id="showPanel"></table>
              
              <input type="hidden" name="action"  value="CHECKOUT">
              <input type="submit" value="確認訂單" class="button">
</form>


<script>
	var memID=${memVO.memID};
	
	window.onload = function(){
		getCart(memID);
		
	}

	

	
	$("#showPanel").on("click","#minus",function(){

		var comID = $(this).parents("tr").children("td.comID").attr("value");
// 		var td = $(this).parents("tr").children("td.comID");
// 		var comID2 = td.text();
		var count = parseInt($(this).next("font").text());
		var font = $(this).next("font");
		if(count<2){
			$(this).attr("disabled",true);
			return;
		}
		
			$.ajax({
				url:"<%=request.getContextPath()%>/cart/comCart.do",
				type:"POST",
				data:{
					action:"minusCount",
					memID: memID,
					comID: comID,
					cardCount: count
				},
				dataType:"json",
				cache:false,
				ifModified:true,
				context:font,
				success:function(data){				
						count--;						
						$(this).text(count);
				}
		});
		
	});
	
	$("#showPanel").on("click","#plus",function(){
		var comID = $(this).parents("tr").children("td.comID").attr("value");
		var count = parseInt($(this).prev("font").text());
		var font = $(this).prev("font");
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			data:{
				action:"plusCount",
				memID:memID,
				comID:comID,
				cardCount:count
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			context:font,
			success:function(data){
				if(count>=1){	
					$(this).prev("input").attr('disabled',false);
					count++;
					console.log(count);
					$(this).text(count);
				}
			}
		});
		
		
	});
	
	
	
	function getCart(memID){
	 var cart = [];
	 
	 $.ajax({
		 url:"<%=request.getContextPath()%>/cart/comCart.do",
		 type:"POST",
		 data:{
			 action : "getAllCombyMemID",
			 memID : memID,
		 },
		 dataType : "json",
		 cache:false,
		 ifModified :true,
		 success : function(data){
			 for(let i = 0;i<data.length;i++){
				cart.push({
					memID : data[i].memID,					
					comID : data[i].comID,					
					cardCount : data[i].cardCount,
					cardTime : data[i].cardTime,
					comName : data[i].comName,
					comPrice : data[i].comPrice,
					comPicSrc : data[i].comPicSrc
				});	 
				console.log(data[i].memID);
				console.log(data[i].comID);
			 }
			 generateCart(cart);
		
			 
		 }
		 
	 });
	
	};
	
	function generateCart(cart){
		var html = "";
		html += "<tr><th>勾選欲結帳商品</th>";
		html += "<th>會員ID</th><th>食材ID</th><th>食材名稱</th><th>食材圖片</th><th>數量(份)</th><th>單價</th><th>新增時間</th><th>刪除</th></tr>";
		
		for(let i = 0 ; i<cart.length ; i++){
			
			html+= "<tr class='tr'><td><input type='checkbox'  name='checkComID' value='"+cart[i].comID+"'></td>";
			html+= "<td>"+cart[i].memID+"</td>";
			html+="<td class='comID' value='"+cart[i].comID+"'>"+cart[i].comID+"</td>";
			html+="<td>"+cart[i].comName+"</td>";
			html+="<td><img src = '<%=request.getContextPath()%>/ComPicReader"+ cart[i].comPicSrc +"&pic=1' height='100' width='100'></td>";
			html+="<td><input type='button' id='minus' value='-'>&nbsp&nbsp<font class='font'>"+cart[i].cardCount+"</font>&nbsp&nbsp<input type='button' id='plus' value='+'></td>";
			html+="<td>$"+ cart[i].comPrice+"</td>";
			html+="<td>"+cart[i].cardTime+"</td>";
			html+="<td><input type='button' id='delete' value='刪除'></td><tr>";

			
		}
				document.getElementById("showPanel").innerHTML = html;
				document.getElementById("font").innerHTML = "購物車內共有"+ cart.length + "件商品";
		
	}
	
	$("#showPanel").on("click","#delete",function(){
		var str = $("#font").text();
   	 	console.log(str);
		var comID = $(this).parents("tr.tr").children("td.comID").text();
		var tr = $(this).parents("tr.tr");
		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"POST",
			 data:{
				 action : "delete_Cart",
				 memID : memID,
				 comID : comID
			 },
			 dataType : "json",
			 cache:false,
			 ifModified :true,
			 context:tr,
		     success:function(data){
		    	 console.log("success remove! size:" + data);
		    	 $(this).remove();
		    	 var message = "購物車內共有"+data+"件商品";
		    	 console.log(message);
		    	 $("#font").text(message);
		     }
		});
	});
</script>

</body>
</html>