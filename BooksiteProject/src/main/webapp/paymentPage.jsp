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
            <div w3-include-html="header.html">
            </div>
            <table class="T1">
                <caption>결제하기</caption>
                <thead>

                    <tr>
                        <th colspan="3">받는분 정보</th>
                    </tr>
                    <tr>
                        <th>배송지 정보</th>
                        <th colspan="2">김부기
                            <br><br>경기도 성남시 분당구 돌마로46 5층
                        </th>
                    </tr>

                    <tr>
                        <th>주문자/이메일정보</th>
                        <th colspan="2">김부기 / bookies@gmail.com</th>
                    </tr>
                    <tr>
                        <th colspan="3">주문상품 : 1개</th>
                    </tr>
                </thead>
                <tr>
                    <td><img src="source/book/하루도_쉬운_날이_없어.png" width="200px" height="270px"></td>
                    <td>하루도 쉬운 날이 없어</td>
                    <td style="font-size: larger;"><b>14,000원</b>
                        <br><small>수량 : 1개</small>
                    </td>
                </tr>
                <tr>
                    <th colspan="3" ; style="text-align:center">결재방법<br>
                        [추후개발예정]</th>
                </tr>
                <tr>
                    <td colspan="3" ; align="center"><button style="width: 1280px;height: 55px;">14,000원 결제하기</button>
                    </td>
                </tr>
            </table>
        </div>

    </body>

    </html>