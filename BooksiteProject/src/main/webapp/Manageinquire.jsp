<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>1:1고객문의(관리자)</title>
<link rel="stylesheet" href="css/inquire_Manager.css">
</head>

<body>
	<div class="wrap">
		<%@ include file="Header.jsp"%>
		<h2 style="padding-bottom: 20px">1:1고객문의(답변대기 건수 : 2건)</h2>

		<form method="get">
			<table class="search" border="1">
				<tr>
					<td align="center"><select name="searchField">
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select> <input type="text" name="searchWord" /> <input type="submit"
						name="검색" value="검색" /></td>
				</tr>
			</table>
		</form>

		<table border="1">
			<tr>
				<th>번호</th>
				<th>ID(이메일)</th>
				<th>문의유형</th>
				<th>제목</th>
				<th>답변상태</th>
				<th>등록일</th>
			</tr>
			<c:choose>
				<c:when test="${ empty inquireLists}">
					<tr>
						<td colspan="6" align="center">등록된 문의가 없습니다!</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ inquireLists }" var="inq" varStatus="loop">
						<tr align="center">
							<td>${map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)}
							</td>
							<td>{ inq.memberId }</td>
							<td align="left"><a href="/view.jsp?id=${ inq.id }">${ inq.title }</a></td>
							<td>{ inq.title }</td>
							<td>{ inq.state }
							<td>{ inq.registerDate}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>

		<table border="1">
			<tr>
				<td>${ map.pagingImg }</td>
			</tr>
		</table>

		<%@ include file="Footer.jsp"%>
	</div>
</body>

</html>