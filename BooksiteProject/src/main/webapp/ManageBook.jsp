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
					<th>배송비</th>
					<th>예상 배송일</th>
					<th>페이지 수</th>
					<th>무게</th>
					<th>ISBN13</th>
					<th>ISBM10</th>
					<th>카테고리</th>
					<th>소개글</th>
					<th>소개이미지</th>
					<th>출판사</th>
					<th>출판사 리뷰</th>
					<th>목차</th>
					<th>조회수</th>
					<th>재고수량</th>
					<th>흥미 글</th>
					<th>출시일</th>
					<th>작성일</th>
					<th>수정일자</th>
				</tr>
				<c:forEach var="m" items="${bookList}" varStatus="state">
					<tr>
						<td class="radioBox"><input type="radio" name="chooseBook"
							value="1"></td>
						<td><a href="">${ m.id }</a></td>
						<td>${ m.coverImg }</td>
						<td>${ m.title }</td>
						<td>${ authorList[state.index] }</td>
						<td>${ m.translator }</td>
						<td>${ m.price }</td>
						<td>${ m.totalPages }</td>
						<td>${ m.weight }</td>
						<td>${ m.isbn13 }</td>
						<td>${ m.isbn10 }</td>
						<td>${ m.bookCategoryId }</td>
						<td>${ m.introduce }</td>
						<td>${ m.introduceImg }</td>
						<td>${ m.publisher }</td>
						<td>${ m.publisherReview }</td>
						<td>${ m.deliveryFee }</td>
						<td>${ m.estimatedDeliveryDate }</td>
						<td>${ m.contents }</td>
						<td>${ m.visit }</td>
						<td>${ m.quantity }</td>
						<td>${ m.catchphrase }</td>
						<td>${ m.publicationDate }</td>
						<td>${ m.registDate }</td>
						<td>${ m.updateDate }</td>
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