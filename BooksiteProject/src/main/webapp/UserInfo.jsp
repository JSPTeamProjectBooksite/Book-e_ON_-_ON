<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/UserInfo.css">
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<body>
	<div class="container">
		<h1>회원정보</h1>
		<table border="1">
			<thead>
				<tr>
					<th>이름</th>
					<td>${ userInfo.name }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ userInfo.email }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${ userInfo.password }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${ userInfo.birth }</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>${ userInfo.gender }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${ userInfo.phoneNum }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${ userInfo.address }</td>
				</tr>
				<tr>
					<th>포인트</th>
					<td>${ userInfo.point }</td>
				</tr>
			</thead>
		</table>
		<div class="Resign">
			<a class="button" href="./UserInfoUpdate.jsp">비밀번호 변경</a> 
			<a class="button" href=""> 회원탈퇴 </a>
		</div>
	</div>
</body>
</html>