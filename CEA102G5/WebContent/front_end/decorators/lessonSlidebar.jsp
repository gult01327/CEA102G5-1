<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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

</style>

<div class="row">

<div class="col-md-9 col-md-push-3">
	<sitemesh:write property='body' />
</div>
<div class="col-md-3 col-md-pull-9">
                        <div class="sidebar">
                            <div class="widget widget-product-search">
                                <form class="form-search">
                                    <input type="text" class="search-field" placeholder="Search Course…" value="" name="s" />
                                    <input type="submit" value="Search" id="inToRight1" />
                                </form>
                            </div>
                            <div class="widget widget_price_filter">
                                <h3 class="widget-title">Filter by price</h3>
                                <div class="price_slider_wrapper">
                                    <div class="price_slider" style="display:none;"></div>
                                    <div class="price_slider_amount">
                                        <input type="text" id="min_price" name="min_price" value="" data-min="0" placeholder="Min price" />
                                        <input type="text" id="max_price" name="max_price" value="" data-max="30000" placeholder="Max price" />
                                        <button type="submit" class="button" id=inToRight2>Filter</button>
                                        <div class="price_label" style="display:none;">
                                            Price: <span class="from"></span> &mdash; <span class="to"></span>
                                        </div>
                                        <div class="clear"></div>
                                    </div>
                                </div>
                            </div>
                            
                        
                            
                            
                            
					<!-- 左邊商品列 -->
                            <div class="widget widget-products">
                                <h3 class="widget-title">New  Lesson</h3>
                                <ul class="product-list-widget">
					                <jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/> 
									<c:forEach var="lesVO" items="${lesSvc.allTrueToFront}" begin="0" end="2">
										<li>
										 <a href="<%=request.getContextPath()%>/front_end/lesson/les.do?action=searchOneLesson&lesID=${lesVO.lesID}">
										 <img src = "<%=request.getContextPath()%>${lesVO.pic}" max-width=100>
										 <span>${lesVO.lesName}</span>
									     </a>
									     <ins>$ ${lesVO.lesPrice}</ins>
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
$("#inToRight2").click(
		function(e){
			console.log("in");
			console.log($("input.search-field").val());
			console.log($("#LES_Name").val());
			let lesName = $("input.search-field").val();
			e.preventDefault();
			$("#LES_Name").val($("input.search-field").val());
			$("#LES_Price1").val($("#min_price").val());
			$("#LES_Price2").val($("#max_price").val());
			$("#lessonQueryFront").submit();
		})
$("#inToRight1").click(
		function(e){
			console.log("in");
			console.log($("input.search-field").val());
			console.log($("#LES_Name").val());
			let lesName = $("input.search-field").val();
			e.preventDefault();
			$("#LES_Name").val($("input.search-field").val());
			$("#LES_Price1").val($("#min_price").val());
			$("#LES_Price2").val($("#max_price").val());
			$("#lessonQueryFront").submit();
		})
</script>

</body>
</html>