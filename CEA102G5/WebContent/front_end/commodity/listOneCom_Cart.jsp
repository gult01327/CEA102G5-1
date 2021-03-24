<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.cart.model.*"%>
<%@ page import="com.member.model.*"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  ComVO comVO = (ComVO) session.getAttribute("comVO"); //12CartServlet.java(Controller), 存入req的comVO物件
%>
<%MemVO memVO = (MemVO) session.getAttribute("memVO"); %>

<html>
<head>
<title>商品資料</title>


</head>
<body>

<style>

.product-carousel .owl-buttons{
	height:0px;
}

</style>
<div id="main">
                            <div class="single-product">
                                <div class="col-md-6">
                                    <div class="image-gallery">
                                        <div class="image-gallery-inner">
                                            <div>
                                             <div class="image-thumb">
                                                    <a href="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" data-rel="prettyPhoto[gallery]">
                                                        <img src="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" alt="" />
                                                    </a>
                                              </div>
											</div>
										</div>
									</div>
								</div>
								 <div class="col-md-6">
                                    <div class="summary">
                                        <h1 class="product-title">${comVO.comName}</h1>
                                        <div class="product-price">
                                            <ins>$${comVO.comPrice }</ins>
                                            <p>${comVO.comWeight} ${comVO.comUnit} /份</p>
                                        </div>
                                        <div class="mb-3">
                                        	
                                            <p>${comVO.comContent}</p>
                                        </div>
                                        <form class="cart">
                                            <div class="quantity-chooser">
                                                <div class="quantity">
                                                    <span class="qty-minus" data-min="1"><i class="ion-ios-minus-outline"></i></span>
                                                    <input type="text" id='quantity' name="quantity" value="1" title="Qty" class="input-text qty text" size="4">
                                                    <span class="qty-plus" data-max=""><i class="ion-ios-plus-outline"></i></span>
                                                </div>
                                            </div>
                                            <button type="button" id="single-add-to-cart">ADD TO CART</button>
                                            <input type='hidden' id='comID' value='${comVO.comID}'>
                                            <input type='hidden' id='memID' value='${memVO.memID}'>
                                            <input type='hidden' id='location' value='<%=request.getServletPath()%>'>
                                        </form>
                                        <div class="product-tool" style='cursor:pointer' id='favorite'>
                                             <img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heartempty.png' width='50px' height='50px'>
                                             <font size='+2' style='margin-left:20px; vertical-align:bottom;'>加入收藏</font>
                                        </div>
                                    </div>
                                </div>
                                                                <div class="col-md-12">
                                    <div class="commerce-tabs tabs classic">
                                        <ul class="nav nav-tabs tabs">
                                            <li class="active">
                                                <a data-toggle="tab" href="#tab-description" aria-expanded="true">Description</a>
                                            </li>
                                            <li class="">
                                                <a data-toggle="tab" href="#tab-reviews" aria-expanded="false">Reviews</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div class="tab-pane fade active in" id="tab-description">
                                                <p>
                                                    ${comVO.comContent}<br>
                                                    <br>
                                                    <br>
                                                    <h4>商品基本營養成分</h4>
                                                                                                                商品熱量:${comVO.comCal}g<br>
                                                                                                                商品碳水化合物含量:${comVO.comCarb}g<br> 
                                                                                                                商品蛋白質含量:${comVO.comPro}g<br>
                                                                                                                商品脂質含量:${comVO.comFat}g<br>
                                                </p>
                                            </div>
<jsp:useBean id="comSvc" scope="page" class="com.commodity.model.ComService"></jsp:useBean>                                                   
                                            <div id="tab-reviews" class="tab-pane fade">
                                                <div class="single-comments-list mt-0">
                                                    <div class="mb-2">
                                                        <h2 class="comment-title">${comSvc.getAllComComment(comVO.comID).size()} messages for ${comVO.comName}</h2>
                                                    </div>
