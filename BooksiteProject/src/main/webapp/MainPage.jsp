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
        border-radius: 15px;
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

</style>
</head>
<body>
<!-- 메인 -->
<div id="wrap">
	<%@include file="./Header.jsp" %>
    <div id="contents">
        <!-- 공간 띄우기 -->
        <div style="height: 100px;"></div>
    
        <!-- 전송폼(히든) -->
        <form action="/detail" name="mainPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>
    
        <!-- 슬라이드 광고 -->

        <!-- <div>
            <table id="slideTable">
                <tr>
                    <th rowspan="2" style="width: 5%;">
                        <input type="button" value="앞으로" onclick="clickBefore()">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[0].image } class="bookImageStyle" id="index0" alt="" onclick="clickSlide(0)">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[1].image } class="bookImageStyle" id="index1" alt="" onclick="clickSlide(1)">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[2].image } class="bookImageStyle" id="index2" alt="" onclick="clickSlide(2)">
                    </th>
                    <th style="width: 15%;" class="bookTh">
                        <img src= ${ slideList[3].image } class="bookImageStyle" id="index3" alt="" onclick="goToDetailPage(${ slideList[3].bid })">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[4].image } class="bookImageStyle" id="index4" alt="" onclick="clickSlide(4)">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[5].image } class="bookImageStyle" id="index5" alt="" onclick="clickSlide(5)">
                    </th>
                    <th class="bookTh">
                        <img src= ${ slideList[6].image } class="bookImageStyle" id="index6" alt="" onclick="clickSlide(6)">
                    </th>
                    <th rowspan="2" style="width: 5%;">
                        <input type="button" value="뒤로" onclick="clickNext()">
                    </th>
                </tr>
                <tr>
                    <td>${ slideList[0].title }</td>
                    <td>${ slideList[1].title }</td>
                    <td>${ slideList[2].title }</td>
                    <td>${ slideList[3].title }</td>
                    <td>${ slideList[4].title }</td>
                    <td>${ slideList[5].title }</td>
                    <td>${ slideList[6].title }</td>
                </tr>
            </table>
            <div style="
            	text-align: center;
                font-size: 24px;
                margin-top: 10px;
            	" id="ad">
                ${ slideList[3].ad }
            </div>
        </div> -->

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
                <table>
                    <tr>
                    	<c:forEach var="book" items="${popularList}">
	                        <td class="bookImageTd" style="width: 200px;">
	                            <img class="animation_1 imgBox1" id="popularityBookImage_0" alt="" src=${ book.image }  style="width: 100%;"
	                            	onclick="goToDetailPage(${ book.bid })">
	                        </td>
                    	</c:forEach>
                    </tr>
                    <tr>
                    	<c:forEach var="book" items="${popularList}">
	                        <td>${ book.title }</td>
                    	</c:forEach>
                    </tr>
                    <tr>
                    	<c:forEach var="book" items="${popularList}">
	                        <td>${ book.author }</td>
                    	</c:forEach>
                    </tr>
                </table>
            </div>
    
        </div>
    </div>
    <%@include file="./Footer.jsp" %>
</div>

</body>
</html>