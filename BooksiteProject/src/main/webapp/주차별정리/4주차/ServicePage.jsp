<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<!--<link rel="stylesheet" href="css/public.css">  -->
<script src="js/includeHTML.js"></script>
<meta http-equiv="X-UA-Compatible" content="chrome">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/service.css">
<title>고객센터</title>
</head>

<body>

	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<div class="wrapper">
			<div class="search">
				<input type="text" maxlength=100 placeholder=" 고객님, 무엇을 도와 드릴까요?" />
			</div>

			<div class="container">
				<div class="rect">
					<img src="/source/ico/고객센터_계정.png"><span>계정</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_개인정보.png"><span>개인정보</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_회원가입.png"><span>회원가입</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_보관함.png"><span>보관함</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_결제.png"><span>결제</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_배송.png"><span>배송</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_시스템장애.png"><span>시스템 장애</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_전자책.png"><span>전자책</span>
				</div>
				<div class="rect">
					<img src="/source/ico/고객센터_고객상담.png"><span>고객상담</span>
				</div>
				<div class="rect">
					<span>전자책 바로가기</span>
				</div>
				<div class="rect">
					<span>메인 바로가기</span>
				</div>
				<div class="rect">
					<span>로그인 바로가기</span>
				</div>

			</div>

			<div class="block"></div>

			<div class="accordian">
				<caption style="font-size: 24px">FAQ(자주 묻는 질문)</caption>
				<div class="block2"></div>
				<input type="checkbox" id="answer01"> <label for="answer01">배송기간은
					얼마나 소요되나요?<em></em>
				</label>
				<div>
					<p>배송기간은 도서마다 다르나, 평균 2일 소요됩니다.</p>
				</div>

				<input type="checkbox" id="answer02"> <label for="answer02">배송기간은
					얼마나 소요되나요?<em></em>
				</label>
				<div>
					<p>배송기간은 도서마다 다르나, 평균 2일 소요됩니다.</p>
				</div>

				<input type="checkbox" id="answer03"> <label for="answer03">배송기간은
					얼마나 소요되나요?<em></em>
				</label>
				<div>
					<p>배송기간은 도서마다 다르나, 평균 2일 소요됩니다.</p>
				</div>
			</div>

			<div class="block3"></div>

		</div>
		<%@ include file="Footer.jsp"%></div>
</body>

</html>