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
				<td class="title">작성자</td>
				<td>${ cusinfo.name }</td>
				<td class="title">ID(이메일)</td>
				<td>${ cusinfo.email }</td>
				<!--<td>ID(계정)</td>
				<td>${ cusinfo.id }</td>!-->
			</tr>
			<tr>
				<td class="title">작성일자</td>
				<td><%=sf.format(nowTime)%></td>
				<td class="title">연락처</td>
				<td>${ cusinfo.phone_num }</td>
				<!--  <td>연락처</td>
				<td>${ cusinfo.id }</td>-->
			</tr>
			<tr>
				<td class="title">질문유형</td>
				<td colspan="3"><select style="height: 63px">
						<option>회원정보/서비스</option>
						<option>도서/상품정보</option>
						<option>주문결제</option>
						<option>배송수령</option>
						<option>반품교환</option>
						<option>웹사이트 이용관련</option>
						<option>검색기능 관련</option>
						<option>eBook상품.오류신고</option>
						<option>시스템 불편사항</option>
						<option>개인정보침해신고</option>
						<option>고객제안/불편신고</option>
						<option>개인출판/작가</option>
						<option>기타문의/제안</option>
				</select></td>
			</tr>
			<!-- <tr>
				<td rowspan="2">질문유형</td>
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
			</tr>-->

			<tr>
				<td class="title">제목</td>
				<td colspan="3"><input
					style="border: none; width: 100%; height: 63px; font-size: 16px;"
					type="text" name="subject" maxlengtd="500"></td>
			</tr>

			<tr>
				<td class="title" rowspan="2">내용</td>
				<td colspan="3"><textarea
						style="border: none; font-size: 16px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="3" ;class="notice"><small> *문의내용 답변 안내*
						<p>- 답변은 마이룸 또는 회원정보에 등록된 이메일로 확인 가능합니다.</p>
						<p>- 17시 이후 문의건과 공휴일 1:1 상담문의는 다음 운영시간(평일 09시~ 17시)에 답변드립니다.</p>
						<p>- 정상근무일 기준이며, 통지예정일이 휴일인 경우 다음 정상 근무 일에 진행 됩니다.</p>
						<p>- 설/추석/공휴일 등 연휴 기간 동안 고객센터 휴무로 인해 1:1 상담 답변이 불가합니다.</p>
						<p>- 설/추석/공휴일 연휴 끝난 이후부터 순차적으로 답변드릴 예정이오니 양해 부탁드립니다.</p>
				</small></td>
			</tr>
		</table>
		<div class="Bnt">
			<table class="submitbnt">
				<tr>
					<td><input type="submit" name="문의접수"></td>
					<td><input type="submit" name="문의접수"><input type="button" value="창닫기" onClick='self.close()'></td>
				</tr>
			</table>
		</div>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>
