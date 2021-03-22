<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%> 
<%@ page import="com.recipe.model.*"%>   


<jsp:useBean id="recVO" scope="request" type="com.recipe.model.RecVO" />
<jsp:useBean id="reciSvc" scope="request" class="com.recipe_ingredients.model.ReciService" />
<jsp:useBean id="recsSvc" scope="request" class="com.recipe_step.model.RecsService" />

<%
	MemVO memVO2 = (MemVO)session.getAttribute("memVO");
	pageContext.setAttribute("memVO2", memVO2);
	RecVO recVO2 = (RecVO) request.getAttribute("recVO");
	MemService memSvc = new MemService();
	MemVO memVO = memSvc.getOneMem(recVO2.getMemID());
	RecService recSvc = new RecService();
	List<RecVO> list = recSvc.getRecByMemID(recVO2.getMemID());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>���Щ���</title>
	
	

<body bgcolor=#E8FFE8>
 <style>
    #left{
        
        width: 100%;
        height: 100%;
        margin: 0px auto;
        margin-bottom:50px;
    }
    #title{
        
        width: 350px;
        display: inline-block;
        margin-left: 50px;
        margin-top: 50px;
        
    }
    #author{
        
        display: inline-block;
        margin-left: 80px;
        margin-top: 140px;
        width: 300px;
        height: 50px;
        /* ����W�� */
        vertical-align : top;
        
    }
    #recipeContent{
        margin-top: 50px;
        box-shadow:3px 3px 5px 6px #cccccc; 
        width:670px; 
        
    }
    #size{
        font-size: x-large;
        
        margin-left: 150px;
    }
    #cooktime{
        font-size: x-large;
        margin-left: 250px;
    }
    #sizeNum{
        font-size: larger;
        margin-left: 150px;
    }
    #cooktimeNum{
        margin-top: 50px;
        margin-left: 250px;
        font-size: larger;
    }
    table {
	width: 200px;
	box-shadow:3px 3px 5px 6px #cccccc;
	margin-top: 5px;
	margin-bottom: 5px;
    display: inline-block;
  }
  #recIng{
    
      width: 1000px;
      margin-top: 30px;
      margin-left: 10px;
      
  }
  #leftTable,td{
      margin-left: 5px;
      padding: 6px;
      text-align: center; 
  }
  #rightTable{
      margin-left: 100px;
  }
  #recStep{
      width: 800px;
      box-shadow:3px 3px 5px 6px #cccccc;
      margin-left: 10px;
      margin-top: 50px;
  }
  #stepblock{
   margin-top: 20px;
    
  }
  textarea{
        resize: none;
    }
    #contentDiv{
        margin-top: 80px;
        margin-left: 60px;
        
        width: 400px;
        vertical-align : top;
    }
    #cotent{
    	margin-top:30px;
    	
    	box-shadow:3px 3px 5px 6px #cccccc;
    }

    #stepText{
        margin-left: 50px;
        box-shadow:3px 3px 5px 6px #cccccc;
        width:400px ;
        height:200px;
        display: inline-block;
        vertical-align : top;
        font-size: x-large;
        padding: 30px;
    }
    #stepPic{
        vertical-align : top;
        margin-left: 5px;
    }
    #index{
        display: inline-block;
        margin-left: 30px;
        margin-top: 30px;
        font-family:fantasy;
    }
    #cartbtn{
        display: inline-block;
        vertical-align : top;
        margin-left: 30px;
    }
    #calculate{
        display: inline-block;
        box-shadow:3px 3px 5px 6px #cccccc; 
        vertical-align : top;
        margin-left: 130px;
    }
    #favRec{
    	margin-left: 140px;
    	cursor:pointer;
    	font-size:large;

    }
    #authorName{
    	margin-left: 30px;
    	vertical-align : top;
    	font-size:x-large;
    }
    #h5fav{
    	display: inline-block;
    	margin-left: 10px;
    }
	#link{
		display: inline-block;
		margin-left: 195px;
	}
	#board{
        margin-left: 10px;
        box-shadow:3px 3px 5px 6px #cccccc;
        border-radius: 10px;
        padding: 10px;
        margin-top: 80px;
    }
    #boardContent{
        margin-top: 35px;
    }
    .boardmemPic{
        border-radius: 50%;
        width:100px;
        height:100px;
    }
    .boardmemPic2{
        border-radius: 50%;
        width:100px;
        height:100px;
    }
    #boardText{
        margin-top: 50px;
    }
    #boardtextbox{
        vertical-align: top;
        margin-left: 30px;
    }
    #boardbtn{
        vertical-align: bottom;
        margin-top:30px;
        margin-left:500px;
    }
    .boardmsg{
        display: inline-block;
        vertical-align: top;
        margin-left: 30px;
        border: 1px solid black;
        width: 500px;
        height: 70px;
        border-radius: 10px;
        padding: 10px;
    }
    .msgdate{
        margin-left: 140px;
    }
    .boardmemName{
        margin-left: 140px;
    }
    #report{
    	display:inline-block;
    	margin-left: 195px;  
    }
    .report{
        display: inline-block;
        float: right;
        vertical-align: top;
        margin-right: 30px;
        cursor:pointer;
        color:blue;
    }
    .deleteMsg{
    	display: inline-block;
        float: right;
        vertical-align: top;
        margin-right: 30px;
        cursor:pointer;
        color:blue;
    }
    .modal-title{
    	color:red;
    }


