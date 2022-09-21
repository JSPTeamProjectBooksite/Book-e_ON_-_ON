<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="css/public.css">
        <script src="js/includeHTML.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="chrome">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="css/payment.css">
    </head>

    <body>
        <div class="wrap">
            <%@ include file="header.html" %>
   
            <table>
                <caption>결제하기</caption>
                <thead>

                    <tr>
                        <th colspan="3">받는분 정보</th>
                    </tr>
                    <tr>
                        <th>배송지 정보</th>
                        <th colspan="2">${ bookList.name}
                            <br><br>${bookList.address}</th>
                    </tr>

                    <tr>
                        <th>주문자/이메일정보</th>
                        <th colspan="2">${ book.name} / ${book.eamil}</th>
                    </tr>
                    <tr>
                        <th colspan="3">주문상품 : ${book.orderQuantity}개</th>
                    </tr>
                </thead>
                <tr>
                    <td><img src= ${book.img}
                    width="200px" height="270px"></td>
                    <td>하루도 쉬운 날이 없어</td>
                    <td style="font-size: larger;"><b>${book.money}</b>
                        <br><small>수량 : ${book.orderQuantity}개</small>
                    </td>
                </tr>
                <tr>
                    <th colspan="3" ; style="text-align:center">결재방법<br>
                        [추후개발예정]</th>
                </tr>
                <tr>
                    <td colspan="3" ; align="center"><button style="width: 1280px;height: 55px;">${book.money}원 결제하기</button>
                    </td>
                </tr>
            </table>
            <%@ include file="footer.html" %>
        </div>

    </body>

    </html>