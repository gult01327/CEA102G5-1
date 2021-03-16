<%@page import="com.recipeb_report.model.RecbrService"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>
<%@ page import="com.util.model.*"%>

<%
	RecbrService recbrSvc = new RecbrService();
	List<RecbrUtilVO> list = recbrSvc.getAllRecbrforBackEnd(0);
	pageContext.setAttribute("list",list);
%>
<html>
<head><title>�Ҧ��f�֤����ХD�� - listAllRec.jsp</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>



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
  textarea{
  	resize:none;
  	height:200px;
  }
</style>


<h2 class="page-title text-center" style='color:black;'>Recipe Board Report (Unreviewed)</h2>	
<table>
	<tr>
		<th>�d���H(ID)</th>
		<th>�d�����e</th>
		<th>���|�H(ID)</th>
		<th>���|���e</th>
		<th>�d�����A</th>
		<th>�d�ݸӭ���</th>
		<th>�R���ӵ��d��</th>
		<th>�^�����|</th>
	</tr>
	<jsp:useBean id="memSvc" scope="page" class="com.member.model.MemService"></jsp:useBean>  
	<%@ include file="page1.file" %>  
	<c:forEach var="recbrUtilVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
		<tr class='tabletr'>
			<td>${memSvc.getOneMem(recbrUtilVO.bMemID).memName} (${recbrUtilVO.bMemID})</td>
			<td>${recbrUtilVO.recbContent}</td>
			<td>${memSvc.getOneMem(recbrUtilVO.rMemID).memName}(${recbrUtilVO.rMemID})</td>
			<td>${recbrUtilVO.recbrContent}</td>
			<td>${(recbrUtilVO.recbStatus==1)?"�w�U�[":"���`"}</td>


			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/recipe/rec.do" style="margin-bottom: 0px;">
			    <input type="submit" value="�d�ݸӭ���">
			    <input type="hidden" id="recID" name="recID" value="${recbrUtilVO.recID}">
			    <input type="hidden" name="action" value="GetRecDetail_ByrecID">
			    </FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/recipeb/recb.do" style="margin-bottom: 0px;">
			    <input type="submit" value="${(recbrUtilVO.recbStatus==1)?'�W�[�ӵ��d��':'�U�[�ӵ��d��'}">
			    <input type="hidden" name="recbID"	value="${recbrUtilVO.recbID}">
			    <input type="hidden" name="recbStatus"	value="${recbrUtilVO.recbStatus}">
			    <input type="hidden" name="action" value="updateMsgStatus"></FORM>
			</td>
			<td>
			  
			    <input type="button" class='reply' value="�^�����|">
			    <input type="hidden" class="recbrID" value="${recbrUtilVO.recbrID}">

			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">�^�иӯd�����|</h3>
            </div>
            <div class="modal-body">
              <textarea id='msgReport' cols="50" rows="10" placeholder="�п�J�^��"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
              <button type="button" id='msgBtn'>�e�X�^��</button>
              <input type='hidden' id='msgRecbrID' value=''>
            </div>
          </div>
        </div>
      </div>
		
		
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">�w���\�ާ@!</h3>
            </div>
            <div class="modal-body">
             <img id = 'successDivImg' src='<%=request.getContextPath()%>/resource/images/success.png' width='100px' height='100px'>
              <font id='successMsg' color='red'></font>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
            </div>
          </div>
        </div>
      </div>	
<script type="text/javascript">
	$(document).on('show.bs.modal', '.modal', function () {
	  $(this).appendTo('body');
	});
	
	$(".reply").click(function(){
		let recbrID = $(this).next().val();
		$("#msgRecbrID").val(recbrID);
		$("#replyModal").modal("show");
	});
	
	$("#msgBtn").click(function(){
		let msgReport = $("#msgReport").val();
		let recbrID = $("#msgRecbrID").val();
		if(msgReport.trim()==""){
			$("#replyModal").modal("hide");
			$("#successDivImg").attr("src","<%=request.getContextPath()%>/resource/images/warning.png");
			$("#successMsg").text("�п�J�T��");
			$("#successModal").modal("show");
			return;
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/back_end/recipeb/recb.do",
			type:"post",
			data:{
				msgReport:msgReport,
				recbrID:recbrID,
				action:"addRecbReply"
			},
			dataType:"text",
			cache:false,
			ifModified:true,
			success:function(){
				window.location.reload();
			}
		});
		
	});
	
	
	$(document).ready(function(){
		$(".status").each(function(){
			
			if($(this).text()=="�w�ͮ�"){
				
				$(this).next().children().children().attr("disabled",true);
			}
		});
	});
	
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