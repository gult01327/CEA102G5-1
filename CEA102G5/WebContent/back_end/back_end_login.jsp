<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login_Page </title>
<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/admin_info/css/back_login.css">
<script src="<%= request.getContextPath()%>/resource/js/jquery-3.5.1.min.js"></script>
</head>
<body>

  <img src="<%= request.getContextPath()%>/resource/images/food.jpg" width="300"><font size="+3">後台登入</font>
    <hr>
    <div class="wrapper">
    <form METHOD="post" ACTION="<%=request.getContextPath()%>/admin_info/admi.do">
            <div class="loginBox">
                <div class="loginBoxCenter">
                	身分:
                	<input type=radio id=admin name=identity required="required" value= admin ${(param.identity == "admin")?'checked':''}>
					<label for=admin>後臺管理員</label>
                	<input type=radio id=coach name=identity value= coach ${(param.identity == "coach")?'checked':''}>
                    <label for=coach>教練</label>
                    <p><label for=account>帳號：</label></p>
                    <p><input type="text" id="account" name="account" value="${param.account}" class="loginInput" autofocus="autofocus" required="required" autocomplete="off" placeholder="請輸入帳號" value=""/><span style="color:red">${errorMsgs.account}</span></p>
                    <p><label for="password">密碼：</label></p>
                    <p><input type="password" id="password" name="password" value="${param.password}" class="loginInput" required="required" placeholder="請輸入密碼" value=""/><span style="color:red">${errorMsgs.password}</span></p>
                </div>
                <div class="loginBoxButtons">
                <input type="hidden" name="action" value="login"> 
                <button type="submit" class="loginBtn">登入</button>
                </div>
            </div>
    	</div>
    </form>

</body>
</html>