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
					<input id="user" type="text" name="memAccount" class="input" required='required' autocomplete="off">
					
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password"  name="memPassword" class="input" data-type="password" required='required'>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
					<input type="hidden" name="action" value="login">
				</div>
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
					<input id="user" type="text"  name="memName" class="input" required='required'>
					
				</div>
				<div class="group">
					<label for="account" class="label">Account</label>
					<input id="account" type="text" name="memAccount" class="input" required='required'>
					<div id='show'></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password"  name="memPassword" class="input" required='required'>
					
				</div>
				<div class="group">
					<label for="phone" class="label">Mem phone</label>
					<input id="phone" type="text" name="memPhone" class="input" required='required'>
					
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="pass" type="email" name="memEmail" class="input" required='required'>
					
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
				$("#show").html(html);
// 				
			}else{
				html += "<font style='margin-top:10px; margin-left:120px; color:#00ff14;'>此帳號可以使用!</font>";
				$("#show").html(html);
			}
		}
	});
	
	
	
	console.log("OK");
	
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