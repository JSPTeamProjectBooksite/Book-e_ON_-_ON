<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>비밀번호 찾기</title>
	<link rel="stylesheet" type="text/css" href="./css/find-password.css">
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
			<form action="/findPassword" method="get">
				<h2 class="title">비밀번호 찾기</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Email</h5>
           		   		<input type="text" class="input" name="user_email">
           		   </div>
           		</div>
           		<div class="input-div two">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Name</h5>
           		   		<input type="text" class="input" name="user_name">
           		   </div>
           		</div>
           		<div class="input-div pass">
           		   <div class="i"> 
           		    	<i class="fas fa-lock"></i>
           		   </div>
           		   <div class="div">
           		    	<h5>Phone Number</h5>
           		    	<input type="text" class="input" name="user_phoneNum">
            	   </div>
            	</div>
            	<input type="submit" class="btn" value="비밀번호 찾기">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="./js/find-id.js"></script>
</body>
</html>