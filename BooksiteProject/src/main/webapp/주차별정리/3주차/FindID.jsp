<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/find-id.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>아이디 찾기</h1>
		<form action="./findID" method="get">
			<div>
				<input class="inputGroup" type="text" placeholder="Your name" name="user_name">
			</div>
			<div>
				<input class="inputGroup" type="address" placeholder="Your address" name="user_address">
			</div>
			<input class="submit" type="submit" value="아이디 찾기">
		</form>
	</div>
</body>
</html>