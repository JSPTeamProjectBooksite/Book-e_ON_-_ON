<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 답변(관리자)</title>
<link rel="stylesheet" href="/css/inquirydetail.css">
</head>
<body>

<%-- 	<%
	String sql = " SELECT * FROM INQUIRY_TBL WHERE TITLE=?";
	psmt = con.prepareStatement(sql);
	String TITLE = request.getParameter("TITLE");
	psmt.setString(1, title);
	rs = psmt.executeQuery();
	rs.next();
	%> --%>
	
	<div class="wrap">
		<%@ include file="Header.jsp"%>

		<!-- 제목 -->
		<h2
			style="border-bottom: 1px; padding-bottom: 20px; align-items: center">1:1문의</h2>

		<div class="details">
<!-- 		<form action="" -->
			<table border="1">
				<tr>
					<th>문의유형</th>
					<td>DB정보</td>
					<th>등록일시</th>
					<td>DB정보</td>
					<th>문의상태</th>
					<td>답변 대기상태</td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="5">DB정보</td>
				</tr>
				<tr>
					<th>문의내용</th>
					<td colspan="5"><textarea style="width: 100%; height: 150px">DB정보로 불러오기</textarea></td>
					</td>
				</tr>
				<tr>
					<th>답변내용</th>
					<td colspan="5"><textarea style="width: 100%; height: 200px"></textarea></td>
				</tr>
			</table>
		</div>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>