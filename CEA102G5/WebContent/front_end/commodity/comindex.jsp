<%@page import="com.commodity_category.model.ComcService"%>
<%@page import="com.cart.model.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity_category.model.*"%>
<%@ page import="com.member.model.*"%>       

<%
 	ComService comSvc = new ComService();
 	List<ComVO> list = comSvc.getAllForComindex();
 	pageContext.setAttribute("list",list);//為了分頁
 	ComcService comcSvc = new ComcService();
 	List<ComcVO> countList = comcSvc.getComCountByComc();
%>
	<%CartService cartSvc = new CartService(); 
%>
<%MemVO memVO = (MemVO) session.getAttribute("memVO"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0" />

<title>所有商品資料 </title>
<style>
		#cf{
			text-align: center;
			width: 80%;
			margin: 20px auto;
		}
		#cf div{
			width: 32%;
			float: left;
			margin-right: 10px;
			margin-top: 10px;
		}
		#cf div img{
			width: 80%;
			height: 150px;
		}
		#cf div p{
			color:#999;
			text-align: center;
		}

</style>
 
</head>
<body bgcolor=#E8FFE8>

	<%@ include file="page1.file" %> 
<div id="cf">
<div class="category-carousel-2 mb-3" data-auto-play="true" data-desktop="3" data-laptop="3" data-tablet="2" data-mobile="1">
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#f8c9c2">
                                    <a class='getComBycomcID' href='#'>
                                    	<input type='hidden' value='<%=countList.get(1).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/meat.png" alt="" />
                                        <h2 class="category-title">
                                            Meat <mark class="count">(<%=countList.get(1).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#c6e6f6">
                                    <a class='getComBycomcID' href="#">
                                    	<input type='hidden' value='<%=countList.get(2).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/seafood2.png" alt="" />
                                        <h2 class="category-title">
                                            Seafood<mark class="count">(<%=countList.get(2).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#FFBB66">
                                    <a class='getComBycomcID' href="#">
                                    	<input type='hidden' value='<%=countList.get(0).getComcID()%>'>
                                        <img src="<%=request.getContextPath()%>/resource/images/category/fruits2.png" alt="" />
                                        <h2 class="category-title">
                                            Fruits <mark class="count">(<%=countList.get(0).getComCount()%>)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#66CDAA">
                                    <a href="#">
                                        <img src="<%=request.getContextPath()%>/resource/images/category/vegetables.png" alt="" />
                                        <h2 class="category-title">
                                            Vegetables <mark class="count">(6)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                            <div class="cat-item">
                                <div class="cats-wrap" data-bg-color="#e0d1a1">
                                    <a href="#">
                                        <img src="<%=request.getContextPath()%>/resource/images/category/Seasoning.png" alt="" />
                                        <h2 class="category-title">
                                            Seasoning <mark class="count">(6)</mark>
                                        </h2>
                                    </a>
                                </div>
                            </div>
                        </div>
<div class="product-grid">

<c:forEach var="comVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                            <div class="col-md-4 col-sm-6 product-item text-center mb-3">
                                <div class="product-thumb">
                                    <a href="shop-detail.html">
                                        <img src="<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" alt="" width='100px' height='100px' />
                                    </a>
                                    <div class="product-action">
                                        <span class="add-to-cart">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to cart"></a>
                                        </span>
                                        <span class="wishlist">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Add to wishlist"></a>
                                        </span>
                                        <span class="quickview">
                                            <a href="#" data-toggle="tooltip" data-placement="top" title="Quickview"></a>
                                        </span>
                                        <span class="compare">
                                            Sales:${comVO.comSales}
                                        </span>
                                    </div>
                                </div>
                                <div class="product-info">
                                    <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
                                        <h2 class="title">${comVO.comName}</h2>
                                        <span class="price">
                                            <ins>$${comVO.comPrice}</ins>
                                        </span>
                                    </a>
                                </div>
                            </div>
</c:forEach>
</div>

 

<%@ include file="page2.file" %>

</div>

    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/modernizr-2.7.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.init.min.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/core.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/widget.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/mouse.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/slider.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>
     <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/popper.min.js"></script>
    <script type="text/javascript">
			$(".getComBycomcID").click(function(){
				var comcID = $(this).children().val();

					$.ajax({
						url:"<%=request.getContextPath()%>/commodity_category/comc.do",
						type:"post",
						data:{
							action:"listComforByComcIDwithSales",
							comcID:comcID
						},
						dataType:"json",
						cache:false,
						ifModified :true,
						success : function(data){
							generateTable(data);
						}
						
					});
			});
		function generateTable(data){
			var html = "";
			for(let i = 0 ; i<data.length ; i++){
				html += "<div class='col-md-4 col-sm-6 product-item text-center mb-3'><div class='product-thumb'>";
				html += "<a href='shop-detail.html'><img src='<%=request.getContextPath()%>/ComPicReader"+data[i].comPicSrc+"&pic=1' alt='' /></a>";
				html += "<div class='product-action'><span class='add-to-cart'><a href='#' data-toggle='tooltip' data-placement='top' title='Add to cart'></a></span>";
				html += "<span class='wishlist'><a href='#' data-toggle='tooltip' data-placement='top' title='Add to wishlist'></a></span>";
				html += "<span class='quickview'><a href='#' data-toggle='tooltip' data-placement='top' title='Quickview'></a></span>";
				html += "<span class='compare'>Sales:"+data[i].comSales+"</span></div></div>";
			 	html += "<div class='product-info'><a href='<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID="+data[i].comID+"'><h2 class='title'>"+data[i].comName+"</h2><span class='price'><ins>$"+data[i].comPrice+"</ins></span></a></div></div>";
			}
			$(".product-grid").html(html);
		}	
			
    </script>

</body>
</html>