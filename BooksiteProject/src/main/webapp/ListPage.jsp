<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
<link rel="stylesheet" href="./css/ListPage.css">
<script src="./js/ListPage.js"></script>
<!-- 
<script src="./js/bookList.js"></script>
 -->

</head>
<body>
<%@include file="./Header.jsp" %>
<!-- 메인 -->
<div id="wrap">
    <div id="contents">
        <!-- 공간 띄우기 -->
        <div style="height: 100px;"></div>
    
        <!-- 전송폼 -->
        <form action="./DetailPage.jsp" name="listPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>
    
        <!-- 슬라이드 광고 -->
        <div>
            <div>
                <table border="1" id="slideTable">
                    <tr>
                        <th rowspan="2" style="width: 5%;">
                            <input type="button" value="앞으로" onclick="clickBefore()">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th style="width: 15%;" class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th class="bookTh">
                            <img src="./source/book/노인과_바다.png" class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                        </th>
                        <th rowspan="2" style="width: 5%;">
                            <input type="button" value="뒤로" onclick="clickNext()">
                        </th>
                    </tr>
                    <tr>
                        <td>(제목)</td>
                        <td>(제목)</td>
                        <td>(제목)</td>
                        <td>(제목)</td>
                        <td>(제목)</td>
                        <td>(제목)</td>
                        <td>(제목)</td>
                    </tr>
                </table>
            </div>
            <div style="
                font-size: 24px;
                margin-top: 10px;
            " id="ad">
                (광고글)
            </div>
    
    
            <!-- 슬라이드 이미지 셋팅 스크립트 -->
            <script>
                setList();
                vewListPage();
            </script>
        </div>
    
        
        <!-- 검색창 -->
        <form action="" style="margin-top: 100px;">
            <div style="height: 100px;">
                <div style="height:70px; width: 700px; background:turquoise; margin: auto; padding: 10px; text-align: center; border-radius: 10px;">
                    <input type="text" name="search" style="width: 550px; height: 50px; font-size: 32px; border: none;">
                    <input type="submit" value="검색" style="width: 100px; height: 50px;">
                </div>
            </div>
        </form>
    
        <!-- 검색결과 (평소에는 보이지 않으나, 검색창 검색값이 있을 경우 해당 div에 출력) -->
        <div style="display: '';">
    
            <div style="
                height: 75px;
                font-size: 32px;
                font-weight: 600;
                color: gray;
            ">
                검색 결과
            </div>
    
            <div style="text-align: center;">
                ""의 검색 결과 입니다.
            </div>
    
            <span>
                <table border="1" style="width: 180px; display:inline-block;" id="searchTable">
                    <tr>
                        <td class="bookImageTd">
                            <img src="./source/book/역행자.png" alt="" style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            (책이름)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            (저자)
                        </td>
                    </tr>
                </table>
            </span>
        </div>
    
    
        <!-- 주제별 선정 -->
        <!-- 타입 1 -->
        <div style="
            display: '';
            /* background-color:khaki; */
        ">
            <div style="
                height: 75px;
                font-size: 32px;
                font-weight: 600;
                color: gray;
            ">
                인기 도서
            </div>
            <div style="
                text-align: center;
            ">
                <table border="1">
                    <tr>
                        <td class="bookImageTd" style="width: 200px;">
                            <img id="popularityBookImage_0" alt="" src="./source/book/아몬드.png" style="width: 100%;">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            (도서명)
                        </td>
                    </tr>
                    <tr>
                        <td>
                            (저자)
                        </td>
                    </tr>
                </table>
                <!-- <script>setPopularity();</script> -->
            </div>
    
        </div>
    
        <div id="footer">여기는 푸터</div>
    </div>
</div>

</body>
</html>