<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.recipe.model.*"%>

<html>
<head><title>�Ҧ��f�֤��������| - listAllRecReport.jsp</title>
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
  }
</style>

<h2 class="page-title text-center" style='color:black;'>Recipe Report</h2>
			<br> <select id='selectStatus'>
				<option value="0">���f��</option>
                <option value="1">�w�f��</option>
			</select>
<div id='showRecr'></div>				

<div class="modal fade" id="replyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">�^�иӭ������|</h3>
            </div>
            <div class="modal-body">
              <textarea id='msgReport' cols="50" rows="10" placeholder="�п�J�^��"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
              <button type="button" id='msgBtn'>�e�X�^��</button>
              <input type='hidden' id='msgRecrID' value=''>
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
	
	$("#msgBtn").click(function(){

		var msgRecrID = $("#msgRecrID").val();
		var msgReport = $("#msgReport").val();
		if(msgReport.trim() == ''){
			$("#replyModal").modal("hide");
			$("#successDivImg").attr("src","<%=request.getContextPath()%>/resource/images/warning.png");
			$("#successMsg").text("�п�J�T��");
			$("#successModal").modal("show");
			return;
		}
		
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"addRecrReply",
				msgRecrID:msgRecrID,
				msgReport:msgReport
			},
			dataType:"text",
			cache:false,
			ifModified:true,
			context:locate,
			success:function(data){
				$(this).text(msgReport);
				$("#msgReport").val('');
				$("#replyModal").modal("hide");
				$("#successDivImg").attr("src","<%=request.getContextPath()%>/resource/images/success.png");
				$("#successMsg").text("�w���\�e�X���|");
				$("#successModal").modal("show");
			}
		});
		
		
	});
	var locate;
	$("#showRecr").on("click",".reply",function(){
		locate = $(this).parent().prev().prev();
		var recrIDStr = $(this).next().val();
		$("#msgRecrID").val(recrIDStr);
		$("#replyModal").modal("show");
	});
	
	$("#selectStatus").change(function(){
		var selectStatus = $("#selectStatus").val();
		console.log(selectStatus);
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"getAllRecrbyStatus",
				status:selectStatus		
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
					generateTable(data);
			}
		});
	});
	
	$(document).ready(function(){
		var selectStatus = $("#selectStatus").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/reciper/recr.do",
			type:"post",
			data:{
				action:"getAllRecrbyStatus",
				status:selectStatus		
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
					generateTable(data);
			}
		});
	});

	
	function generateTable(data){
		if(data == ""){
			var html = "";
			$("#showRecr").html(html);
			return;
		}
		
		var html = "";
		html += "<table><tr><th>���ХD��ID</th><th>���м��D</th><th>���йϤ�</th><th>���|��ID</th><th>�������|���e</th><th>���мf�֪��A</th><th>���Ц^�Ф��e</th><th>�d�ݭ��Щ���</th>";
		if(data[0].recrStatus == '0'){
			html += "<th>�^�Э������|</th></tr>";
		}else{
			html += "</tr>";
		}
		for(let i = 0 ; i<data.length; i++){
			html += "<tr class='tr'><td class='tdrecID'>"+data[i].recID+"</td><td>"+data[i].recName+"</td>";
			html += "<td><img src='<%=request.getContextPath()%>/ComPicReader"+data[i].recPicSrc+"&pic=1' height='100' width='100'></td>";
			html += "<td class='tdmemID'>"+data[i].memID+"</td>";
			html += "<td>"+data[i].recrContent+"</td>";
			if(data[i].recrStatus == '0'){
				html += "<td>���f��</td>";
			}else{
				html += "<td>�w�f��</td>";
			}
			if(typeof(data[i].recrReplyContent) == 'undefined'){
				html +="<td>�ȵL�^��</td>";
			}else{
				html += "<td>"+data[i].recrReplyContent+"</td>";				
			} 
			html += "<td><input id='checkRec' type='button' value='�d�ݭ��Щ���'></td>";
			if(data[i].recrStatus == '0'){
				html += "<td><input class='reply' type='button' value='�^�Э������|'>";
			}
			html += "<input type='hidden' id='recrID' value='"+data[i].recrID+"'></td></tr>";
		}
		html += "</table>"
		
		$("#showRecr").html(html);
	}
</script>
			


</body>

</html>