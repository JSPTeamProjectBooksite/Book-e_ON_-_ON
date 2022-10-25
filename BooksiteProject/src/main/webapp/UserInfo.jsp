<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/UserInfo.css">
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css" rel="stylesheet">
<meta charset="UTF-8">
<title>회원 정보 조회</title>
</head>
<body>
	<div class="wrap">
		<h2>기본회원정보</h2>
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
					<th style="width: 271px">비밀번호</th>
					<td>${ userInfo.password }</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${ userInfo.birth }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${ userInfo.phoneNum }</td>
				</tr>
				<tr>
					<th>가용 적립금(원)</th>
					<td>${ userInfo.point }</td>
				</tr>
			</thead>
		</table>
		<div class="Resign">
			<a class="button" href="./UserInfoUpdate.jsp">비밀번호 변경</a> <a
				class="button" onclick="resignBtn()"> 회원탈퇴 </a>
		</div>
	</div>
</body>
<script type="text/javascript">
	function resignBtn() {
		if (confirm("고객의 모든 정보가 삭제됩니다.\n탈퇴하시겠습니까?")) {
			window.location.href = './resign';
			alert("회원이 탈퇴 되었습니다. 이용해 주셔서 감사합니다.");
		}
	}
</script>
</html>