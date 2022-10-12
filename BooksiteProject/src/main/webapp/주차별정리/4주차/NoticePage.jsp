<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/NoticePage.css">
    <script
        src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous">
    </script>
    <script src="js/shopCart.js"></script>
    <title>알림</title>
</head>
<body>
        <%@ include file="./Header.jsp" %>
    <div id="wrap">
        
        <main class="notice">
            <h1 class="noticeTitle">알림</h1>
            <div class="postWrapper">
                <div class="postList">
                	<c:forEach var="post" items="${ postList }">
                    <a class="postItem" href="#">
                        <div class="postCategory">${ post.category }</div>
                        <div class="postInfo">
                            <div class="postTitle">${ post.title }</div>
                            <div class="postDate">${ post.date }</div>
                        </div>
                        <div class="postExpandIcon"><img src="./source/ico/arrow_forward_ios_black_24dp.svg" alt="펼치기아이콘"></div>
                    </a>
                    </c:forEach>
                </div>
            </div>
            <div class="leftBtn"><a href="#"><img src="./source/ico/notice_right.png" alt="왼쪽"></a></div>
            <div class="rightBtn"><a href="#"><img src="./source/ico/notice_left.png" alt="오른쪽"></a></div>
        </main>

        
    </div><%@ include file="./Footer.jsp" %>
</body>
</html>
