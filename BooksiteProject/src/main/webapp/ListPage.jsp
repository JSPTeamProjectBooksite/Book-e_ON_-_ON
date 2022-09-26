<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #searchListDiv{
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        gap: 10px;
        align-items: end;
    }
</style>
<script type="text/javascript">
	function goToDetailPage(bid){
        document.mainPageForm.BID.value = bid;
        document.getElementById("BIDform").submit();
	}
</script>
<title>검색 결과</title>
</head>
<body>
    <div id="wrap">
        <!-- 검색창 -->
        <form action="/list" style="margin-top: 100px;">
            <div style="height: 100px;">
                <div style="height:70px; width: 700px; background:turquoise; margin: auto; padding: 10px; text-align: center; border-radius: 10px;">
                    <input type="text" name="search" style="width: 550px; height: 50px; font-size: 32px; border: none;">
                    <input type="submit" value="검색" style="width: 100px; height: 50px;">
                </div>
            </div>
        </form>
        
        <!-- 전송폼 -->
        <form action="/detail" name="mainPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>

        
        <!-- 검색결과 (평소에는 보이지 않으나, 검색창 검색값이 있을 경우 해당 div에 출력) -->
        <div id="searchDiv">
    
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
    
            <div id="searchListDiv">
            	<c:forEach var="book" items="${searchList}">
                    <div>
                        <img src= ${ book.image } alt="${ book.title } 이미지" style="width: 100%;"
                            onclick="goToDetailPage( ${ book.bid } )">
                        <div style="height:80px; text-align:center;">
                            ${ book.title }
                            <br>
                            ${ book.author }
                        </div>
                    </div>
            	</c:forEach>
            </div>
        </div>
    </div>
</body>
</html>