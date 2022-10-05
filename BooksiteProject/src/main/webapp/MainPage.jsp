<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>도서목록</title>
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
    #searchBar{
        display: grid;
        grid-template-columns: 1.5fr 7.5fr 1fr;
        align-items: end;
        gap: 20px;
        height:70px;
        width: 750px;
        background:rgb(203, 255, 250);
        margin: auto;
        padding-left: 35px;
        padding-right: 35px;
        text-align: center;
        border-radius: 50vh;
        border: 3px darkcyan solid;

        /* 그림자 애니메이션 속도*/
        transition: all 0.1s linear;
    }
    /* 그림자 애니메이션*/
    #searchBar:focus-within,
    #searchBar:hover{
        box-shadow: 0px 3px 5px 3px #6a8dc2;
    }

    #searchOption{
        height: 100%;
        width: 100%;

        text-align: center;
        font-size: 25px;
        font-weight: 600;
        color:darkcyan;

        background-color:transparent;
        border: none;
    }
    .searchText{
        padding: 10px;
        width: 100%;
        height: 100%;
        font-size: 24px;
        border: none;
        background-color:transparent;
    }
    input:focus,
    select:focus{
        outline: none;
        background-color:rgb(183, 235, 255);
    }
    #searchBtn{
        width: 100%;
        height: 100%;
        border: none;
        border-radius: 50vw;
        background-image:url('./source/MainPage/돋보기.png');
        background-repeat: no-repeat;
        background-position:center;
        background-color: transparent;
        background-size: 100% 100%;
        cursor:pointer;
        transition: all 0.01s linear;
    }
    #searchBtn:hover{
        transform: scale( 1.15 );
    }
    
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
        <form action="/list">
            <div id="searchBar">
                <select name="searchFeild" id="searchOption">
                    <option value="title">제목</option>
                    <option value="author">작가</option>
                </select>
                <input class="searchText" type="text" name="searchWord">
                <input id="searchBtn" type="submit" alt="search" value=" ">
            </div>
        </form>
    
        <!-- 공간 띄우기 -->
        <div style="height: 25px;"></div>

        <!-- 슬라이드 광고 -->
        <div style="text-align: center;">
            <img src="./source/MainPage/슬라이드 예시 이미지.png" alt="" style="width: 80%; border-radius: 20px;">
        </div>

        
    	<!-- 임시 스크립트 파일 -->
		<script type="text/javascript">
			var str = "<%= request.getParameter("search") %>";
			
			if(str != "null"){
				if(str.length < 2){
					alert("2글자 이상만 검색가능합니다.");
				}
				else{				
					document.getElementById('searchDiv').style.display = "";
				}
			}
		</script>
    
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
            <c:forEach var="book" items="${popularList}">
            	<div style="width: 100%;">
                    <div class="bookImage">
                        <img class="animation_1 imgBox1" id="popularityBookImage" alt="" src="${ book.image }"  style="width: 100%;" onclick="goToDetailPage(${ book.bid })">
                    </div>
                    <div style="height:100px; text-align:center;">
                    	${ book.title }
                    	<br>
                    	${ book.author }
                    </div>
            	</div>
            </c:forEach>
        </div>
    </div>
    <%@include file="./Footer.jsp" %>
</div>

</body>
</html>