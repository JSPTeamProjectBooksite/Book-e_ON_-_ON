<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body style="text-align: center; color:#999; font-weight: 800">
${message}
</body>
<script type="text/javascript">
	var message = "${message}";
	
	if(message == '로그인 가능한 아이디 입니다.'){
		parent.goToOn();
	}
	else{
		console.log("${message}");
		parent.printAlert("${ message }");
	}
</script>
</html>