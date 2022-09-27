<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String userID = (String) session.getAttribute("user_id"); // 세션에서 아이디르 받아 userID에 저장합니다.
boolean login = (userID == null) ? false : true; //로그인 되었는지 안되었는지 여부를 login에 불린으로 저장합니다.
System.out.println(userID + "jgjg" + login);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    body{
        background: #c1adff;
    }
    nav{
    	margin: auto;
        width: 80vw;
        min-width: 800px
    }
    #headerTable{
        margin-top: 25px;
        margin-bottom: 25px;
        width: 100%;
        height: 100%;
    }
    #logo{
        display: inline;
        font-size: 32px;
        font-family: sans-serif;
        color: white;
    }
    .button{
        width: 75px;
    }
</style>
</head>
<body>
	<header>
		<nav>
			<table id="headerTable">
				<tr>
					<th style="text-align: left;">
						<h3 id="logo">BOOK-e On & On</h3>
					</th>
					<th class="button">버튼1
					<th style="text-align: right;">
						<%
						if (login) {
							out.print("\"" + userID + "\"님이 접속하셨습니다.");
						}
						//최상단부 스크립틀릿에 보시면 세션에서 로그인 됐을 경우 아이디가 저장돼있습니다.
						//로그인값(false)이 아닐경우 출력됩니다.
						%>
					</th>
					<th class="button"><a href="/cart/list">장바구니</a></th>

					<%
					if (login) {
					%>
					<th class="button"><a href="/logout">로그아웃</a></th>
					<%
					} else {
					%>
					<th class="button"><a href="/login">로그인</a></th>
					<%
					}
					%>
				</tr>
			</table>
		</nav>
	</header>
</body>
</html>