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
<style>
    #select{
        width: 1000px;
        
        margin-left: 100px;
    }
    #selectType{
        width: 100px;
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
        width:1000px;
        margin-top: 30px;
        margin-left: 100px;
    }
    #oneRec{
        width: 1000px;
        border: 1px solid black;
        border-radius: 5px;
        padding-top: 20px;
        padding-bottom: 20px;
    }
    #recPic{
        width:250px;
        height: 230px;
    }
    #recName{
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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<body bgcolor="#E8FFE8">
    <div id="parent">
        <div id='select'>
            <span><a href="<%=request.getContextPath()%>/front_end/recipe/recIndex.jsp">回食譜首頁</a></span>
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
			html += "<div id='recbody'><span id='recName'><a href='<%=request.getContextPath()%>/recipe/rec.do?action=GetRecDetail_ByrecID&recID="+data[i].recID+"'><b>"+data[i].recName+"</b></a></span><br>";
			html += "<span class='recAuthor' id='recAuthor'>"+data[i].memID+"</span><br><br>";
			html += "<span id='recContent'>"+data[i].recContent+"</span><br><br>";
			html += "<span id='recCal'>總熱量: "+data[i].recCal+"</span><br><br><br>";
			html += "<span id='recFav'>5人收藏</span></div></div>";

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