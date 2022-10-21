<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 질문과 답변(1:1문의)</title>
<link rel="stylesheet" href="css/public.css">
<link rel="stylesheet" href="/css/inquirydetail.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<!-- 제목 -->
		<h2 style="border-bottom: 1px; padding-bottom: 20px; align-items: center">1:1문의</h2>
		<form action="">
			<%@ include file="InquiryDetailForm.jsp"%>
			<input type="submit" value="전송">
		</form>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
<script>
	document.getElementById("inquireInput").style.display = 'none';
	document.getElementById("replyInput").style.display = 'none';
	document.getElementById("replyOutput").style.display = 'none';
	document.getElementById("reply").style.display = 'none';
</script>
</html>