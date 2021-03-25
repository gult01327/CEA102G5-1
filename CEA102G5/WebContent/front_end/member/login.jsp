<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>EATIN登入介面</title>
<body>
<style>
#tip{
	display:inline-block;
}
</style>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/css/login.css">

<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
		<div class="login-form">
			<div class="sign-in-htm">
<form action="<%=request.getContextPath()%>/front_end/member/mem.do" method="post">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="user" type="text" name="memAccount1" value="${param.memAccount1}" class="input" required='required' autocomplete="off">
					<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>${errorMsgs.memAccount}</font>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password"  name="memPassword1" class="input" data-type="password" required='required'>
					<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>${errorMsgs.memPassword}</font>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
					<input type="hidden" name="action" value="login">
				</div>
				<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>${errorMsgs.Exception }</font>
</form>
				<div class="hr"></div>
				<div class="foot-lnk">
					<a href="<%=request.getContextPath()%>/front_end/member/forgetPw.jsp" style="color:red;">Forgot Password?</a>
				</div>
			</div>
<form action="<%=request.getContextPath()%>/front_end/member/mem.do" method="post" enctype="multipart/form-data">
			<div class="sign-up-htm">
				<div class="group">
					<label for="user" class="label">Username</label>
					<input id="memName" type="text"  name="memName" class="input" required='required' value="${(not empty memVOError)?memVOError.memName:''}" >
					<div id='showName'></div>
				</div>
				<div class="group">
					<label for="account" class="label">Account</label>
					<input id="account" type="text" name="memAccount" class="input" required='required' value="${(not empty memVOError)?memVOError.memAccount:''}">
					<div id='showAccount'></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="memPass" type="password"  name="memPassword" class="input" required='required' value="${(not empty memVOError)?memVOError.memPassword:''}">
					<div id='showPw'></div>
				</div>
				<div class="group">
					<label for="phone" class="label">Mem phone</label>
					<input id="phone" type="text" name="memPhone" class="input" required='required' value="${(not empty memVOError)?memVOError.memPhone:''}">
					<div id='showPhone'></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="memEmail" type="email" name="memEmail" class="input" required='required' value="${(not empty memVOError)?memVOError.memEmail:''}">
					
				</div>
					<div class="group">
					<label for="pass" class="label">Mem picture</label>
					<label class="label">
						<input id="pic" name="memUpfile" type="file" style="display:none;" required='required'> 
						<img alt="" src="<%=request.getContextPath()%>/resource/images/upload.png" style="width:100px; height:80px;">
					</label> 
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign Up">
					<input type="hidden" name="action" value="insert">
				</div>
				<div class="hr"></div>

			</div>
</form>
		</div>
	</div>
</div>
<script type="text/javascript">
$("#memName").blur(function(){
	let html = '';
	let name = $(this).val();
	if(!/^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$/.test(name)){
		html += "<font style='margin-top:10px; margin-left:40px; color:#FF0000;'>長度必須在2~10之間且只能為英文或數字</font>";
		$("#showName").html(html);
		$(".button").attr("disabled",true);
	}else{
		html += "<font style='margin-top:10px; margin-left:175px; color:#00ff14;'>正確</font>";
		$("#showName").html(html);
		$(".button").attr("disabled",false);
	}

});

$("#memPass").blur(function(){
	let html = '';
	let pass = $(this).val();
	if(!/^[(a-zA-Z0-9_)]{2,10}$/.test(pass)){
		html += "<font style='margin-top:10px; margin-left:40px; color:#FF0000;'>長度必須在2~10之間且只能為英文或數字</font>";
		$("#showPw").html(html);
		$(".button").attr("disabled",true);
	}else{
		html += "<font style='margin-top:10px; margin-left:170px; color:#00ff14;'>正確</font>";
		$("#showPw").html(html);
		$(".button").attr("disabled",false);
	}
});


$("#phone").blur(function(){
	let html = '';
	let phone = $(this).val();
	if(!/^(09)[0-9]{8}$/.test(phone)){
		html += "<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>請填入正確手機號碼</font>";
		$("#showPhone").html(html);
		$(".button").attr("disabled",true);
	}else{
		html += "<font style='margin-top:10px; margin-left:170px; color:#00ff14;'>正確</font>";
		$("#showPhone").html(html);
		$(".button").attr("disabled",false);
	}
	
	
});

$(".login-wrap").on("blur","#account",function(){
	let html = '';
	let account = $("#account").val();
	if(account == ''){
		$("#show").html(html);
		return;
	}
	$.ajax({
		url:"<%=request.getContextPath() %>/member/mem.do",
		type:"post",
		data:{
			action:"checkAccount",
			account:account
		},
		cache:false,
		ifModified:true,
		success:function(data){
			if(data == "isAdded"){
				html += "<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>帳號重複，請重新輸入</font>";
				$("#showAccount").html(html);
				$(".button").attr("disabled",true);
			}else if(data == "error"){
				html += "<font style='margin-top:10px; margin-left:120px; color:#FF0000;'>長度必須在2~10之間</font>";
				$("#showAccount").html(html);
				$(".button").attr("disabled",true);
			}else{
				html += "<font style='margin-top:10px; margin-left:120px; color:#00ff14;'>此帳號可以使用!</font>";
				$("#showAccount").html(html);
				$(".button").attr("disabled",false);
			}
		}
	});
});

$(".login-wrap").on("change","input[type='file']",function(e){
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

</script>

</body>
</html>