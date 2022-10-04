<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/orderConfirm.css">
<link rel="stylesheet" href="css/public.css">
<script src="js/includeHTML.js"></script>
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>주문확인 페이지</title>
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<div class="block"></div>

		<table class="Order">
			<caption>결제완료</caption>
			<tr>
				<td class="top">주문일자</td>
				<td class="top">주문번호</td>
				<td class="top">주문금액</td>
				<td class="top">주문상품</td>
				<td class="top">주문수량</td>
				<td class="top">비고</td>
			</tr>
			<tr>
				<!-- 주문일자 -->
				<td>2022-09-19</td>
				<!-- 임의의 주문번호 만들어 카운트 -->
				<td>ON220919-1</td>
				<td>42,000원</td>
				<!-- 클릭 시, 상품 상세 페이지로 이동  -->
				<td><a href="detail.jsp">기분이 태도가 되지 않으려면</a></td>
				<td>1</td>
				<td></td>
			</tr>
		</table>
		<div class="block2">
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>

</html>