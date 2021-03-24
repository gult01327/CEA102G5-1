<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.LinkedHashSet"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="com.commodity_category.model.*"%>

<jsp:useBean id="listCom_ByComcID" scope="request" type="java.util.Set<ComVO>" /> <!-- 於EL此行可省略 -->
<jsp:useBean id="ComcSvc" scope="page" class="com.commodity_category.model.ComcService" />
<% LinkedHashSet<ComVO> set = (LinkedHashSet)request.getAttribute("listCom_ByComcID");
	Iterator itSet = set.iterator();
%>
	<%ComcService comcSvc = new ComcService();
	List list = comcSvc.getAll();
	Iterator itList = list.iterator();
	%>
<html>
<head><title>分類商品 - listcom_ByComcID.jsp</title>



</head>
<body bgcolor='white'>
<h3>所有商品資料:</h3>
<h4><a href="<%=request.getContextPath()%>/back_end/commodity/	comSelectPage.jsp">
		 <img src="<%=request.getContextPath()%>/resource/images/back1.gif" width="100" height="32" border="0"></a></h4>
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
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
	display: block;
    overflow-x: auto;
    white-space: nowrap;
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
		<th>商品編號</th>
		<th>商品名稱</th>
		<th>分類名稱</th>
		<th>商品圖片</th>
		<th>商品簡介</th>
		<th>商品狀態</th>
		<th>商品重量</th>
		<th>商品單位</th>
		<th>商品熱量(cal)</th>
		<th>商品碳水(g)</th>
		<th>商品蛋白質(g)</th>
		<th>商品脂肪(g)</th>
		<th>商品特性</th>
		<th>商品創建時間</th>
		<th></th>
		<th></th>
	</tr>
	
	
	<%while(itSet.hasNext()){ //大括號還沒加
		ComVO comVO = (ComVO)itSet.next();
		
	%>
	<tr>
	<td><%=comVO.getComID()%></td>
	<td><%=comVO.getComName()%></td>
	<td>
	<%
	for(int i =0;i<list.size();i++){//還沒加
		ComcVO comcVO = (ComcVO)list.get(i);
		if(comVO.getComcID() == comcVO.getComcID()){%>
	<font><%=comcVO.getComcName()%></font>
		<%}%>  
	<%}%>
	</td>
	<td><img src="<%=request.getContextPath()%>/ComPicReader<%=comVO.getComPicSrc()%>&pic=1" style="max-width: 150px;

width:expression(this.width > 150 ? "150px" : this.width);

overflow:hidden;"></td>
	<td style="text-align:left;"><%=comVO.getComContent()%></td>
	<td class="status" style="color:biue;cursor: pointer;">
			<c:if test="<%=comVO.getComStatus()==0%>">
				<font color='blue'>下架</font>
			</c:if>
			<c:if test="<%=comVO.getComStatus()==1%>">
				<font color='blue'>上架</font>
			</c:if>
	</td>
	<input type="hidden" name="comID" value="<%=comVO.getComID()%>">
	<input type="hidden" name="comStatus" value="<%=comVO.getComStatus()%>">
	<td><%=comVO.getComWeight()%></td>
	<td><%=comVO.getComUnit()%></td>
	<td><%=comVO.getComCal()%></td>
	<td><%=comVO.getComCarb()%></td>
	<td><%=comVO.getComPro()%></td>
	<td><%=comVO.getComFat()%></td>
	<td><%=comVO.getComProp()%></td>
	<td><%=comVO.getComTime() %></td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/commodity/com.do" style="margin-bottom: 0px;">
			    <input type="submit" value="修改"> 
			    <input type="hidden" name="comID"      value="<%=comVO.getComID()%>">
			    <input type="hidden" name="comcID"      value="<%=comVO.getComcID()%>">
			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--送出本網頁的路徑給Controller--><!-- 目前尚未用到  -->
			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM>
			</td>
	</tr>
	<%}%>
</table>


<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";

$(".status").click(function(){
	let status=$(this);
	let comID = status.next().val();
	let comStatus = status.next().next().val();
	

	$.ajax({
		url:"<%=request.getContextPath()%>/front_end/commodity/com.do",
		type:"post",
		data:{
			action:"comStatusChangeajax",
			comID:comID,
			comStatus:comStatus,
		},
		cache:false,
		ifModified :true,
		success : function(date){
			console.log(date);
			if(date==="1"){
				status.children().text("上架");
				status.next().next().val("1");
			}else{
				status.children().text("下架");
				status.next().next().val("0");
			}
		}
	});
	
 });
</script>

</body>

</html>