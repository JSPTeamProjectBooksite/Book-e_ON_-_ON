<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/ManagerBook.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap">
		<div style="height: 10vh"></div>
		<h1>책 정보</h1>
		<div style="height: 10vh"></div>
		<!-- 검색창 -->
		<input type="text"><input type="submit" value="검색">

		<!-- 오버플로테이블 -->
		<div style="width: 100%; height: 80vh; overflow: auto">

			<table border="1" class="bookTable">
				<tr>
					<th style="width: 35px;">선택</th>
					<th>BID</th>
					<th>이미지</th>
					<th>책 이름</th>
					<th>작가</th>
					<th>옮긴이</th>
					<th>가격</th>
					<th>페이지 수</th>
					<th>무게</th>
					<th>ISBN13</th>
					<th>ISBM10</th>
					<th>카테고리</th>
					<th>소개글</th>
					<th>소개이미지</th>
					<th>출판사</th>
					<th>출판사 리뷰</th>
					<th>배송비</th>
					<th>예상 배송일</th>
					<th>목차</th>
					<th>조회수</th>
					<th>재고수량</th>
					<th>흥미 글</th>
					<th>출시일</th>
					<th>작성일</th>
					<th>수정일자</th>
				</tr>
				<c:forEach var="book" items="${bookList}" varStatus="state">
					<tr>
						<td class="radioBox"><input type="radio" name="chooseBook"
							value="1"></td>
						<td><a href="">${ book.id }</a></td>
						<td>${ book.coverImg }</td>
						<td>${ book.title }</td>
						<td>${ authorList[state.index] }</td>
						<td>${ book.translator }</td>
						<td>${ book.price }</td>
						<td>${ book.totalPages }</td>
						<td>${ book.weight }</td>
						<td>${ book.isbn13 }</td>
						<td>${ book.isbn10 }</td>
						<td>${ book.bookCategoryId }</td>
						<td>${ book.introduce }</td>
						<td>${ book.introduceImg }</td>
						<td>${ book.publisher }</td>
						<td>${ book.publisherReview }</td>
						<td>${ book.deliveryFee }</td>
						<td>${ book.estimatedDeliveryDate }</td>
						<td>${ book.contents }</td>
						<td>${ book.visit }</td>
						<td>${ book.quantity }</td>
						<td>${ book.catchphrase }</td>
						<td>${ book.publicationDate }</td>
						<td>${ book.registDate }</td>
						<td>${ book.updateDate }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div style="text-align: right;">
			<button>수정</button>
			<button>삭제</button>
			<button>추가</button>
		</div>
	</div>
</body>
</html>