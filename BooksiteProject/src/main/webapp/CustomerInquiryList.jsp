<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 문의내역</title>
<link rel="stylesheet" href="/css/CustomerInquiryList.css">
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-gothic.css"
	rel="stylesheet">
</head>
<body>
	<h2>나의 문의내역</h2>
	<form method="get">
		<table class="InquiryList" border="1">
			<tr>
				<th>등록일자</th>
				<th>구분</th>
				<th>제목</th>
				<th>상태</th>
				<th>비고</th>
			</tr>
			<c:forEach var="cutomerinquiry" items="${ cinquirylist }">
				<tr align="center">
					<td class="date"><a
						href="/payment/detail?rigisterdate=${ cutomerinquiry.rigisterDate }">${ cutomerinquiry.rigisterDate }</a></td>
					<td>${ cutomerinquiry.categroy }</td>
					<td>${ cutomerinquiry.title }</td>
					<td>${ cutomerinquiry.state }</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
<script>

	function setPage(){
		var dates = document.getElementsByClassName("date");

		for(var i=0; i < dates.length; i++){
			dates[i].innerHTML = dates[i].innerHTML.replace('T', ' ');
		}
	}

	setPage();
</script>
</html>