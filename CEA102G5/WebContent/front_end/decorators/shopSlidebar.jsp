<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<%String comName =request.getParameter("COM_NAME");%>
<html>
<head>
<meta charset="UTF-8">
<title>LessonSlidebar</title>

</head>
<body>

<style>
div.widget-products .product-list-widget li a img{
width:80px;
height:auto;
}
	#inToRight2{
	position:absolute;
	margin-left:180px;
	margin-top:20px;
	}
	
	.price_label{
	font-size:17px;
	margin-right:95px;
	margin-top:-35px;
	}
</style>

<div class="row">

<div class="col-md-9 col-md-push-3">
	<sitemesh:write property='body' />
</div>
<div class="col-md-3 col-md-pull-9">
                        <div class="sidebar">
                        	<form action="<%=request.getContextPath()%>/front_end/commodity/com.do" method="post">
	                            <div class="widget widget-product-search">
	                                
	                                    <input type="text" autocomplete="off" class="form-control" placeholder="Search Commodity…" value="<%= (comName==null)? "" : comName%>" name="COM_NAME" />
	                                    <input type="hidden" name="action" value="listCom_ByCompositeQueryFS">
	                                    <input type="submit" value="Search" id="inToRight2" />
	                                
	                            </div>

	                            
								<div style="color:red;margin:10px 5px;">
	                            	<%
	                            	String error=(String)session.getAttribute("error");
	                            	if (error!=null || error!=""){%>
	                            		<br>${error}
	                            	<%
	                            	session.removeAttribute("error");
	                            	}
	                            	%>
								</div>

	                            <div class="widget widget_price_filter">
	                                <h3 class="widget-title" style="margin-top:70px;margin-left:50px;margin-bottom:-25px;">Filter by price</h3>
	                                <div class="price_slider_wrapper">
	                                    <div class="price_slider" style="display:none;"></div>
	                                    <div class="price_slider_amount">
	                                    
	                                        <input type="text" id="min_price" name="COM_PRICE" value="" data-min="0" placeholder="Min price" />
	                                        <input type="text" id="max_price" name="COM_PRICE2" value="" data-max="1000" placeholder="Max price" />
	                                        <input type="submit" value="Filter" id="inToRight1" />
	                                        
	                                        <div class="price_label" style="display:none;">
	                                            Price: <span class="from"></span> &mdash; <span class="to"></span>
	                                        </div>
	                                        <div class="clear"></div>
	                                    </div>
	                                </div>
	                            </div>
                            </form>
                        
                            
                            
                            
					<!-- 左邊商品列 -->
                            <div class="widget widget-products">
                                <h3 class="widget-title" style="margin-left:40px;margin-bottom:10px;margin-top:20px">HOT SALES</h3>
                                <ul class="product-list-widget">
                                
<!--                                 蝶帶出銷量前幾的商品 -->
					                <jsp:useBean id="comSvc" class="com.commodity.model.ComService"/> 
									<c:forEach var="comVO" items="${comSvc.allForComindex}" begin="0" end="2">
										<li>
										 <a href="<%=request.getContextPath()%>/front_end/cart/comCart.do?action=getOne_For_Cart&comID=${comVO.comID}">
										 <img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" max-width=100>
										 <span>${comVO.comName}</span>
									     </a>
									     <ins>$ ${comVO.comPrice}</ins>
										</li>
									</c:forEach>
                                </ul>
                            </div>
                            
					<!--左下標籤 -->
                            <div class="widget widget-tags">
                            </div>
                        </div>
                    </div>

</div>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery-migrate.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/modernizr-2.7.1.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/owl.carousel.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.countdown.min.js"></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/jquery.prettyPhoto.init.min.js'></script>
    <script type='text/javascript' src='<%=request.getContextPath()%>/resource/js/slick.min.js'></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/core.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/widget.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/mouse.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/slider.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/jquery.ui.touch-punch.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/script2.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/popper.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/resource/js/price-slider.js"></script>

<script type="text/javascript">
</script>

</body>
</html>