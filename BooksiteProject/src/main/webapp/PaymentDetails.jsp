<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역 상세조회</title>
<!-- <link rel="stylesheet" href="css/public.css"> -->
<link rel="stylesheet" href="/css/orderDetails.css">
</head>
<body>
	<div class="wrap">
		
		<h2>【주문/배송 상세조회】</h2>
		
		<div class="block"></div>
		
		<table class="confirm" border="1">
			<h4>▶상세주문내역</h4>
			<tr>
				<th>주문일</th>
				<th>주문번호</th>
				<th>수령인</th>
				<th>주문상품</th>
				<th>비고</th>
			</tr>
			<tr>
				<td>${ payInfo.registerDate }</td>
				<td>${ payInfo.id }</td>
				<td>${ userInfo.name }</td>
				<td id="bookTitle">${ orderInfoList[0].book.title }</td>
				<td>${ payInfo.shippingMessage }</td>
			</tr>

		</table>
		<div class="delinfo">
			<table class="delinfo" border="1">
				<h4>▶기본배송정보</h4>
				<tr>
					<th>주문번호</th>
					<td style="width: 372px;">${ payInfo.id}</td>
					<th style="width: 213px;">배송방법</th>
					<td style="width: 407px;">택배수령</td>
				</tr>
				<tr>
					<th>주문일</th>
					<td>${ payInfo.registerDate }</td>
					<th>결제일</th>
					<td>${ payInfo.registerDate }</td>
				</tr>
				<tr>
					<th>배송상태</th>
					<td colspan="3">${ payInfo.shippingState }</td>
				</tr>
				<tr>
					<th>수령예상일</th>
					<td colspan="3">? 일 이내</td>
				</tr>

			</table>
			<div class="block"></div>

			<table class="delinfo" border="1">
				<tr>
					<th class="col">주문하신 분</th>
					<td style="width: 372px;">${ userInfo.name }</td>
                    <th class="col">받으시는 분</th>
                    <td>${ userInfo.name }</td>
                </tr>
				<tr>
					<th class="col">배송주소</th>
					<td colspan="3">${ userInfo.address }</td>
				</tr>
				<tr>
					<th class="col">전화번호</th>
					<td>없음</td>
					<th class="col">휴대전화</th>
					<td>${ userInfo.phoneNum }</td>
				</tr>
				<tr>
					<th class="col">배송메세지</th>
					<td colspan="3"> ${ payInfo.shippingMessage }</td>
				</tr>

			</table>
		</div>

		<div class="orderinfo">
			<table class="order" border="1">
				<h4>
					▶주문상품정보
					<button>엑셀저장</button>
				</h4>
				<tr>
					<th>상품명</th>
					<th>주문수량</th>
					<th>금액</th>
					<th>적립예정금액</th>
					<th>비고</th>
				</tr>
				<c:forEach var="order" items="${ orderInfoList }" varStatus="status">
					<tr>
						<td><b>${ order.book.title }</b></td>
						<td><b>${ order.order.quantity }</b></td>
						<td><b>${ order.book.price }</b></td>
						<td><b>??</b></td>
						<td></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="payinfo">
			<table class="pay" border="1">
				<h4>▶결제정보</h4>
				<tr>
					<th>총 주문금액</th>
					<td>${ payInfo.totalAmount }</td>
				</tr>
				<tr>
					<th>적립금 결제</th>
					<td>${ payInfo.pointAmount }</td>
				</tr>
				<tr>
					<th>실 결제금액</th>
					<td style="color: red;"><b>${ payInfo.actualAmount }</b> 원</td>
				</tr>
				<tr>
					<th>결제방법</th>
					<td>${ payInfo.paymentMethod }</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	// alert("${ orderInfoList.size() }");

	var orderSize = "${ orderInfoList.size() }"*1;

	function setPage(){
		if(orderSize > 1){
			document.getElementById("bookTitle").innerHTML += " 외 " + (orderSize-1) + "권";
		}
	}

	setPage();
</script>
</html>