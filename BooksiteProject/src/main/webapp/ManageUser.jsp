<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저정보 관리</title>
<style type="text/css">
	*{
		margin: 0;
		padding: 0;
		box-sizing: border-box;
	}
    #wrap{
        margin: auto;
        max-width: 800px;
        min-width: 400px;
    }
    #UserTable{
    	width: 100%;
    }
    #UserTable ul,li{
    	padding: 10px ;
    }
    .radioBox{
        text-align: center;
    }
</style>
</head>
<body>
    <div id="wrap">
        <div style="height:10vh"></div>

        <h1 style="text-align: center;">유저 정보</h1>

        <div style="height:10vh"></div>

        <table border="1" id="UserTable">
            <tr>
                <td colspan="6" style="text-align: center;">
                    <input type="text">
                    <input type="submit" value="검색">
                </td>
            </tr>
            <tr>
                <th style="width: 35px;">선택</th>
                <th>UID</th>
                <th>이름</th>
                <th>아이디</th>
                <th>비밀번호</th>
                <th>성별</th>
            </tr>
            <tr>
            	<td class="radioBox"><input type="radio" name="chooseUser" value="1"></td>
				<td><a href="">1</a></td>
				<td>이현우</td>
				<td>lee1234</td>
				<td>pw123</td>
				<td style="text-align: center;">M</td>
            </tr>
            <tr>
            	<td class="radioBox"><input type="radio" name="chooseUser" value="2"></td>
				<td><a href="">2</a></td>
				<td>최진영</td>
				<td>cjy1234</td>
				<td>pw123</td>
				<td style="text-align: center;">M</td>
            </tr>
            <tr>
                <td colspan="6" style="text-align: right;">
                    <button>수정</button>
                    <button>삭제</button>
                    <button>추가</button>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>