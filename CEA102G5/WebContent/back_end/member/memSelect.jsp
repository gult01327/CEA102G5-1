<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>��x�|���޲z</title>
</head>
<body bgcolor=#E8FFE8 onload="load()">
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">��x�|���޲z</font>
<hr><p>
<!-- <h3>This is the Home page for Member: Home</h3> -->
<h4><a href="<%=request.getContextPath() %>/back_end/commodity/comSelectPage.jsp">�^��x�ӫ~�޲z</a></h4>
<br>
<h4><a href='<%=request.getContextPath()%>/front_end/member/addMem.jsp'>�s�W�|��</a></h4>
<br>
<h4><a href='<%=request.getContextPath()%>/back_end/member/listAllMem.jsp'>�Ҧ��|���C��</a></h4>   
<br>
<h4><a href='<%=request.getContextPath()%>/front_end/member/login.jsp'>�|���n�J</a></h4>   
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
        <b>��J�|���s�� (�p1):</b>
        <input type="text" name="memID">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"/>
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       <b>��ܷ|��ID:</b>
       <select size="1" name="memID">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.memID}">${memVO.memID}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       <b>��ܷ|���m�W:</b>
       <select size="1" name="memID">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.memID}">${memVO.memName}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
<li>
<h4><font color=blue>�U�νƦX�d��:</font></h4>
  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/member/mem.do" >
       
        <b>��J�|���s��:</b>
        <input type="text" name="mem_ID" value=""><br>       
       
       <b>��J�|���b��:</b>
       <input type="text" name="mem_Account" value=""><br>
       
       <b>��J�|���K�X:</b>
       <input type="text" name="mem_Password" value=""><br>
    
       <b>��J�|���H�c:</b>
       <input type="text" name="mem_Email" value=""><br>
           
       <b>��J�|���q��:</b>
       <input type="text" name="mem_Phone" value=""><br>
       
       <b>��J�|�����Q:</b>
       <input type="text" name="mem_Bonus" value=""><br>
       
        <b>��J�|�����A(�p0,1,2):</b>
       <input type="text" name="mem_Status" value=""><br>
       
    	<b>��J�|���Ыخɶ��d��:</b>
       <input placeholder="ex:2021-03-24,����j��" autocomplete="off" type=text  name=mem_Time><br>  
		<input placeholder="ex:2020-01-01,����p��" autocomplete="off" type=text  name=mem_Time2>
		        
        <input type="submit" value="�e�X">
        <input type="hidden" name="action" value="listmem_ByCompositeQuery">
     </FORM> 
</li>
<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>


</html>