</style>


<h2 class="page-title text-center" style='color:black;'>Recipe Detail</h2>
    <div id='parent'></div>
    
    <div id='left'>
    	
        <div id='title'>
            <h2 id='titleText'>${recVO.recName}</h2>
            <img src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" alt="" width="300px">
        </div>
        <div id='author' >
            <img src="<%=request.getContextPath()%>/ComPicReader<%=memVO.getMemPicSrc()%>&pic=1" alt="" width="100px">
            <span id="authorName"><%=memVO.getMemName()%></span>
            <br><br><span>���@�̦@��<%=list.size()%>����</span><br>
            <br><span id = 'howManyFav'></span><br>
            <span id='favRec'><img class='heart' id='heart' src='<%=request.getContextPath()%>/resource/images/heartempty.png' width='40px'>
            <h5 id='h5fav'>�I������</h5>
            </span>
            <a href='#boardtextbox' id='link'><h5>���Яd��</h5></a>
            <%if(memVO2!=null){%><a href='javascript:presses()'><h5 id='report'>�������|</h5></a><%}%>          
        	<input type="hidden" id="sessionMemID" value="${memVO2.memID}"/>
        </div>
        <div id='contentDiv'>
            <h5 id='content'>${recVO.recContent}</h5>
        </div>
        <div id='recipeContent'>
            <span id='size'>���q</span>
            <span id='cooktime'>�ɶ�</span><br>
            <span id='sizeNum'>${recVO.recSize}�H��</span>
            <span id='cooktimeNum'>${recVO.recCooktime}����</span>
        </div>
        <div id='recIng'>
            <h3>�����զ�</h3>
            
            <table id='leftTable'>
                <tr>
                    <td>�����W��</td>
                    <td>�����J��</td>
                </tr>
			<c:forEach var="reciVO" items="${reciSvc.getIngsByRecID(recVO.recID)}">
				<tr>
					<td>${reciVO.comName}</td>
					<td>${reciVO.reciNums}</td>
					<input type="hidden" name="comIDForCarts" value="${reciVO.comID}">
				</tr>
			
			</c:forEach>
            </table>
            <div id='calculate'>
                <font id='showTotalCal' size='5' face='Arial' color='red'><b>�`���q��:${recVO.recCal}�d����</b></font><br>
                <font size='3' face='Arial' color='black'>�`�Ҥ��ƦX����:${recVO.recCarb}�J</font><br>
                <font size='3' face='Arial' color='black'>�`�J�ս謰:${recVO.recProtein}�J</font><br>
                <font size='3' face='Arial' color='black'>�`�תլ�:${recVO.recFat}�J</font>
            </div>
            <div id='cartbtn'>
                <img src="<%=request.getContextPath()%>/resource/images/cart.jpg" alt="" width='30px'>
                <input type='button' id='addCart' value='�@��ɤJ�ʪ���'>
                <input type="hidden" id='location' name="location" value="<%=request.getServletPath()%>">
                <input type="hidden" id='recID' name="recID" value="${recVO.recID}">
                <br>  
            </div>
        </div>

        <div id='recStep'>
            <h3>���ШB�J</h3><hr>
            <%int count = 1; %>
<c:forEach var="recsVO" items="${recsSvc. getAllStepsByRecID(recVO.recID)}">
            <div id='stepblock'>
                <div id='index'><font size='+3'><%=count%></font></div>
                <img id='stepPic' src="<%=request.getContextPath()%>/ComPicReader${recsVO.recsPicSrc}&pic=1" alt="" width="250" height="200">
                <div id='stepText'>${recsVO.recsContent}</div>
            </div><br>
            <%count++; %>
