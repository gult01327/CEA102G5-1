<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>




<meta charset="UTF-8">
<title>Update Lesson</title>
</head>
<div>



<jsp:useBean id="lesSvc" class="com.lesson.model.LesService"/>
<jsp:useBean id="coaSvc" class="com.coach.model.CoaService"/>
<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>

<form METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/lesson/les.do" enctype="multipart/form-data">
<fieldset>
<table>
        <tr>
            <th>課程編號</th>
            <td>${lesVO.lesID}</td>
        <tr>
        <tr>
            <th>課程名稱</th>
            <td><input placeholder="中英文2-60字" id=lesName type="text" name=lesName required="required" value=${lesVO.lesName}><span style="color:red">${errorMsgs.lesName}</span></td>
        <tr>
        <tr>
            <th>教練(專長)</th>
            <td>${coaSvc.getOneCoach(lesVO.coaID).coaName}(${talSvc.getTalent(lesVO.talID).talName})</td>
        <tr>
        <tr>
            <th>上課日期</th>
            <td>${lesVO.lesDate}  ${lesVO.lesTime}</td>
        <tr>
        <tr>
            <th>報名日期</th>
            <td>${lesVO.lesBegin} ~ ${lesVO.lesEnd}</td>
        <tr>
        <tr>
            <th>人數上限</th>
            <td>${lesVO.lesAlready}位(${(lesVO.lesAvailable-lesVO.lesAlready)}位)</td>
        <tr>
        <tr>
            <th>圖片</th>
            <td><input id=pic accept="image/*" type="file" name=lesPicture></td>
        <tr>
        <tr>
            <th>影片</th>
            <td><input id=lesVideo accept="video/*" type="file" name=lesVideo></td>
        <tr>
        <tr>
            <th>價格</th>
            <td><input placeholder="課程售價"  id=lesPrice type="number" name=lesPrice required="required" value=${lesVO.lesPrice}><span style="color:red">${errorMsgs.lesPrice}</span></td>
        <tr>
    </table>
    <div id= preview></div> 
    <input type="hidden" name="lesID" value="${lesVO.lesID}"> 
	<input type="hidden" name="action" value="update">
	<input type=submit value=更新>
</fieldset>
</form>		






	<script>
	
	var servletPathName ="${pageContext.request.requestURI}";
	
	
		$("#lesVideo").change(function(e){
			let file = e.target.files[0];
			let limit = 50*1024;
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