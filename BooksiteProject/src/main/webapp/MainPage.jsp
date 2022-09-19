<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/public.css">
    <link rel="stylesheet" href="css/MainPage.css">
    <script src="js/includeHTML.js"></script>
    <title>Main Page</title>
</head>
<body>
    <div class="wrap">
        <div w3-include-html="header.html"></div>

        <main>
            <section class="mainDoor">
                <!-- 메인 텍스트 -->
                <div class="mainText">
                    <p>
                        온라인에서도 오프라인에서도 즐기는 여운<br>
                        <b>BOOK e On & On</b>
                    </p>
                </div>

                <!-- 하단 중앙 홈 바로가기 버튼 -->
                <button class="startBtn">On&On Start</button>

                <!-- 하단 우측 맨 위로가기 버튼 -->
                <!-- <div class="topUp">맨위로</div> -->
            </section>
        </main>

        <div w3-include-html="footer.html"></div>
    </div>
</body>
</html>