<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1> 회원정보 수정 </h1>
    <form action="./userInfoUpdate" method="get">
        <div>
            <input type="password" placeholder="Your password" name="password">
        </div>
        <div>
            <input type="password" placeholder="New password" name="new_password"> 일단 이것만 입력하면 비밀번호 변경됨
        </div>
        <div>
            <input type="password" placeholder="New password check" name="new_password_check">
        </div>
        <input type="submit" value="수정하기">
    </form>
</body>
</html>