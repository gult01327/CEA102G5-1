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
<h3>This is the Home page for Member: Home</h3>
<h4><a href="<%=request.getContextPath() %>/back_end/commodity/comSelectPage.jsp">�^��x�ӫ~�޲z</a></h4>


<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/member/listAllMem.jsp'>�Ҧ��|���C��</a>   <br><br></li>
   <li><a href='<%=request.getContextPath()%>/front_end/member/login.jsp'>�|���n�J</a>   <br><br></li>
  
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
</ul>



<h4><font>�s�W�|��:</font></h4>
<ul>
  <li><a href='<%=request.getContextPath()%>/back_end/member/addMem.jsp'>ADD Member</a> </li>
</ul>



<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>
</body>


</html>