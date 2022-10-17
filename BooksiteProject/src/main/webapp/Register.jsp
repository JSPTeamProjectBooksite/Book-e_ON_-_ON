<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Jua&display=swap')
	;
</style>
<link rel="stylesheet" href="css/Register.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>회원가입</h1>
		<form action="register" method="get"
			onsubmit="return validateForm(this);">
			<div>
				<input class="inputGroup" type="text" placeholder="Your name"
					name="name">
			</div>
			<div>
				<input class="inputGroup" type="text" placeholder="Email"
					name="email">
				<!-- <button type="button" href="/IDCheck">중복체크</button> -->
			</div>
			<div>
				<input class="inputGroup" type="password" placeholder="Password"
					name="password">
			</div>
			<div>
				<input class="inputGroup" type="date" placeholder="Birthday"
					name="birthday">
			</div>
			<div>
				<select class="selectGroup" name="gender" id="gender">
					<option value="Select">Gender</option>
					<option value="M">Man</option>
					<option value="W">Woman</option>
					<option value="E">Etc</option>
				</select>
			</div>
			<div>
				<input class="inputGroup" type="tel" name="phoneNum"
					placeholder="Phone number">
			</div>
			<div>
				<input class="inputGroup" type="text" name="address"
					placeholder="Address">
			</div>
			<div>
				<input class="checkboxGroup" type="checkbox"> <span
					class="allTerms"> 모든 약관에 동의합니다. </span>
			</div>
			<div class="terms">
				<div>
					<input type="checkbox"> <span> Book-e On & On 이용약관
						(필수) </span>
				</div>
				<div>
					<input type="checkbox"> <span> Book-e On & On 커뮤니티
						이용약관 (필수) </span>
				</div>
				<div>
					<input type="checkbox"> <span> 개인 정보 수집 및 이용 (필수) </span>
				</div>
			</div>
			<input class="submit" type="submit" value="Register">
		</form>
	</div>
</body>
<script type="text/javascript">
	function validateForm(form) {
		if (!form.name.value) {
			alert("이름을 입력하세요.");
			return false;
		}
		if (!form.email.value) {
			alert("이메일을 입력하세요.");
			return false;
		}
		if (!form.password.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (!form.birthday.value) {
			alert("생년월일을 설정하세요.");
			return false;
		}
		if (!form.phoneNum.value) {
			alert("핸드폰번호를 입력하세요.");
			return false;
		}
		if (!form.address.value) {
			alert("주소를 입력하세요.");
			return false;
		}
		alert("회원가입이 성공적으로 되었습니다.");
		return true;
	}
</script>
</html>