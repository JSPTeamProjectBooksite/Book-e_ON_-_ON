<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href="./css/register1.css">
	<link href="https://fonts.googleapis.com/css?family=Poppins:600&display=swap" rel="stylesheet">
	<script src="https://kit.fontawesome.com/a81368914c.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
	<div class="container">
		<img class="wave" src="./source/Login/wave.png">
		<div class="img">
			<img src="./source/Login/reading.png">
		</div>
		<div class="login-content">
			<form action="/register" name="registerForm">

				<h2 class="title">회원가입</h2>
					<div class="input-div one">
						<div class="i">
						</div>
						<div class="div">
								<h5>Your name
									<iframe id="nameUseResert" name="param1" style="
										display: inline;
										width: 100px;
										height: 15px;
										border: none;
									">
									</iframe>
								</h5>
								<input type="text" class="input" name="name" minlength='2' maxlength='30' required>
						</div>
					</div>
					<div class="input-div id">
						<div class="i"> 
						</div>
						<div class="div">
							<h5>Email
								<iframe id="emailUseResert" name="param2" style="
									display: inline;
									width: 100px;
									height: 15px;
									border: none;
								">
								</iframe>
							</h5>
							<input type="id" class="input" name="email" required>
					</div>
				</div>
				<div class="input-div id">
					<div class="i"> 
						</div>
						<div class="div">
							<h5>Password</h5>
							<input type="password" class="input" name="password" maxlength='35' required>
					</div>
				</div>
				<!-- <div class="input-div id">
					<div class="i"> 
						</div>
					<div class="div">
						<h5>id</h5>
						<input type="id" class="input" name="id">
					</div>
				</div>
				<div class="div">
					<select class="selectGroup" name="gender" id="gender">
						<option value="Select"> Gender </option>
						<option value="Man"> Man </option>
						<option value="Woman"> Woman </option>
						<i class="fa-sharp fa-solid fa-venus-double"></i>
					</select>
				</div> -->
				<div class="input-div id">
					<div class="i"> 
					</div>
					<div class="div">
						<input class="inputGroup" type="date" name="birthday" placeholder="Birthday" id="birthday" style="font-weight: bold; color: #999;" required>
					</div>
				</div>
				<div class="input-div id">
					<div class="i"> 
						</div>
					<div class="div">
						<h5>phone number</h5>
						<input type="tel" class="input" name="phoneNum" maxlength='13' required>
					</div>
				</div>
				<!-- 주소는 추후 주문시 입력 -->
				<!-- <div class="input-div id">
					<div class="i"> 
						</div>
					<div class="div">
						<h5>address</h5>
						<input type="id" class="input" name="address">
					</div>
				</div> -->
				<!-- 약관 -->
				<div class="terms">
					<div>
						<input class="checkboxGroup" type="checkbox" id="allCheckBox" onclick="allCheck(this)" required>
						<span class="allTerms"> 모든 약관에 동의합니다. </span>
					</div>
					<div>
						<input type="checkbox" name="checkBox" onclick="check(this)" required>
						<span> Book-e On & On 이용약관 (필수) </span>
					</div>
					<div>
						<input type="checkbox" name="checkBox" onclick="check(this)" required>
						<span> Book-e On & On 커뮤니티 이용약관 (필수) </span>
					</div>
					<div>
						<input type="checkbox" name="checkBox" onclick="check(this)" required>
						<span> 개인 정보 수집 및 이용 (필수) </span>
					</div>
				</div>
				<!-- <input type="submit" class="btn" value="Register">  -->
				<button type="button" class="btn" onclick="sendForm()">Register</button>
			</form>
		</div>
	</div>

	<!-- 아이디 중복 확인용 히든폼 -->
	<form action="/register/check.do" method="post" name="checkform">
		<input type="hidden" name="name" value="">
		<input type="hidden" name="email" value="">
	</form>

	<script type="text/javascript" src="./js/register1.js"></script>
