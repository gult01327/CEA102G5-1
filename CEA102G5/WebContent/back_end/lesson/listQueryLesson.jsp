<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Query Result</title>


</head>
<body>

<style>

tr.datatable:hover{
background-color: #DFE7F2;
color: #000000;
}
.nowPageColor{
	background-color: #B3D9D9;
	color: #000000;
}
#nums, #orderBy{
	display:inline-block;
	width:auto;
	height:auto;
}
#pre, #next, #pageNumBlock{
	visibility:hidden;
}

div.product-grid{
	display:flex;
	flex-direction: row;
	align-items: flex-end;
	flex-wrap:wrap;
}
div.product-item .product-action{
	padding:0;
	height:16px;
}

div.pagination{
	margin:20 auto;
}
#tableRs{
	display: flex;
	justify-content: center;
	flex-direction:column;
}
div#sel, table#view{
	margin:10px auto;
}



</style>
		


<script type="text/javascript" src="<%= request.getContextPath()%>/resource/lesson/js/fenYeah.js"></script>

<div id=tableRs>
<div id=sel>
<span>總筆數:${total}筆</span>
<input type=hidden id=total value=${total}>
<span>每頁筆數</span><select id=nums>
	<c:forEach var="val" begin="2" end="10">
		<option ${(nums == val)?'selected':''} value=${val}>${val}筆</option>
	</c:forEach>
</select>
<span>排序</span>
<select id=orderBy>
	<option ${(orderBy == "LES_DATE")?'selected':''} value="LES_DATE">上課日</option>
	<option ${(orderBy == "LES_ALREADY")?'selected':''} value="LES_ALREADY">報名人數</option>
	<option ${(orderBy == "LES_TIME")?'selected':''} value="LES_TIME">上課時間</option>
	<option ${(orderBy == "LES_PRICE")?'selected':''} value="LES_PRICE">價格</option>
</select>
</div>

<div class='resultBox'>
<div class='result' id=viewBlock>
	<table id=view style='width:500px;'>
    	<tr id=thRow><th>課名</th><th>專長</th><th>日期</th><th>已預約</th><th>教練</th></tr>
	</table>
</div>
</div>
						<div class="pagination">
                            <a class="prev page-numbers" id=pre href="#">Prev</a>
                            <div id=pageNumBlock style="display:inline-block;"></div>
                            <a class="next page-numbers" id=next href="#">Next</a>
                        </div>
</div>

    <div class="modal fade" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="myModalLabel">課程資訊</h3>
                </div>
                <div class="modal-body">   
<div id=modalView></div>
                </div>
                <div class="modal-footer">
               		<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do" style="display:inline-block;">
                    <input type="hidden" name="reqUrl" value="<%=request.getServletPath()%>"> 
                    <input type="hidden" name="total" value=${total}>
                    <input type="hidden" name="page" value=> 
                    <input type="hidden" name="nums" value=>
                    <input type="hidden" name="orderBy" value=>
                    <input type="hidden" name="lesID" value=> 
                    <input type="hidden" name="action" value="forUpdate"> 
					<input type=submit value=編輯>
                    </form>
                    <form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do" style="display:inline-block;">
                    <input type="hidden" name="reqUrl" value="<%=request.getServletPath()%>">
                    <input type="hidden" name="total" value=${total}>
                    <input type="hidden" name="page" value=>
					<input type="hidden" name="orderBy" value=> 
                    <input type="hidden" name="nums" value=> 
                    <input type="hidden" name="lesID" value=>
                    <input type="hidden" name="action" value="cancel"> 
					<input type=submit value=取消課程>
                    </form>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
		

		





<script type="text/javascript">


var servletPathName ="${pageContext.request.requestURI}";

var nowPage = ${(not empty page)?page:1};

var lesID = ${(not empty requestScope.lesID)?lesID:-1};

$("#pageNumBlock").on("click","a",function(){
	nowPage = parseInt($(this).text());
	lesID = -1;
	load();
});

$("#pre").click(function(){
if($(this).text().length > 0){
	nowPage = nowPage-1;
	lesID = -1;
	load();
}
});
$("#next").click(function(){
if($(this).text().length > 0){
	nowPage = nowPage+1;
	lesID = -1;
	load();
}
});
$("#nums").change(function(){
	nowPage = 1;
	lesID = -1;
	load();
});
$("#orderBy").change(function(){
	lesID = -1;
	load();
});

$("body").on("click","#lookUp", function(){
	lookUp($(this).attr("value"));
});


</script>

</body>
</html>