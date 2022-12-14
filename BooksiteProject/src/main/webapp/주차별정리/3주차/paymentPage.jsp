<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/public.css">
<script src="js/includeHTML.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결제하기</title>
<link rel="stylesheet" href="css/payment.css">
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>
		<div class="block0"></div>

		<h2>
			<img src="/source/ico/checked_icon.png"> 상품 주문서
		</h2>

		<div class="block"></div>

		<div class="cusinfo">
			<h3>주문자 정보</h3>
			<table>
				<!-- <caption>
                <details>
                    <summary>보내는 분</summary>
                    휴
                    
                    
                    대폰, 이메일
                </details> -->
				<!--</caption>-->
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>

						<th>받는분</th>
						<td>${ delinfo.name }(${ delinfo.id })</td>
					</tr>
					<tr>
						<th>휴대폰</th>
						<td>${ delinfo.phoneNumber }</td>
					</tr>
			</table>
		</div>

		<div class="delinfo">
			<h3>배송 정보</h3>
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>배송지</th>
						<td class="block1">[기본배송지]<br>${ delinfo.address }</td>
					</tr>
					<tr>
						<th>상세 정보</th>
						<td>${ delinfo.name }/ ${ delinfo.address } <br>배송메세지 |
							없음
							<button type="button" name="주소수정버튼">수정하기</button>
						</td>

					</tr>
				</tbody>
			</table>
		</div>

		<div class="prodinfo">
			<h3>상품 정보</h3>
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>

					<tr>
						<td class="img"><img src="/source/book/하루도_쉬운_날이_없어.png"></td>
						<td>[국내도서] 하루도 쉬운 날이 없어
							<p style="color: rgb(252, 69, 69);">상품 금액 : 원 | 수량 : 개</p>
						</td>
						</td>
					</tr>
					
				</tbody>
			</table>
		</div>
		
		<div class="stickybar">
		<table>
			<tr>
			<thead>
				<th>주문금액</th>
				<td>{paymentDTO.price}원</td>
				<br>
				<tr>
					<td class="small"><small> ㄴ상품금액</small></td>
					<td><small> ${paymentDTO.price} 원</small></td>
				</tr>
				<tr>
					<td class="small"><small> ㄴ할인금액</small></td>
					<td><small> -0 원</small></td>
				</tr>
				
				<tr>
					<th>배송비</th>
					<td>0원</td>
				</tr>

				<tr>
					<th>쿠폰할인</th>
					<td>0원</td>
				</tr>

				<tr>
					<th>적립금 사용</th>
					<td>0원</td>
				</tr>

				<tr>
					<th>적립금 사용</th>
					<td>0원</td>
				</tr>

				<tr>
					<th>최종결제금액</th>
					<td>${paymentDTO.price}원</td>
				</tr>

			</thead>
		</table>
	</div>

		<div class="point">
			<h3>쿠폰/적립금</h3>
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>쿠폰적용</th>
						<td><select
							style="width: 175px; height: 30px; border: 1px solid rgb(151, 151, 151);">
								<option>적용 가능한 쿠폰 없음</option>
						</select></td>
					</tr>
					<tr>
						<th>적립금 적용</th>
						<td><input type="number" name="적립금" value="0" readonly
							disabled>
							<button type="button" name="사용버튼">모두사용</button> <br> <small>사용가능
								적립금 0원</small></td>

					</tr>
				</tbody>
			</table>
		</div>

		<div class="paymethod">
			<h3>결제 수단</h3>
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<th>결제수단 선택</th>
						<td class="paybnt"><a href="#a" class="bnt1"><img
								src="/source/ico/kakaopay_icon.JPG"></a>
							<div class="blockbnt"></div> <a href="#a" class="bnt2"><img
								src="/source/ico/toss_icon.JPG"></a> <a href="#a" class="bnt3"><img
								src="/source/ico/visa_icon.JPG"></a></td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="policy">

			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<h3>결제 진행 필수 전체 동의</h3>
						<td><input type="checkbox" name="전체동의" value="전체동의" /> 결제 진행
							필수 전체 동의 <br> <input type="checkbox" name="세부동의">
							(필수) 개인정보 수집‧이용 및 처리 동의 <br> <input type="checkbox"
							name="세부동의"> (필수) 개인정보 제3자 제공동의 <br> <input
							type="checkbox" name="세부동의"> (필수) 전자지급 결제대행 서비스 이용약관 동의</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="finalbnt">
			<table>
				<colgroup>
					<col style="width: px;">
					<col>
				</colgroup>
				<tbody>
					<tr>
						<td>
							<button type="button" style="width: 1280px; height: 40px; font-size: 18px; font-weight: 560; color: #fff; background-color: rgb(255, 153, 153); border: 1px solid rgb(252, 140, 140); border-radius: 2px;"
								type="button" name="final" onclick="./orderConfirm.jsp">14,000원 결제하기</button>
								
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<!-- 여기</div>삭제 -->

	
	<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>