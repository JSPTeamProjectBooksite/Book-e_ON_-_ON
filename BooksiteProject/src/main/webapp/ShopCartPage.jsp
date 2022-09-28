<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="today" class="java.util.Date" />
<fmt:formatDate value="${today}" pattern="yyyyMMdd" var="nowDate"/>

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
            <div class="cart">
                <h1 class="cartTitle">장바구니</h1>

                <form id="cartForm" action="" method="POST">
                <table class="bookList">
                    <tr>
                        <th colspan="3">상품정보</th>
                        <th>판매가</th>
                        <th>주문수량</th>
                        <th>합계</th>
                        <th>배송일정</th>
                    </tr>
                    <c:forEach var="book" items="${bookList}">
                    <tr class="bookItem">
                        <td class="bookCheck"><img src="${pageContext.request.contextPath}/source/ico/check_box_false.svg" alt="체크박스"><input id="check" name="check" type="checkbox"></td>
                        <td class="bookImg"><img src="${pageContext.request.contextPath}/${book.image}" alt="상품 이미지"></td>
                        <td class="bookTitle">${ book.title }</td>
                        <td class="bookMoney">${ book.price }</td>
                        <td class="bookCount"><input type="number" min="1" max="999" name="bookCount" value="${ book.count }"></td>
                        <td class="bookMoneySum">14,000원</td>
                        <td class="bookDeliveryTime">평균 ${ book.estimatedDeliveryDate }일 소요</td>
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

                <div class="submitBtns">
                    <button type="submit" class="selectBookPaymentBtn" >선택한 상품만 구매</button>
                    <button type="submit" class="selectBookSaveBtn" >보관함 저장</button>
                </div>
            	</form>
            </div>
        </main>

        <%@ include file="Footer.jsp" %>
    </div>



</body>
</html>
