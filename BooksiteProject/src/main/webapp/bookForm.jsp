<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<h1 style="text-align: center;">도서 정보</h1>
<form action="/webCrawling" method="post">
<!-- <form action="/webCrawling" method="post" target="param"> -->
	<div id="webCrawlingDiv">
		<input type="text" name="URL" value="" placeholder="교보문고 책 정보페이지 주소를 넣어주세요." autofocus>
		<input type="submit" value="교보문고 링크에서 책 정보 가져오기" style="font-size: 20px;">
	</div>
</form>
<form action="/BookUpload.do" method="post" id="bookAddForm" onsubmit="return checkForm(this);">
    <table border="1" id="bookAddFormTable">
        <tr>
            <th>*도서명</th>
            <td>
                <input type="hidden" name="chooseBook" value="${ book.id }">
                <input type="text" name="title" value="${ book.title }">
            </td>
        </tr>
        <tr>
            <th>*이미지 경로</th>
            <td><input type="text" name="coverImgUrl" value="${ book.coverImg }"></td>
        </tr>
        <tr>
            <th>
                *작가
                <button type="button" onclick="window.open('/authorSearch?do=authorSearchFrom', '', 'width=500, height=650'); return false;">작가 조회</button>
            </th>
            <td>
            	<input type="text" name="author" value="${ authorID }${ book.authorId }" readonly>
            </td>
        </tr>
        <tr>
            <th>번역가</th>
            <td><input type="text" name="translator" value="${ book.translator }"></td>
        </tr>
        <tr>
            <th>*가격</th>
            <td><input type="text" name="price" value="${ book.price }"></td>
        </tr>
        <tr>
            <th>*재고 수량</th>
            <td><input type="text" name="quantity" value="${ book.quantity }"></td>
        </tr>
        <tr>
            <th>배송비</th>
            <td><input type="text" name="deliveryFee" value="${ book.deliveryFee }"></td>
        </tr>
        <tr>
            <th>페이지 장수</th>
            <td><input type="text" name="totalPages" value="${ book.totalPages }"></td>
        </tr>
        <tr>
            <th>무게</th>
            <td><input type="text" name="weight" value="${ book.weight }"></td>
        </tr>
        <tr>
            <th>ISBN</th>
            <td style="
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 5px;
            ">
                <div><input type="text" name="isbn13" placeholder="ISBN13" value="${ book.isbn13 }"></div>
            	<div><input type="text" name="isbn10" placeholder="ISBN10" value="${ book.isbn10 }"></div>
            </td>
        </tr>
        <tr>
            <th>
                카테고리
                <button type="button">카테고리 조회</button>
            </th>
            <td>
            	<input type="text" name="categoryId">
            </td>
        </tr>
        <tr>
            <th>*소개글</th>
            <td><textarea name="introduce">${ book.introduce }</textarea></td>
        </tr>
        <tr>
            <th>소개이미지링크</th>
            <td><input type="text" name="introduceImageUrl" value="${ book.introduceImg }"></td>
        </tr>
        <tr>
            <th>*출판사</th>
            <td><input type="text" name="publisher" value="${ book.publisher }"></td>
        </tr>
        <tr>
            <th>출판사 리뷰</th>
            <td><textarea name="publisherReview">${ book.publisherReview }</textarea></td>
        </tr>
        <tr>
            <th>목차</th>
            <td><textarea name="contents">${ book.contents }</textarea></td>
        </tr>
        <tr>
            <th>*출시일</th>
            <td><input type="date" name="publicationDate" value="${ book.publicationDate }"></td>
        </tr>
        <tr>
            <th>캐치프라이즈</th>
            <td><input type="text" name="catchphrase" value="${ book.catchphrase }"></td>
        </tr>
    </table>
</form>
<!-- <iframe src="" style="display: none;" name="param"></iframe> -->
</html>