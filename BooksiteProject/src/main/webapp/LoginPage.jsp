<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
@import url('https://fonts.googleapis.com/css2?family=Jua&display=swap')
	;
</style>
<link rel="stylesheet" href="css/Login.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>

<body>
	<div class="container">
		<h1>로그인</h1>
		<form action="/login" method="get" name="login" onsubmit="return validateForm(this);">
			<div>
				<input class="init" type="text" placeholder="Email" name="email">
			</div>
			<div>
				<input class="init" type="password" placeholder="PW" name="password">
			</div>
			<div class="group">
				<a href="./findID">아이디 찾기</a> <a href="./findPassword">비밀번호 찾기</a>
			</div>
			<input class="submit" type="submit" value="Login"> <input
				class="button" type="button" value="회원가입"
				onclick="location.href='./Register.jsp'">
		</form>
	</div>
</body>
<script type="text/javascript">
	function validateForm(form) {
		if(!form.email.value) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if(!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>

</html>