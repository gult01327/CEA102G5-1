<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="com.member.model.*"%>


<%
	MemVO memVO = (MemVO) session.getAttribute("memVO");
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getRecByMemID(memVO.getMemID());
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>�ӤH���ХD�� - listAllRec.jsp</title>
</head>
<body>
<style>
  table#table-1 {
	background-color:#E8FFE8;
    border: 2px solid black;
    text-align: ;
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

<style>
  table {
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

	
<table>
	<tr>
		<th>���ХD��ID</th>
		<th>�|��ID</th>
		<th>���м��D</th>
		<th>���йϤ�</th>
		<th>���Ъ��A</th>
		<th>�קﭹ��</th>
		<th>�d�ݭ��Щ���</th>
	</tr>  
	<%@ include file="page1.file" %>  
	<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr class='tabletr'>
			<td>${recVO.recID}</td>
			<td>${recVO.memID}</td>
			<td>${recVO.recName}</td>
			<td><img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" height="100" width="100"></td>
			<td class='status' value='${recVO.recStatus}'>${(recVO.recStatus==1)?'�f�֤�':'�w�ͮ�'}</td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" id='update' value="�קﭹ��">
			    <input type="hidden" id="recID" name="recID" value="${recVO.recID}">
			    <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			    <input type="hidden" name="action" value="GetOneForUpdateRec">
			    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�d�ݭ��Щ���">
			    <input type="hidden" name="recID"	value="${recVO.recID}">
			    <input type="hidden" name="action" value="GetRecDetail_ByrecID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<script type="text/javascript">
	$(document).ready(function(){
		$(".status").each(function(){
				if($(this).attr("value") == "3"){
					$(this).text("�w�h�^");
				}
				
				if($(this).attr("value") == "0"){
					$(this).text("�w�U�[");
				}
		});
	});

	
	
</script>


</body>
</html>