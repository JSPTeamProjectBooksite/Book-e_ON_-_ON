<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var print = "${bookList[0].size()}";
	alert(print);
</script>

${bookList}
${bookList.size()}
${bookList[0].title}
</body>
</html>