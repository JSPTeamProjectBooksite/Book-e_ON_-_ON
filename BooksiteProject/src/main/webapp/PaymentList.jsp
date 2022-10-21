<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 조회</title>
<link rel="stylesheet" href="/css/OrderList.css">
</head>
<body>
	<h2>【주문내역조회】</h2>
	<form method="get">
		<table id="paymentTable" border="1">
			<tr>
				<th>주문번호</th>
				<th>상품금액</th>
				<th>배송상태</th>
				<th>구매일자</th>
				<th>비고</th>
			</tr>
			<c:forEach var="payment" items="${ paymentList }" varStatus="status">
				<tr align="center">
					<td><a href="/payment/detail?id=${ payment.id }">${ payment.id }</a></td>
					<td class="price">${ payment.actualAmount }</td>
					<td>${ payment.shippingState }</td>
					<td class="date" >${ payment.registerDate }</td>
					<td id="state_${status.index}"></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
<script>

	function setPage(){
		var dates = document.getElementsByClassName("date");

		for(var i=0; i < dates.length; i++){
			dates[i].innerHTML = dates[i].innerHTML.replace('T', ' ');
		}

		var prices = document.getElementsByClassName("price");

		for(var i=0; i < prices.length; i++){
			prices[i].innerHTML = (prices[i].innerHTML*1).toLocaleString('ko-KR');
		}
	}

	setPage();
</script>
</html>