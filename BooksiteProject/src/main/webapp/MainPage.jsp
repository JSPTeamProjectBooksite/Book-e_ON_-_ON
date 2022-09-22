<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/MainPage.css">
<title>메인 페이지</title>
</head>
<body>
    <header>
        <nav>
            <h3 id="logo">BOOK-e On & On</h3>
            <img class="hamburger" src="./source/mainPage/burger.svg" alt="hamburger">
        </nav>
        <section>
            <div class="hero">
                <img src="./source/mainPage/photo-1526243741027-444d633d7365.jpg" alt="book">
                <h1 class="headline">온앤온에서<br>하루종일 독서On</h1>
                <div style="
                    position: absolute;
                    top: 63%;
                    right: 10%;
                    width: 20%;
                    z-index: 4;
                    text-align: center;
                " id="listPageBtn" onclick="clickListPage()">
                    <img src="./source/mainPage/goToRead.png" alt="">
                </div>
            </div>
        </section>
    </header>

    <div class="slider"></div>
    <div class="slider2"></div>

    <div style="height: 10vh;"></div>

    <div class="intro">

        <div id="text1" class="text" style="opacity: 1; background: #3A3C84;">
            <h1>On & On 에 잘 오셨습니다.</h1>
        </div>
        <div id="text2" class="text">
            <h1>이제가세요.</h1>
        </div>
        <div id="text3" class="text">
            <h1>장난입니다 가지마세요.</h1>
        </div>
        <div id="text4" class="text">
            <h1>책 읽어야죠</h1>
        </div>
        <div id="text5" class="text">
            <h1>이거 만드는거 힘들었어요.</h1>
        </div>
        <div id="text6" class="text">
            <h1>누가 감성맨트 좀 생각해줘요.</h1>
        </div>
        <div id="text7" class="text" style="background: #c1adff;">
        </div>
        
        <video src="./source/mainPage/Pexels Videos-Bible Pages Turning 2268807.mp4"></video>
    </div>
    <!-- 다시배경색을 바꿔야한다. -->
    <div style="background: #c1adff;">
        <div id="warp">
            <h1><a href="">독서 하러가기 >></a></h1>
        </div>
    </div>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/ScrollMagic.min.js"
        integrity="sha512-HzAEuXwhLxwm/Jj+5ecdjzrRVrjuh2ZeIxyT1Ln37TO5pWNMnKBuU7cfd1wvRQ/k86w1oC174Yk1T7aRlBpIcA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/debug.addIndicators.js"
        integrity="sha512-vWutwDjKJo+VMAA7IrS/ICTmVYXRMdqtXA27MSuPxGjkbYnKeUKPrIpfsAwIXCzaSDF/qRy/L85ko/yxW0AIiA=="
        crossorigin="anonymous" referrerpolicy="no-referrer">
        </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"
    integrity="sha512-DkPsH9LzNzZaZjCszwKrooKwgjArJDiEjA5tTgr3YX4E6TYv93ICS8T41yFHJnnSmGpnf0Mvb5NhScYbwvhn2w=="
    crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TimelineMax.min.js"
        integrity="sha512-0xrMWUXzEAc+VY7k48pWd5YT6ig03p4KARKxs4Bqxb9atrcn2fV41fWs+YXTKb8lD2sbPAmZMjKENiyzM/Gagw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.7/plugins/animation.gsap.js"
    integrity="sha512-jlbgjhSLRQsQc/bits6lHjywF3n/NLO3Sz1rwa9gsUnCOi0f0lD/yAul75UNOzIiDg35zaJJ3BKT3zo6+i9lQA=="
    crossorigin="anonymous" referrerpolicy="no-referrer">
    </script>
    <script src="./js/MainPage.js"></script>
</body>
</html>