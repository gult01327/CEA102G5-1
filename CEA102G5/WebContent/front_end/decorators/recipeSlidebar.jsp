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
										<form class="form-search" action='<%=request.getContextPath()%>/front_end/recipe/rec.do'>
											 <select name="selectType" id="selectType">
									                <option value="REC_NAME">找食譜</option>
									                <option value="MEM_NAME">找作者</option>
            								</select>
								            <input type="text" autocomplete="off" name='selectText' id="selectText"  required="required">
								            <label>
											<input type='submit' style='display:none;'>	
											<input type='hidden' name='action' value='getAllByCondition'>							            
								            <img id="searchPng" style='cursor:pointer' src="<%=request.getContextPath()%>/resource/images/search.png" alt="" width="30px" height="30px">
								            </label>								           		
										</form>
							</div>
                            
                        
                            
                            
                            <jsp:useBean id="recSvc" scope='page' class="com.recipe.model.RecService"/>
									<div class="widget widget_posts_widget">
										<h3 class="widget-title">Newest Posts</h3>
									<c:forEach var="recVO" items="${recSvc.all}" begin="0" end="2">
										<div class="item">
											<div class="thumb"> 
												<img src = "<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" max-width=100>
											</div>
											<div class="info">
												<span class="title">
													<a href="<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID=${recVO.recID}">${recVO.recName}</a> 
												</span> 
												<span class="date">${recVO.recTime}</span>
											</div>
										</div>
									</c:forEach>
									</div>

</div>

<script type="text/javascript">

</script>

</body>
</html>