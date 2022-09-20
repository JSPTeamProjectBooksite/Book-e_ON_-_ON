<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
        </style>
    <link rel="stylesheet" href="css/Login.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="script.js"></script>
    <title>Document</title>
</head>

<body>
    <div class="container">
        <h1> 로그인</h1>
        <form>
            <div>
                <input class="init" type="text" placeholder="ID">
            </div>
            <div>
                <input class="init" type="password" placeholder="PW">
            </div>
            <div class="group">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>
            <input class="submit" type="submit" value="Login">
            <input class="button" type="button" value="회원가입" href="./MainPage.html">
        </form>
    </div>
</body>

</html>