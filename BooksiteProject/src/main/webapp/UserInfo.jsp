<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보</h1>
	<table border="1">
		<thead>
			<tr>
				<td>이름</td>
				<td>${ userInfo.name }</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td>${ userInfo.id }</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>${ userInfo.password }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${ userInfo.phoneNumber }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${ userInfo.address }</td>
			</tr>
		</thead>
	</table>
	 <a href="./UserInfoUpdate.jsp">[회원정보수정]</a>
</body>
</html>