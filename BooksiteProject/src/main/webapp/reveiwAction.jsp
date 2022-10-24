<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
<script>
    var str = "${ message }";

    //alert(str);

    if(str=="성공"){
        parent.location.reload();
    }
</script>
</html>