<c:forEach var="comComtVO" items="${comSvc.getAllComComment(comVO.comID)}" >
                                                    <ul class="comment-list">
                                                        <li>
                                                            <div class="comment-container">
                                                                <div class="comment-author-vcard" style="height:150px;">
                                                                    <img alt="" src="<%=request.getContextPath()%>/ComPicReader${comComtVO.memPicSrc}&pic=1" width='50px' height='50px' />
                                                                </div>
                                                                <div class="comment-author-info">
                                                                    <span class="comment-author-name">${comComtVO.memName}</span>
                                                                    <c:if test="${comComtVO.odPoint == 1}">
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    </c:if>
                                                                    <c:if test="${comComtVO.odPoint == 2}">
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    </c:if>
                                                                    <c:if test="${comComtVO.odPoint == 3}">
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    </c:if>
                                                                    <c:if test="${comComtVO.odPoint == 4}">
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/starempty.png' width='20px'>
                                                                    </c:if>
                                                                    <c:if test="${comComtVO.odPoint == 5}">
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    <img src='<%=request.getContextPath()%>/resource/images/star.png' width='20px'>
                                                                    </c:if>

                                                                    <p>${comComtVO.odMessage}</p>
                                                                    
                                                                    
                                                                    
                                                                </div>
                                                                <c:if test="${!empty comComtVO.odResponse}">
                                                                	<div style="background-color:#f5f5f5;margin:0px 70px;">
                                                                		賣家回覆:<br>${comComtVO.odResponse}
                                                                	</div>
                                                                </c:if>
                                                            </div>
                                                        </li>                             
                                                    </ul>
</c:forEach>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="related">
                                        <div class="related-title">
                                            <div class="text-center mb-1 section-pretitle fz-34">Related</div>
                                            <h2 class="text-center section-title mtn-2 fz-24">Ingredients</h2>
                                        </div>
                                        <div class="product-carousel p-0" data-auto-play="true" data-desktop="3" data-laptop="2" data-tablet="2" data-mobile="1">
<jsp:useBean id="comcSvc" scope="page" class="com.commodity_category.model.ComcService"></jsp:useBean>   
<c:forEach var="comVO" items="${comcSvc.getComsByComcIDwithSales(comVO.comcID)}" end="4" >
                                            <div class="product-item text-center">
                                                <div class="product-thumb">
                                                    <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
                                                        <div class="badges">
                                                            <span class="hot">Hot</span>
                                                        </div>
                                                        <img src="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" alt="" style="height:250px;"/>
                                                    </a>
                                                    <div class="product-action">
				                                        <span class="add-to-cart">
				                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
				                                        </span>
				                                        <input type="hidden" id="memID" value="${sessionScope.memVO.memID}">
				                                        <input type="hidden" id="comID" value="${comVO.comID}">
				                                        <input type='hidden' id='location' value='<%=request.getServletPath()%>'>
				                                        <span class="wishlist" style="cursor:pointer;">
				
				                                        </span>
				                                        <span class="compare">
				                                            Sales:${comVO.comSales}
				                                        </span>
				                                    </div>
                                                </div>
                                                <div class="product-info">
                                                    <a href="shop-detail.html">
                                                        <h2 class="title">${comVO.comName}</h2>
                                                        <span class="price">$${comVO.comPrice}</span>
                                                    </a>
                                                </div>
                                            </div>
</c:forEach>
                                        </div>
                                    </div>
                                </div>
							</div>
</div>





	
	<script>
<c:if test="${!empty comVO}">
	comID = ${comVO.comID};
