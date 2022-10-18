<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<title>주문상세내역조회</title>
<link rel="stylesheet" href="css/orderDetails.css">
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>
		<h2>주문/배송 상세조회</h2>
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
				<td>2022-10-10</td>
				<td>ON202210101</td>
				<td>김하영</td>
				<td>기분이 태도가 되지 않게 외 총2권</td>
				<td>비고</td>
			</tr>

		</table>
		<div class="delinfo">
			<table class="delinfo" border="1">
				<h4>▶기본배송정보</h4>
				<tr>
					<th>주문번호</th>
					<td style="width: 372px;">ON202210101</td>
					<th style="width: 213px;">배송방법</th>
					<td style="width: 407px;">택배수령</td>
				</tr>
				<tr>
					<th>주문일</th>
					<td>결제하기버튼 누른시간</td>
					<th>결제일</th>
					<td>결제하기버튼 누른시간</td>
				</tr>
				<tr>
					<th>배송상태</th>
					<td colspan="3">배송완료(운송장번호 : 7127384888)</td>
				</tr>
				<tr>
					<th>수령예상일</th>
					<td colspan="3">2022.10.12일 이내</td>
				</tr>

			</table>
			<div class="block"></div>

			<table class="delinfo" border="1">
				<tr>
					<th class="col">주문하신 분</th>
					<td style="width: 372px;">김하영</td>
                    <th class="col">받으시는 분</th>
                    <td>김하영</td>
                </tr>
				<tr>
					<th class="col">배송주소</th>
					<td colspan="3">경기도 성남시 분당구 돌마로45 5층</td>
				</tr>
				<tr>
					<th class="col">전화번호</th>
					<td>없음</td>
					<th class="col">휴대전화</th>
					<td>010-1234-2345</td>
				</tr>
				<tr>
					<th class="col">배송메세지</th>
					<td colspan="3">없음</td>
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
					<th>가격</th>
				</tr>
				<tr>
					<td>노인과바다</td>
					<td>1</td>
					<td>가격 : 12,600원<small><b>[적립예정금액 : 700원(5%)]</b></small>
					</td>
				</tr>
				<tr>
					<td>기분이 태도가 되지 않게</td>
					<td>1</td>
					<td>가격 : 12,600원<small><b>[적립예정금액 : 700원(5%)]</b></small>
					</td>
				</tr>


			</table>
		</div>
		<div class="payinfo">
			<table class="pay" border="1">
				<h4>▶결제정보</h4>
				<tr>
					<th>총 주문금액</th>
					<td>28,100원(상품가격 25,600원+ 배송료 2,500원)</td>
				</tr>
				<tr>
					<th>적립금 결제</th>
					<td>5,000원</td>
				</tr>
				<tr>
					<th>실 결제금액</th>
					<td style="color: red;"><b> 23,100</b>원</td>
				</tr>
				<tr>
					<th>결제방법</th>
					<td>카카오페이 간편결제</td>
				</tr>
			</table>

		</div>
		<div class="closebtn">
			<button type="button" onclick="./main">닫기</button>
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>

</html>