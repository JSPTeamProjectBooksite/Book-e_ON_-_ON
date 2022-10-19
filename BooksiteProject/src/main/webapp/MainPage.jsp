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
<!-- <script src="./js/ListPage.js"></script> -->
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
    .imgBox1{
        border-radius: 10px;
        border: 1px lightgray solid;
    }
</style>
<style>
    
    #popList{
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        gap: 2vh;
        align-items: end;
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
        <div style="height: 25px;"></div>

        <!-- 슬라이드 광고 -->
        <div style="text-align: center;">
            <img src="./source/MainPage/슬라이드 예시 이미지.png" alt="" style="width: 80%; border-radius: 20px;">
        </div>
    
        <!-- 공간 띄우기 -->
        <div style="height: 100px;"></div>
        
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
                    <div class="bookImage">
                        <img class="animation_1 imgBox1" id="popularityBookImage" alt="" src="${ info.book.coverImg }"  style="width: 100%;" onclick="goToDetailPage(${ info.book.id })">
                    </div>
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

</body>
</html>