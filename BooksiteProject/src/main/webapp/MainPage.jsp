<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" href="./css/public.css">
<link rel="stylesheet" href="./css/MainPage.css">
<script type="text/javascript">
    console.log("메인페이지들어옴");
	function goToDetailPage(bid){
        document.mainPageForm.BID.value = bid;
        document.getElementById("BIDform").submit();
	}
</script> 
<!-- 임시 애니메이션 스타일 -->
<style>
    .animation_1{
        transition: all 0.05s linear;
    }
    .animation_1:hover{
        transform: scale( 1.05 );
        box-shadow: 5px 5px 15px 0px #aaaaaa;
    }
    .animation_2{
        transition: all 0.05s linear;
    }
    .animation_2:hover{
        transform: scale( 1.2 );
    }
    .imgBox1{
        border-radius: 10px;
        border: 1px lightgray solid;
    }
    #popList{
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        gap: 2vh;
        align-items: end;
    }
    .slideImg{
        position: absolute;
        top: 0;
        opacity: 0;
        display: none;
    }

</style>
</head>
<body>
<!-- 메인 -->
<div id="wrap">
	<%@include file="./Header.jsp" %>
    <div id="contents">
        <!-- 전송폼(히든) -->
        <form action="/detail" name="mainPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>
        
        <!-- 공간 띄우기 -->
        <div style="height: 25px;"></div>
    
        <!-- 검색창 -->
        <%@ include file="./SearchBar.jsp" %>
    
        <!-- 공간 띄우기 -->
        <div style="height: 50px;"></div>

        <!-- 슬라이드 광고 -->
        <div style="position:relative;">

            <div id="slideImg_0" style="text-align: center;">
                <img src="./source/ad/광고기본.png" alt="" style="width: 100%; z-index: -999;">
            </div>

            <img id="button_Left" class="animation_2" src="./source/ad/arr_L.png" alt="" style="cursor: pointer; width: 5%; position: absolute; top: 32%; margin-left: 1%; z-index: 5;" onclick="clickLeft()">
            <img id="button_Right" class="animation_2" src="./source/ad/arr_R.png" alt="" style="cursor: pointer; width: 5%; position: absolute; top: 32%; right: 0; margin-right: 1%; z-index: 5;" onclick="clickRight()">

            <div id="slideImg_1" class="slideImg" style="text-align: center;">
                <img src="./source/ad/광고1.png" alt="" style="width: 100%; border: 3px solid #5986c8; border-radius: 25px;">
            </div>
            <div id="slideImg_2" class="slideImg" style="text-align: center;">
                <a href="/detail?BID=2">
                    <img src="./source/ad/광고2.png" alt="" style="width: 100%; border: 3px solid #935252; border-radius: 25px;">
                </a>
            </div>
            <div id="slideImg_3" class="slideImg" style="text-align: center;">
                <a href="/list?searchFeild=author&searchWord=아니+에르노">
                    <img src="./source/ad/광고3.png" alt="" style="width: 100%; border: 3px solid #ccc; border-radius: 25px;">
                </a>
            </div>
            <div id="slideImg_4" class="slideImg" style="text-align: center;">
                <a href="/detail?BID=5">
                    <img src="./source/ad/광고4.png" alt="" style="width: 100%; border: 3px solid #60a05a; border-radius: 25px;">
                </a>
            </div>
            <div id="slideImg_5" class="slideImg" style="text-align: center;">
                <a href="/detail?BID=7">
                    <img src="./source/ad/광고5.png" alt="" style="width: 100%; border: 3px solid #5e4eb6; border-radius: 25px;">
                </a>
            </div>
            <div id="slideImg_6" class="slideImg" style="text-align: center;">
                <a href="/detail?BID=6">
                    <img src="./source/ad/광고6.png" alt="" style="width: 100%; border: 3px solid #faa8a8; border-radius: 25px;">
                </a>
            </div>
        </div>
    
        <!-- 공간 띄우기 -->
        <div style="height: 25px;"></div>
        
        <!-- 주제별 선정 -->
        <!-- 타입 1 -->
        
        <div style="
            height: 75px;
            font-size: 32px;
            font-weight: 600;
            color: gray;
        ">
            인기 도서
        </div>
        <div id="popList">
            <c:forEach var="info" items="${popularList}">
                <div style="width: 100%;">
                    <a href="/detail?BID=${ info.book.id }">
                        <div class="bookImage">
                            <img class="animation_1 imgBox1" alt="${ info.book.title }" src="${ info.book.coverImg }"  style="width: 100%;">
                        </div>
                    </a>
                    <div style="height:100px; text-align:center;">
                    	${ info.book.title }
                    	<br>
                    	${ info.author.name }
                    </div>
            	</div>
            </c:forEach>
        </div>
        <div style="
            height: 75px;
            font-size: 32px;
            font-weight: 600;
            color: gray;
        ">
            전체 도서 <span style="color:#999; font-size: 26px; font-weight: 400;">(업데이트 순 정렬)</span>
        </div>
        <div id="popList">
            <c:forEach var="info" items="${totalList}">
            	<div style="width: 100%;">
                    <a href="/detail?BID=${ info.book.id }">
                        <div class="bookImage">
                            <img class="animation_1 imgBox1" alt="${ info.book.title }" src="${ info.book.coverImg }"  style="width: 100%;">
                        </div>
                    </a>
                    <div style="height:100px; text-align:center;">
                    	${ info.book.title }
                    	<br>
                    	${ info.author.name }
                    </div>
            	</div>
            </c:forEach>
        </div>
    </div>
    <%@include file="./Footer.jsp" %>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TimelineMax.min.js"
            integrity="sha512-0xrMWUXzEAc+VY7k48pWd5YT6ig03p4KARKxs4Bqxb9atrcn2fV41fWs+YXTKb8lD2sbPAmZMjKENiyzM/Gagw=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/2.1.3/TweenMax.min.js"
            integrity="sha512-DkPsH9LzNzZaZjCszwKrooKwgjArJDiEjA5tTgr3YX4E6TYv93ICS8T41yFHJnnSmGpnf0Mvb5NhScYbwvhn2w=="
            crossorigin="anonymous" referrerpolicy="no-referrer">
