<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<%
    Object coaVO = request.getAttribute("coaVO");                  
    if (coaVO == null) {                                           
      response.sendRedirect(request.getContextPath()+"/back_end/coach/mainCoach.jsp");
      return;
    }
%>

<html>
<head>

<script src="<%= request.getContextPath()%>/resource/js/jquery-3.5.1.min.js"></script>
<script defer src="<%= request.getContextPath()%>/resource/coach/js/coach.js"></script>
<meta charset="UTF-8">
<title>Coach Edit</title>
</head>
<body>

		
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
			<input type=text name=coaName required="required" value=${coaVO.coaName}>
	<p>帳號<p>
			<input type=text name=coaAccount required="required" value=${coaVO.coaAccount}>
	<p>密碼<p>
			<input type=text name=coaPassword required="required" value=${coaVO.coaPassword}>
	<p>性別<p>
			<label for="coaSexMale">男性</label>
			<input type="radio" name="coaSex" id="coaSexMale" value="Male" required="required" ${(coaVO.coaSex== "Male")?'checked':''}>
    		<label for="coaSexFemale">女性</label>
    		<input type="radio" name="coaSex" id="coaSexFemale" value="Female" ${(coaVO.coaSex== "Female")?'checked':''}>
	<p>圖片<p>
			<input id=pic type=file name=coaPicture>
	<div id="preview"></div>
	<p>專長<p>
	<jsp:useBean id="talSvc" class="com.talent.model.TalService"/>
	<jsp:useBean id="coatSvc" class="com.coach_talent.model.CoatService"/>
	<c:forEach var="talVO" items="${talSvc.all}">
		<input type="checkbox" name="talID" id="${talVO.talID}" value="${talVO.talID}">
		<label for="${talVO.talID}">${talVO.talName}</label>
		<c:forEach var="coatVO" items="${coatSvc.getByCoach(coaVO.coaID)}">
			<c:if test="${coatVO.talID==talVO.talID}">
				<script language="javascript">
					document.getElementById("${talVO.talID}").checked = true;
      			</script>
			</c:if>
		</c:forEach>
	</c:forEach>
	<p>資歷<p>
	<jsp:useBean id="expSvc" class="com.exp.model.ExpService"/>
		<img src="<%=request.getContextPath()%>/resource/coach/images/add.png" id="btnAddExpContent">
	<c:forEach var="expVO" items="${expSvc.getByCoach(coaVO.coaID)}">
  			<div>
	 			<input name=expContent type=text value=${expVO.expContent}>
	 		 	<img src="<%=request.getContextPath()%>/resource/coach/images/trash.png" id = "btnRemoveExpContent">
	 		</div>
  	</c:forEach>
  	<div id = "content" style="display:none">
		<input type=text name=expContent>
		<img src="<%=request.getContextPath()%>/resource/coach/images/trash.png" id = "btnRemoveExpContent">		
	</div>
	<div id= contentArea></div>
		<input type="hidden" name="coaID" value=${coaVO.coaID}>
		<input type="hidden" name="action" value="save"> 
		<input type=submit value=儲存>
	</FORM>

	
	
			<script>
			
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
		                    img.height = 200;
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