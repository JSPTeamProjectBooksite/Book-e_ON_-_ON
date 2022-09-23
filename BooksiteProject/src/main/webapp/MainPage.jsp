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
<!-- 
<script src="./js/bookList.js"></script>
 -->
<script type="text/javascript">
	function goToDetailPage(bid){
        document.mainPageForm.BID.value = bid;
        document.getElementById("BIDform").submit();
	}
</script> 
</head>
<body>
<!-- 메인 -->
<div id="wrap">
	<%@include file="./Header.jsp" %>
    <div id="contents">
        <!-- 공간 띄우기 -->
        <div style="height: 100px;"></div>
    
        <!-- 전송폼 -->
        <form action="/detail" name="mainPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>
    
        <!-- 슬라이드 광고 -->
        <!-- 현제 사용할 예정이 없는 기능입니다.(다시만들기) -->

        <div style="background:salmon; border-radius: 25px; text-align: center;">
            슬라이드 기능 추가 예정
            <div style="display: none">
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
                            <img src= ${ slideList[3].image } class="bookImageStyle" id="index3" alt="" onclick="goToDetailPage(${ slideList[3].BID })">
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
            </div>
        </div>
    
        <!-- 검색창 -->
        <form action="/main" style="margin-top: 100px;">
            <div style="height: 100px;">
                <div style="height:70px; width: 700px; background:turquoise; margin: auto; padding: 10px; text-align: center; border-radius: 10px;">
                    <input type="text" name="search" style="width: 550px; height: 50px; font-size: 32px; border: none;">
                    <input type="submit" value="검색" style="width: 100px; height: 50px;">
                </div>
            </div>
        </form>
    
        <!-- 검색결과 (평소에는 보이지 않으나, 검색창 검색값이 있을 경우 해당 div에 출력) -->
        <div style="display: none;" id="searchDiv">
    
            <div style="
                height: 75px;
                font-size: 32px;
                font-weight: 600;
                color: gray;
            ">
                검색 결과
            </div>
    
            <div style="text-align: center;">
                " <%= request.getParameter("search") %> "의 검색 결과 입니다.
            </div>
    
            <span>
            	<c:forEach var="book" items="${searchList}">
	                <table border="1" style="width: 180px; display:inline-block;" id="searchTable">
	                    <tr>
	                        <td class="bookImageTd">
	                            <img src= ${ book.image } alt="" style="width: 100%;"
	                            	onclick="goToDetailPage(${ book.BID })">
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            ${ book.title }
	                        </td>
	                    </tr>
	                    <tr>
	                        <td>
	                            ${ book.author }
	                        </td>
	                    </tr>
	                </table>
            	</c:forEach>
            </span>
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
	                            <img id="popularityBookImage_0" alt="" src=${ book.image }  style="width: 100%;"
	                            	onclick="goToDetailPage(${ book.BID })">
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