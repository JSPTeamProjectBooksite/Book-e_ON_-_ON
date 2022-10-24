<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리</title>
<style type="text/css">
	*{
		margin:0;
		padding:0;
		box-sizing: border-box;
	}
    #wrap{
        width: 500px;
        margin: auto;
        text-align: center;
    }
</style>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous">
    $('#optionBox_1').click(function() {
        $.ajax({
            type: 'GET',
            url: '/#',
            dataType: 'Object',
            success: function(result) {
                $('#1')
            }
        })
    })


</script>
</head>
<body>
    <div id="wrap">
        <h1 style="text-align: center;">카테고리 조회</h1>
        <form action="#" method="post">
            <table border="1" style="width: 100%; height:400px;">
                <tr>
                    <th>
                        <h2 style="text-align: center;">카테고리 선택</h2>
                    </th>
                </tr>
                <tr>
                    <td>
                        <select name="option_1" id="optionBox_1">
                            <option value="">분류1</option>
                            <c:forEach var="info" items="${popularList}">
                                <option value="학생">학생</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</body>
</html>