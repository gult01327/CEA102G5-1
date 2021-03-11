<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta http-equiv="pragma" content="no-cache">
<title>Add Coach</title>
</head>
<body>
		
		<H1>新增教練</H1>
<c:if test="${!empty errorMsgs}">
		<ul>
			<c:forEach var="error" items="${errorMsgs}">
				<li style="color:red">${error.key} : ${error.value}</li>
			</c:forEach>
		</ul>
</c:if>
	
	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back_end/coach/coa.do"
	enctype="multipart/form-data">
	
	
	<p>名稱<p>
			<input placeholder="名稱" type=text name=coaName required="required" value=${coachVO.coaName}>
	<p>帳號<p>
			<input placeholder="帳號" type=text name=coaAccount required="required" value=${coachVO.coaAccount}>
	<p>密碼<p>
			<input placeholder="密碼" type=text name=coaPassword required="required" value=${coachVO.coaPassword}>
	<p>性別<p>
			<label for="coaSexMale">男性</label>
			<input type="radio" name="coaSex" id="coaSexMale" value="Male" required="required" ${(coachVO.coaSex== "Male")?'checked':''}>
    		<label for="coaSexFemale">女性</label>
    		<input type="radio" name="coaSex" id="coaSexFemale" value="Female" ${(coachVO.coaSex== "Female")?'checked':''}>
	<p>圖片<p>
			<input id=pic type=file name=coaPicture required="required">
	<div id="preview"></div>
	<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
	<p>選擇專長<p>
	<c:forEach var="talVO" items="${talSvc.all}">
		<input type="checkbox" name="talID" id="${talVO.talID}" value="${talVO.talID}">
		<label for="${talVO.talID}">${talVO.talName}</label>
	</c:forEach>
	
	<p>填寫資歷<p>
	<img src="<%=request.getContextPath()%>/resource/coach/images/add.png" id="btnAddExpContent">
	<div id = "content" style="display:none">
		<input type=text name=expContent>
		<img src="<%=request.getContextPath()%>/resource/coach/images/trash.png" id = "btnRemoveExpContent">		
	</div>
	<div id= contentArea></div>
		<input type="hidden" name="action" value="add"> 
		<input type=submit value=新增>
	</form>
		


	
		<script>
		
        $("body").on("click", "#btnRemoveExpContent", function() {
            $(this).parent().remove();
        });
        $("body").on("click", "#btnAddExpContent", function() {
            let content = document.getElementById("content");
            let newContent = content.cloneNode(true);
            newContent.style.display = "";
            $("#contentArea").append(newContent);
        });
        
		
		var servletPathName ="${pageContext.request.requestURI}";
		
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
		                    img.height = 100+'px';
		                    img.src = r;
		                    preview.append(img);
		                });
		                reader.readAsDataURL(file);
		            }
		        };
		    } else {
		        alert("error")
		    };
			});
		</script>

</body>
</html>