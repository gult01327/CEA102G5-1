<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.member.model.*"%>

<%
MemVO memVO = (MemVO) session.getAttribute("memVO"); 
int memID = memVO.getMemID();
ComService comSvc =new ComService();
List list = comSvc.getFavorite(memID);
pageContext.setAttribute("list",list);
%>

<html>
<head><title>�q����� - listOd_ByOmID.jsp</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/lightbox.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>



<body bgcolor=#E8FFE8>
<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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

	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
  }
  textarea{
  	resize:none;
  }
</style>
<h2 class="page-title text-center" style='color:black;'>Order Detail</h2>

	


<table>
	<tr>
		<th>�ӫ~�s��</th>
		<th>�ӫ~���O</th>
		<th>�ӫ~�W��</th>
		<th>�ӫ~����</th>
		<th>�ӫ~�Ϥ�</th>
<!-- 		<th>�ӫ~�Ϥ�2</th> -->
		<th>�ӫ~²��</th>
		<th>�ӫ~���A</th>
		<th>�ӫ~���q</th>
		<th>�ӫ~���</th>
		<th>�ӫ~���q(cal)</th>
		<th>�ӫ~�Ҥ�(g)</th>
		<th>�ӫ~�J�ս�(g)</th>
		<th>�ӫ~�ת�(g)</th>
		<th>�ӫ~�S��</th>
		<th>�ӫ~�P�q</th>
		<th>�ӫ~�Ыخɶ�</th>
		
		
	</tr>

	<c:forEach var="comVO" items="${list}">
		
		<tr>
			<td>${comVO.comID}</td>
			<td>
			<c:forEach var="comcVO" items="${comcSvc.all}">
                    <c:if test="${comVO.comcID==comcVO.comcID}">
	                   ${comcVO.comcName}
                    </c:if>
                </c:forEach>
			</td>
			<td>${comVO.comName}</td>
			<td>$ ${comVO.comPrice}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=1" height="100" width="100"></td>
<%-- 			<td><img src = "<%=request.getContextPath()%>/ComPicReader${comVO.comPicSrc}&pic=2" height="100" width="100"></td> --%>
			<td>${comVO.comContent}</td>
			<td>
			<c:if test="${comVO.comStatus==1}">
				�U�[
			</c:if>
			<c:if test="${comVO.comStatus==0}">
				�W�[
			</c:if>
			</td>
			<td>${comVO.comWeight}</td>
			<td>${comVO.comUnit}</td>
			<td>${comVO.comCal}</td>
			<td>${comVO.comCarb}</td>
			<td>${comVO.comPro}</td>
			<td>${comVO.comFat}</td>
			<td>${comVO.comProp}</td>
			<td>${comVO.comSales}</td>
			<td>${comVO.comTime}</td>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/commodity/com.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�ק�"> -->
<%-- 			     <input type="hidden" name="comID"  value="${comVO.comID}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/commodity/com.do" style="margin-bottom: 0px;"> --%>
<%-- 			     <input type="submit" value="${(comVO.comStatus==0)?"�U�[":"�W�[" }"> --%>
<%-- 			     <input type="hidden" name="comID"  value="${comVO.comID}"> --%>
<%-- 			     <input type="hidden" name="comName"  value="${comVO.comName}"> --%>
<%-- 			     <input type="hidden" name="comStatus"  value="${comVO.comStatus}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<!-- 			     <input type="hidden" name="action" value="comStatusChange"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>


<div class="modal fade" id="msgTextDiv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">�|������</h3>
        </button>
      </div>
      <div class="modal-body">
      <div>
        <img class='star' id='star1' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star2' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star3' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star4' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star5' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <input id='score' name='score' type="hidden" value="">
    </div>
        <textarea id='msgText' cols="60" rows="10" placeholder="�п�J����"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class='submitbtn' type="button" class="btn btn-primary">�e�X�^��</button>
        <input type='hidden' id='omIDforMsg' value=''>
        <input type='hidden' id='comIDforMsg' value=''>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>


</body>
</html>