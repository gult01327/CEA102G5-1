<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Lesson</title>
</head>
<div>
		

<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.css">
<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.js"></script>
<script defer src="<%= request.getContextPath()%>/resource/lesson/js/lesson.js"></script>

<style>

.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year{
width:70%;
}

</style>

		<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>

<form id=lesAddForm METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do" enctype="multipart/form-data">
<fieldset>
<label for="coaVO">教練</label><br>
	<select name=coaID id=coaVO required="required" style=width:130px;>
		<option selected="selected" disabled="disabled"  style='display: none' value=''></option>
		<c:forEach var="coaVO" items="${coaSvc.normal}">
			<option value = "${coaVO.coaID}">${coaVO.coaName}</option>
		</c:forEach>
	</select><br>
	<label for="talVO">專長</label><br>
		<select name=talID id=talVO required="required" style=width:130px;>
		<option>請先選擇教練</option>
		</select><br>
	<label for="lesName">課程名稱</label><span style="color:red">${errorMsgs.lesName}</span><br>
		<input placeholder="中英文2-60字" id=lesName type="text" name=lesName required="required" value=${lesVO.lesName}><br>
	<label for="lesDate">日期</label><span style="color:red">${errorMsgs.lesDate}</span><br>
		<input autocomplete="off" placeholder="僅能新增3天之後的課程" type="text" id="lesDate" name=lesDate required="required" value="${(empty lesVO)?param.lesDate:lesVO.lesDate}"><br>
	<label for="lesTime">上課時段(最小間隔一小時)</label><span style="color:red">${errorMsgs.lesTime}</span><br>
		<input autocomplete="off" placeholder="格式13:00-14:30" type="text" id=lesTime name=lesTime required="required" value=${lesVO.lesTime}><br>
	<label for="lesBegin">報名起始日</label><span style="color:red">${errorMsgs.lesBegin}</span><br>
		<input autocomplete="off" placeholder="不能晚於上課日1天" type="text" id="lesBegin" name="lesBegin" required="required" value=${lesVO.lesBegin}><br>
	<label for="lesEnd">報名截止日</label><span style="color:red">${errorMsgs.lesEnd}</span><br>
		<input autocomplete="off" placeholder="最晚於上課日當日0時0分0秒" type="text" id="lesEnd" name="lesEnd" required="required" value=${lesVO.lesEnd}><br>
	<label for="pic">課程圖片</label><span style="color:red"></span><br>
		<input id=pic accept="image/*" type="file" name=lesPicture required="required"><br>
	<label for="lesVideo">課程影片</label><br><span style="color:red"></span><br>
		<input id=lesVideo accept="video/*" type="file" name=lesVideo required="required"><br>
	<label for="lesAvailable">人數上限</label><span style="color:red">${errorMsgs.lesAvailable}</span><br>
		<input placeholder="上課人數上限"  id=lesAvailable type="number" name=lesAvailable required="required" value=${lesVO.lesAvailable}><br>
	<label for="lesPrice">價格</label><span style="color:red">${errorMsgs.lesPrice}</span><br>
		<input placeholder="課程售價"  id=lesPrice type="number" name=lesPrice required="required" value=${lesVO.lesPrice}><br>
	<br><div id= preview></div>
	<input type="hidden" name="action" value="add"> 
	<input id="add" type=submit value=新增>
</fieldset>
</form>



	<script>
	var servletPathName ="${pageContext.request.requestURI}";
	
	
		$("#lesVideo").change(function(e){
			let file = e.target.files[0];
			let limit = 30*1024;
			if(file.type.indexOf("video") < 0){
				let msg ="請確認檔案類型";
				$("#lesVideo").val("");
				alert(msg);
			}else if((file.size/1000) > limit){
				let msg ="您所選擇的檔案大小為 "+(file.size/1000)+" kB\n已超過上傳上限 "+limit+" kB\n不允許上傳！";
				$("#lesVideo").val("");
				alert(msg);
			}
		})
		let preview = document.getElementById('preview');
		$("#pic").change(function(e){
				$("#preview").children().remove();
				let files = e.target.files;
		    if (files) {
		        for (let i = 0; i < files.length; i++) {
		            let file = files[i];
		            if (file.type.indexOf("image") > -1) {
		                let reader = new FileReader();
		                reader.addEventListener("load", function(e) {
		                    let r = e.target.result;
		                    let img = document.createElement("img");
		                    img.height = 200;
		                    img.src = r;
		                    preview.append(img);
		                });
		                reader.readAsDataURL(file);
		            }else {
		            	let msg ="請確認檔案類型";
						$("#pic").val("");
						alert(msg);
					}
				    };
		        };
			});
		

		</script>
</div>
</html>