<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>아이디 찾기</title>
	<link rel="stylesheet" type="text/css" href="./css/find-id.css">
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
			<form action="/findID">
				<h2 class="title">아이디 찾기</h2>
           		<div class="input-div one">
           		   <div class="i">
           		   		<i class="fas fa-user"></i>
           		   </div>
           		   <div class="div">
           		   		<h5>Name</h5>
           		   		<input type="text" class="input"  name="user_name">
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
            	<a href="/findPassword">Forgot Password?</a>
            	<input type="submit" class="btn" value="아이디 찾기">
            </form>
        </div>
    </div>
    <script type="text/javascript" src="./js/find-id.js"></script>
</body>
</html>