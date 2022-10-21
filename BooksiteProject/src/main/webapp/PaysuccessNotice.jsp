<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" type="text/css" href="../css/payment_done.css">
<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/a81368914c.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>
	<div id="wrap">
	<%@ include file="Header.jsp"%>
		<div class="container">
			<hr>
			<h1>주문이 완료되었습니다!</h1>
			<p>
				Book e On&On을 이용해주셔서 감사합니다.<br> 자세한 주문내역은 마이페이지 > <a href="">주문내역</a> 확인 하실 수 있습니다.<br>
				평균 배송은 2일 이내 발송되나, 정확한 배송 일정은 문의주시기 바랍니다.
			</p>
			<table border="1">
				<tr>
					<th>구매혜택</th>
				</tr>
				<tr>
					<td>구매하신 도서금액의 5%가 적립됩니다.</td>
				</tr>
			</table>
			<div class="btn">
				<button class="button" onclick="location.href='./main';">쇼핑 계속하기</button>
			</div>
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>

</html>