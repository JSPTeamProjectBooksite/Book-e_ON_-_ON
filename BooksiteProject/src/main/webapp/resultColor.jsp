<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String result = (String)request.getAttribute("result");
//System.out.println("result:"+result);
boolean color = ("true".equals(result));
//System.out.println(color);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
</style>
</head>
<body>
	<span style="color: red; font-size: 11px;position: absolute; font-weight: 800;" id="result"></span>
</body>
<script>
	var sta = '사용불가';
	<%if(color){%>
		sta = '사용가능';
		document.getElementById("result").style.color = 'green';
	<%}%>

	document.getElementById("result").innerHTML = sta;
	
	function result(){
		return sta;
	}
</script>
</html>