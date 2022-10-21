<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오류 발생</title>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    #warp{
        height: 100vh;
        display: grid;
        grid-template-columns: 1fr 8fr 1fr;
        align-items: center;
    }
</style>
</head>
<body>
<div id="warp">
    <div></div>
    <div style="height: 80vh; position: relative; text-align: center;">
        <div style="height:60%; text-align: center;">
            <img src="./source/MainPage/error.webp" alt="" style="height: 100%;">
        </div>
        <div>
            <div style="font-size: 5vh; font-weight:800; color:#333;">${ map.message_1 }</div>
            <div style="font-size: 4vh; font-weight:800; color:#555; margin-top: 25px;">${ map.message_2 }</div>
        </div>
        <div style="position:absolute; bottom:0; right: 0; left: 0;">
            <button type="button" style="font-size: 32px; font-weight: 800; color:darkcyan; border-width: 3px; background: paleturquoise; border-color: aquamarine; padding: 10px; border-radius: 10px;" onclick="goToMain()">Go to main</button>
        </div>
    </div>
    <div></div>
</div>
</body>
<script>
    function goToMain(){
        location.href = "/main";
    }
</script>
</html>