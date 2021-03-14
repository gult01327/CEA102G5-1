
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>  
<% MemVO memVO = (MemVO) session.getAttribute("memVO"); %>
<jsp:useBean id="recVO" scope="request" type="com.recipe.model.RecVO" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>個人修改食譜</title>
    <link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/lightbox.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
     <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
    <style>
    #all{
		width: 1500px;
		height: auto;
		margin: 50px auto;
		/* background-color: rgb(243, 241, 240); */

	}

    #left{
		width: 800px;
		float: left;
		/* background-color: brown; */
		text-align: center;
	}
    #right{
		width: 300px;

		float: left;
		/* background-color: rgb(42, 165, 144); */
        

	}
    #text{
        margin-top: 10px;
        margin-bottom: 30px;
        border: 2px solid black;
        border-radius: 4px;
        width:400px;
        height: 40px;
    }
    #ta{
        margin-top: 10px;
        border: 2px solid black;
        border-radius: 4px;
    }
    #size{
        width: 150px;
        height: 30px;
    }
    #fontSize{
        margin-left: 120px;
    }
    #cooktime{
        margin-left: 80px;
        width: 150px;
        height: 30px;
        margin-bottom: 30px;
    }
    #ingredients{
        
        border-radius: 4px;
        width: 520px;
        height: auto;
        text-align:center;
        margin-left: 150px;
        margin-bottom: 50px;
    }
    #step{
        border: 2px solid black;
        border-radius: 4px;
        width: 600px;
        text-align:center;
        margin-left: 150px;
        margin-bottom: 50px;
    }

    button{
        background-color:antiquewhite;
        width: 120px;
        height: 50px;
        cursor: pointer;
        border: 1px;
        border-radius: 10px;
        
    }
    button:hover{
        border-radius: 30px;
	    background-color: rgba(255,255,255,.3); 
	    transition: all 0.5s;
    }
    #submitbtn{
        background-color: rgb(245, 98, 98);
    }

    #labelUpload{
        cursor: pointer;
    }

    textarea{
    	border: solid;
        border-radius: 5px;
        resize: none;
    }
    img{
        cursor: pointer;
        border: solid;
        border-radius: 5px;
    }
    img.imgRemove{
    	border:0px;
    }
    img.ingredientsRemove{
  		border: 0px;
  	}
    textarea.textbox{
    	margin-left: 20px;
    }
    #showIngredient{
    	 
    }
    #ingTable{
    	width:780px;
    }
    #calculate{
    	width:100%;
    	
    	margin-top:525px;
    	margin-left:50px;
    }
    #calbtn{
    	margin-top:50px;
    	margin-left:50px;
    }
    #index{
        display: inline-block;
        vertical-align: top;
        margin-left: 10px;
        margin-right: 20px;
        margin-top: 80px;
        font-family:fantasy;
        font-size: x-large;
    }


    </style>
         
</head>
<body bgcolor=#E8FFE8>
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">個人修改食譜</font>
<hr><p>

		<h4><a href="<%=request.getContextPath() %>/front_end/commodity/comindex.jsp">回商城首頁</a></h4>
