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
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="css/payment.css">
</head>

<body>
	<div id="wrap">
		<%@ include file="Header.jsp"%>
		<div class="block0"></div>

		<!-- 제목(?)같은거 -->
		<h2>
			<img src="/source/ico/checked_icon.png"> 상품 주문서
		</h2>

		<form action="/payment.do" method="get" id="paymentForm">
			<!-- 히든으로 결제 정보 전송 -->
			<input type="hidden" name="memberId" value="${ delinfo.id }">

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
							<td class="block1">
								[기본배송지]<br>${ delinfo.address }
							</td>
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
									<td class="imgBox">
										<input type="hidden" name="bookId" value="${ prod.id }">
										<input type="hidden" name="selectCount" value="${ selectCount[status.index] }">
										<img src="${ prod.coverImg }">
									</td>
									<td>
										[${ prod.bookCategoryId }] ${ prod.title }
										<p style="color: rgb(252, 69, 69);">상품 금액 : ${ prod.price }원 | 수량 : ${ selectCount[status.index] } 개</p>
									</td>
								</tr>
	
							</c:forEach>
						</table>
					</td>
	
					<!-- 스티키 존 -->
					<td rowspan="4" class="stickyBar">
						<table class="stickyTable">
							<tr>
								<th>주문금액</th>
								<td><span id="totalPrice">0</span> 원</td>
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
								<td>
									<span id="delivery">0</span> 원
								</td>
							</tr>
							<tr>
								<th>쿠폰할인</th>
								<td><span id="usedPoint">0</span> 원</td>
							</tr>
							
							<tr>
								<th>적립금 사용</th>
								<td><span id="point">0</span>원</td>
							</tr>
							<tr>
								<th>최종결제금액</th>
								<td style="font-size: x-large; color: red;">
									<span class="finalPrice">0</span> 원
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
									<button type="button" name="useBnt" style="text-align: center" onclick="return usePoint()">모두사용</button>
									<br>
									<small>사용가능 적립금 <span id="availablePoint">0</span> 원</small>
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
								<td>
									<label class="paybnt">
										<input type="radio" name="paymentMethod" value="Visa 카드 결제">
										<span><img src="/source/ico/Visa_ci.png"></span>
									</label>
									 
									<label class="paybnt">
										<input type="radio" name="paymentMethod" value="카카오 페이 결제">
										<span><img src="/source/ico/Kakaopay_ci.png"></span>
									</label>
									 
									<label class="paybnt">
										<input type="radio" name="paymentMethod" value="토스 결제">
										<span><img src="/source/ico/Toss_ci.png"></span>
									</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
	
				<tr>
					<td class="policy">
						<table>
							<tr>
								<td>
									<h3>결제 진행 필수 전체 동의</h3>
									<input type="checkbox" name="전체동의" id="allCheckBox" onclick="allCheck(this)"/> 결제	진행 필수 전체 동의<br>
									<input type="checkbox" name="세부동의" onclick="check(this)"/> (필수) 개인정보 수집‧이용 및 처리 동의<br>
									<input type="checkbox" name="세부동의" onclick="check(this)"/> (필수) 개인정보 제3자 제공동의<br>
									<input type="checkbox" name="세부동의" onclick="check(this)"/> (필수) 전자지급 결제대행 서비스 이용약관 동의
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>

			<input type="hidden" id="deliveryTotalPointFinal" name="DTPF" value="">
	
			<!-- 버튼부 -->
			<div class="fianlpayBnt">
				<button type="button" name="final" onclick="return payBtn()">
					<b><span class="finalPrice"></span></b> 원 결제하기
				</button>
			</div>
		</form>
		<%@ include file="Footer.jsp"%>
	</div>
</body>
<script>
	var paymentForm = document.getElementById("paymentForm")


	var deliveryFee = ${ priceInfo.deliveryFee }*1; //배송비
	var availablePoint = ${ delinfo.point }*1; //사용가능 포인트
	var usedPoint = 0; //사용하는 포인트
	var totalPrice = ${ priceInfo.totalPrice }*1; //전체금액
	var finalPrice = ${ priceInfo.finalPrice }*1; //최종금액

	function setPage(){
		document.getElementById("delivery").innerHTML = deliveryFee.toLocaleString('ko-KR');
		document.getElementById("availablePoint").innerHTML = availablePoint.toLocaleString('ko-KR');
		document.getElementById("userPoint").value = usedPoint;
		document.getElementById("usedPoint").innerHTML = usedPoint.toLocaleString('ko-KR');
		document.getElementById("totalPrice").innerHTML = totalPrice.toLocaleString('ko-KR');
	
		var tem = document.getElementsByClassName("finalPrice");
	
		for(var i = 0; i < tem.length; i++){
			tem[i].innerHTML = finalPrice.toLocaleString('ko-KR');
		}
	}

	function usePoint(){

		if(availablePoint == 0){
			alert("사용가능한 적립금이 없습니다.");
			return false;
		}

		if(finalPrice > availablePoint){
			usedPoint = availablePoint;
			finalPrice -= availablePoint;
			availablePoint = 0;
		}else{
			usedPoint = finalPrice;
			availablePoint -= finalPrice;
			finalPrice = 0;
		}

		alert("적립금을 사용합니다!");
		setPage();
	}

	function allCheck(btn){
		var checkboxes = document.getElementsByName("세부동의");
		checkboxes.forEach((checkbox) => {
    		checkbox.checked = btn.checked;
  		})
	}

	function check(btn){
		if(!btn.checked){
			//alert("체크해제")
			document.getElementById('allCheckBox').checked = false;
			return;
		}
		var checkboxes = document.getElementsByName("세부동의");
		var tem = true;
		
		checkboxes.forEach((checkbox) => {
			if(!checkbox.checked){
				//alert("선택되지 않은게 있음")
				
				tem = false;
			}
		})
		
		if(tem){
			//alert("모두 선택됨")
			document.getElementById('allCheckBox').checked = true;
		}
	}

	//결제 버튼 눌림
	function payBtn(){
		
		if(paymentForm.paymentMethod.value == ""){
			alert("결제방식을 선택해주세요.");
			paymentForm.paymentMethod[0].focus();
			return false;
		}
		
		var checkboxes = document.getElementsByName("세부동의");
		var agree = true;

		checkboxes.forEach((checkbox) => {
			if(!checkbox.checked){
				agree = false;
			}
		})
		
		if(!agree){
			alert("약관을 모두 동의해주세요.")
			document.getElementById('allCheckBox').focus();
			return false;
		}

		document.getElementById("deliveryTotalPointFinal").value = '' + deliveryFee +','+ totalPrice +','+ usedPoint +','+ finalPrice;
		
		paymentForm.submit();
	}

	setPage();
</script>
</html>