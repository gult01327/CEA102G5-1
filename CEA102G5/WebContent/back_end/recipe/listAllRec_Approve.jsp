<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>


<%
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getRecByStatus(2);
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>�Ҧ��w�ͮĭ��ХD�� - listAllRec_Approve.jsp</title>




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
	width: 850px;
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
<h2 class="page-title text-center" style='color:black;'>Recipe Approved</h2>	
	
<table>
	<tr>
		<th>���ХD��ID</th>
		<th>�|��ID</th>
		<th>���м��D</th>
		<th>���йϤ�</th>
		<th>���Ъ��A</th>
		<th>�d�ݭ��Щ���</th>
	</tr>  
	<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"></jsp:useBean>    
	<%@ include file="page1.file" %>
	<c:forEach var="recVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr class='tabletr'>
			<td>${recVO.recID}</td>
			<td>${memSvc.getOneMem(recVO.memID).memName}</td>
			<td>${recVO.recName}</td>
			<td><img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" height="100" width="100"></td>
			<td class='status' value='${recVO.recStatus}'>${(recVO.recStatus==1)?'�f�֤�':'�w�ͮ�'}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�d�ݭ��Щ���" style="padding: 5px 5px; font-size:12px;">
			    <input type="hidden" name="recID"	value="${recVO.recID}">
			    <input type="hidden" name="action" value="GetRecDetail_ByrecID"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<script type="text/javascript">
	
	
	$("body").on("click","#verify",function(){
		$(".tabletr").css({"background-color":"white"});
		var recID = $(this).next().val();
		
		console.log(recID);
		var tabletr = $(this).parents(".tabletr");
		
		$.ajax({
			url:"<%=request.getContextPath()%>/recipe/rec.do",
			type:"post",
			data:{
				action:"updateStatus",
				recID : recID,
			},
			cache:false,
			ifModified:true,
			dataType : "text",
			context:tabletr,
			success:function(data){
				$(this).css({"background-color":"#ddd"});
				$(this).children("td.status").text("�w�ͮ�");
				$(this).children("td.status").next().children().children("#verify").attr('disabled',true);
				console.log(data);
			}
		});
		
	});
	
	
	
</script>
<script type="text/javascript">
	var servletPathName ="${pageContext.request.requestURI}";
</script>

</body>
</html>