</c:forEach>
        </div>
        <div id='board'>
        	<h3>�d��</h3>
            <div id='msgDiv'>
            
            </div>
            <div  id='boardText'>
                <img class='boardmemPic2' src="<%=request.getContextPath()%>/resource/images/user.png" alt="" width="100px" height="100px">
                <textarea name="" id="boardtextbox" style='width:500px;height:150px' cols="50" rows="10" placeholder="�п�J�d��"></textarea>
                <input id='boardbtn' type="button" value="�o��d��">
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
             <img src='<%=request.getContextPath()%>/resource/images/success.png' width='100px' height='100px'>
              <font id='successMsg' color='red'></font>
            </div>
            <div class="modal-footer">
              <button id='close' type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
            </div>
          </div>
        </div>
      </div>
      
      
      <div class="modal fade" id="reportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">�w��ӭ������|</h3>
            </div>
            <div class="modal-body">
              <textarea id='recipeReport' cols="50" rows="10" placeholder="�п�J���|�ƶ�"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
              <button type="button" id='reportBtn' data-dismiss="modal">�e�X���|</button>
            </div>
          </div>
        </div>
      </div>
      
       <div class="modal fade" id="msgModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
              <h3 class="modal-title" id="exampleModalLabel">�w��ӭ��Яd�����|</h3>
            </div>
            <div class="modal-body">
              <textarea id='msgReport' cols="50" rows="10" placeholder="�п�J���|�ƶ�"></textarea>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">����</button>
              <button type="button" id='msgBtn' data-dismiss="modal">�e�X���|</button>
            </div>
          </div>
        </div>
      </div>
    <script type="text/javascript">
    var recbIDforMsgreport = '';
    
	$("#msgDiv").on("click",".reporth4",function(){
		recbIDforMsgreport = $(this).next().val();
		$("#msgModal").modal("show");
	});
	
	$("#msgBtn").click(function(){
		var sessionMemID = $("#sessionMemID").val();
		var msgReport = $("#msgReport").val();
    	if(msgReport.trim() == ''){
			console.log("�п�J���|���e");
			return;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/recipeb/recb.do",
			type:"post",
			data:{
				action:"addMsgReport",
				recbID:recbIDforMsgreport,
				sessionMemID:sessionMemID,
				msgReport:msgReport
			},
			dataType:"text",
			cache:false,
			ifModified:true,
			success:function(data){
				if(data == "success"){
					$("#msgReport").val('');
					var str = "�w���\�e�X�z���d�����|!";
					$("#successMsg").text(str);
					$("#successModal").modal("show");
				}
			}
			
		});
	});
    
    
    function presses(){
    	$("#reportModal").modal("show");
    }
    
    $("#reportBtn").click(function(){
    	var report = $("#recipeReport").val();
    	var recID = $("#recID").val();
    	var sessionMemID = $("#sessionMemID").val();
    	if(report.trim() == ''){
			console.log("�п�J");
			return;
		}
    	$.ajax({
    		url:"<%=request.getContextPath()%>/reciper/recr.do",
    		type:"post",
    		data:{
    			action:"addReport",
    			report:report,
    			recID:recID,
    			sessionMemID:sessionMemID
    		},
    		dataType : "text",
			cache:false,
			ifModified:true,
			success:function(data){
				if(data == "true"){
					$("#recipeReport").val('');
					var str = "�w���\�e�X�z�����|!";
					$("#successMsg").text(str);
					$("#successModal").modal("show");
				}
				
			}
    	});
    	
    	
    });
    
    
    </script>
    
    <script type="text/javascript">
    //�p��ɶ�
    function getTimeInterval(createTime){
    	var now = Date.parse(new Date())/1000;
    	var limit = now - createTime;
    	var content = "";
    	if(limit<60){
    		content = "�o����" + limit + "�����e";
    	}else if(limit >=60 && limit<3600){
    		content = "�o����" + Math.floor(limit/60)+"�����e";
    	}else if(limit >= 3600 && limit < 86400){
    		content = "�o����" + Math.floor(limit/3600)+"�p�ɫe";
    	}else if(limit >=86400 && limit < 2592000){
    		content = "�o����" + Math.floor(limit/86400) + "�ѫe";
    	}else if(limit >= 2592000 && limit < 31104000){
    		content = "�o����" + Math.floor(limit/2592000)+"�Ӥ�e";
    	}else{
    		content = "�o����ܤ֤@�~�e...";
    	}
    	
    	return content;
    }
    
    
    $(document).ready(function(){
    	var recID = $("#recID").val();
    	var sessionMemID = $("#sessionMemID").val();
    	$.ajax({
			url:"<%=request.getContextPath()%>/recipeb/recb.do",
			type:"post",
			data:{
				action:"getAllMsgByRecID",
				recID: recID
			},
			dataType : "json",
			cache:false,
			ifModified:true,
			success:function(data){
				 var html = '';
				 for(let i = 0 ; i<data.length ; i++){
			         html += "<div class ='boardText' id='boardContent'><img class='boardmemPic' src='<%=request.getContextPath()%>/ComPicReader?id="+ data[i].memID +"&table=MEMBER_INFO&column=MEM_PICTURE&idname=MEM_ID&pic=1' width='50px' height='50px'>";
			         html += "   <div class='boardmsg'>"+data[i].recbContent+"</div>";
			         if(sessionMemID != data[i].memID && sessionMemID != ''){
			        	 html += "<div class='report'><h6 class='reporth4'>���|���d��</h6>";
			        	 html += "<input type='hidden' class='recbID' value='"+data[i].recbID+"'>"
			        	 html += "<input type='hidden' class='msgMemID' value='"+data[i].memID+"'></div>"
			         }else if(sessionMemID == data[i].memID){
			        	 html += "<div class='deleteMsg'><h6 class='deleteMsgh4'>�R�����d��</h6>";
			        	 html += "<input type='hidden' class='recbID' value='"+data[i].recbID+"'></div>"
			         }
			         html += "<div class='boardmemName'>"+data[i].memName+"</div>";		         
			         html += "  <div class='msgdate'>"+getTimeInterval(data[i].recbTimeLong)+"</div></div>";
				 }
				 
		         $("#msgDiv").append(html);
			}
		});
    });
    
    $("#msgDiv").on("click","h6.deleteMsgh4",function(){
    	var recbID = $(this).next().val();
		var div = $(this).parents("div.boardText");
    	$.ajax({
    		url:"<%=request.getContextPath()%>/recipeb/recb.do",
			type:"post",
			data:{
				action:"deleteMsg",
				recbID:recbID
			},
			dataType : "text",
			cache:false,
			ifModified:true,
			context:div,
			success:function(data){
				if(data == "success"){
					$(this).remove();
				} 
			}
    	});
    });
    
    
    $("#boardbtn").click(function(){
		var textmsg = $("#boardtextbox").val();
		var recID = $("#recID").val();
		var memID = $("#sessionMemID").val();
		if(textmsg.trim() == ''){
			console.log("�п�J");
			return;
		}
		$.ajax({
			url:"<%=request.getContextPath()%>/recipeb/recb.do",
			type:"post",
			data:{
				action:"addRecbMsg",
				recID: recID,
				memID: memID,
				textmsg:textmsg
			},
			dataType : "json",
			cache:false,
			ifModified:true,
			success:function(data){
				 var html = '';
		         html += "<div class ='boardText' id='boardContent'><img class='boardmemPic' src='<%=request.getContextPath()%>/ComPicReader${memVO2.memPicSrc}&pic=1'>";
		         html += "   <div class='boardmsg'>"+data.recbContent+"</div>";
		         html += "<div class='deleteMsg'><h6 class='deleteMsgh4'>�R�����d��</h6>";
	        	 html += "<input type='hidden' class='recbID' value='"+data.recbID+"'></div>"
		         html += "<div class='boardmemName'>"+data.memName+"</div>"
		         html += "  <div class='msgdate'>�o������...</div></div>";
		        
		         $("#msgDiv").append(html);
		         $("#boardtextbox").val('');
			}
		});
		
		
       
    });
    
    //�ˬd�O�_�n�J�ϥίd���\��
    $(document).ready(function(){
    		var memID = $("#sessionMemID").val();
    		
    		if(memID==''){
    			$("#boardtextbox").attr("readonly",true);
    			$("#boardtextbox").attr("placeholder","�еn�J�|����d��");
    			$("#boardbtn").attr("disabled",true);	
    		}else{
    			$.ajax({
    				url:"<%=request.getContextPath()%>/recipe/rec.do",
    				type:"post",
    				data:{
    					action:"checkIflogintoBoard",
        				memID:memID
    				},
    				dataType : "json",
    				cache:false,
    				ifModified:true,
    				success:function(data){
    					$(".boardmemPic2").attr("src","<%=request.getContextPath()%>/ComPicReader"+data.memPicSrc+"&pic=1");
    					$("#boardtextbox").attr("readonly",false);
    	    			$("#boardtextbox").attr("placeholder","�п�J���Яd��");
    	    			$("#boardbtn").attr("disabled",false);	
    				}
    			});
    		}
    	});
    	//�ˬd�O�_�����ùL
    	$(document).ready(function(){
    		var recID = $("#recID").val();
    		var memID = $("#sessionMemID").val();
    		
    		var howManyFav = getHowManyFav(recID);
    		$("#howManyFav").text("�@��"+howManyFav + "�H����");
    		
    		if(memID==''){
    			console.log("�Ū�");
    		}else{
    			$.ajax({
    				url:"<%=request.getContextPath()%>/recipe/rec.do",
    				type:"post",
    				data:{
    					action:"checkIfFav",
    					recID:recID,
        				memID:memID
    				},
    				dataType : "text",
    				cache:false,
    				ifModified:true,
    				success:function(data){
    					console.log(data);
    					if(data=="true"){
    						$("#heart").attr('src','<%=request.getContextPath()%>/resource/images/heart.png');
    		        		$("#h5fav").text("�w����");
    					}
    				}
    			});
    		}
    	});
    	
    	function getHowManyFav(recID){
    		var count = '';
    		$.ajax({
    			url:"<%=request.getContextPath()%>/recipe/rec.do",
    			type:"post",
    			data:{
    				action:"getHowManyFav",
    				recID:recID
    			},
    			dataType : "text",
    			cache:false,
    			ifModified:true,
    			async:false,
    			success:function(data){
    				count = data;
    				
    			}
    		});
    		return count;
    	}
    
    	$("#favRec").click(function(){
    		var memID = $("#sessionMemID").val();
    		var h3text = $("#h5fav").text();
    		console.log(h3text);
    		if(h3text == '�I������'){
    			$.ajax({
    				url:"<%=request.getContextPath()%>/recipe/rec.do",
    				type:"post",
    				data:{
    					action:"addFav",
    					location: $("#location").val(),
    					recID:$("#recID").val()
    				},
    				dataType : "text",   				
    				cache:false,
    				ifModified:true,
    				success:function(data){
    					if(data==0){
    						window.location.replace("<%=request.getContextPath()%>/front_end/member/login.jsp");
    					}else{
    						$("#heart").attr('src','<%=request.getContextPath()%>/resource/images/heart.png');
    		        		$("#h5fav").text("�w����");
    					}
    				}
    			});
    		}else{
    			$.ajax({
    				url:"<%=request.getContextPath()%>/recipe/rec.do",
    				type:"post",
    				data:{
    					action:"delFav",
    					recID:$("#recID").val()
    				},
    				dataType : "text",
    				traditional: true,
    				cache:false,
    				ifModified:true,
    				success:function(data){
    					console.log(data);
    					$("#heart").attr('src','<%=request.getContextPath()%>/resource/images/heartempty.png');
    	        		$("#h5fav").text("�I������");
    				}
    				
    			});
    			
    		}
    		
    	});
    		
    
    	$("#addCart").click(function(){
//     		console.log($("#location").val());
			var comIDArr = new Array();
			$("input[name='comIDForCarts']").each(function(){
				comIDArr.push($(this).val());
			});
			console.log(comIDArr);
		
			$.ajax({
				url:"<%=request.getContextPath()%>/cart/comCart.do",
				type:"post",
				data:{
					action:"addCartfromRecipe",
					location: $("#location").val(),
					comIDForCarts:comIDArr,
					recID:$("#recID").val()
				},
				dataType : "text",
				traditional: true,
				cache:false,
				ifModified:true,
				success:function(data){
					if(data==0){
						window.location.replace("<%=request.getContextPath()%>/front_end/member/login.jsp");
					}else{
						var str = "�w���\�K�["+data+"���ӫ~���ʪ���! �Ыe���d��!"
						$("#successMsg").text(str);
						$("#successModal").modal("show");
						$("#close").click(function(){
							window.location.reload();
						});
					}
				}
			});
    	});
    
    
    </script>
</body>
</html>