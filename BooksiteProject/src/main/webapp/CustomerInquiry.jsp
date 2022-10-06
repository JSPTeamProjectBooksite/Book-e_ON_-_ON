<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 고객문의</title>
<link rel="stylesheet" href="/css/customerinquiry.css">
</head>
<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<h3>1:1 고객문의</h3>

		<table class="CustomerInquiry">
			<tr>
				<th>작성자</th>
				<td colspan="5">${ cusinfo.name }(${ cusinfo.id })</td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td colspan="5"><%=sf.format(nowTime)%></td>
			</tr>
			<tr>
				<th rowspan="2">질문유형</th>
				<td><input type="radio" name="radio" />회원정보/서비스</td>
				<td><input type="radio" name="radio" />도서/상품정보</td>
				<td><input type="radio" name="radio" />주문결제</td>
				<td><input type="radio" name="radio" />배송수령</td>
				<td><input type="radio" name="radio" />반품교환</td>
			</tr>

			<tr>
				<td><input type="radio" name="radio" />개인출판/작가</td>
				<td><input type="radio" name="radio" />웹사이트 이용관련</td>
				<td><input type="radio" name="radio" />시스템 불편사항</td>
				<td><input type="radio" name="radio" />고객제안/불편신고</td>
				<td><input type="radio" name="radio" />기타</td>
			</tr>

			<tr>
				<th>제목</th>
				<td colspan="5"><input type="text" name="subject"
					maxlength="500"></td>
			</tr>

			<tr>
				<th>내용</th>
				<td colspan="5"><textarea></textarea></td>
			</tr>
			<tr>
				<th></th>
				<td><input type="submit"></td>
			</tr>

		</table>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>
