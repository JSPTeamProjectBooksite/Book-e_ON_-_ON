<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        background: #c1adff;
    }
    nav{
    	margin: auto;
        width: 80vw;
        min-width: 1200px
    }
    #headerTable{
        margin-top: 25px;
        margin-bottom: 25px;
        width: 100%;
        height: 100%;
    }
    #logo{
        display: inline;
        font-size: 32px;
        font-family: sans-serif;
        color: white;
    }
    .button{
        width: 75px;
    }
</style>
</head>
<body>
    <header>
        <nav>
            <table id="headerTable">
                <tr>
                    <th style="text-align:left;">
                        <h3 id="logo">BOOK-e On & On</h3>
                    </th>
                    <th class="button">
                        버튼1
                         <% out.print(session.getAttribute("user_id")); %>
                    </th>
                    <th class="button">
                        <a href="/shopcart">장바구니</a>
                    </th>
                    <th class="button">
                        <a href="/login">로그인</a>
                    </th>
                </tr>
            </table>
        </nav>
    </header>
</body>
</html>