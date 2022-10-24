<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body style="text-align: center; color:#999; font-weight: 800">
${message}
</body>
<script type="text/javascript">
	var message = "${message}";
	
	function setPage(){
		if(message == '로그인 가능한 아이디 입니다.'){
			parent.goToOn();
			return;
		}
		else{
			console.log("${message}");
			parent.printAlert("${ message }");
			return;
		}
		
		if(message == '비밀번호가 성공적으로 변경되었습니다. 다시 로그인 해주세요.'){
			parent.goToOn();
			return;
		}else{
			console.log("${message}");
			parent.printAlert("${ message }");
			return;
		}
	}

	setPage();
</script>
</html>