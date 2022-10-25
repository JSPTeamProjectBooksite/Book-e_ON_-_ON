<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/public.css">
    <link rel="stylesheet" href="/css/NoticePage.css">
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <script src="js/shopCart.js"></script>
    <title>알림</title>
</head>
<body>
    <div id="wrap">
    	<%@ include file="./Header.jsp" %>
        
        <main class="notice">
            <h1 class="noticeTitle">알림</h1>
            <div class="postWrapper">
                <div class="postList">
                	<c:forEach var="post" items="${ noticeList }">
                    <a class="postItem" href="#">
                        <div class="postCategory">${ post.category }</div>
                        <div class="postInfo">
                            <div class="postTitle">${ post.title }</div>
                            <div class="postDate">${ post.registerDate }</div>
                        </div>
                        <div class="postExpandIcon"><img src="./source/ico/arrow_forward_ios_black_24dp.svg" alt="펼치기아이콘"></div>
                    </a>
                    </c:forEach>
                </div>
            </div>
            <div class="post_board_number">
            <ul class="pageNumber">
			<c:forEach var="num" begin="0" end="10" step="1">
				<li><a href="#">${num}</a></li>
			</c:forEach>
            </ul>
			</div>
        </main>

        <%@ include file="./Footer.jsp" %>
    </div>
</body>
</html>