</c:if>
</script>
    	<script type="text/javascript">
	
	 $("#single-add-to-cart").click(function(){
		let qty = $("#quantity").val();
		let comID = $("#comID").val();
		let memID = $("#memID").val();
		let location = $("#location").val();

		if(memID == ''){
			window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location="+location+"&comID="+comID+"";
			return;
		}

		$.ajax({
			url:"<%=request.getContextPath()%>/cart/comCart.do",
			type:"post",
			data:{
				action:"ADD",
				comID:comID,
				cardCount:qty
			},
			cache:false,
			ifModified :true,
			success : function(){
				window.location.reload();
			}
		});
		
	 });
	 //收藏讀取用
	window.onload = function(){

		let comID = $("#comID").val();
		let memID = $("#memID").val();

		if(memID == ''){
			let html=""
			html="<img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heartempty.png' width='50px' height='50px'>";
			html+="<font size='+2' style='margin-left:20px; vertical-align:bottom;'>加入收藏</font>";
			document.getElementById("favorite").innerHTML = html;
		}else{
			$.ajax({
				url:"<%=request.getContextPath()%>/front_end/commodity/comf.do",
				type:"post",
				data:{
					action:"firstload",
					comID:comID,
					memID:memID,
				},
				cache:false,
				ifModified :true,
				success : function(date){
					if(date==="true"){
						let html=""
							html="<img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heart.png' width='50px' height='50px'>";	
							html+="<font size='+2' style='margin-left:20px; vertical-align:bottom;'>取消收藏</font>";
							document.getElementById("favorite").innerHTML = html;
					}else{
						let html=""
						html="<img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heartempty.png' width='50px' height='50px'>";	
						html+="<font size='+2' style='margin-left:20px; vertical-align:bottom;'>加入收藏</font>";
						document.getElementById("favorite").innerHTML = html;	
					}
				}
			});
		}
	}
	 
	 //收藏按鈕用
	 $("#favorite").click(function(){
			let comID = $("#comID").val();
			let memID = $("#memID").val();
			let location = $("#location").val();

			if(memID == ''){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location="+location+"&comID="+comID+"";
				return;
			}

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
					if(date==="true"){
						let html=""
							html="<img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heart.png' width='50px' height='50px'>";	
							html+="<font size='+2' style='margin-left:20px; vertical-align:bottom;'>取消收藏</font>";
							document.getElementById("favorite").innerHTML = html;
					}else{
						let html=""
						html="<img id='addFav'  src='<%=request.getContextPath()%>/resource/images/heartempty.png' width='50px' height='50px'>";	
						html+="<font size='+2' style='margin-left:20px; vertical-align:bottom;'>加入收藏</font>";
						document.getElementById("favorite").innerHTML = html;	
					}
				}
			});
			
		 });
		 
	 $(document).ready(function(){
			
	        $(".wishlist").each(function(){
				let wishlist=$(this);
	        	let comID =wishlist.prev().prev().val();
				let memID = wishlist.prev().prev().prev().val();
				let location = wishlist.prev().val();
				if(memID===null||memID===''){
					wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
				}else{
					$.ajax({
						url:"<%=request.getContextPath()%>/front_end/commodity/comf.do",
						type:"post",
						data:{
							action:"firstload",
							comID:comID,
							memID:memID,
						},
						cache:false,
						ifModified :true,
						success : function(date){
							if(date==="true"){
							console.log("123");
								wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heart.png' alt='' />");
								
							}else{
								wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
								
							}
						}
					});
				}
	        });
	    });
	    
	    $(".wishlist").click(function(){
	    	let wishlist=$(this);
     	let comID =wishlist.prev().prev().val();
			let memID = wishlist.prev().prev().prev().val();
			let location = wishlist.prev().val();
			if(memID == ''){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location="+location+"&comID="+comID+"";
				return;
			}

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
					if(date==="true"){
						wishlist.empty();
						wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heart.png' alt='' />");
					}else{
						wishlist.empty();
						wishlist.prepend("<img src='<%=request.getContextPath()%>/resource/images/heartempty.png' alt='' />");
					}
				}
			});
			
		 });
	    $(".add-to-cart").click(function(){
	    	let comID = $("#comID").val();
			let memID = $("#memID").val();
			if(memID == ""){
				window.location.href = "<%=request.getContextPath()%>/cart/comCart.do?action=ADD&location=<%=request.getServletPath()%>&comID="+comID+"";
				return;
			}
			$.ajax({
				url:"<%=request.getContextPath()%>/cart/comCart.do",
				type:"post",
				data:{
					action:"ADD",
					comID:comID,
					cardCount:1
				},
				cache:false,
				ifModified :true,
				success : function(){
					window.location.reload();
				}
			});
		});
	</script>

</body>
</html>