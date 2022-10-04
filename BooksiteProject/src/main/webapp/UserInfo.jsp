<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/UserInfo.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>회원정보</h1>
		<table>
			<thead>
				<tr>
					<th>이름</th>
					<td>${ userInfo.name }</td>
				</tr>
				<tr>
					<th>아이디</th>
					<td>${ userInfo.id }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>${ userInfo.password }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${ userInfo.phoneNumber }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${ userInfo.address }</td>
				</tr>
			</thead>
		</table>
		<div class="Resign">
			<a class="button" href=""> 회원탈퇴 </a>
		</div>
		<!-- <div>
            <a href="./UserInfoUpadate.jsp">[회원정보수정]</a>
        </div> -->
	</div>
</body>
</html>