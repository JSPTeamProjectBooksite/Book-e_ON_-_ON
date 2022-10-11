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

		<h2>1:1 고객문의</h2>

		<table class="CustomerInquiry" border="1">

			<tr>
				<th class="info">작성자</th>
				<td colspan="2">${ cusinfo.name }</td>
				<th>ID(계정)</th>
				<td colspan="2">${ cusinfo.id }</td>
			</tr>
			<tr>
				<th class="info">작성일자</th>
				<td colspan="2"><%=sf.format(nowTime)%></td>
				<th>연락처</th>
				<td colspan="2">${ cusinfo.id }</td>
			</tr>
			<tr>
				<th rowspan="2">질문유형</th>
				<td class="radio"><input type="radio" name="radio" checked="checked"/> 회원정보/서비스</td>
				<td class="radio"><input type="radio" name="radio" /> 도서/상품정보</td>
				<td class="radio"><input type="radio" name="radio" /> 주문결제관련</td>
				<td class="radio"><input type="radio" name="radio" /> 배송수령</td>
				<td class="radio"><input type="radio" name="radio" /> 반품교환문의</td>
			</tr>

			<tr>
				<td><input type="radio" name="radio" /> 웹사이트 이용관련</td>
				<td><input type="radio" name="radio" /> 개인출판/작가</td>
				<td><input type="radio" name="radio" /> 시스템 불편사항</td>
				<td><input type="radio" name="radio" /> 고객제안/불편신고</td>
				<td><input type="radio" name="radio" /> 기타문의/제안</td>
			</tr>

			<tr>
				<th class="info">제목</th>
				<td colspan="5"><input
					style="border: none; height: 63px; font-size: 16px;" ; type="text"
					name="subject" maxlength="500"></td>
			</tr>

			<tr>
				<th rowspan="2">내용</th>
				<td colspan="5"><textarea
						style="border: none; font-size: 16px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="5"><small> *문의내용 답변 안내*
						<p>- 답변은 마이룸 또는 회원정보에 등록된 이메일로 확인 가능합니다.</p>
						<p>- 17시 이후 문의건과 공휴일 1:1 상담문의는 다음 운영시간(평일 09시~ 17시)에 답변드립니다.</p>
						<p>- 정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무 일에 진행 됩니다.</p>
						<p>- 설/추석/공휴일 등 연휴 기간 동안 고객센터 휴무로 인해 1:1 상담 답변이 불가합니다.</p>
						<p>- 설/추석/공휴일 연휴 끝난 이후부터 순차적으로 답변드릴 예정이오니 양해 부탁드립니다.</p>
				</small></td>
			</tr>

			<tr>
				<th></th>
				<td><input type="submit" name="문의접수"></td>
				<td><input type="button" value="창닫기" onClick='self.close()'>
			</tr>

		</table>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>
