<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>

<style>
table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
	border: 3px ridge Gray;
	height: 80px;
	text-align: center;
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

</head>
<body bgcolor='white'>
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do">
		<b>查詢會員編號 :</b> <input type="text" name="mem_ID" size="1"> 
		<input type="hidden" name="action" value="getByMember"> 
		<input type="submit" value="送出" >
	</FORM>
	
    <jsp:useBean id="lesSvc" scope="page" class="com.lesson.model.LesService" /> 
       <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson.reservation/lesr.do" >
       <b>選擇課堂編號:</b>
       <select size="1" name="les_ID" >
         <c:forEach var="lesVO" items="${lesSvc.all}" > 
          <option value="${lesVO.lesID}">${lesVO.lesID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getByLesson">
       <input type="submit" value="送出">
    </FORM>
    
 <script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
</script>       
</body>
</html>