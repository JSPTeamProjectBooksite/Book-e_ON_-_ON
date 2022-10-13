<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<script src="js/includeHTML.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="chrome">
<title>결제하기</title>
<link rel="stylesheet" href="css/payment.css">
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>
		<div class="block0"></div>

		<!-- 제목(?)같은거 -->
		<h2>
			<img src="/source/ico/checked_icon.png"> 상품 주문서
		</h2>

		<!-- 사용자 정보(★살리는 부분 -->
		<div>
			<div class="block"></div>

			<div class="cusinfo">
				<h3>주문자 정보</h3>
				<table>
					<tr>

						<th>받는분</th>
						<td>${ delinfo.name }(${ delinfo.email })</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>${ delinfo.phoneNum }</td>
					</tr>
				</table>
			</div>

			<div class="delinfo">
				<h3>배송 정보</h3>
				<table>
					<tr>
						<th>배송지</th>
						<td class="block1">[기본배송지]<br>${ delinfo.address }</td>
					</tr>
					<tr>
						<th>상세 정보</th>
						<td>${ delinfo.name }/${ delinfo.address }<br>배송메세지 | 없음
							<button type="button" name="주소수정버튼" style="text-align: center">수정하기</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 제품정보 -->
		<table style="width: 100%;">
			<!-- 1번째 블럭 -->
			<tr>
				<td colspan="2" class="prodinfo">
					<h3>상품 정보</h3>
				</td>
			</tr>

			<!-- 2번째 블럭 -->
			<tr>
				<td class="prodinfo">
					<table>
						<c:forEach var="prod" items="${ prodinfo }" varStatus="status">
							<tr>
								<td class="imgBox"><img src="${ prod.coverImg }"></td>
								<td>[${ prod.bookCategoryId }] ${ prod.title }
									<p style="color: rgb(252, 69, 69);">상품 금액 : ${ prod.price }원
										| 수량 : ${ selectCount[status.index] } 개</p>
								</td>
							</tr>

						</c:forEach>
					</table>
				</td>

				<!-- 스티키 존 -->
				<td rowspan="4" class="stickyBar">
					<table class="stickyTable">
						<c:set var="total" value="${priceInfo.totalPrice}"/>

						<tr>
							<th>주문금액</th>
							<td>${total} 원</td>
						</tr>
						<c:set var="selectCount" value="${ selectCount }" />
						<c:forEach var="prod" items="${ prodinfo }" varStatus="status">
							<tr>
								<th><small> ㄴ상품금액</small></th>
								<td><small> ${prod.price * selectCount[status.index]}원</small></td>
							</tr>
						</c:forEach>

						<tr>
							<th><small> ㄴ할인금액</small></th>
							<td><small> -0 원</small></td>
						</tr>
						<tr>
							<th>배송비</th>
							<td>${ priceInfo.deliveryFee }원</td>
						</tr>
						<tr>
							<th>쿠폰할인</th>
							<td>0원</td>
						</tr>
						
						<tr>
							<th>적립금 사용</th>
							<td><span id="pointUse">0</span>원</td>
						</tr>
						<tr>
							<th>최종결제금액</th>
							<td style="font-size: x-large; color: red;">
								<span id="finalPrice">
									<c:out value="${total + priceInfo.deliveryFee}"></c:out>
								</span>
								원
							</td>
						</tr>
					</table>
				</td>

			</tr>


			<!-- 3번째 블럭 -->
			<tr>
				<td class="point">
					<h3>쿠폰/적립금</h3>
					<table>
						<tr>
							<th>쿠폰적용</th>
							<td><select>
									<option>[오픈기념]3,000원 할인(기간만료)</option>
									<option>가입 첫달 무료배송(기간만료)</option>
							</select></td>
						</tr>
						<tr>
							<th>적립금 적용</th>
							<td>
								<input type="number" id="userPoint" name="point" value="0" readonly disabled>
								<button type="button" name="useBnt" style="text-align: center" onclick="usePoint()">모두사용</button>
								<br>
								<small>사용가능 적립금 <span id="availablePoint">5000</span>	원</small>
							</td>
						</tr>
					</table>
				</td>
			</tr>


			<tr>
				<td class="paymethod">
					<h3>결제 수단</h3>
					<table>
						<tr>
							<th>결제수단 선택</th>
							<td class="paybnt"><a href="#a" class="bnt1"> <img
									src="/source/ico/Visa_ci.png">
							</a>

								<div class="blockbnt"></div> <a href="#a" class="bnt2"> <img
									src="/source/ico/Kakaopay_ci.png">
							</a> <a href="#a" class="bnt3"> <img
									src="/source/ico/Toss_ci.png">
							</a></td>
						</tr>
					</table>
				</td>
			</tr>

			<tr>
				<td class="policy">
					<table>
						<tr>
							<h3>결제 진행 필수 전체 동의</h3>
							<td><input type="checkbox" name="전체동의" value="전체동의" /> 결제
								진행 필수 전체 동의 <br> <input type="checkbox" name="세부동의" />
								(필수) 개인정보 수집‧이용 및 처리 동의 <br> <input type="checkbox"
								name="세부동의" /> (필수) 개인정보 제3자 제공동의 <br> <input
								type="checkbox" name="세부동의" /> (필수) 전자지급 결제대행 서비스 이용약관 동의</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>

		<!-- 버튼부 -->
		<div class="fianlpayBnt">
			<a href="/orderConfirm.jsp">
				<button type="button" type="button" name="final">
					<b><c:out value="${total}"></c:out></b> 원 결제하기
				</button>
			</a>
		</div>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
<script>
	function usePoint(){
		var availablePoint = document.getElementById("availablePoint").innerHTML * 1; //사용가능금액
		
		var point = document.getElementById("userPoint"); //포인트 박스

		document.getElementById("pointUse").innerHTML = availablePoint;
		point.value = availablePoint;
		document.getElementById("finalPrice").innerHTML -= availablePoint;

		document.getElementById("availablePoint").innerHTML = 0;

		alert(point.value + "점의 포인트를 사용합니다.");
	}
</script>
</html>