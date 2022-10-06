<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap');
</style>
<link rel="stylesheet" href="css/Register.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
        <h1> 회원가입 </h1>
        <form>
            <div>
                <input class="inputGroup" type="text" placeholder="Your name" id="name" required>
            </div>
            <div>
                <input class="inputGroup" type="text" placeholder="Email" id="email" required>
            </div>
            <div>
                <input class="inputGroup" type="password" placeholder="Password" id="password" required>
            </div>
            <div>
                <input class="inputGroup" type="text" placeholder="Birthday" id="birthday" required>
            </div>
            <div>
                <select class="selectGroup" name="gender" id="gender">
                    <option value="Select"> Gender </option>
                    <option value="Man"> Man </option>
                    <option value="Woman"> Woman </option>
                </select>
            </div>
            <div>
                <input class="inputGroup" type="tel" id="phoneNum" placeholder="Phone number" required>
            </div>
            <div>
                <input class="inputGroup" type="text" id="address" placeholder="Address" required>
            </div>
            <div>
                <input class="checkboxGroup" type="checkbox" required>
                <span class="allTerms"> 모든 약관에 동의합니다. </span>
            </div>
            <div class="terms">
                <div>
                    <input type="checkbox" required>
                    <span> Book-e On & On 이용약관 (필수) </span>
                </div>
                <div>
                    <input type="checkbox" required>
                    <span> Book-e On & On 커뮤니티 이용약관 (필수) </span>
                </div>
                <div>
                    <input type="checkbox" required>
                    <span> 개인 정보 수집 및 이용 (필수) </span>
                </div>
            </div>
            <input class="submit" type="submit" value="Register">
        </form>
    </div>
</body>
</html>