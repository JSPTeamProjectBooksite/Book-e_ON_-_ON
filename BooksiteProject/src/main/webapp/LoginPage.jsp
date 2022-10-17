<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Login</title>
	<link rel="stylesheet" type="text/css" href="./css/Login.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<img class="wave" src="./source/Login/wave.png">
		<div class="img">
			<img src="./source/Login/reading.png">
		</div>
		<div class="login-content">
			<form action="/login" method="post" name="login">
				<img src="./source/Login/avatar.png">
				<h2 class="title">로그인</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Email</h5>
           		   		<input type="Email" class="input"  name="email">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>password</h5>
           		    	<input type="password" class="input" name="password">
            	   </div>
            	</div>
            	<a href="./FindID.jsp">Forgot Email?</a>
                <a href="/findPassword">Forgot Password?</a>
            	<input type="submit" class="btn" value="로그인">
                <input type="button" class="btn" value="회원가입" onclick="location.href='./Register.jsp'">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="./js/Login.js"></script>
</body>
</html>