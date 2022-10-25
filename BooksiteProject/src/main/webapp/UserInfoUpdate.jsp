<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/UserInfoUpdate.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<form action="/changepassword" method="get" onsubmit="return vaildateForm(this);" target="pass" id="changepasswordform">
			<h1>비밀번호 변경</h1>
			<div>
				<input class="wrap" type="password" placeholder="Your password" name="Password">
			</div>
			<div>
				<input class="wrap" type="password" placeholder="New password"
					name="NewPassword">
			</div>
			<div>
				<input class="wrap" type="password" placeholder="New password check" name="NewPasswordCheck">
			</div>
			<input class="submit" type="submit" value="변경하기">
		</form>
		<iframe src="" name="pass" style="display:none;"></iframe>
	</div>
</body>
	<script type="text/javascript">
	function vaildateForm(form) {
		/* if(form.newPassword.value == )
			
			 */
	}
	function printAlert(str){
		alert(str);
	}
	function goToOn(){
		var form = document.getElementById('changepasswordform');
		//alert("로그인합니다.");
		form.action="/login";
		form.target = "_self";
		form.submit();
	}
	</script>
</html>