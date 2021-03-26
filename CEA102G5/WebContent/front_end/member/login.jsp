<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>EATIN登入介面</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resource/bootstrap/css/bootstrap.min.css">
    </head>
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
					<label for="user" class="label">Account</label>
					<input id="user" type="text" name="memAccount1" value="${param.memAccount1}" class="input" 
					required='required' autocomplete="off" placeholder="請輸入帳號" autofocus="autofocus" >
					<font style='margin-top:10px; margin-left:120px; color:#ffd700;'>${errorMsgs.memAccount}</font>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password"  name="memPassword1" class="input"  
					required='required' placeholder="請輸入密碼" data-eye autofocus="autofocus" >
					<font style='margin-top:10px; margin-left:120px; color:#ffd700;'>${errorMsgs.memPassword}</font>
				</div>
				<div class="group">
					<input type="submit" class="button" value="Sign In">
					<input type="hidden" name="action" value="login">
				</div>
				<font style='margin-top:10px; margin-left:70px; color:#ffd700;'>${errorMsgs.Exception}</font>
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
					<input id="user" type="text"  name="memName" class="input" required='required' 
					value="${(not empty memVOError)?memVOError.memName:''}"  placeholder="請輸入姓名" autofocus="autofocus">
					<div id='show'><font style='margin-top:10px; margin-left:50px; color:#ffd700;'>${errorMsgs2.memName}</font></div>
				</div>
				<div class="group">
					<label for="account" class="label">Account</label>
					<input id="account" type="text" name="memAccount" class="input" required='required' 
					value="${(not empty memVOError)?memVOError.memAccount:''}"placeholder="請輸入帳號" autofocus="autofocus">
					<div id='show2'><font style='margin-top:10px; margin-left:50px; color:#ffd700;'>${errorMsgs2.memAccount2}</font></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Password</label>
					<input id="pass" type="password"  name="memPassword" class="input" required='required' 
					value="${(not empty memVOError)?memVOError.memPassword:''}" placeholder="請輸入密碼" autofocus="autofocus" data-eye>
					<div id='show'><font style='margin-top:5px; margin-left:120px; color:#ffd700;'>${errorMsgs2.memPassword2}</font></div>
				</div>
				<div class="group">
					<label for="phone" class="label">Mem phone</label>
					<input id="phone" type="text" name="memPhone" class="input" required='required' 
					value="${(not empty memVOError)?memVOError.memPhone:''}" placeholder="請輸入電話" autofocus="autofocus">
					<div id='show'><font style='margin-top:10px; margin-left:50px; color:#ffd700;'>${errorMsgs2.memPhone}</font></div>
				</div>
				<div class="group">
					<label for="pass" class="label">Email Address</label>
					<input id="pass" type="email" name="memEmail" class="input" required='required' 
					value="${(not empty memVOError)?memVOError.memEmail:''}" placeholder="請輸入電子信箱" autofocus="autofocus">
					<div id='show'><font style='margin-top:10px; margin-left:50px; color:#ffd700;'>${errorMsgs2.memEmail}</font></div>
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
	<script src="<%=request.getContextPath()%>/resource/jquery/jquery-3.5.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/popper/popper.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/bootstrap/js/bootstrap.min.js"></script>  
	<script src="<%=request.getContextPath()%>/resource/js/my-login.js"></script> 
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
				html += "<font style='margin-top:10px; margin-left:120px; color:#ffd700;'>帳號重複，請重新輸入</font>";
				$("#show2").html(html);
				$(".button").attr("disabled",true);
			}else if(data == "error"){
				html += "<font style='margin-top:10px; margin-left:120px; color:#ffd700;'>長度必須在2~10之間</font>";
				$("#show2").html(html);
				$(".button").attr("disabled",true);
			}else{
				html += "<font style='margin-top:10px; margin-left:120px; color:#00ff14;'>此帳號可以使用!</font>";
				$("#show2").html(html);
				$(".button").attr("disabled",false);
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