<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/shopCart.css">
    <script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
    </script>
    <script src="js/shopCart.js"></script>
    <title>장바구니</title>
</head>
<body>
    <div id="wrap">
		<%@ include file="header.html" %>
        <main>
            <div class="basket">
                <h1 class="baseketTitle">장바구니</h1>
                <table class="bookList">
                    <tr>
                        <!-- <th></th> -->
                        <th colspan="3">상품정보</th>
                        <th>판매가</th>
                        <th>주문수량</th>
                        <th>합계</th>
                        <th>배송일정</th>
                    </tr>
                    <c:forEach var="book" items="${bookList}">
                    <tr class="bookItem">
                        <td class="bookCheck"><img src="source/ico/check_box_false.svg" alt="체크박스"></td>
                        <td class="bookImg"><img src="${ book.img }" alt="상품 이미지"></td>
                        <td class="bookTitle">${ book.title }</td>
                        <td class="bookMoney">${ book.money }</td>
                        <td class="bookCount"><input type="number" min="1" max="999"></td>
                        <td class="bookMoneySum">14,000원</td>
                        <td class="bookDeliveryTime">평균 ${ book.deliveryTime }일 소요</td>
                    </tr>
                    </c:forEach>
                </table>
                <table class="selectBookMoney">
                    <tr>
                        <th>상품금액</th>
                        <th>배송비</th>
                        <th>결제금액</th>
                    </tr>
                    <tr>
                        <td class="bookValue">14,000원</td>
                        <td class="bookDeliveryValue">0원</td>
                        <td class="bookLastValue">14,000원</td>
                    </tr>
                </table>

                <div class="basketBtns">
                    <button type="button" class="selectBookPurchaseBtn">선택한 상품만 구매</button>
                    <button type="button" class="selectBookSaveBtn">보관함 저장</button>
                </div>
            </div>
        </main>

        <%@ include file="footer.html" %>
    </div>
</body>
</html>
