<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
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
    #MenuTable{
    	width: 100%;
    }
    #MenuTable ul,li{
    	padding: 10px ;
    }
</style>
<script>
	var JobPosition = '<%= (String)session.getAttribute("JobPosition") %>';

	if(JobPosition == 'null'){
		alert('권한이 없습니다. 메인페이지로 갑니다.');
		location.href='/main';
	}
</script>
</head>
<body>
    <div id="wrap">
        <div style="height:10vh"></div>
        
        <h1 style="text-align: center;">관리자 페이지</h1>

        <div style="height:10vh"></div>

        <table border="1" id="MenuTable">
            <tr>
                <td>
                    <ul style="list-style: none;">
                        <li><a href="/MANAGE/USER">유저 정보</a></li>
                        <li><a href="/ManagerBook">책 정보</a></li>
                        <li><a href="/MANAGE/INQUIRY">1:1문의(관리자)</a></li>
                    </ul>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>