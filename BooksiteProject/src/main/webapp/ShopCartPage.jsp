<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/public.css">
    <link rel="stylesheet" href="/css/shopCartPage.css">
    
    <script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
    </script>
    <script type="text/javascript"> 
    	sessionStorage.setItem("contextpath", "${pageContext.request.contextPath}"); 
    </script>
    <script src="${pageContext.request.contextPath}/js/shopCartPage.js">
    </script>
    <title>장바구니</title>
</head>
<body>
    <div id="wrap">
		<%@ include file="Header.jsp" %>
        <main>
           	<!-- 장바구니 책 리스트 -->
            <div class="cart">
			
                <form id="cartForm" action="" method="POST">
	                <input type="hidden" name="_method" value="POST">
	                <table class="bookList">
            			<caption class="cartTitle">장바구니</caption>
	                    <tr>
	                        <th colspan="3" class="thBookInfo">상품정보</th>
	                        <th class="thBookPrice">판매가</th>
	                        <th class="thBookCount">주문수량</th>
	                        <th class="thBookPriceSum">합계</th>
	                        <th class="thBookDeliveryDate">배송일정</th>
	                    </tr>
	                    
	                    <!-- 장바구니 안에 아무 것도 없을 때 -->
	                    <c:if test="${empty bookList}">
	                    <tr>
	                    	<td colspan="7" style="height:200px; text-align: center;">장바구니 안에 아무 것도 없습니다..</td>
	                    </tr>
	                    </c:if>
	                    
	                    <c:forEach var="book" items="${bookList}">
	                    <tr class="bookItem ">
	                        <td class="bookCheck">
		                        <img src="${pageContext.request.contextPath}/source/ico/check_box_false.svg" alt="체크박스">
		                        <input class="bookCheckBox" name="selectedBooks" type="checkbox" value="${ book.id }">
	                        </td>
	                        <td class="bookImg"><img src="${pageContext.request.contextPath}/${book.coverImg}" alt="상품 이미지"></td>
	                        <td class="bookTitle">${ book.title }</td>
	                        <td class="bookPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${book.price}" /></td>
	                        <td class="bookCount"><input type="number" min="1" max="999" name="bookCount" value="${ book.quantity }" onchange="onChangeFunction(${book.price}, this)"></td>
	                        <td class="bookPriceSum"><span class="num">0</span>원</td>
	                        <td class="bookDeliveryDate">평균 ${ book.estimatedDeliveryDate }일 소요</td>
	                        <td class="bookDelete"><button type="button" class="bookDeleteBtn" value="${ book.id }">X</button></td>
	                    </tr>
	                    </c:forEach>
	                </table>
            	</form>
            	
            	<!-- 가격표 -->
                <table class="selectBookMoney">
                    <tr>
                        <th>상품금액</th>
                        <th>배송비</th>
                        <th>결제금액</th>
                    </tr>
                    <tr>
                        <td class="bookValue"><span class="num">14,000</span>원</td>
                        <td class="bookDeliveryValue"><span class="num">0</span>원</td>
                        <td class="bookLastValue"><span class="num">14,000</span>원</td>
                    </tr>
                </table>

                <div class="submitBtns">
                    <button type="submit" form="cartForm" class="selectBookDeleteBtn" >선택한 상품 삭제</button>
                    <button type="submit" form="cartForm" class="selectBookPaymentBtn" >선택한 상품 구매</button>
                    <button type="submit" form="cartForm" class="selectBookSaveBtn" >보관함 저장</button>
                </div>
            </div>
        </main>

        <%@ include file="Footer.jsp" %>
    </div>


	<script src="/js/jquery/jquery.number.min.js"></script>
    <script>
    function setCookie(name, value, exp) {
    	var date = new Date();
    	date.setTime(date.getTime() + exp*24*60*60*1000);
    	document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/cart/';
    };
    
    function fromUpdate(from, action, method){
    	from.attr('action', action);
    	from.find("input[name=_method]").val(method);
    	from.submit();
    }
    
    // 선택된 상품 삭제
    $('.bookDeleteBtn').click(function(){
		console.log($(this).val());
    	setCookie($(this).val(), "null", 0);
		location.reload();
	});
    
   	// 선택된 모든 상품 결제, 삭제, 저장
    const fromTag = $('#cartForm');
    $('.selectBookPaymentBtn').click(function(){	fromUpdate(fromTag, '/payment', 'post');});
    $('.selectBookSaveBtn').click(function(){		fromUpdate(fromTag, '#', 'post');});
    $('.selectBookDeleteBtn').click(function(){		fromUpdate(fromTag, '/cart', 'DELETE');});
    
    // 가격 계산
    function onChangeFunction(price, e){
    	let count = $(e).val();
    	let bookPriceSum = 	$(e).parent()
						    	.siblings('.bookPriceSum')
						    	.find('.num');
    	bookPriceSum.html(price * count);
    	
    	bottomCalculation();
    }
    
    const bookValue = $('.bookValue .num');
    const bookDeliveryValue = $('.bookDeliveryValue .num');
    const bookLastValue = $('.bookLastValue .num');
    
    bookDeliveryValue.html('2500'); 
    
    function bottomCalculation(){
    	let totalValue = 0;
    	
    	$('.bookItem .num').each(function(index, item){
    		let value = parseInt($(item).html());
    		totalValue += value;
    		console.log(value);
    	});
    	
    	bookValue.html(totalValue);
    	if(totalValue > bookDeliveryValue.html())
    		bookLastValue.html(totalValue - bookDeliveryValue.html());
    	else
    		bookLastValue.html(totalValue);
    }
    bottomCalculation();
    
    </script>
</body>
</html>
