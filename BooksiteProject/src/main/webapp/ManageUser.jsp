<%@page import="org.iptime.booke.utils.LocalDateABC"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
	function clickBtn(btn) {
		if (btn == "Delete") {
			document.getElementById("sendForm").action = "/DeleteUser";
		} else if (btn == "Edit") {
			document.getElementById("sendForm").action = "/ManageUserEdit";
		}
		document.getElementById("sendForm").submit();
	}
</script>
<title>유저정보 관리</title>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

#wrap {
	margin: auto;
	max-width: 1200px;
	min-width: 400px;
}

#UserTable {
	width: 100%;
}

#UserTable ul, li {
	padding: 10px;
}

.radioBox {
	text-align: center;
}
</style>
</head>
<body>
	<div id="wrap">
		<div style="height: 10vh"></div>

		<h1 style="text-align: center;">유저 정보</h1>

		<div style="height: 10vh"></div>

		<form action="" method="get" id="sendForm">
			<table border="1" id="UserTable">
				<tr>
					<td colspan="12" style="text-align: center;"><input
						type="text"> <input type="submit" value="검색"></td>
				</tr>
				<tr>
					<th style="width: 35px;">선택</th>
					<th>UID</th>
					<th>이름</th>
					<th>이메일</th>
					<th>비밀번호</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>핸드폰번호</th>
					<th>주소</th>
					<th>포인트</th>
					<th>계정 상태</th>
					<th>가입일</th>
				</tr>
				<c:forEach var="n" items="${memberList}">
					<c:set var="registerDate" value="${ n.memberDto.registerDate }" ></c:set>
					<% 
						LocalDateTime date = (LocalDateTime) pageContext.getAttribute("registerDate");
						pageContext.setAttribute("registerDate", LocalDateABC.printDate(date));
					%>
					<tr>
						<td class="radioBox"><input type="radio" name="chooseUser"
							value="${ n.memberDto.id }"></td>
						<td><a href="">${ n.memberDto.id }</a></td>
						<td>${ n.memberDto.name }</td>
						<td>${ n.memberDto.email }</td>
						<td>${ n.memberDto.password }</td>
						<td>${ n.memberDto.birth }</td>
						<td style="text-align: center;">${ n.memberDto.gender }</td>
						<td>${ n.memberDto.phoneNum }</td>
						<td>${ n.memberDto.address }</td>
						<td>${ n.memberDto.point }</td>
						<td>${ n.memberState }</td>
						<td>${ registerDate }</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="12" style="text-align: right;">
						<button onclick="clickBtn('Edit')">수정</button>
						<button onclick="clickBtn('Delete')">삭제</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>