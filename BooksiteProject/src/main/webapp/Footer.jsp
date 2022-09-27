<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    #footerTable{
        min-width: 800px;
        width: 80vw;
        height: 100%;
        margin:auto;
        font-size: 24px;
        font-family: Arial;
        font-weight: 600;
        color: white;
    }

    .headMenu{
        font-size: 28px;
        font-weight: 800;
        color: white;
    }

    ul li {
        padding: 10px;
    }

    ul{
        list-style: none;
    }

    li {
        color:darkgrey;
    }
    .footerMenu{
        vertical-align: top;
    }

</style>
</head>
<body>
    <footer>
        <div style="height: 350px;
            min-width: 800px;
            background: #3A3C84;
            position: relative;
        ">
	        <div style="
                height: 500px;
	            width: 100%;
	            background: linear-gradient(to top, #3A3C84, #c1adff);
	            position: absolute;
	            z-index: -1;
	            bottom: 350px;
	        ">
	        </div>

            <table id="footerTable">
                <tr style="height: 30px;"></tr>
                <tr>
                    <td class="footerMenu" style="padding: 20px;">
                        <span style="font-size: 32px;">
                            북이 온앤온
                        </span>
                        <br>
                        BOOK-e On & On
                    </td>
                    <td class="footerMenu">
                        <ul>
                            <li class="headMenu">사이트</li>
                            <li>사이트 앱</li>
                            <li>사이트 소개</li>
                            <li>개발자</li>
                        </ul>
                    </td>
                    <td class="footerMenu">
                        <ul>
                            <li class="headMenu">고객 센터</li>
                            <li>고객 질문</li>
                            <li>공지 사항</li>
                            <li>자주 묻는 질문</li>
                        </ul>
                    </td>
                    <td class="footerMenu">
                        <ul>
                            <li class="headMenu">문의</li>
                            <li>콘텐츠 제공 문의</li>
                            <li>사업 제휴 문의</li>
                            <li>나문희</li>
                        </ul>
                    </td>
                    <td class="footerMenu">
                        <img src="./source/ico/git.png" alt="" style="height: 80px; width:80px; margin: 20px; border-radius: 40px;">
                    </td>
                </tr>
            </table>
        </div>

    </footer>
</body>
</html>