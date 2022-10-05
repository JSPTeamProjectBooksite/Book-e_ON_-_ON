<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#wrap{
        margin: auto;
        max-width: 1200px;
        min-width: 800px;
    }
	
	#searchDiv{
		margin: auto;
		width: 90%;
	}

    #searchListDiv{
    	border: 1px solid black;
    	background: lightgrey;
        display: grid;
        grid-template-columns: repeat(6, 1fr);
        gap: 2vw;
        align-items: end;
    }
    
    #searchListText{
    	height:80px;
    	text-align:center;
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
		<%@include file="./Header.jsp" %>
        <!-- 검색창 -->
        <form action="/list">
            <div style="height: 100px;">
                <div style="height:70px; width: 700px; background:turquoise; margin: auto; padding: 10px; text-align: center; border-radius: 35px;">
                    <select name="searchFeild" id="">
                        <option value="title">제목</option>
                        <option value="author">작가</option>
                    </select>
                    <input type="text" name="search" style="width: 400px; height: 50px; font-size: 32px; border: none;">
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
    
            <div style="text-align: center;
            	margin-bottom: 30px;
            ">
                " <%= request.getParameter("searchWord") %> "의 검색 결과 입니다.
            </div>
    
            <div id="searchListDiv">
            	<c:choose>
            		<c:when test="${ empty searchList }">
            			<div>
            				검색된 도서가 없습니다.(-_-)
            			</div>
            		</c:when>
            		<c:otherwise>
            			<c:forEach var="book" items="${searchList}">
		                    <div>
		                        <img src= ${ book.image } alt="${ book.title } 이미지" style="width: 100%;"
		                            onclick="goToDetailPage( ${ book.bid } )">
		                        <div id="searchListText">
		                        	<div style="font-size:14px">${ book.title }</div>
		                        	<div style="height: 3px"></div>
		                        	<div style="
                                    font-size:12px;
                                    color:dimgray;
                                    ">${ book.author }</div>
		                        </div>
		                    </div>
		            	</c:forEach>
            		</c:otherwise>
            	</c:choose>
            </div>
           	<div style="text-align:center;">
           		${ map.pagingImg }
           	</div>
        </div>
	    <%@include file="./Footer.jsp" %>
    </div>
</body>
</html>