<form method="post" action="<%=request.getContextPath() %>/recipe/rec.do" enctype="multipart/form-data">
    
    <div id="all"> 
        <div id="left">
             <font size="+2">標題</font><br>
             <input type="text" id="text" name="title" value='${recVO.recName}' placeholder="請填寫食譜標題" ><br>
             <font size="+2">請上傳圖片</font><br>
             <label id="labelUpload">
                 <input id="myFile" type="file" name="recipePic" style="display: none;">
                <img id="img" src="<%=request.getContextPath()%>/ComPicReader${recVO.recPicSrc}&pic=1" alt="" width="250">
             </label><br><br><br>
             
             <font size="+2">食譜簡介</font><br>
             <textarea name="intro" id="ta" cols="52" rows="8" placeholder="輸入食譜描述(最多200字)" maxlength="200">${recVO.recContent}</textarea><br>
             <font size="+2">份量(人份)</font> <font size="+2" id="fontSize">烹調時間(分鐘)</font><br>
             <select name="size" id="size">
                 <option value="-1" ${(recVO.recSize==0)?'selected':''}>未設定</option>
                 <option value="2" ${(recVO.recSize==2)?'selected':''}>2人份</option>
                 <option value="4" ${(recVO.recSize==4)?'selected':''}>4人份</option>
                 <option value="6" ${(recVO.recSize==6)?'selected':''}>6人份</option>
                 <option value="8" ${(recVO.recSize==8)?'selected':''}>8人份</option>
             </select>
             <select name="cooktime" id="cooktime">
                <option value="-1"${(recVO.recCooktime==0)?'selected':''}>未設定</option>
                <option value="10"${(recVO.recCooktime==10)?'selected':''}>10</option>
                <option value="15"${(recVO.recCooktime==15)?'selected':''}>15</option>
                <option value="25"${(recVO.recCooktime==25)?'selected':''}>25</option>
                <option value="30"${(recVO.recCooktime==30)?'selected':''}>30+</option>
            </select><br>
            <font size="+2">食材</font><br><br>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
   				請選擇食材
  			</button><br>
  			
  			
  			<div id="showIngredient">
  			
  			</div>
  			
  		

             
            <font size="+2">步驟</font><br>
            <input type="button" onclick="addBox()" value="添加步驟">
            <div id="step">

                
            </div>

        </div>
        <div id="right">
            <input type="submit" value="發布食譜"><br><br>
            <input type="hidden" name="action" value="updateRecipe">
            <input type="hidden" name="memID" value="${memVO.memID}">
            <input type="hidden" name="recID" value="${recVO.recID}">
            <button>儲存食譜</button><br><br>
            <button>取消</button><br><br>
            <button>刪除食譜</button>
            
            <div id="calculate">
  				
  				
  			</div>


        </div>
    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width:1000px">
      <div class="modal-content" background-color="red">
        <div class="modal-header">
          <h2 class="modal-title" id="exampleModalLabel">請選擇食材</h2>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <jsp:include page="/front_end/recipe/listComforRec.jsp" />
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</form>
    <script type="text/javascript">
   //拿食材
    $(document).ready(function(){
    	 var recID = ${recVO.recID};
    	 $.ajax({
    		 url:"<%=request.getContextPath()%>/recipe/rec.do",
    		 type:"post",
    		 data:{
    			 action:"GetRecDetail_ByAjax",
    			 recID : recID
    		 },
    		 dataType : "json",
    		 cache:false,
 			 ifModified:true,
 			 success:function(data){
 				var html = "";
 				html += "<table id='ingTable'><tr><td>食材名稱</td><td>食材熱量</td><td>食材碳水化合物</td><td>食材蛋白質</td><td>食材脂質</td></tr>";
 				for(let i = 0; i<data.length; i++){
 					html += "<tr>";
 					html += "<input type='hidden' name='alreadyChecked' value='"+data[i].comID +"'>";
 					html += "<td>"+data[i].comName+"</td>";
 					html += "<td class='cal'>"+ data[i].comCal +"</td>";
 					html += "<td class='carb'>"+data[i].comCarb+"</td>";
 					html += "<td class='pro'>"+data[i].comPro+"</td>";
 					html += "<td class='fat'>"+data[i].comFat+"</td>";
 					html += "<td><input type='text' value='"+data[i].reciNums+"'class = 'ingNums' name='ingNums' style='width:150px' placeholder='請輸入食材克數' ></td>";
 					html += "<td><img class='ingredientsRemove' src='<%=request.getContextPath()%>/resource/images/trash.png'></td>";
 					html +="</tr>";	
 				}
 				html +="</table>";
 				$("#showIngredient").html(html);
				 calculateByingNums();
 			 } 
    	 });
    	 
    });
    
    //拿步驟
    $(document).ready(function(){
    	var recID = ${recVO.recID};
    	$.ajax({
    		url:"<%=request.getContextPath()%>/recipe/rec.do",
    		type:"post",
    		data:{
	   			 action:"GetRecStep_ByAjax",
	   			 recID : recID
   		 	},
   		 	dataType : "json",
   		 	cache:false,
			ifModified:true,
			success:function(data){
				for(let i = 0 ; i<data.length ; i++){
					addBox();
					var imgstep = $(".imgStep").get(i);
					var textbox = $(".textbox").get(i);
					imgstep.setAttribute("src","<%=request.getContextPath()%>/ComPicReader"+data[i].recsPicSrc+"&pic=1");
					textbox.innerText = data[i].recsContent;
					var recsID = $("input[name=recsID]").get(i);
					recsID.setAttribute("value",data[i].recsID);
// 					var hidden = document.createElement("input");
// 					hidden.setAttribute("type","hidden");
// 					hidden.setAttribute("value",data[i].recsID);
				}
			}
    	});
    });
    
    $("#showIngredient").on("click",".ingredientsRemove",function(){
		$(this).parents("tr").remove();
		calculate();
		calculateByingNums();
		
	});
    
    
        function init(){
        let myFile = document.getElementById("myFile"); //上傳檔案鈕的資料
        
        myFile.addEventListener('change', function(e) {
        
        let files = e.target.files;

        if(files){

            for(let i = 0; i < files.length; i++){
                let file = files[i];

                if(file.type.indexOf('image') > -1){
                    

                    let reader = new FileReader();
                    reader.addEventListener('load',function(e){
                        let result = e.target.result;
                        console.log(result);
     
                        let img = document.getElementById('img');

                        img.setAttribute('src',result);
 
                    });
                    reader.readAsDataURL(file);
                }else{
                    alert('別亂傳，請上傳圖片檔!');
                }
            }
        }

        });
    }

    $("body").on("click",".imgRemove",function(){
        $(this).parent("div").remove();
        
    });

    $("#step").on("change","input[type='file']",function(e){
        let file = e.target.files[0];
        let img = $(this).parent().children("img")[0];
        console.log(img);

                if(file.type.indexOf('image') > -1){
                    

                    let reader = new FileReader();
                    reader.addEventListener('load',function(e){
                        let result = e.target.result;
                        
                        img.src=result; 
                    });
                    reader.readAsDataURL(file);
                }else{
                    alert('別亂傳，請上傳圖片檔!');
                }
        });

        
    var count = 10;
    var count2 = 0;
    var count3 = 30;
    var indexCount = 1;
	function addBox(){
            var div = document.createElement('div');
           
            var label = document.createElement("label");
            
            var file = document.createElement("input");
            var hidden = document.createElement("input");
            hidden.setAttribute('type','hidden');
            hidden.setAttribute('name','fileName');
            hidden.setAttribute('value','stepPic'+count);
            var hidden2 = document.createElement("input");
            hidden2.setAttribute('type','hidden');
            hidden2.setAttribute('name','recsID');
            
            file.setAttribute('id','file');
            file.setAttribute('type','file');
            file.setAttribute('style','display:none;');
            var img = document.createElement("img");
            var br = document.createElement("br");
            img.setAttribute('id','img'+count);
            img.setAttribute('class','imgStep');
            img.setAttribute('src','<%=request.getContextPath()%>/resource/images/upload.png');
            img.setAttribute('width','200px');
            img.setAttribute('height','188px');
            file.setAttribute('name','stepPic'+count);
            var textBox = document.createElement("textarea");
            var imgRemove = document.createElement("img");
            imgRemove.setAttribute('src','<%=request.getContextPath()%>/resource/images/trash.png');
            imgRemove.setAttribute('class','imgRemove');
            textBox.setAttribute('cols',30);
            textBox.setAttribute('rows',10);
            textBox.setAttribute('class','textbox');
            textBox.setAttribute('name','stepText');
            count++;
            count2++;
            imgRemove.setAttribute('onclick','remove()');
            count3++;
            div.setAttribute('id',count2);
            label.setAttribute('id',count);
            textBox.id = count3;
            var index = document.createElement('div');
            index.setAttribute('id','index');
            index.setAttribute('class','indexClass');
            index.innerText = indexCount;
            indexCount++;
            var left = document.getElementById('left');
            document.getElementById("step").appendChild(div);
            document.getElementById(count2).appendChild(index);
            document.getElementById(count2).appendChild(label);
            document.getElementById(count).appendChild(file);
            document.getElementById(count).appendChild(hidden);
            document.getElementById(count).appendChild(hidden2);
            document.getElementById(count).appendChild(img);
            document.getElementById(count2).appendChild(textBox);
            document.getElementById(count2).appendChild(imgRemove);

            // if(count>=15){
            // var btn = document.getElementById('btn');
            //     btn.setAttribute('disabled','disabled');
            // }
            console.log("New elements id : " + textBox.id);
        }

    $( function() {
    $( "#step" ).sortable({
    	cursor:"crosshair",
        opacity:0.6,
        update:function(){
            var count = 1;
            $(".indexClass").each(function(){
                $(this).text(count);
                count++;
            });
        }
    });
    $( "#step" ).disableSelection();
  } );
    
    function calculateByingNums(){
    	var ingNumArr = new Array();
    	$(".ingNums").each(function(){
    		var ingNum = parseInt($(this).val());
    		ingNumArr.push(ingNum);
    	});
    	var calArr = new Array();
    	$(".cal").each(function(){
    		var cal = parseFloat($(this).text());
    		calArr.push(cal);
    	});
    	var carbArr = new Array();
		$(".carb").each(function(){
			var carb = parseFloat($(this).text());
			
			carbArr.push(carb);
		});
		var proArr = new Array();
		$(".pro").each(function(){
			var pro = parseFloat($(this).text());
			
			proArr.push(pro);
		});
		var fatArr = new Array();
		$(".fat").each(function(){
			var fat = parseFloat($(this).text());
			
			fatArr.push(fat);
		});
    	
		//個別加總
    	var totalCal = 0;
		var totalCarb = 0;
		var totalPro = 0;
		var totalFat = 0;
		
		for(let i = 0 ; i<ingNumArr.length; i++){
			totalCal += (calArr[i] * ingNumArr[i]); 
			totalCarb += (carbArr[i] * ingNumArr[i]); 
			totalPro += (proArr[i] * ingNumArr[i]); 
			totalFat += (fatArr[i] * ingNumArr[i]); 
		}
		var totalCal2 = totalCal.toFixed(2);
    	var totalCarb2 = totalCarb.toFixed(2);
    	var totalPro2 = totalPro.toFixed(2);
    	var totalFat2 = totalFat.toFixed(2);
    	
    	var html ="";
		html += "<font id='showTotalCal' size='5' face='Arial' color='red'><b>總熱量為:( "+totalCal2+" )卡路里</b></font><br>";
		html += "<input type='hidden' name='totalCal' value='"+ totalCal2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總碳水化合物為:( "+totalCarb2+" )克</font><br>";
		html += "<input type='hidden' name='totalCarb' value='"+ totalCarb2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總蛋白質為:( "+totalPro2+" )克</font><br>";
		html += "<input type='hidden' name='totalPro' value='"+ totalPro2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總脂肪為:( "+totalFat2+" )克</font>";
		html += "<input type='hidden' name='totalFat' value='"+ totalFat2 +"'>";
	
		$("#calculate").html(html);
    }
    
    $("#showIngredient").on("change","input[name='ingNums']",function(){
    	var ingNumArr = new Array();
    	$(".ingNums").each(function(){
    		var ingNum = parseInt($(this).val());
    		ingNumArr.push(ingNum);
    	});
    	var calArr = new Array();
    	$(".cal").each(function(){
    		var cal = parseFloat($(this).text());
    		calArr.push(cal);
    	});
    	var carbArr = new Array();
		$(".carb").each(function(){
			var carb = parseFloat($(this).text());
			
			carbArr.push(carb);
		});
		var proArr = new Array();
		$(".pro").each(function(){
			var pro = parseFloat($(this).text());
			
			proArr.push(pro);
		});
		var fatArr = new Array();
		$(".fat").each(function(){
			var fat = parseFloat($(this).text());
			
			fatArr.push(fat);
		});
    	
		//個別加總
    	var totalCal = 0;
		var totalCarb = 0;
		var totalPro = 0;
		var totalFat = 0;
    	
    	for(let i = 0 ; i<ingNumArr.length; i++){
    		if(isNaN(ingNumArr[i])){
    			totalCal += calArr[i];
    			totalCarb += carbArr[i];
    			totalPro += proArr[i];
    			totalFat += fatArr[i];
    		}else{
    			totalCal += (calArr[i] * ingNumArr[i]); 
    			totalCarb += (carbArr[i] * ingNumArr[i]); 
    			totalPro += (proArr[i] * ingNumArr[i]); 
    			totalFat += (fatArr[i] * ingNumArr[i]); 
    		}
    	}
    	var totalCal2 = totalCal.toFixed(2);
    	var totalCarb2 = totalCarb.toFixed(2);
    	var totalPro2 = totalPro.toFixed(2);
    	var totalFat2 = totalFat.toFixed(2);
    	
    	var html ="";
		html += "<font id='showTotalCal' size='5' face='Arial' color='red'><b>總熱量為:( "+totalCal2+" )卡路里</b></font><br>";
		html += "<input type='hidden' name='totalCal' value='"+ totalCal2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總碳水化合物為:( "+totalCarb2+" )克</font><br>";
		html += "<input type='hidden' name='totalCarb' value='"+ totalCarb2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總蛋白質為:( "+totalPro2+" )克</font><br>";
		html += "<input type='hidden' name='totalPro' value='"+ totalPro2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總脂肪為:( "+totalFat2+" )克</font>";
		html += "<input type='hidden' name='totalFat' value='"+ totalFat2 +"'>";
	
		$("#calculate").html(html);
    });
    
    
    
    function calculate(){
    	
    	//抓取熱量
    	var calArr = new Array();
    	$(".cal").each(function(){
    		var cal = parseFloat($(this).text());
    		
    		
    		calArr.push(cal);
    	});
//     	console.log(calArr);
		var totalCal = 0;
		for(let i = 0;i<calArr.length;i++){
			totalCal+=calArr[i];
		}
		var totalCal2 = totalCal.toFixed(2);
		
		//抓取碳水
		var carbArr = new Array();
		$(".carb").each(function(){
			var carb = parseFloat($(this).text());
			
			carbArr.push(carb);
		});
		var totalCarb = 0;
		for(let i = 0 ; i <carbArr.length;i++){
			totalCarb+=carbArr[i];			
		}
		var totalCarb2 = totalCarb.toFixed(2);
		//抓取蛋白質
		var proArr = new Array();
		$(".pro").each(function(){
			var pro = parseFloat($(this).text());
			
			proArr.push(pro);
		});
		var totalPro = 0;
		for(let i = 0; i<proArr.length;i++){
			totalPro += proArr[i];
		}
		var totalPro2 = totalPro.toFixed(2);
		//抓取脂質
		var fatArr = new Array();
		$(".fat").each(function(){
			var fat = parseFloat($(this).text());
			
			fatArr.push(fat);
		});
		var totalFat = 0 ;
		for(let i = 0 ; i < fatArr.length ;i++){
			totalFat += fatArr[i];
		}
		var totalFat2 = totalFat.toFixed(2);
		var html ="";
		html += "<font id='showTotalCal' size='5' face='Arial' color='red'><b>總熱量為:( "+totalCal2+" )卡路里</b></font><br>";
		html += "<input type='hidden' name='totalCal' value='"+ totalCal2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總碳水化合物為:( "+totalCarb2+" )克</font><br>";
		html += "<input type='hidden' name='totalCarb' value='"+ totalCarb2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總蛋白質為:( "+totalPro2+" )克</font><br>";
		html += "<input type='hidden' name='totalPro' value='"+ totalPro2 +"'>";
		html += "<font size='3' face='Arial' color='black'>總脂肪為:( "+totalFat2+" )克</font>";
		html += "<input type='hidden' name='totalFat' value='"+ totalFat2 +"'>";
		
		$("#calculate").html(html);
    }    
        
        window.onload = function(){
    		init();
    	}    
    </script>
    
</body>
</html>