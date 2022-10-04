<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/find-password.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>비밀번호 재설정</h1>
		<form action="./findPassword" method="get">
			<div>
				<input class="inputGroup" type="text" placeholder="Your name" name="user_name">
			</div>
			<div>
				<input class="inputGroup" type="text" placeholder="Your id" name="user_id">
			</div>
			<div>
				<input class="inputGroup" type="address" placeholder="Your address" name="user_address">
			</div>
			<input class="submit" type="submit" value="비밀번호 찾기">
		</form>
	</div>
</body>
</html>