</body>
<script>
	var regist = document.registerForm;
	var checkform = document.checkform;

	var userName = document.registerForm.name;
	var email = document.registerForm.email;
	var password = document.registerForm.password;
	var birthday = document.registerForm.birthday;
	var phoneNumber = document.registerForm.phoneNum;

	
	var check_num = /[0-9]/;    // 숫자 
	var check_eng = /[a-zA-Z]/;    // 문자 
	var check_spc = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자
	var check_kor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/; // 한글체크

	function handleOnInput(e)  {
		e.value = e.value.replace(/[^A-Za-z가-힣]/ig, '')
	}

	//닉내임 입력창을 벗어났을 때 아이디 확인
	regist.name.onblur = function() {
		//console.log(/[^가-힣|a-z|A-Z|0-9]/.test(regist.name.value));
		//console.log(/[^가-힣a-zA-Z0-9]/.test(regist.name.value));
		console.log(regist.name.value);
		
		var temp = true;
		
		if(regist.name.value.length < 2){
			alert("최소 2글자 이상의 이름을 사용하셔야 합니다.");
			temp = false;
		}
		else if(/[^가-힣|a-z|A-Z|0-9|]/.test(regist.name.value)){
			alert("한글,영어,숫자만 사용이 가능합니다.");
			temp = false;
		}
		
		if(!temp){
			return;
		}
		checkform.action = "/register/check.do?what=name";
		checkform.name.value = regist.name.value;
		checkform.target = "param1";
		checkform.submit();
		
		//console.log(document.getElementById('nameUseResert').contentWindow.getElementById("result"));
	}

	//이메일 입력창을 벗어났을 때 확인
	regist.email.onblur = function() {
		//console.log(/[^가-힣|a-z|A-Z|0-9]/.test(regist.email.value));
		//console.log(/[^가-힣a-zA-Z0-9]/.test(regist.email.value));
		console.log(regist.email.value);
		
		var temp = true;
		
		if(regist.email.value.length < 2){
			alert("최소 2글자 이상의 이름을 사용하셔야 합니다.");
			temp = false;
		}
		else if(/[^a-z|A-Z|0-9|!@#$%^&*.]/.test(regist.email.value)){
			alert("영어,숫자,특수문자(!@#$%^&*) 만 사용이 가능합니다.");
			temp = false;
		}
		
		if(!temp){
			return;
		}
		checkform.action = "/register/check.do?what=email";
		checkform.email.value = regist.email.value;
		checkform.target = "param2";
		checkform.submit();
		
		//console.log(document.getElementById('nameUseResert').contentWindow.getElementById("result"));
	}

	//폰번호 양식에 맞게 변경 함수
	phoneNumber.onblur = function() {
		phoneNumber.value = phoneNumber.value.replace(/[^0-9]/g, '');

		if(phoneNumber.value.length >= 3){
			var resert;

			resert = phoneNumber.value.substring(0,3) + '-';

			if(phoneNumber.value.length >= 7){
				resert += phoneNumber.value.substring(3,7) + '-' + phoneNumber.value.substring(7,11);
			}else{
				resert += phoneNumber.value.substring(3);
			}

			phoneNumber.value = resert;
		}
	};

	//비밀번호 양식에 맞게 변경 함수
	password.onblur = function() {
		console.log(regist.password.value);
		
		var temp = true;
		
		if(regist.password.value.length < 6){
			alert("최소 6자 이상의 비밀번호를 사용하셔야 합니다.");
			temp = false;
		}
		else if(/[^a-z|A-Z|0-9|!@#$%^&*]/.test(regist.password.value)){
			alert("영어,숫자,특수문자(!@#$%^&*) 만 사용이 가능합니다.");
			temp = false;
		}
		else if(!/[a-z|A-Z|]/.test(regist.password.value)){
			alert("영어도 사용해서 비밀번호를 만들어주세요.");
			temp = false;
		}
		else if(!/[0-9|!@#$%^&*]/.test(regist.password.value)){
			alert("영어만으론 비밀번호를 만들 수 없습니다.");
			temp = false;
		}
		if(!temp){
			return;
		}
		
		// alert("사용가능한 비밀번호입니다.");
	};

	function allCheck(btn){
		var checkboxes = document.getElementsByName("checkBox");
		checkboxes.forEach((checkbox) => {
    		checkbox.checked = btn.checked;
  		})
	}

	function check(btn){
		if(!btn.checked){
			//alert("체크해제")
			document.getElementById('allCheckBox').checked = false;
			return;
		}
		var checkboxes = document.getElementsByName("checkBox");
		var tem = true;
		
		checkboxes.forEach((checkbox) => {
			if(!checkbox.checked){
				//alert("선택되지 않은게 있음")
				
				tem = false;
			}
		})
		
		if(tem){
			//alert("모두 선택됨")
			document.getElementById('allCheckBox').checked = true;
		}
	}

	function sendForm(){
		var condition1 = (userName.value.length > 0 && document.getElementById('nameUseResert').contentWindow.result()=='사용가능');
		var condition2 = (email.value.length > 0 && document.getElementById('emailUseResert').contentWindow.result()=='사용가능');
		var condition3 = (password.value.length > 0);
		var condition4 = (birthday.value.length == 10);
		var condition5 = (phoneNumber.value.length == 13 && (/[0-9|-]/.test(phoneNumber.value)));

		console.log(condition1);
		console.log(condition2);
		console.log(condition3);
		console.log(condition4);
		console.log(condition5);

		if(!condition1){
			alert("이름을 확인해주세요.");
			return;
		}else if(!condition2){
			alert("이메일을 확인해주세요.");
			return;
		}else if(!condition3){
			alert("비밀번호를 확인해주세요.");
			return;
		}else if(!condition4){
			alert("생일을 확인해주세요.");
			return;
		}else if(!condition5){
			alert("연락처를 확인해주세요.");
			return;
		}

		var checkboxes = document.getElementsByName("checkBox");
		var agree = true;

		checkboxes.forEach((checkbox) => {
			if(!checkbox.checked){
				agree = false;
			}
		})

		if(!agree){
			alert("약관을 확인주세요.");
			document.getElementById('allCheckBox').focus();
			return;
		}
		



		regist.submit();
	}
</script>
</html>