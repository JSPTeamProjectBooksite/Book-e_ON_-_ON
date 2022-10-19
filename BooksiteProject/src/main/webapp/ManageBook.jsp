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
		<div style="text-align: center; padding: 10px;">
			<span>
				<input type="text"><input type="submit" value="검색">
			</span>
		</div>
			

		<!-- 오버플로테이블 -->
		<div style="width: 100%; height: 60vh; overflow: auto; padding: 10px;">
			<form action="#" method="post" id="sendForm">
				<table border="1" class="bookTable">
					<tr>
						<th style="width: 35px;">선택</th>
						<th>BID</th>
						<th>책 이름</th>
						<th>이미지</th>
						<th>작가</th>
						<th>옮긴이</th>
						<th>상세소개</th>
						<th>가격</th>
						<th>페이지 수</th>
						<th>무게</th>
						<th>ISBN13</th>
						<th>ISBM10</th>
						<th>카테고리</th>
						<th>소개이미지</th>
						<th>출판사</th>
						<th>배송비</th>
						<th>예상 배송일</th>
						<th>조회수</th>
						<th>재고수량</th>
						<th>출시일</th>
						<th>작성일</th>
						<th>수정일자</th>
					</tr>
					<c:forEach var="book" items="${bookList}" varStatus="state">
						<tr>
							<td class="radioBox">
								<input type="radio" name="chooseBook" value="${ book.id }">
							</td>
							<td>${ book.id }</td>
							<td>${ book.title }</td>
							<td>${ book.coverImg }</td>
							<td>${ authorList[state.index] }</td>
							<td>${ book.translator }</td>
							<td><a href="/introducePopup?id=${ book.id }" onClick="window.open(this.href, '', 'width=800, height=800'); return false;"><b>[ 상세 소개 보기 ]</b></a></td>
							<td>${ book.price }</td>
							<td>${ book.totalPages }</td>
							<td>${ book.weight }</td>
							<td>${ book.isbn13 }</td>
							<td>${ book.isbn10 }</td>
							<td>${ book.bookCategoryId }</td>
							<td>${ book.introduceImg }</td>
							<td>${ book.publisher }</td>
							<td>${ book.deliveryFee }</td>
							<td>${ book.estimatedDeliveryDate }</td>
							<td>${ book.visit }</td>
							<td>${ book.quantity }</td>
							<td>${ book.publicationDate }</td>
							<td>${ book.registDate }</td>
							<td>${ book.updateDate }</td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
		<div style="text-align: right; padding: 10px;">
			<button type="button" onClick="window.open('/MANAGE/BOOKADD', '', 'width=700, height=800'); return false;">추가</button>
			<button type="button" onclick="return reviseBook()">수정</button>
			<button type="button" onclick="return deleteBook()">삭제</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	var form = document.getElementById("sendForm");
	//도서 삭제
	function deleteBook() {
		if(form.chooseBook.value == ""){
			alert("선택된 책이 없습니다.");
			return false;
		}
		form.action = "/ManageBookDelete";
		form.submit();
	}
	//도서 수정
	function reviseBook(){
		if(form.chooseBook.value == ""){
			alert("선택된 책이 없습니다.");
			return false;
		}
		
		window.open('/ManageBookRevise?chooseBook=' + form.chooseBook.value, '', 'width=700, height=800');
		return false;
	}
</script>
</html>