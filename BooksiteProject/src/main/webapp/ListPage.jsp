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
        min-height: 100vh;
        position: relative;
    }
	
	#searchDiv{
		margin: auto;
		width: 90%;
	}
    
    #searchListDiv{
        /* border: 1px solid black;
    	background: lightgrey; */
        width: 720px;
        margin:auto;
    }
    
    #searchListText{
    	height:80px;
    	text-align:center;
    }

    #listDiv{
        display: grid;
        grid-template-columns: 3fr 7fr;
    }

    #infoTable{
        width: 100%;
    }

    #infoTable tr,td,th{
        padding: 3px;
    }

    /* 애니메이션 */
    .animation_1{
        transition: all 0.05s linear;
    }
    .animation_1:hover{
        transform: scale( 1.05 );
        box-shadow: 5px 5px 15px 0px #aaaaaa;
        cursor: pointer;
    }
    .imgBox1{
        border-radius: 10px;
        border: 1px lightgray solid;
    }
    .clickTag{
        font-size: 20px;
        color:cadetblue
    }
    .clickTag:hover{
        color:cornflowerblue;
        cursor: pointer;
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
        
        <!-- 전송폼 -->
        <form action="/detail" name="mainPageForm" id="BIDform" method="get">
            <input type="hidden" name="BID" value="">
        </form>

		<!-- 공간 띄우기 -->
        <div style="height: 25px;"></div>

        <!-- 검색창 -->
        <%@ include file="./SearchBar.jsp" %>
        
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
            			<div style="text-align: center;">
            				검색된 도서가 없습니다.(-_-)
            			</div>
            		</c:when>
            		<c:otherwise>
            			<c:forEach var="map" items="${searchList}">
		                    <div id="listDiv">
                                <div style="text-align: center; padding: 20px;">
                                    <img src="${ map.book.coverImg }" alt="${ map.book.title } 이미지" style="width: 90%;" onclick="goToDetailPage( ${ map.book.id } )" class="animation_1 imgBox1">
                                </div>
                                <div style="padding: 20px;">
                                    <table id="infoTable">
                                        <tr>
                                            <td class="clickTag" onclick="goToDetailPage( ${ map.book.id } )">${ map.book.title }</td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 14px;">${ map.book.catchphrase }</td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 14px;">${ map.author } | ${ map.book.translator }${ map.book.publisher }</td>
                                        </tr>
                                        <tr>
                                            <td style="font-size: 20px; color:darkcyan; text-align: right;">${ map.book.price }원</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            <hr>
		            	</c:forEach>
            		</c:otherwise>
            	</c:choose>
            </div>
        </div>

        <!-- 공간 띄우기 -->
        <div style="height: 100px;"></div>

	    <%@include file="./Footer.jsp" %>
    </div>
</body>
</html>