<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>
<%
	MemVO memVO2 = (MemVO)session.getAttribute("memVO");
	pageContext.setAttribute("memVO2", memVO2); 
	if(memVO2==null){
		String location = request.getServletPath();
		session.setAttribute("location", location);
		response.sendRedirect(request.getContextPath()+"/front_end/member/login.jsp");
		return;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>食譜首頁</title>
</head>


<body bgcolor="#E8FFE8">
<style>
    #select{
        width: 100%;
        
        margin-left: 100px;
    }
    #selectType{
        width: 200px;
        height: 30px;
    }
    #selectText{
        width:200px;
        height: 25px;
    }
    #headerlink{
        display: inline-block;
    }
    #fav{
        margin-left: 300px;
        font-size: large;
    }
    #add{
        margin-left: 80px;
        font-size: large;
    }
    #showRec{
        width:100%;
        margin-top: 30px;
        margin-left: 100px;
    }
    #oneRec{
        width: 100%;
        border: 1px solid black;
        border-radius: 5px;
        padding-top: 20px;
        padding-bottom: 10px;
        margin-top:50px;
        margin-bottom:50px;
    }
    #recPic{
        width:200px;
        height: 200px;
    }
    #recName{
    	width:300px;
        font-size: x-large;
    }
    #recAuthor{
        font-size: large;
        margin-top: 100px;
    }
    #recbody{
        width: 600px;
        display: inline-block;
        vertical-align: top;
        margin-left:30px;
        padding: 10px;
    }
    #searchPng{
        vertical-align: bottom;
        cursor: pointer;
    }
    #favRec{
        display: inline-block;
        vertical-align: top;
    }


</style>

    <div id="parent">
        <div id='select'>
            <span><h2>${memVO2.memName}您好，您的收藏食譜如下:</h2></span>
        </div>

        <div id="showRec"></div>
        <input type='hidden' id='loginMemID' value='${memVO2.memID}'>
        
        </div>
        
        
<script type="text/javascript">
	
	$(document).ready(function(){
		getRec();
	});
	


	function getRec(){
		var memID = $("#loginMemID").val();
		$.ajax({
			url:"<%=request.getContextPath()%>/recipe/rec.do",
			type:"post",
			data:{
				action:"getRecMemFavorite",
				memID : memID
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
				generateResult(data);
				for(let i = 0;i<data.length;i++){
					getMemBymemID(data[i].memID);
				}
			}
		});
	}
	
	function generateResult(data){
		var html = "";
		html += "<div><span id='titleNum'>共"+data.length+"筆</span></div><hr>";
		for(let i = 0 ;i<data.length;i++){
			html += "<div id='oneRec'><img id='recPic' src='<%=request.getContextPath()%>/ComPicReader"+data[i].recPicSrc+"&pic=1'>";
			html += "<div id='recbody'><span id='recName'><a href='<%=request.getContextPath()%>/front_end/recipe/rec.do?action=GetRecDetail_ByrecID&recID="+data[i].recID+"'><b>"+data[i].recName+"</b></a></span><br>";
			html += "<span class='recAuthor' id='recAuthor'>"+data[i].memID+"</span><br><br>";
			html += "<span id='recContent'>"+data[i].recContent+"</span><br><br>";
			html += "<span id='recCal'>總熱量: "+data[i].recCal+"</span><br><br><br>";
			html += "</div></div>";

		}
		$("#showRec").html(html);
	}
	
	
	
	function getMemBymemID(memID){
		var memName ='';
		$.ajax({
			url: "<%=request.getContextPath()%>/member/mem.do",
			type: "post",
			data:{
				action: "getMemByAjax",
				memID : memID
			},
			dataType:"json",
			cache:false,
			ifModified:true,
			success:function(data){
				$(".recAuthor").each(function(){
					if($(this).text() == memID){
						var str = "作者: " + data.memName;
						$(this).text(str);
					}
				});
			}
			
		});
	}
	
	
</script>
</body>
</html>