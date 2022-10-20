<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 조회</title>
<link rel="stylesheet" href="css/OrderList.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<h2>【주문내역조회】</h2>
		<form method="get">
			<table class="List" border="1">
				<tr>
					<th>No</th>
					<th>주문번호</th>
					<th>구매도서</th>
					<th>배송상태</th>
					<th>구매일자</th>
					<th>비고</th>
				</tr>
				<c:forEach var="order" items="${orderList }" varStatus="status">
					<tr align="center">
						<td>${ order.id }</td>
						<td><a href="/PaymentDetails.jsp">${ order.paymentId }</a></td>
						<td>${ bookList[status.index] }</td>
						<td>배송준비 중</td>
						<td>${ order.registerDate }</td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<div class="closebtn">
			<button type="button" onclick="location.href='./main';">닫기</button>
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>