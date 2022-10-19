<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    footer{
        width: 100%;
        background: #6087c2;
        /* background: linear-gradient(to left, #be92ea, #91eaea); */
        margin: auto;
		min-width: 800px;
        height: 300px;
		border-radius: 15px 15px 0px 0px;
		box-shadow: 10px -5px 15px 3px #91b5ea;
		position: absolute;
		bottom: 0;
        padding: 50px;
        color:white;
    }
    
    footer a{
        color:white;
        text-decoration: none;
    }

    #gitImg{
        height: 80px; 
        width:80px;
        border-radius: 40px;

        transition: all 0.2s linear;
    }
    #gitImg:hover{
        transform: scale( 1.05 );
        box-shadow: 0px 0px 10px 3px white; 
    }

</style>
</head>
	<div style="height: 375px;"></div>
	
    <footer>
        <div>
            <a href="/main" style="font-weight: 800;">
                <span style="font-size: 32px;">북이 온앤온</span>
                <br>
                <span style="font-size: 24px;">BOOK-e On & On</span>
            </a>
            <a href="https://github.com/JSPTeamProjectBooksite/Book-e_ON_-_ON" target="_blank" style="float: right;">
                <img id="gitImg" src="/source/ico/git.png" alt="">
            </a>
        </div>

        <div style="height:25px;"></div>
        
        <div style="font-weight: 600; color:#ddd">
            프로젝트명 : Book-e On & On | 조장 : 이현우 | 조원 : 김하영, 김지나, 안성환, 최진영<br>
        </div>

        <div style="height:15px;"></div>

        <div style="font-weight: 600;">
            개발자 페이지 : <a href="https://github.com/JSPTeamProjectBooksite/Book-e_ON_-_ON" target="_blank">Git Hub</a><br>
            고객 지원 : <a href="#">문의 게시판</a><br>
        </div>
    </footer>
</html>