</script>
<!--  -->
<script>
    var Left = true;
    var Right = true;

    const slideImg_1 = document.querySelector('#slideImg_1');
    const slideImg_2 = document.querySelector('#slideImg_2');
    const slideImg_3 = document.querySelector('#slideImg_3');
    const slideImg_4 = document.querySelector('#slideImg_4');
    const slideImg_5 = document.querySelector('#slideImg_5');
    const slideImg_6 = document.querySelector('#slideImg_6');

    const t1 = new TimelineMax();

    const slideImg = [slideImg_1, slideImg_2, slideImg_3, slideImg_4, slideImg_5, slideImg_6];
    // 시작 지점
    var index = 1;

    t1.set(slideImg[index], { opacity: 1, display:'block'})

    function clickLeft(){
        console.log("L버튼 눌림");
        if(Left){
            Left = false;
            var indexBefore = index--;
            if(index < 0){
                index = slideImg.length-1;
            }
            var indexafter = index;

            t1.fromTo(
                slideImg[indexBefore],
                1,
                {opacity: 1, x: 0, display:'none'},
                {opacity: 0, x: 30}
            ).fromTo(
                slideImg[indexafter],
                1,
                {opacity: 0, x: -30, display: 'block' },
                {opacity: 1, x: 0,onComplete: setLeftTrue},
                "-=1"
            )
        }
        console.log("L버튼 동작 마침");
    }

    function clickRight(){
        console.log("R버튼 눌림");
        if(Right){
            Right = false;
            var indexBefore = index++;
            if(index == slideImg.length){
                index = 0;
            }
            var indexafter = index;

            t1.fromTo(
                slideImg[indexBefore],
                1,
                {opacity: 1, x: 0, display:'none'},
                {opacity: 0, x: -30}
            ).fromTo(
                slideImg[indexafter],
                1,
                {opacity: 0, x: 30, display: 'block'},
                {opacity: 1, x: 0,onComplete: setRightTrue},
                "-=1"
            )
        }
        console.log("R버튼 동작 마침");
    }

    function setLeftTrue(){
        Left = true;
    }

    function setRightTrue(){
        Right = true;
    }
</script>
</body>
</html>