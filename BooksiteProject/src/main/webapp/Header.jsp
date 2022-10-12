<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Long userID = (Long)session.getAttribute("LoginID"); // 세션에서 아이디르 받아 LoginID에 저장합니다.
String userName = (String)session.getAttribute("LoginName");
boolean login = (userID == null) ? false : true; //로그인 되었는지 안되었는지 여부를 login에 불린으로 저장합니다.


String recentURI = request.getRequestURI();
System.out.println(recentURI+"해더");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	header{
		background: linear-gradient(to left, #d6fcfc, #91eaea);
		margin: auto;
		min-width: 800px;
		height: 100px;
		border-radius: 0px 0px 15px 15px;
		box-shadow: 10px 5px 15px 3px #91b5ea;
		margin-bottom: 25px;
	}
    #headerTable{
        width: 100%;
        height: 100%;
    }
    #logo{
        display: inline;
        font-size: 32px;
        font-family: sans-serif;
        color: white;
        text-shadow: 3px 2px 2px #91b5ea;
    }
    .button{
        width: 75px;
    }
</style>
</head>
<body>
	<header>
		<table id="headerTable">
			<tr>
				<th style="width: 20px;"></th>
				<th style="text-align: left;">
					<h3 id="logo">BOOK-e On & On</h3>
				</th>
				<th style="text-align: right;">
					<%
					if (login) {
						out.print("\"" + userName + "\"님이 접속하셨습니다.");
					//최상단부 스크립틀릿에 보시면 세션에서 로그인 됐을 경우 아이디가 저장돼있습니다.
					//로그인값(false)이 아닐경우 출력됩니다.
					%>
					<br>
					<a href="/userInfo">마이페이지</a>
					<%
					}
					%>
				</th>
				<th class="button"><a href="/cart/list">장바구니</a></th>

				<%
				if (login) {
				%>
				<th class="button">
					<a href="/logout">
						<img alt="" src="./source/ico/iconmonstr-door-6.svg">
					</a>
				</th>
				<%
				} else {
				%>
				<th class="button">
					<a href="/login?from=<%=recentURI%>">
						<img src="./source/ico/iconmonstr-door-5.svg" alt="">
					</a>
				</th>
				<%
				}
				%>
				<th style="width: 20px;"></th>
			</tr>
			<tr style="height: 15px;"></tr>
		</table>
	</header>
</body>
</html>