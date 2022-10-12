<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1문의내용(관리자)</title>
<link rel="stylesheet" href="css/inquire_Manager.css">
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>
		<h2 style="padding-bottom: 20px">상품문의 접수(2)</h2>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>문의분류</th>
					<th>답변상태</th>
					<th>제목</th>
					<th>문의자</th>
					<th>등록일</th>
				</tr>
				<tr>
					<th class="num">2</th>
					<td>계정</td>
					<td>답변대기</td>
					<td>탈퇴문의</td>
					<td>khy1234</td>
					<td>2022.10.10</td>
				</tr>
				<tr>
					<th>1</th>
					<td>계정</td>
					<td>답변완료</td>
					<td>계정 잠김</td>
					<td>khy1234</td>
					<td>2022.10.10</td>
				</tr>
			</table>

		<%@ include file="Footer.jsp"%>
	</div>
</body>

</html>