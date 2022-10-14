<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<form action="/ManageUserEdit" method="get">
			<h1>유저 정보 수정</h1>
			<table border="1">
				<tr>
					<th>UID</th>
					<td><input type="text" value="${ result.id }"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" value="${ result.name }"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" value="${ result.email }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" value="${ result.password }"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="text" value="${ result.birth }"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><input type="text" value="${ result.gender }"></td>
				</tr>
				<tr>
					<th>핸드폰번호</th>
					<td><input type="text" value="${ result.phoneNum }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" value="${ result.address }"></td>
				</tr>
				<tr>
					<th>포인트</th>
					<td><input type="text" value="${ result.point }"></td>
				</tr>
				<tr>
					<th>계정 상태</th>
					<td><input type="text" value="${ result.memberStateId }"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="text" value="${ result.registerDate }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: right;">
						<button>수정</button>
						<button>다시 입력</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>