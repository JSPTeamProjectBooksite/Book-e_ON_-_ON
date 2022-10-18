<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 조회</title>
<link rel="stylesheet" href="css/OrderList.css">
</head>
<body>
	<div class="wrap">
	<%@ include file="Header.jsp" %>
	
	<h2>주문내역조회</h2>
	
	<table border="1">
	<tr>
	<th>No</th>
	<td>숫자ID</td>
	</tr>
	<tr>
	<th>주문번호</th>
	<td>B22101800001</td>
	</tr>
	<tr>
	<th>구매도서</th>
	<td>도서이름</td>
	</tr>
	<tr>
	<th>수량</th>
	<td>1</td>
	</tr>
	<tr>
	<th>구매일자</th>
	<td>2022-10-18</td>
	</tr>
	</table>
	<div class="closebtn">
			<button type="button" onclick="./main">닫기</button>
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>