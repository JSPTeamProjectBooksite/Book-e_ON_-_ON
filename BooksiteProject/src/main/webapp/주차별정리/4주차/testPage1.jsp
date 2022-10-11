<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>UI 테스트 페이지</title>
<style>
	#wrap{
	}
	#contents{
		margin: auto;
		background: white;
		width: 1200px;
		/* 이건 꼭넣을 것!! */

		
		height: 3000px;
		text-align: center;
		font-size: 5vh;
		padding-top: 500px;
	}
</style>
</head>
<body>
	<div id="wrap">
		<%@include file="./Header.jsp" %>
		
		<div id="contents">
			여기에 글이 추가됩니다.
		</div>

		<%@include file="./Footer.jsp" %>	
	</div>
</body>
</html>