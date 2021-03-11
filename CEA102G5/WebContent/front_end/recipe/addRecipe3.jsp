<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.commodity.model.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>編輯食譜</title>
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
        border: 2px solid black;
        border-radius: 4px;
        width: 520px;
        height: 110px;
        text-align:center;
        margin-left: 150px;
        margin-bottom: 50px;
    }
    #step{
        border: 2px solid black;
        border-radius: 4px;
        width: 520px;
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
    textarea.textbox{
    	margin-left: 20px;
    }
    #showIngredient{
    	 border: 2px solid black;
    }
    #ingTable{
    	width:780px;
    }


    </style>
         
</head>
<body bgcolor=#E8FFE8>
<img src="<%=request.getContextPath()%>/resource/images/food.jpg" height="100" width="100"><font size="+3">編輯食譜</font>
<hr><p>

		<h4><a href="<%=request.getContextPath() %>/front_end/commodity/comindex.jsp">回商城首頁</a></h4>
    <div id="all">
        <div id="left">
             <font size="+2">標題</font><br>
             <input type="text" id="text" name="title" placeholder="請填寫食譜標題" ><br>
             <font size="+2">請上傳圖片</font><br>
             <label id="labelUpload">
                 <input id="myFile" type="file" style="display: none;">
                <img id="img" src="<%=request.getContextPath()%>/resource/images/upload.png" alt="" width="250">
             </label><br><br><br>
             
             <font size="+2">食譜簡介</font><br>
             <textarea name="intro" id="ta" cols="52" rows="8" placeholder="輸入食譜描述(最多200字)" maxlength="200"></textarea><br>
             <font size="+2">份量(人份)</font> <font size="+2" id="fontSize">烹調時間(分鐘)</font><br>
             <select name="size" id="size">
                 <option value="-1">未設定</option>
                 <option value="2">2人份</option>
                 <option value="4">4人份</option>
                 <option value="6">6人份</option>
                 <option value="8">8人份</option>
             </select>
             <select name="cooktime" id="cooktime">
                <option value="-1">未設定</option>
                <option value="10">10</option>
                <option value="15">15</option>
                <option value="25">25</option>
                <option value="30+">30+</option>
            </select><br>
            <font size="+2">食材</font><br><br>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
   				請選擇食材
  			</button><br>
  			
  			
  			<div id="showIngredient">
  			<table id="ingTable">
  					<tr>
  						<td>食材名稱</td>
  						<td>食材熱量</td>
  						<td>食材碳水化合物</td>
  						<td>食材蛋白質</td>
						<td>食材脂質</td>
  					</tr>
  				<c:forEach	var="comVO" items="${checkCom}">
  					<tr>
  						<td>${comVO.comName}</td>
  						<td>${comVO.comCal}</td>
  						<td>${comVO.comCarb}</td>
  						<td>${comVO.comPro}</td>
						<td>${comVO.comFat}</td>
  					</tr>
  				</c:forEach>
  			</table>
  			</div>

             
            <font size="+2">步驟</font><br>
            <input type="button" onclick="addBox()" value="添加步驟">
            <div id="step">

                
            </div>

        </div>
        <div id="right">
            <button id="submitbtn">發布食譜</button><br><br>
            <button>儲存食譜</button><br><br>
            <button>取消</button><br><br>
            <button>刪除食譜</button>

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

    <script type="text/javascript">
    	
   
    
    
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
    
	function addBox(){
            var div = document.createElement('div');
           
            var label = document.createElement("label");
            
            var file = document.createElement("input");
            file.setAttribute('id','file');
            file.setAttribute('type','file');
            file.setAttribute('style','display:none;');
            var img = document.createElement("img");
            var br = document.createElement("br");
            img.setAttribute('id','img'+count);
            img.setAttribute('src','<%=request.getContextPath()%>/resource/images/upload.png');
            img.setAttribute('width','200px');
            img.setAttribute('height','162px');
            var textBox = document.createElement("textarea");
            var imgRemove = document.createElement("img");
            imgRemove.setAttribute('src','<%=request.getContextPath()%>/resource/images/trash.png');
            imgRemove.setAttribute('class','imgRemove');
            textBox.setAttribute('cols',30);
            textBox.setAttribute('rows',10);
            textBox.setAttribute('class','textbox');
            count++;
            count2++;
            imgRemove.setAttribute('onclick','remove()');
            count3++;
            div.setAttribute('id',count2);
            label.setAttribute('id',count);
            textBox.id = count3;
            var left = document.getElementById('left');
            document.getElementById("step").appendChild(div);
            document.getElementById(count2).appendChild(label);
            document.getElementById(count).appendChild(file);
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
    $( "#step" ).sortable();
    $( "#step" ).disableSelection();
  } );
        
        
        
        window.onload = function(){
    		addBox();
    		init();
    	}    
    </script>
    
</body>
</html>