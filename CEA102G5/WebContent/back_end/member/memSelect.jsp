<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>後台會員管理</title>
</head>
<body bgcolor=#E8FFE8 onload="load()">
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">後台會員管理</font>
<hr><p>
<!-- <h3>This is the Home page for Member: Home</h3> -->
<h4><a href="<%=request.getContextPath() %>/back_end/commodity/comSelectPage.jsp">回後台商品管理</a></h4>
<br>
<h4><a href='<%=request.getContextPath()%>/front_end/member/addMem.jsp'>新增會員</a></h4>
<br>
<h4><a href='<%=request.getContextPath()%>/back_end/member/listAllMem.jsp'>所有會員列表</a></h4>   
<br>
<h4><a href='<%=request.getContextPath()%>/front_end/member/login.jsp'>會員登入</a></h4>   
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
        <b>輸入會員編號 (如1):</b>
        <input type="text" name="memID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"/>
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       <b>選擇會員ID:</b>
       <select size="1" name="memID">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.memID}">${memVO.memID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       <b>選擇會員姓名:</b>
       <select size="1" name="memID">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.memID}">${memVO.memName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="送出">
     </FORM>
  </li>
  
<li>
<h4><font color=blue>萬用複合查詢:</font></h4>
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       
        <b>輸入會員編號:</b>
        <input type="text" name="mem_ID" value=""><br>       
       
       <b>輸入會員帳號:</b>
       <input type="text" name="mem_Account" value=""><br>
       
       <b>輸入會員密碼:</b>
       <input type="text" name="mem_Password" value=""><br>
    
       <b>輸入會員信箱:</b>
       <input type="text" name="mem_Email" value=""><br>
           
       <b>輸入會員電話:</b>
       <input type="text" name="mem_Phone" value=""><br>
       
       <b>輸入會員紅利:</b>
       <input type="text" name="mem_Bonus" value=""><br>
       
        <b>輸入會員狀態(如0,1,2):</b>
       <input type="text" name="mem_Status" value=""><br>
       
    	<b>輸入會員創建時間範圍:</b>
       <input placeholder="ex:2021-03-24,日期大者" autocomplete="off" type=text  name=mem_Time><br>  
		<input placeholder="ex:2020-01-01,日期小者" autocomplete="off" type=text  name=mem_Time2>
		        
        <input type="submit" value="送出">
        <input type="hidden" name="action" value="listmem_ByCompositeQuery">
     </FORM> 
</li>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>


</html>