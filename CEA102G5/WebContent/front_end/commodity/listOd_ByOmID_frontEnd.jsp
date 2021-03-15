<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ordermaster.model.*"%>
<%@ page import="com.orderdetail.model.*"%>

<%List<OdVO> list = (List<OdVO>) request.getAttribute("list"); 
%>

<html>
<head><title>訂單明細 - listOd_ByOmID.jsp</title>
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
	width: 1050px;

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

	


<table id='#showTable'>
	<tr>
		<th>訂單主檔ID</th>
		<th>商品名稱</th>
		<th>商品圖片</th>
		<th>訂購數量</th>
		<th>商品單價</th>
		<th>退貨狀態</th>
		<th>退貨原因</th>
		<th>退貨日期</th>
		<th>會員留言</th>
		<th>管理員回覆</th>
		<th>寫評價</th>
	</tr>
	
	<c:forEach var="odVO" items="${list}">
		<tr class='trtable'>
			<td class='tdOmID'>${odVO.omID}</td>
			<td>${odVO.comName}</td>
			<td><img src = "<%=request.getContextPath()%>/ComPicReader${odVO.comPicSrc}&pic=1" height="100" width="100"></td>
			<td>${odVO.odCount}</td>
			<td>$ ${odVO.odPrice}</td>
			<td>${odVO.odReturn==0?"未退貨":"已退貨"}</td>
			<td>${odVO.odReason}</td>
			<td>${odVO.odRtime}</td>
			<td id='showMsg'>${odVO.odMessage}</td>
			<td>${odVO.odResponse}</td>
			<td><input class = 'msg' type='button' value='寫評價' ${odVO.odMessage==null? "" : "disabled='disabled'"} />
				<input type='hidden' value='${odVO.comID}'>
			</td>
		</tr>
	</c:forEach>
</table>


<div class="modal fade" id="msgTextDiv" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title" id="exampleModalLongTitle">會員評價</h3>
        </button>
      </div>
      <div class="modal-body">
      <div>
        <img class='star' id='star1' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star2' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star3' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star4' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <img class='star' id='star5' src="<%=request.getContextPath()%>/resource/images/starempty.png" alt="" width="30px" height="30px">
        <input id='score' type="hidden" value="">
    </div>
        <textarea id='msgText' cols="60" rows="10" placeholder="請輸入評價"></textarea>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button class='submitbtn' type="button" class="btn btn-primary">送出回覆</button>
        <input type='hidden' id='omIDforMsg' value=''>
        <input type='hidden' id='comIDforMsg' value=''>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
var servletPathName ="${pageContext.request.requestURI}";
</script>

<script type="text/javascript">
	$(".submitbtn").click(function(){
		var omID = $("#omIDforMsg").val();
		var comID = $("#comIDforMsg").val();
		var msgText = $("#msgText").val();
		if(msgText.trim()==''){
			return;
		}
		var score = $("#score").val();

		$.ajax({
			url:"<%=request.getContextPath()%>/ordermaster/om.do",
			type:"post",
			data:{
				action:"addMsg",
				column:"ORDD_MESSAGE",
				omID:omID,
				comID:comID,
				msgText:msgText
			},
			dataType:"text",
			cache:false,
			ifModified :true,
			success : function(data){
				console.log(data);
				$("#msgTextDiv").modal("hide");
				window.location.reload();
			}
			
			
			
		});
		
	});


	$(".msg").click(function(){
		var omIDstr = $(this).parents("tr.trtable").children("td.tdOmID").text();
		var comIDstr = $(this).next().val();
		$("#omIDforMsg").val(omIDstr);
		$("#comIDforMsg").val(comIDstr);
		$("#msgTextDiv").modal("show");
	});
	
	$("#star1").click(function(){
        if($(this).attr('src') == '<%=request.getContextPath()%>/resource/images/starempty.png'){
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }else{
            $(".star").attr('src','<%=request.getContextPath()%>/resource/images/starempty.png');
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }
        $("#score").val("1");

    });

    $("#star2").click(function(){
        if($(this).attr('src') == '<%=request.getContextPath()%>/resource/images/starempty.png'){
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }else{
            $(".star").attr('src','<%=request.getContextPath()%>/resource/images/starempty.png');
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }
        $("#score").val("2");
    });

    $("#star3").click(function(){
        if($(this).attr('src') == '<%=request.getContextPath()%>/resource/images/starempty.png'){
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star2").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }else{
            $(".star").attr('src','<%=request.getContextPath()%>/resource/images/starempty.png');
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star2").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }
        $("#score").val("3");
    });

    $("#star4").click(function(){
        if($(this).attr('src') == '<%=request.getContextPath()%>/resource/images/starempty.png'){
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star2").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star3").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }else{
            $(".star").attr('src','<%=request.getContextPath()%>/resource/images/starempty.png');
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star2").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star3").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }
        $("#score").val("4");
    });

    $("#star5").click(function(){
        if($(this).attr('src') == '<%=request.getContextPath()%>/resource/images/starempty.png'){
            $(this).attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star1").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star2").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star3").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
            $("#star4").attr('src','<%=request.getContextPath()%>/resource/images/star.png');
        }
        $("#score").val("5");
    });
</script>
</body>
</html>