<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#infoTable{
		width: 750;
		margin: auto;
	}
	#infoTable tr{
		min-height: 20px;
	}
</style>
<title>도서 상세 소개</title>
</head>
<body>
	<table border="1" id="infoTable">
		<tr>
			<th>${ book.title }</th>
		</tr>
		<tr>
			<th>[도서 소개]</th>
		</tr>
		<tr>
			<td>
				<img src="${ book.introduceImg }" alt="" style="width: 100%;">
				${ book.introduce }
			</td>
		</tr>
		<tr>
			<th>[출판사리뷰]</th>
		</tr>
		<tr>
			<td>${ book.publisherReview }</td>
		</tr>
		<tr>
			<th>[목차]</th>
		</tr>
		<tr>
			<td>${ book.contents }</td>
		</tr>
		<tr>
			<th>[캐치프라이즈]</th>
		</tr>
		<tr>
			<td>${ book.catchphrase }</td>
		</tr>
	</table>
</body>
</html>